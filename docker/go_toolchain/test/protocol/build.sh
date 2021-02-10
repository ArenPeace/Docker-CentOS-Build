#!/bin/bash
set -ue

protoc \
-I=${GOPATH}/src \
-I=proto/ \
--go_out=plugins=grpc:go/  \
--govalidators_out=go/ \
./proto/*.proto

