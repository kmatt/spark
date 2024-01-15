#!/bin/bash

# https://spark.apache.org/docs/3.4.1/building-spark.html

export MAVEN_OPTS="-Xss64m -Xmx2g -XX:ReservedCodeCacheSize=1g"

#./build/mvn -DskipTests clean package

pushd ..
#dev/make-distribution.sh --name custom-spark --pip --r --tgz
dev/make-distribution.sh --name custom-spark --pip --tgz -Phive -Phive-thriftserver
#dev/make-distribution.sh --name custom-spark --pip --r --tgz -Psparkr -Phive -Phive-thriftserver

cd python
python setup.py sdist
ls -lah dist

popd

#pip install python/dist/pyspark-3.5.0.tar.gz
