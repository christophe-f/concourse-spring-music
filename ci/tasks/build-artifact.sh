#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`

cd music-repo
echo $version
ls build-artifact
gradle assemble -PVersion=$version
ls build/libs/

cp build/libs/spring-music-$version.war build-artifact/spring-music-$version.war
