GROWTH School 2020
Python Notebook README
********************************

Authors: Cameron Hummels (Caltech) <br>
Updated by Iva Kostadinova (Caltech), Igor Andreoni (Caltech)

*************************************************
### Introduction

These Python notebooks were developed by the GROWTH (Global Relay of Observatories Watching Transients Happen) international collaboration in astronomy for the GROWTH school series.  The notebooks you have just downloaded were used during the GROWTH online school held on Aug 16-18, 2020.

Each Python notebooks is accompanied by an introductory lecture given by experts in the field of  time-domain astronomy and observational followup to astrophysical transients. Each lecture and its Python notebook form a “module”. There are a total of twelve such "modules"  that were presented at the GROWTH school in 2020. 

The modules can be run individually but some of the modules deal with content
provided in previous modules. The order of the GROWTH summer school in 2020 is:

* 1:  Python Basics
* 2:  Image Data Reduction
* 3:  UV/Optical/IR Photometry
* 4:  Observing Run Preparation
* 5:  Image Subtraction
* 6:  Lightcurve Analysis
* 7:  Spectroscopy
* 8: Data Analysis in X-ray Astronomy
* 9: Radio Astronomy and Data Analysis

Note that the resources from previous GROWTH astronomy schools are also available for downloading from our website. To learn more, visit 

http://growth.caltech.edu/astronomy-school.html

****************************
### Downloading the Modules

Unzip the file you have just downloaded and tar it.  (The $ represents the 
command line prompt, so just type the stuff following it):
```
$ tar -zxvf GROWTH_Modules_2020.tar.gz
```

****************************
### Installing Dependencies

To run any of these modules, you must have a working python 3.x install 
and several python libraries.  You can tell your python version by running:

$ python -V

If you lack a python 3.x install, The conda package manager is a good source.  
Find and download the conda installer script of the latest version for your 
operating system here: https://repo.continuum.io/miniconda/

For example, if you have a linux system, you can get it through the conda 
webpage or download it directly using wget:

$ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

Now, run the installer by running this as a bash script and follow the prompts.
You probably want to set this up as your default, so allow it to initialize
Miniconda3 by running conda init.

$ bash Miniconda3-latest-Linux-x86_64.sh

Close and re-open this shell window to ensure the settings are updated.
Next, you'll want to install several necessary python packages using pip.  
For all of the notebooks, you'll want to get these basic packages:

$ pip install matplotlib numpy scipy astropy jupyter astroquery pandas 

************************************************************
### Installing Python Dependencies for Each Notebook

For each of the notebooks, there are additional packages and external 
programs required.  If you plan to run all of the modules, you can just install all of the necessary dependencies (after executing the command above) as:

```
$ pip install pyregion photutils astroplan==0.5 pytz image_registration pytest healpy ligo.skymap sklearn pydotplus pyds9 tensorflow pillow emcee corner
```

If you don't want to install *all* the dependencies for all the modules as above right now, you can install just the ones you want for the modules you  will use:

1:  Python Basics:<br>
No additional packages required

2:  Image Reduction<br>
$ pip install pyregion photutils
(Requires SExtractor and SWarp)

3:  Photometry<br>
$ pip install photutils<br>
(Requires SExtractor and PSFEx)

4:  Observing Run Preparation<br>
$ pip install astroplan pytz

5:  Image Subtraction<br>
$ pip install photutils image_registration pytest<br>
(Requires SExtractor, SWarp, PSFEx, and DS9)

6:  Light Curve Analysis<br>
No additional packages required

7:  Spectra <br>
No additional packages required, but scipy >= 1.4 is required

8:  X-ray Data Analysis<br>
No additional packages required

9: Radio Data Analysis<br>
$ pip install emcee corner

**********************************************************************
### Installing Astromatic Dependencies for Photometry Modules

There are a few external programs required for some of the photometry 
modules, which are not able to be installed using pip.  These are needed for
doing aperture photometry, image plane transformations, and PSF fitting in
the modules: Image Reduction, Image Subtraction, and Photometry.  

First, get a working copy of ds9 installed.  To install ds9, download 
the appropriate version for your platform and place it somewhere in your 
path: http://ds9.si.edu/site/Download.html

The additional external dependencies are programs created by the Astromatic 
group (http://www.astromatic.net/software):

* SExtractor (Source Extractor)
* SWarp (Source Warp)
* PSFEx (Point Spread Function Extractor)

While these are useful tools to have and to use, they can also be a real pain to
install properly on some systems (e.g., Windows, some Mac installs).  
Installing them from source is extremely challenging and time-consuming, 
however some package managers install them quite trivially.  Try these options
below, but if all else fails, try to install via source or use our VirtualBox
image that has the dependencies already all installed, but requires 15GB of
free space and is slower than running things natively on your own computer.

****************************************************************
### Installing the Astromatic Dependencies for Linux Users

If you are running linux, try installing them with your favorite package 
manager: apt-get, yum, rpm.  These should all be able to install these packages
quite easily.  For example, someone running ubuntu should be able to simply run
(note this may require root privileges and to be run prefixed by `sudo`):

```
$ [sudo] apt-get install sextractor swarp psfex
```

****************************************************************
### Installing the Astromatic Dependencies for Mac Users

If you have a Mac, some of the time you can install these dependencies 
pretty easily.  Things are definitely easiest if you use MacPorts as your 
package manager.  But if you are already using Homebrew as your package 
manager, MacPorts and Homebrew do not play well together, so we have a 
Homebrew-based solution below.  For those of you who don't use a package 
manager at all, try installing MacPorts by following the instructions here: 
https://www.macports.org/install.php . Once MacPorts is installed, 
you should simply be able to install the Astromatic programs by running
(you made need root privileges to run this prefixed by the `sudo` command):

```
$ [sudo] port install sextractor swarp psfex
```

If this is successful, move on to the next steps.

Alternatively, if you use Homebrew as your package manager, you can install
these programs individually.  First, ensure that Homebrew is looking in the 
science programs to search for code, then install SExtractor:

```
$ brew tap brewsci/science
$ brew install sextractor
```

Second, download the source code for SWarp and follow its instructions for
install.  This is normally a laborious process, but it is much easier now
because it will rely on some of the software that just got installed by 
SExtractor.  You should be able to simply download the latest SWarp source 
file, unzip it, configure it, make it, and install it by, but check the
installation instructions (https://www.astromatic.net/software/swarp) 
if this doesn't work:

```
$ wget https://www.astromatic.net/download/swarp/swarp-2.38.0.tar.gz
$ tar -zxvf swarp-2.38.0.tar.gz
$ cd swarp-2.38.0
$ ./configure
$ make
$ make install
```

Lastly, you will need to install PSFEx, which is a little more involved.
First, use Homebrew to install some packages:

```
$ brew install autoconf automake libtool fftw openblas
```

Now, download PSFEx from its github repository by going to:
https://github.com/astromatic/psfex , and clicking on the green "Clone or 
Download" button, then select "Download as Zip".  After you have the zipped
file downloaded, unzip the file somewhere.  At this point, you will install
PSFEx according to the instructions in its INSTALL file, but basically you
want to run:

```
sh autogen.sh #this creates the configure file
./configure --enable-openblas --with-openblas-libdir=/usr/local/opt/openblas/lib --with-openblas-incdir=/usr/local/opt/openblas/include
make -j
make install
```

Then test that you successfully installed by running:

```
$ psfex
```

If you get some fftw version issue, try running conda install fftw=3.3.8.

If these three programs install properly, then continue on to the next step.
On the other hand, if these fail, you can try to install them from source,
but they have a lot of difficult-to-install dependencies (e.g., LAPACK, ATLAS, 
FFTW).  You might be better off using MacPorts as your package manager, or 
even trying to follow our backup plan, to install VirtualBox and get all of
the dependencies for free (see below).

*******************************************************************
### Installing the Astromatic Dependencies for Windows Users

Sorry, the Astromatic group does not support Windows machines.  You can try
building from source, but this is not advisable.  Instead, you can try to install a virtual machine running linux on your Windows machine.  Scroll down to the APPENDIX to learn how to install a VirtualBox.


***********************************************************************
### Testing to Ensure All Dependencies Are Correctly Installed

To ensure you have all of the dependencies properly installed, we have provided
a short python script to run through and test these dependencies.  Please
run this code and verify that it successfully works on your system prior to
your arrival at the GROWTH School.

```
$ python test_dependencies.py
```

*****************************
### Running a module

OK, you were able to get all of the dependencies installed, and you have
your desired copies of the modules.  Congratulations!  Now you can run them
and proceed through the exercises.  

Once you have selected and downloaded your desired module, you can open it/them
with the command:

$ tar -zxvf <module_name.tar.gz>

Each module contains an `.ipynb` file, a Jupyter Notebook file, which 
contains the lesson.  In addition, many of the modules
contain a data directory with some configuration and science data to use
in the examples.

Now, move to the desired module directory and launch a jupyter notebook
on the desired .ipynb file.  From here, you can follow the GROWTH lesson 
by hitting <shift-enter> on any numbered box, and it will attempt to execute 
the code within that box to produce some sort of output to illustrate the 
lesson.  When you are done, save your work, close the notebook from the 
window, and then go back to the terminal and hit <ctrl>-C to quit.  You can 
check the solutions at the end in the included notebook.  

$ cd python_basics
$ jupyter notebook python_basics.ipynb

***********
### APPRENDIX

Using a VirtualBox Instance If You Cannot Properly Install Dependencies

In some cases, there may be difficulties installing all of the necessary 
dependencies to get things working for the GROWTH school modules to function
correctly.  In these cases, it is possible for users to install VirtualBox,
a freely-available program for running a different operating system as a 
virtual machine *inside* the normal operating system on your computer.  This
can be a bit slower and it needs a bit of space in order to operate, but it 
generally just *works*.  

First, go to the VirtualBox website, and download the software appropriate
for your computer's operating system: https://www.virtualbox.org/wiki/Downloads

Click on the downloaded file and follow the on-screen prompts to install the
software.

Now, you can download the GROWTH School image file that has Python, all of the
GROWTH modules, and their required dependencies already installed.  For 
reference, this virtual machine is running Ubuntu Linux version 18.04 in 
64-bit mode.  This is a big zipped file, so ensure you have sufficient space 
available on your hard drive to store it, as well as a good internet 
connection to be able to download it.  The zipped file size is 6.2 GB, which 
will help shorten the download time, but you still need to be able to unzip it 
and save it as its true size: 15 GB.  Sorry, I know this is a pain to find 15GB,
free, but we don't really have other alternatives.  Go here and download the file.

https://drive.google.com/open?id=1s0wTC7awmOnaaO5tg3MGwqNB0KlKq-j2

Once this file is downloaded, unzip it using gzip to expand to it's full 15 GB 
filesize:

$ tar -zxvf GROWTH_VBox_2020.tar.gz

Now it should simply be a matter of running VirtualBox and loading the 
downloaded, unzipped image file GROWTH_2019_VBox.vbox.  Try opening it
in your file manager, or explicitly opening it in VirtualBox by clicking
the "Tools" button in the upper right corner of your VirtualBox Manager,
click the "Add" button at the top of this panel, and navigate to the unzipped
growth_summer_2019.vdi file, and select it.  This will now boot up your 
Ubuntu operating system as a virtual machine inside your computer.  Note that
your login/password inside this virtual machine is: growth/growth in
case you need to make system-wide changes or come back from the screensaver.

If you encounter a black screen, try changing the window size of the 
VirtualBox window by dragging a corner of the window to a larger size. Play
with this a bit and you should find a resolution that renders the virtual 
machine.  

There is a README.txt on the desktop that you can double click on
for more instructions, but you should just be able to open a terminal
and go to the GROWTH_Modules directory and proceed with the next steps below
to run the modules.  Good luck!

#### Optional: Configuring VirtualBox Screen Resolution and Copy/Paste

The default resolution for VirtualBox is to run at 600x800, which is quite 
small by today's standards.  If you have problems ever increasing the 
resolution of your VirtualBox window, you may want to follow these steps,
so you can more easily see what is happening in your virtual machine.  You can 
do this by clicking the "Devices" tab at the top of your screen, and selecting 
"Insert Guest Additions Image".  If it asks to download and run a file,
just click OK or Run (pw: growth).  It will download and insert a virtual CD 
into your virtual optical drive, and then run the contents.  Once it is 
complete, read over the text to make sure that it operated correctly, and click 
enter to close the window.  If it didn't operate correctly, it usually gives you
a line of text to run in order to address the problem.  Follow its instructions.
Otherwise, shutdown the virtual machine and restart it.  Once it is back up,
you should be able to change pull the VirtualBox window to different sizes,
and the resolution will change appropriately.

Similarly, by default copy/paste does not work between your virtual machine
and your host desktop.  But you can enable this after you have installed the 
"Guest Additions Image" in the above step, by clicking once again on the 
"Devices" tab at the top of your screen, selecting "Shared Clipboard", and
selecting "Bidirectional".  Now you can copy/paste in your virtual machine
using Ctrl-Shift-C and Ctrl-Shift-V, and these functions will work to 
copy/paste things to/from your host desktop computer.
