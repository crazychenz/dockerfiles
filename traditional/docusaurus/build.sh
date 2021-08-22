#!/bin/sh

docker build $@ --network host -t crazychenz/docusaurus .
