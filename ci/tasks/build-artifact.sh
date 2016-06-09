#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
cd music-repo
#echo $version
gradle assemble -PVersion=$version
ls build/libs/

cp build/libs/spring-music-1.0.0.war build-artifact/spring-music-1.0.0.war
