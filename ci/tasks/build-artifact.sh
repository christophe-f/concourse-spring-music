#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
output=`build-artifact`
cd music-repo
echo $version
ls $output
gradle assemble -PVersion=$version
ls build/libs/

cp build/libs/spring-music-$version.war $output/spring-music-$version.war
