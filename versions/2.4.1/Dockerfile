FROM centos:7.4.1708

LABEL name="Ansible Semaphore" version="2.4.1"

ADD opt/ /opt/

RUN yum -y update \
 && yum -y install gcc git python-devel wget \
 && curl -L https://bootstrap.pypa.io/get-pip.py | python \
 && pip install ansible \
 && wget https://github.com/ansible-semaphore/semaphore/releases/download/v2.4.1/semaphore_linux_amd64 \
 && mv semaphore_linux_amd64 /usr/bin/semaphore \
 && chmod a+x /usr/bin/semaphore \
 && mkdir -p /opt/data/semaphore \
 && touch /firstrun

EXPOSE 3000
WORKDIR /opt/semaphore

# Default Command
CMD ["/bin/bash", "-c", "/opt/semaphore/start.sh"]
