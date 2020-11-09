FROM centos:6.7

RUN yum install -y java-1.6.0-openjdk && \
    yum install -y openssh-server && \
    yum install -y zip && \
    yum install -y unzip && \
    yum clean all
RUN sed -i -e 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    sed -i -e 's/#Port 22/Port 22/g' /etc/ssh/sshd_config && \
    sed -i -e 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd
RUN service sshd start

CMD [ "/usr/sbin/sshd", "-D", "-e" ]

EXPOSE 22
