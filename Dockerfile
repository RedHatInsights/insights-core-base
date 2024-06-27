FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

RUN microdnf update -y &&  microdnf install -y git rsync zip unzip findutils python3.11 python3.11-pip && microdnf clean all
RUN python3 -m pip install --upgrade pip
