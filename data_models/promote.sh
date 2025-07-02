#!/bin/zsh
# This script promotes the generated JSON schemas to the schemas directory.

rm -rf ../schemas/*
cp tsp-output/@typespec/json-schema/*.yaml ../schemas