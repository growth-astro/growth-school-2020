# GROWTH Astronomy School: Guide for JupyterHub users

Authors: Igor Andreoni (Caltech), David Kaplan (UWM), Steven Stetzler (UW), Mario Juric (UW)

*********

A JupyterHub framework was setup for the GROWTH School 2020 (referred to as "the Hub" hereafter). The school participants can access, complete, and run the hands-on module entirely on the Hub. All the necessary software is already installed on the Hub, so there is no need for the school participants to download the modules and install the software locally.  

*********
### Login

In order to login the Hub, you must provide the school organizers with your GitHub account ID. If you do not have a GitHub account yet, please register at https://github.com/join?source=login

Thanks to your GitHub account ID, the school organizers will add you to the `growth-astro-school` GitHub organization, in the appropriate team (Participants, Tutors, Admin). No action from you is required here. Becoming part of this organization will allow your account to be "whitelisted", so that you can login the Hub using your GitHub credentials.

In order to login to the Hub, start the server by clicking on this link: https://growth.dirac.institute/hub/login


*********
### Usage

When you login into the Hub, you can navigate the folders to find the Jupyter notebook of your choice. When you open the notebook, you can edit and run it freely. Your edits will remain saved even when the server is stopped and re-started.

* Opening and running a notebook: <br>
Navigate to the nootebook, click on its name and you should see the notebook opening in a new tab. A guide to how to use jupyter notebooks can be found [HERE](https://jupyter.brynmawr.edu/services/public/dblank/Jupyter%20Notebook%20Users%20Manual.ipynb). Please familiarize yourself with jupyter notebooks before the school begins.

* Downloading the school material: <br>
The notebooks, the raw data, and the data products can be downloaded from the Hub to your computer at any time. On the Hub main interface, navigate to the file of interest, click on the checkbox on the left of the file name, then click the `Download` button that should have appeared on the top bar. There are other ways to download the content, too. For example, you can open the notebook you want to download, click `File`, click `Download As`, then choose a file format and download the file.  After the school finishes, you can download the school material directly from the GROWTH website: http://growth.caltech.edu/growth-school-2020.html

* Using ds9: <br>
During the school, you may want to visualize astronomical images using the ds9 application. To open a ds9 window, open a new desktop from the Hub main page (click on the `New` dropdown menu in the top-left corner on the page, then click on `Desktop`). A new desktop should open in a new tab. There, open a terminal and type `ds9 &` to start a new ds9 window. You can open an image from the `File` menu of the ds9 GUI, or you can open an image directly from command line by typing, for example, `ds9 growth/module_name/data/image_name.fits`
