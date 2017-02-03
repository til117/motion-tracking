
% This function does the predict step.

function [S_bar,params] = predict(S,params,i,x,y)

switch params.version
    
    case 0
        S_bar.X = params.A * S.X + params.Diffusion;
        S_bar.W = S.W;
        
    case 1
        S_bar.X = S.X + params.dt * [params.v * cos(S.X(3,:)) ; ...
            params.v * sin(S.X(3,:)) ; repmat(params.omega,1,params.nparticles)];
        S_bar.X= S_bar.X + params.Diffusion;
        S_bar.W = S.W;
        
    case 2
        
        params.Phat = params.A * params.P * params.A' + params.Q;
        
        if i ~= 1
            S.P = params.A * S.U(i-1,:)';
        else
            S.P = [x,y,0,0]' ;
        end
        
        S_bar = S;
        
            
end

end