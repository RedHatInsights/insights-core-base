# Update comment on Feb 18  to kick off the image rebuild
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
RUN microdnf -y install git autoconf automake gcc libtool file diffutils make xz bzip2 python3.11 python3.11-pip && microdnf clean all
RUN git clone --branch v2.30.0 https://github.com/intel/isa-l.git
COPY yasm-1.3.0-7.el8.x86_64.rpm .
RUN rpm -i yasm-1.3.0-7.el8.x86_64.rpm && rm yasm-1.3.0-7.el8.x86_64.rpm
WORKDIR isa-l
RUN ./autogen.sh
RUN ./configure --prefix=/usr --libdir=/usr/lib64
RUN make
RUN make install
RUN rm -rf isa-l
RUN python3 -m pip install --upgrade pip
