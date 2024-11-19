#!/bin/bash

VERSION='2024-11-17'

docker push gnasello/firefox-ubuntu:$VERSION

docker tag gnasello/firefox-ubuntu:$VERSION gnasello/firefox-ubuntu:latest 

docker push gnasello/firefox-ubuntu:latest