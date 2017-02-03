
function [params,file] = getuserinput()

fprintf('\nWelcome to a Target Tracking System, here are some inputs:\n')
fprintf('\nVideoReader \n0 - Read video in loop \n1 - Read video before loop\n')
fprintf('\nFilter Version \n0 - Particle Filter - X = [x y x_dot y_dot] \n1 - Particle Filter - X = [x y theta] \n2 - Kalman Filter   - X = [x y x_dot y_dot]\n')
fprintf('\nVERBOSE \n1 - Particle Filter - Only particles shown \n2 - Particle Filter - Particles and their mean shown \n3 - Particle Filter - Particles, their mean and box shown \n4 - Particle Filter - Also shows other targets \n5 - Kalman Filter   - Only prediction shown \n6 - Kalman Filter   - Both prediction and measurement shown\n')
fprintf('\nTarget choice \n0 - No target choise \n1 - Target choise\n')
fprintf('\nResampling Mode for Particle Filter \n1 - Systematic resampling \n2 - Multinomial resampling\n')
fprintf('\nError plotting (Only for version 1 || 2) \n0 - No error plot \n1 - Error plot\n\n')


prompt = {'Video File Name:','VideoReader Mode:', ...
    'Filter Version:','VERBOSE Mode:',...
    'Target Choice:','Number of Particles:',...
    'Resampling Mode:','Error Plotting Mode:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'4p0.avi','1','1','1','0','1000','1','1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

file = answer{1};
params.vr = str2num(answer{2});
params.version = str2num(answer{3});
params.VERBOSE = str2num(answer{4});
params.tt = str2num(answer{5});
params.nparticles = str2num(answer{6});
params.sampling = str2num(answer{7});
params.errplot = str2num(answer{8});



%     % Video File
%     % file = '4p0.avi';
%     file = answer{1};
%     
%     % VideoReader
%     % 0 - Read video in loop 
%     % 1 - Read video before loop 
%     % vr = 1;
%     vr = str2num(answer{2});
%     
%     % Filter Version
%     % 0 - Particle Filter - X = [x y x_dot y_dot]'
%     % 1 - Particle Filter - X = [x y theta]'
%     % 2 - Kalman Filter   - X = [x y x_dot y_dot]'
%     % version = 1;
%     version = str2num(answer{3});
%     
%     % VERBOSE
%     % 1 - Particle Filter - Only particles shown
%     % 2 - Particle Filter - Particles and their mean shown
%     % 3 - Particle Filter - Particles, their mean and box shown
%     % 4 - Particle Filter - Also shows other targets
%     % 5 - Kalman Filter   - Only prediction shown
%     % 6 - Kalman Filter   - Both prediction and measurement shown
%     % VERBOSE = 1;
%     VERBOSE = str2num(answer{4});
%     
%     % Target choice 
%     % 0 - No target choise
%     % 1 - Target choise
%     % tt = 0;
%     tt = str2num(answer{5});
%     
%     % Numper of Particles 
%     % nop = 1000;
%     nop = str2num(answer{6});
%     
%     % Resampling Mode for Particle Filter
%     % 1 - Systematic resampling
%     % 2 - Multinomial resampling
%     % sampling = 1;
%     sampling = str2num(answer{7});
%     
%     % Error plotting (Only for version 1 || 2)
%     % 0 - No error plot
%     % 1 - Error plot
%     % errplot = 1;
%     errplot = str2num(answer{8});





