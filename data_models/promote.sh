#!/bin/zsh
# This script promotes the generated JSON schemas to the schemas directory.

rm -r ../schemas/*
cp tsp-output/@typespec/json-schema/*.yaml ../schemas/