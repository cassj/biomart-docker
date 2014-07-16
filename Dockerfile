# start from a base ubuntu image
FROM ubuntu
MAINTAINER Cass Johnston <cassjohnston@gmail.com>

# Install pre-reqs
RUN apt-get update
RUN apt-get install -y openjdk-6-jdk
RUN apt-get install -y ant
RUN apt-get install -y git
RUN apt-get install -y curl vim

### TODO This whole section should be part of a biomart apt package

# Checkout the biomart code 
RUN bash -c 'mkdir /opt/biomart'
RUN bash -c 'cd /opt/biomart && git clone https://github.com/biomart/BioMart.git --branch 0.9.0'

# And build it
RUN bash -c 'cd /opt/biomart/BioMart && ant'

# Path the biomart scripts
ENV PATH $PATH:/opt/biomart/BioMart/dist/scripts

######

#How the hell do we do the configuration?

# And expose the port for the web interface
EXPOSE 9000
