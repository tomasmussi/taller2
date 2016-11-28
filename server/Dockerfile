# Set the base image to Ubuntu
FROM ubuntu:14.04

# Install required packages
RUN apt-get update && apt-get install -y \
  cmake \
  git \
  g++ \
  make \
  wget \
  libcurl4-openssl-dev \ 
  libboost-all-dev
#Fin required packages

#Install jsoncpp
RUN git clone https://github.com/open-source-parsers/jsoncpp.git
RUN cd jsoncpp ; mkdir build ; cd build ; cmake .. ; make install
#Fin install jsoncpp

#Install curlpp
RUN wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/curlpp/curlpp-0.7.3.tar.gz
RUN tar zxf curlpp-0.7.3.tar.gz ; cd curlpp-0.7.3 ; ./configure ; make ; make install
#Fin install curlpp

#Install googleTest
RUN git clone https://github.com/google/googletest.git
RUN cd googletest ; cmake -DBUILD_SHARED_LIBS=ON . ; make ; cd googletest ; cp -a include/gtest /usr/include ; cmake -DBUILD_SHARED_LIBS=ON . ; make ; cp -a libgtest_main.so libgtest.so /usr/lib/ 
#Fin Install googleTest

#Install Leveldb
RUN git clone https://github.com/google/leveldb.git
RUN cd leveldb ; make ; cd out-shared ; cp --preserve=links libleveldb.* /usr/local/lib ; cd ../include ; cp -R leveldb /usr/local/include/ ; ldconfig 
#Fin install Leveldb

#Clone repository
RUN git clone https://github.com/tomasmussi/taller2.git
#Fin clone repository

#Install log4cpp
RUN cd taller2/instaladores ; tar zxf log4cpp-1.1.2rc3.tar.gz ; cd log4cpp ; ./configure ; make ; make check ; make install ; ldconfig


RUN cd taller2/server ; . ./appear.sh ;

CMD ["./taller2/server/build/src/server"]




