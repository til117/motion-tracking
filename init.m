
% This function initializes:
% The particles for the Particle Filter, or
% The belief for the Kalman Filter

function S = init(params)

switch params.version
    case 0
        S.X = [randi(params.rows,1,params.nparticles); ...
            randi(params.columns,1,params.nparticles); ...
            zeros(2,params.nparticles)];
        S.W = 1/params.nparticles * ones(1,params.nparticles); 

    case 1
        S.X = [rand(1, params.nparticles)*params.rows; ...
        rand(1, params.nparticles)*params.columns; ...
        rand(1,params.nparticles)*2*pi - pi];
        S.W = 1/params.nparticles * ones(1,params.nparticles); 
    
    case 2
        S.P = zeros(params.nframes,4);
        S.U = zeros(params.nframes,4);
        S.K = zeros(4,2);
        
end


end