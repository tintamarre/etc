#!/bin/sh

grep -v '^#' $1 | grep -v '^$' | sort
