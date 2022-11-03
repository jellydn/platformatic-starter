#!/bin/sh
set -x
# DSN will be defined in the Dockerfile
sqlite3 $DSN
