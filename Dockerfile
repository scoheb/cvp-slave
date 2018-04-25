FROM openshift/jenkins-slave-base-centos7
RUN yum install -y epel-release
# add ruby for ghi
RUN yum install -y ansible \
        jq \
        python-pip \
        ruby \
        traceroute

# Setup RH-IT-Root-CA certificate for RedHat (necessary for connecting to beaker server)
RUN curl -o /etc/pki/ca-trust/source/anchors/RH-IT-Root-CA.crt --insecure \
         -L https://password.corp.redhat.com/RH-IT-Root-CA.crt &&\
    update-ca-trust extract

RUN pip install --upgrade setuptools
RUN pip install openshift

