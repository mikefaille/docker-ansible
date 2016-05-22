FROM centos:7

RUN yum -y install epel-release git asciidoc rpm-build python2-devel make which python-setuptools && yum clean expire-cache && \
    cd /usr/src && \
    git clone --depth=1 --branch v2.1.0.0-0.3.rc3 git://github.com/ansible/ansible.git --recursive && \
    cd ansible && \
    make rpm && \
    yum install -y rpm-build/ansible-2.1.0.0-0.git201605181948.036547b.HEAD.el7.centos.noarch.rpm && \
    cd .. && rm -R ansible && yum remove -y asciidoc rpm-build python2-devel make && \
    yum clean all

    # cd /usr/src && \
    # git clone --depth=1 --branch v2.0.2.0-1 git://github.com/ansible/ansible.git --recursive && \
    # cd ansible && \
    # make rpm && \
    # yum install -y  rpm-build/ansible-2.0.2.0-0.git201604192124.24d9e5e.HEAD.el7.centos.noarch.rpm && \
    # cd .. && rm -R ansible && yum remove -y asciidoc rpm-build python2-devel a2x make && \
