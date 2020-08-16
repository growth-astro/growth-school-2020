#!/usr/bin/env python
import os,sys

basedir=sys.argv[1]

# make sure we start with fresh versions of these
notebooks="""
image_reduction/image_reduction.ipynb
image_reduction/image_reduction_solutions.ipynb
image_subtraction/image_subtraction.ipynb
image_subtraction/image_subtraction_solutions.ipynb
light_curve_analysis/light_curve.ipynb
light_curve_analysis/light_curve_solutions.ipynb
observing_preparation/observing_prep.ipynb
observing_preparation/observing_prep_solutions.ipynb
photometry/photometry.ipynb
photometry/photometry_solutions.ipynb
python_basics/python_basics_exercises.ipynb
python_basics/python_basics_exercises_solutions.ipynb
python_basics/python_basics_solutions.ipynb
radio/radio.ipynb
radio/radio_solutions.ipynb
spectroscopy/spectra.ipynb
spectroscopy/spectra_guide.ipynb
spectroscopy/spectra_guide_solved.ipynb
spectroscopy/spectra_solutions.ipynb
xray/xray.ipynb
xray/xray_solutions.ipynb
"""

for notebook in notebooks.split('\n'):
    if len(notebook.strip())==0:
        continue
    notebook_file = os.path.join(basedir,
                                 notebook.strip())
    if os.path.exists(notebook_file):
        print('Deleting {}'.format(notebook_file))
        os.remove(notebook_file)
