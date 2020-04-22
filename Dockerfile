FROM centos:7

COPY mysql57-community.repo /etc/yum.repos.d/

RUN yum makecache fast && \
    yum install -y mysql-community-client curl && \
    yum clean all && \
    rm -rf /var/cache/yum/*
COPY init.sh /opt/
RUN mkdir /opt/sql
RUN chmod +x /opt
WORKDIR /opt

CMD ["bash"]
