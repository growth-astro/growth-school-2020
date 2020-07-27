FROM jupyter/base-notebook

USER root

# install system packages
RUN apt-get update \
 && apt-get -y install apt-file \
 && apt-file update \
 && apt-get -y install \
    vim \
    emacs \
    nano \
    cron \
    git \
    sextractor \
    psfex \
    swarp \
    scamp \
    dbus-x11 \
    xfce4 \
    xfce4-panel \
    xfce4-session \
    xfce4-settings \
    xorg \
    xubuntu-icon-theme \
    firefox \
 && apt-get clean

# Disable creation of Music, Documents, etc.. directories
# ref: https://unix.stackexchange.com/questions/268720/who-is-creating-documents-video-pictures-etc-in-home-directory
RUN apt-get remove -y xdg-user-dirs

# Disable the Applications|Log Out menu item in XFCE
# ref: https://github.com/yuvipanda/jupyter-desktop-server/issues/16
RUN rm -f /usr/share/applications/xfce4-session-logout.desktop

# Install ds9
RUN cd /usr/local/bin && \
    curl -L http://ds9.si.edu/download/ubuntu18/ds9.ubuntu18.8.1.tar.gz | tar xzvf -

# also install xpa
RUN cd /usr/local/bin && \
    curl -L http://ds9.si.edu/download/ubuntu18/xpa.ubuntu18.2.1.18.tar.gz | tar xzvf -

USER $NB_UID

# install conda and pip packages
RUN conda install --yes \
    numpy \
    astropy \
    scipy \
    matplotlib \
    pytest \
    requests \
    astroquery \
    photutils \
    emcee \
    corner \
    nbresuse \
    widgetsnbextension \
    nbgitpuller \
 && conda clean --all -f -y

RUN pip install \
    image_registration

# Add missing packages
RUN pip install \
    pyregion \
    astroplan \
    pytz

# Add jupyter-desktop-server
RUN conda install -c manics websockify \
 && pip install jupyter-server-proxy \
 && jupyter labextension install @jupyterlab/server-proxy || ( cat /tmp/jupyterlab-debug* && /bin/false ) \
 && pip install git+https://github.com/mjuric/jupyter-desktop-server

USER root
RUN groupadd -g 996 admin \
 && useradd --system admin -u 999 -g 996 -m -s /bin/bash \
 && echo "#includedir /home/admin/etc/sudoers.d" >> /etc/sudoers

# Updated version of start.sh, that doesn't mess with the jovyan user
COPY start.sh /usr/local/bin/
# Bootstrap script for customizing environment
COPY start-scripts.sh /usr/local/bin/before-notebook.d/start-scripts.sh

USER $NB_USER

