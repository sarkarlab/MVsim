# MVSim
Multivalent binding kinetics simulator

MVSim Multidomain V 1.9
Bence Bruncsics, Wesley J. Errington, Casim A. Sarkar University of Minnesota
June 26, 2021

Code related questions: bruncsics@mit.bme.hu
Questions related to icensing: csarkar@umn.edu

Requirements:
- MATLAB R2019b or newer [link]
  - Packages: Image visualization toolbox
- For hosting the webserver:
  - MATLAB Runtime [link]
  - MATLAB WebAppServer [link]
  
Available App version
- MATLAB app: App installation file for MATLAB users
- Standalone Desktop App: Desktop application compiled by MATLAB
- Web App: deployable web app file

Installation and setup for the Web App:
1. Setting up the webserver by following the instruction in: https://www.mathworks.com/help/webappserver/ug/set-up-matlab-web-app-server.html
2. Staring the Webserver following the instructions in: [link]
3. Coping the ctf file to  the default /local/MathWorks/webapps/R2019b/apps/ location

The directory MVSim contains the following uncompiled files and folders for the model:

* [Images] Containing the png files in the Images folder for the GUI 
* [Diffs] Containing the 189 automatically generates .m files with the ODE system for the MATLAB ODE solver
* MVsim_GUI_V1_9.mlapp – the code for the GUI interface in the MATLAB App Designer	
* GUI_Manual_input3x3x3.m – The code for plotting and for initial information for the model
* EffC_Calculator_polar.m - Used for the effective concentration calculation using polar coordinate integration in the GUI
* [Support_Scripts] - A collection of scripts used for state and ODE system genration used for the .m files generation is the Diffs folder (not required for the GUI) 
* copyUIAxes.m and copyUIAxes.ReadMe.txt - used for saving the images and figures in the GUI


Usage: 
Web App:
1. After installing the web app, the page is accessible via: <host>:<port> /webapps/home/ 
2. After choosing the desired version the filling up the parameters in the Main and Parameters tabs and pushing the Initiate button the app droves the desired plots. 

MATLAB App:
1. Install MATLAB MVsim app
2. Input parameters and press initiate and run button

Troubleshooting:

- Undefined function error: 
  - Check for all the required MARLAB packages
  -Check for MATLAB version
  -Add the Diff_Equations folder to the path
- Missing images: add the image 
  - Add State_images folder to the path

