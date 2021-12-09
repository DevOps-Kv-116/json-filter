FROM python:3.7.2-alpine
RUN pip install --upgrade pip
RUN adduser -D worker
USER worker
ENV PATH="/home/worker/.local/bin:${PATH}"
WORKDIR /home/worker
RUN pip install --user pika flask python-dotenv
COPY --chown=worker:worker . .
ENTRYPOINT [ "python3", "jsonfilter.py" ]

#FROM python:3.8-slim-buster
#WORKDIR /opt/app
#RUN pip3 install --upgrade pip && pip3 install --no-cache-dir pika flask python-dotenv
#COPY . .
#RUN adduser app
#USER app
#ENTRYPOINT [ "python3", "jsonfilter.py" ]


# ===ubuntu image===
# FROM python:3.9

# ENV RMQ_HOST=15.237.25.152 \
#     RMQ_PORT=5672 \
#     RMQ_LOGIN=devops \
#     RMQ_PASS=softserve \
#     QUEUE_SLACK=slack \
#     QUEUE_RESTAPI=restapi \
#     HOST=0.0.0.0 \
#     PORT=5000
    
# RUN apt-get update && apt-get install -y \
#     && pip3 install requests \
#     && pip3 install pika \
#     && pip3 install Flask \
#     && pip3 install python-dotenv


# WORKDIR /root

# COPY . .

# EXPOSE 5000

# ENTRYPOINT [ "python3", "jsonfilter.py" ]


# ==how to install docker on centos==
# dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
# dnf install docker-ce
# systemctl start docker
# systemctl enable docker
# systemctl status docker
# firewall-cmd --zone=public --add-masquerade --permanent
# firewall-cmd --reload
# docker --version
# docker run hello-world
# dnf remove docker-ce
