FROM python:3.9-slim-buster
RUN echo "deb http://deb.debian.org/debian/ buster-backports main" > /etc/apt/sources.list.d/buster-backports.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    jq \
    curl \
    wireguard-tools
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt 
ENTRYPOINT [ "python3", "generate-config.py" ]
