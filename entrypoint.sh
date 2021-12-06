#!/bin/sh

set -e
set -x

# e.g.) 2.12.14 2.13.7 3.1.0
versions=$(sbt -Dsbt.supershell=false --error "print crossScalaVersions" | sed -r 's/\* (.+)/\1/')

# e.g.) ["2.12.14", "2.13.7", "3.1.0"]
scala_versions="[\"$(echo "$versions" | sed '$d' | xargs | sed -e 's/ /", "/g')\"]"

echo "::set-output name=scala_versions::$scala_versions"
