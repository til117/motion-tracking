
% This function does the weight step.

function S_bar = weight(S_bar,params,centroidx,centroidy)

if (params.version == 0) || (params.version == 1)
    version = 1;
elseif params.version == 2
    version = 2;
end

switch version
    
    case 1

        X = S_bar.X(1:2,:);
        z = [centroidx ; centroidy];

        p = exp(-0.5 * ((z(1) - X(1,:)).^2 / params.Sigma_Q(1) + ...
            (z(2) - X(2,:)).^2 / params.Sigma_Q(4)));
        p = p / sum(p);
        S_bar.W = p;
        
    case 2 
        

end


