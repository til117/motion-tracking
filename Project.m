
function Project()

clear all, close all, clc

%% User Input
    
[params,file] = getuserinput();

%% Video Initialization

video = VideoReader(file); 

%% Parameter Initialization

params = init_params(video,params); 

%% Background Image Initialization

background = bgrimg(video,params);

%% Creating Particles / Initializing States

S = init(params);

%% Main Loop

centroidx = zeros(params.nframes,1);
centroidy = zeros(params.nframes,1);
particlemean = zeros(params.nframes,2);

if params.vr == 1;
    mov = cell(1,params.nframes);
    h = waitbar(0,'Video Initialization');
    for j = 1:params.nframes
        mov{j} = read(video,j);
        waitbar(j/params.nframes);
    end
    close(h)
else
    mov = 0;
end

for i = 1:params.nframes
    tic
    % Read and show current image
    switch params.vr
        case 0 
            frame = read(video,i);
        case 1
            frame = mov{i};
    end
    current_image = double(frame);
    imshow(frame);
    hold on
    
    % Get image properties
    
    properties = funcprop(params,current_image,background);
   
    % Get measurements
    if i ~= 1
        [centroid,Index] = measurements(params,i,properties,centroidx(i-1),centroidy(i-1));
    else
        centroid = [0 0];
        Index = 0;
    end
    
    centroidx(i) = centroid(1);
    centroidy(i) = centroid(2);
    
    % Predict
    
    [S_bar,params] = predict(S,params,i,centroidx(1),centroidy(1));
    
    % Weight
    
    S_bar = weight(S_bar,params,centroidx(i),centroidy(i));
    
    % Resample / Update
    
    [S,params] = update1(S_bar,params,i,centroidx(i),centroidy(i));
    
    % Show
    
    graphics(S,properties,Index,params.VERBOSE,params,i,centroidx(i),centroidy(i));
    
    % Mean
    
    particlemean = getmean(S,params,i,particlemean);
    toc
end

%% Errors

    ploterror(params,particlemean,centroidx,centroidy,startframe,endframe)
    
    
end