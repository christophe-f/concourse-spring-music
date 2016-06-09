#!/usr/bin/env bash


outputDir=
 
while [ $# -gt 0 ]; do
  case $1 in
    -o | --output-dir )
      outputDir=$2
      shift
      ;;
    * )
      echo "Unrecognized option: $1" 1>&2
      exit 1
      ;;
  esac
  shift
done

set -e
export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`

cd music-repo
echo $version
ls `build-artifact`
gradle assemble -PVersion=$version
ls build/libs/

cp build/libs/spring-music-$version.war $outputDir/spring-music-$version.war
