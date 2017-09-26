#!/bin/bash

. ./config

docker build ./ -t ${INAME}
