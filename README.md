Please see the original research associated with MVsim at [https://www.biorxiv.org/content/10.1101/2021.08.01.454686v1](https://www.biorxiv.org/content/10.1101/2021.08.01.454686v1).

The installation files for MVsim can be found at [https://github.com/sarkarlab/MVsim/](https://github.com/sarkarlab/MVsim/).

***

MVsim v1.0

Bence Bruncsics, Wesley J. Errington, Casim A. Sarkar

University of Minnesota

May 13, 2022

MVsim is licensed under the [MIT License](https://github.com/sarkarlab/MVsim/blob/main/LICENSE).

Questions related to licensing: csarkar@umn.edu

Code related questions: bruncsics@mit.bme.hu

Requirements:
- [MATLAB R2019b or newer](https://www.mathworks.com/)
  - Packages: Image visualization toolbox
- For hosting the webserver:
  - MATLAB [Runtime](https://www.mathworks.com/products/compiler/matlab-runtime.html) 
  - MATLAB [WebAppServer](https://www.mathworks.com/products/matlab-web-app-server.html)
  
Available App version
- MATLAB app: App installation file for MATLAB users
- Standalone Desktop App: Desktop application compiled by MATLAB
- Web App: deployable web app file for closed networks

Installation and setup for the Web App:
1. Setting up the webserver by following the [instructions](https://www.mathworks.com/help/webappserver/ug/set-up-matlab-web-app-server.html)
2. Staring the Webserver following the [instructions](https://www.mathworks.com/help/compiler/webapps/run-a-web-app.html)
3. Copying the ctf file to the default /local/MathWorks/webapps/R2019b/apps/ location

Installation and setup for standalone desctop app:

Option 1:
1. Downloading and installing MATLAB [Runtime](https://www.mathworks.com/products/compiler/matlab-runtime.html) for [windows](https://ssd.mathworks.com/supportfiles/downloads/R2021a/Release/5/deployment_files/installer/complete/win64/MATLAB_Runtime_R2021a_Update_5_win64.zip), [linux](https://ssd.mathworks.com/supportfiles/downloads/R2021a/Release/5/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2021a_Update_5_glnxa64.zip), [mac](https://ssd.mathworks.com/supportfiles/downloads/R2021a/Release/5/deployment_files/installer/complete/maci64/MATLAB_Runtime_R2021a_Update_5_maci64.dmg.zip)
2. Running the executables  MVsim_standalone_win.exe for windows or the MVsim_standalone_linux.install for linux or download the [mac files](https://drive.google.com/drive/folders/1E2Hy6xb23SQJ7v36Q_ci0-UMJjLhQwyT?usp=sharing) and follow the installation instractions
3. Run the installd version of MVsim.

Option 2:
1. Download the MVsim version packaged with runtime for [windows](https://drive.google.com/file/d/1t2faUYdFB_fPUUW7-Ic0rqdvZmEeNVH5/view?usp=sharing), [linux](https://drive.google.com/file/d/1fyZaCK-gv5_QDpjtiGB-grR5D2zk61C2/view?usp=sharing) or for [mac](https://drive.google.com/drive/folders/1XOgovOQrr_kved5p3DbNPXuAlqxCoW4l?usp=sharing)
2. Follow the installation guide and launch the program

***

The directory MVSim contains the following uncompiled files and folders for the model:

* [Images] Containing the png files in the Images folder for the GUI 
* [Diffs] Containing the 189 automatically generates .m files with the ODE system for the MATLAB ODE solver
* MVsim_GUI_V10.mlapp ??? the code for the GUI interface in the MATLAB App Designer	
* GUI_Manual_input3x3x3.m ??? The code for plotting and for initial information for the model
* EffC_Calculator_polar.m - Used for the effective concentration calculation using polar coordinate integration in the GUI
* [Support_Scripts] - A collection of scripts used for state and ODE system genration used for the .m files generation is the Diffs folder (not required for the GUI) 
* copyUIAxes.m and copyUIAxes.ReadMe.txt - used for saving the images and figures in the GUI ([license information at the end of the script](https://www.mathworks.com/matlabcentral/fileexchange/73103-copyuiaxes))


Usage:

Web App:
1. After installing the web app, the page is accessible via: <host>:<port> /webapps/home/ 
2. After choosing the desired version the filling up the parameters in the Main and Parameters tabs and pushing the Initiate button the app droves the desired plots. 

MATLAB App:
1. Install MATLAB MVsim app
2. Input parameters and press the initiate and run button. For more details follow the "MVsim user tutorial.pdf" file

Installation and run times:
1. Typical installation time is ~1 min.
2. Run time varies based on the complexity of the simulation. For the included bivalent-bivalent demo with default parameters, the typical run time should be < 30 s. More involved simulations can take up to 30 min; a progress bar is included in the app for the user to monitor the calculations and ensure that the app has not stalled.

Troubleshooting:

- Undefined function error: 
  - Check for all required MATLAB packages
  - Check MATLAB version (2019b required; 2021a preferred)
  - Add the Diff_Equations folder to the path
- Missing images:
  - Add State_images folder to the path
