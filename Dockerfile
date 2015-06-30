# Refer to https://allseenalliance.org/developers/develop/building/linux/build-source
FROM ubuntu:12.04

MAINTAINER Bear Lin <kzlin129@gmail.com>

RUN \
  apt-get update &&\
  apt-get install -y build-essential libgtk2.0-dev libssl-dev xsltproc ia32-libs libxml2-dev libcap-dev &&\
  apt-get install -y python &&\
  apt-get install -y scons &&\
  apt-get install -y libssl-dev &&\
  apt-get install -y git-core &&\
  apt-get install -y curl &&\
  apt-get install -y wget

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo &&\
  chmod a+x /usr/local/bin/repo

RUN wget -O /tmp/uncrustify_0.57-1_amd64.deb http://cz.archive.ubuntu.com/ubuntu/pool/universe/u/uncrustify/uncrustify_0.57-1_amd64.deb &&\
  dpkg -i /tmp/uncrustify_0.57-1_amd64.deb &&\
  rm /tmp/uncrustify_0.57-1_amd64.deb

RUN \
  apt-get install -y doxygen graphviz texlive 


RUN \
  wget -O /tmp/xulrunner.tar.bz2 http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/3.6.28/sdk/xulrunner-3.6.28.en-US.linux-i686.sdk.tar.bz2 &&\ 
  cd ~/ &&\
  tar xf /tmp/xulrunner.tar.bz2 &&\
  rm /tmp/xulrunner.tar.bz2 &&\
  cd -

RUN \
  wget -O /usr/share/java/junit-4.9.jar http://search.maven.org/remotecontent?filepath=junit/junit/4.9/junit-4.9.jar &&\
  apt-get install -y ant

RUN \
  apt-get install -y unzip &&\
  wget -O /tmp/gtest-1.6.0.zip https://googletest.googlecode.com/files/gtest-1.6.0.zip &&\
  mkdir -p ~/gtest &&\
  cd ~/gtest &&\
  unzip /tmp/gtest-1.6.0.zip &&\
  rm /tmp/gtest-1.6.0.zip &&\
  cd -

# Ref to https://github.com/dockerfile/java/blob/master/oracle-java6/Dockerfile
#RUN \
#  apt-get install -y python-software-properties &&\
#  echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
#  add-apt-repository -y ppa:webupd8team/java && \
#  apt-get update && \
#  apt-get install -y oracle-java6-installer

# Install openjdk-6-jdk instead of Oracle's
RUN apt-get install -y openjdk-6-jdk

RUN apt-get autoremove -y

RUN \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk6-installer
