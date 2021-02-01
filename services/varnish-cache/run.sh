docker run --name my-running-varnish -v /path/to/default.vcl:/etc/varnish/default.vcl:ro --tmpfs /var/lib/varnish:exec -d varnish
docker run --name my-running-varnish --tmpfs /var/lib/varnish:exec -d -p 8080:80 my-varnish
docker run --name my-running-varnish --tmpfs /var/lib/varnish:exec -d my-varnish