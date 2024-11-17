#!/bin/bash

VERSION='2024-11-17'

docker build --no-cache -t gnasello/firefox-ubuntu:$VERSION .
