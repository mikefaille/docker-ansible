FROM centos:7

RUN yum -y install epel-release git && yum install ansible
