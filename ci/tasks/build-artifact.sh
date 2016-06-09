#!/usr/bin/env bash

inputDir=  outputDir=
 
while [ $# -gt 0 ]; do
  case $1 in
    -i | --input-dir )
      inputDir=$2
      shift
      ;;
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

cd $inputDir
echo "version"
echo $version
gradle assemble -PVersion=$version
ls build/libs/


# Copy jar file to concourse output folder
cd ..
cp $inputDir/build/libs/spring-music-$version.war $outputDir/spring-music-$version.war
echo "file copied"
ls $outputDir/
