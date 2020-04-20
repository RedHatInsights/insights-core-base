FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum -y install git autoconf automake gcc libtool file diffutils make python3 python3-pip && yum clean all
RUN git clone https://github.com/intel/isa-l.git
COPY yasm-1.3.0-7.el8.x86_64.rpm .
RUN yum -y install yasm-1.3.0-7.el8.x86_64.rpm && rm yasm-1.3.0-7.el8.x86_64.rpm
WORKDIR isa-l
RUN ./autogen.sh
RUN ./configure --prefix=/usr --libdir=/usr/lib64
RUN make
RUN make install
RUN rm -rf isa-l
RUN python3 -m pip install --upgrade pip
