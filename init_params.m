
% This function initializes the needed parameters

function params = init_params(video,params)

params.dt = 1;
params.nframes = video.NumberOfFrames;
[params.rows , params.columns , params.sheets] = size(read(video,1));
params.ppl = 4;

switch params.version
    case 0
        params.A = [1 0 params.dt 0; 0 1 0 params.dt; 0 0 1 0; 0 0 0 1];
        params.Diffusion = [25 * randn(2,params.nparticles) ; ...
            5 * randn(2,params.nparticles)];
        params.Sigma_Q = diag([100 100]);

    case 1
        params.omega = 2*pi/params.nframes;
        params.Sigma_R = diag([100 100 0.01]);
        params.Sigma_Q = diag([100 100]);
        params.v = 2*pi*200/params.nframes;
        params.Diffusion = randn(3,params.nparticles) ...
            .* repmat(sqrt(diag(params.Sigma_R)),1,params.nparticles);
        
    case 2
        params.A = [1 0 params.dt 0; 0 1 0 params.dt; 0 0 1 0; 0 0 0 1];
        params.H = [1 0 0 0 ; 0 1 0 0];
        params.R = [0.2845 0.0045 ; 0.0045 0.0455];
        params.Q = eye(4) * 0.01;
        params.P = eye(4) * 100;
        params.Phat = zeros(4);
end