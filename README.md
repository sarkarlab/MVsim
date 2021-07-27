# MVSim
Multivalent binding kinetics simulator

MVSim Multidomain V 2.3
Bence Bruncsics, Wesley J. Errington, Casim A. Sarkar University of Minnesota
June 9, 2020
Questions: Contact bruncsics@mit.bme.hu

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
3. Coping the MVSimMultiDomainV2.3.ctf file to  the default /local/MathWorks/webapps/R2019b/apps/ location

The directory MVSim contains the following uncompiled files and folders for the model:

* [State_images] Containing the png files for the GUI 
* [Diff_Equations] Containing the 9 .m files with the ODE system for the MATLAB ODE solver
* MVsimV2.mappl – the code for the GUI interface in the MATLAB App Designer	
* Multivalent_Main.m – The code for plotting and for initial information for the model
* EffC_Calculattor.m – Used for the effective concentration calculation in the GUI
* EffC_Calculator_polar.m - Used for the effective concentration calculation using polar coordinate integration in the GUI
* copyUIAxes.m and copyUIAxes.ReadMe.txt - used for saving the images and figures in the GUI


Usage: 
1. After installing the web app, the page is accessible via: <host>:<port> /webapps/home/ 
2. After choosing the desired version the filling up the parameters in the Main and Parameters tabs and pushing the Initiate button the app droves the desired plots. 

Troubleshooting:

- Undefined function error: 
  - Check for all the required MARLAB packages
  -Check for MATLAB version
  -Add the Diff_Equations folder to the path
- Missing images: add the image 
  - Add State_images folder to the path

