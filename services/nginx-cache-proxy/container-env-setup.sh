#!/bin/sh

CACHE_SCHEME=$1
CACHE_HOST=$2

setup_ubuntu()
{
  # Parameters
  cache_archive_prefix=$1
  cache_security_prefix=$2
  mirror_archive_prefix=$3
  mirror_security_prefix=$4

  SOURCES_LIST_FPATH=/etc/apt/sources.list

  # OS Detection
  #release=`cat /etc/apt/sources.list | grep ^deb | head -n 1 | cut -d " " -f3`
  
  cache_url="${CACHE_SCHEME}://${CACHE_HOST}"

  cp ${SOURCES_LIST_FPATH} ${SOURCES_LIST_FPATH}.original

  # Jammy-22.04, Hirsute-21.04, Focal-20.04, Disco-19.04, Bionic-18.04
  # Zesty-17.04, Xenial-16.04, Vivid-15.04, Trusty-14.04, Raring-13.04
  # Precise-12.04, Lucid-10.04
  sed -i "s|http://archive.ubuntu.com/ubuntu/|${cache_url}${cache_archive_prefix}${mirror_archive_prefix}|g" ${SOURCES_LIST_FPATH}
  # Jammy-22.04, Hirsute-21.04, Focal-20.04, Disco-19.04, Bionic-18.04
  # Zesty-17.04, Xenial-16.04, Trusty-14.04
  sed -i "s|http://security.ubuntu.com/ubuntu/|${cache_url}${cache_security_prefix}${mirror_security_prefix}|g" ${SOURCES_LIST_FPATH}
  
  # TODO: Conditionally append the original content for resiliency.
  #cat ${SOURCES_LIST_FPATH}.original >> ${SOURCES_LIST_FPATH}

}


setup_debian()
{
  # Parameters
  cache_archive_prefix=$1
  cache_security_prefix=$2
  mirror_archive_prefix=$3
  mirror_security_prefix=$4

  SOURCES_LIST_FPATH=/etc/apt/sources.list

  # OS Detection
  #release=`cat /etc/apt/sources.list | grep ^deb | head -n 1 | cut -d " " -f3`

  cache_url="${CACHE_SCHEME}://${CACHE_HOST}"

  cp ${SOURCES_LIST_FPATH} ${SOURCES_LIST_FPATH}.original

  # Squeeze-6
  sed -i "s|http://httpredir.debian.org/debian|${cache_url}${cache_archive_prefix}${mirror_archive_prefix}|g" ${SOURCES_LIST_FPATH}
  # Wheezy-7, Jessie-8, Stretch-9, Buster-10, Bullseye-11
  sed -i "s|http://deb.debian.org/debian|${cache_url}${cache_archive_prefix}${mirror_archive_prefix}|g" ${SOURCES_LIST_FPATH}
  # Wheezy-7, Jessie-8, Stretch-9
  sed -i "s|http://security.debian.org/debian-security|${cache_url}${cache_security_prefix}${mirror_security_prefix}|g" ${SOURCES_LIST_FPATH}
  # Squeeze-6
  sed -i "s|http://security.debian.org|${cache_url}${cache_security_prefix}|g" ${SOURCES_LIST_FPATH}
  
  # TODO: Conditionally append the original content for resiliency.
  #cat ${SOURCES_LIST_FPATH}.original >> ${SOURCES_LIST_FPATH}

}


setup_alpine()
{
  # Parameters
  cache_prefix=$1

  APK_REPOSITORIES_FPATH=/etc/apk/repositories

  cache_url="${CACHE_SCHEME}://${CACHE_HOST}${cache_prefix}"

  cp ${APK_REPOSITORIES_FPATH} ${APK_REPOSITORIES_FPATH}.original
  sed -i "s'https://dl-cdn.alpinelinux.org'${cache_url}'g" ${APK_REPOSITORIES_FPATH}
  # Older Alpines used http, not https.
  sed -i "s'http://dl-cdn.alpinelinux.org'${cache_url}'g" ${APK_REPOSITORIES_FPATH}

}


setup_centos()
{
  # Parameters
  cache_prefix=$1

  YUM_REPOS_FPATH_PREFIX=/etc/yum.repos.d/CentOS-

  cache_url="${CACHE_SCHEME}://${CACHE_HOST}${cache_prefix}"

  for entry in ${YUM_REPOS_FPATH_PREFIX}*;
  do

    cp ${entry} ${entry}.original

    # Replace IBM's brilliantly unusable repository filter.
    sed -i 's/^mirrorlist/#mirrorlist/g' ${entry}

    # This should work in CentOS 8, 7, 6, & 5.
    sed -i "s'#baseurl=http://mirror.centos.org'baseurl=${cache_url}'g" ${entry}
    sed -i "s'baseurl=http://mirror.centos.org'baseurl=${cache_url}'g" ${entry}
    sed -i "s'baseurl=http://vault.centos.org'baseurl=${cache_url}'g" ${entry}
    #sed -i "s'#baseurl=http://debuginfo.centos.org'baseurl=${cache_url}'g" ${entry}

  done

}


setup_npm()
{
  # Parameters
  cache_prefix=$1
  
  cache_url="${CACHE_SCHEME}://${CACHE_HOST}${cache_prefix}"
  
  npm config set registry ${cache_url}
  cp ~/.npmrc /etc/skel

}


setup_yarn()
{
  # Parameters
  cache_prefix=$1
  
  cache_url="${CACHE_SCHEME}://${CACHE_HOST}${cache_prefix}"
  
  yarn config set registry ${cache_url}
  cp ~/.npmrc /etc/skel
  
}


setup_pip3()
{
  # Parameters
  cache_prefix=$1
  
  cache_url="${CACHE_SCHEME}://${CACHE_HOST}${cache_prefix}"
  
  pip3 config --user set global.index ${cache_url}
  pip3 config --user set global.index-url ${cache_url}
  pip3 config --user set global.trusted-host ${CACHE_HOST}
  mkdir -p /etc/skel/.config/pip
  cp /root/.config/pip/pip.conf /etc/skel/.config/pip/
  
}


# setup_ubuntu <cache_archive_prefix> <cache_security_prefix> <mirror_archive_prefix> <mirror_security_prefix>
grep -i Ubuntu /etc/issue 2>/dev/null && setup_ubuntu /cache/try/ubuntu/archive /cache/try/ubuntu/security /sites/ubuntu-archive /sites/ubuntu-archive
# setup_debian <cache_archive_prefix> <cache_security_prefix> <mirror_archive_prefix> <mirror_security_prefix>
grep -i Debian /etc/issue 2>/dev/null && setup_debian /cache/try/debian/archive /cache/try/debian/security /debian /debian-security
# setup_alpine <cache_prefix>
grep -i Alpine /etc/issue 2>/dev/null && setup_alpine /cache/try/alpine
# setup_centos <cache_prefix>
grep -i CentOS /etc/system-release 2>/dev/null && setup_centos /cache/try/centos
# setup_npm <cache_prefix>
which npm 2>/dev/null && setup_npm /cache/try/npm
# setup_yarn <cache_prefix>
which yarn 2>/dev/null && setup_yarn /cache/try/yarn
# setup_pip3 <cache_prefix>
which pip3 2>/dev/null && setup_pip3 /cache/try/pypi
