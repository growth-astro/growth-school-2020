FROM python:3.6-slim

RUN pip install jupyter && pip install numpy && pip install astropy && pip install scipy

RUN pip install matplotlib && pip install image_registration && pip install pytest

RUN pip install requests && pip install astroquery 

RUN pip install photutils

# Make port 8888 available to the world outside this container
EXPOSE 8888

RUN apt-get update && apt-get -y install apt-file && apt-file update && apt-get -y install vim && \
    apt-get -y install cron && apt-get -y install git

RUN apt-get -y install sextractor && apt-get -y install psfex && apt-get -y install swarp && apt-get -y install scamp

RUN mkdir -p /app
# RUN mkdir -p /app/data
# RUN mkdir -p /app/notebooks
# RUN mkdir -p /app/my_notebooks

COPY . /app

WORKDIR /app

# Set proxy server, replace host:port with values for your servers
#ENV http_proxy http://localhost:8888
#ENV https_proxy https://localhost:8888

CMD /bin/bash

# Start Jupyter notebook
# CMD jupyter-notebook --allow-root --ip=0.0.0.0 &
RUN echo 'alias startjn="jupyter-notebook --allow-root --ip=0.0.0.0 &"' >> ~/.bashrc

#VOLUME /tmp/.X11-unix
#ENV DISPLAY unix:0

# Get ds9 running
# RUN cd /app/Software/SAOImageDS9/ && /app/Software/SAOImageDS9/unix/configure && make

# Final packages to be installed

RUN pip install emcee && pip install corner

RUN apt-get update && apt-get -y install apt-file && apt-file update && apt-get -y install vim && \
    apt-get -y install cron  && apt-get -y install git

