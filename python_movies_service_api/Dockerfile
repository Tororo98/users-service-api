# A simple Flask app container.
FROM python:2
MAINTAINER Carlos Llano <sebastiantofra98@javerianacali.edu.co>

# Place app in container.
COPY . /opt/www
WORKDIR /opt/www

# Install dependencies.
RUN apt-get update && apt-get install jq vim nano curl -y
RUN pip2 install -r requirements.txt

EXPOSE 9000
