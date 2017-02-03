
% This function does the update step.

function [S,params] = update1(S_bar,params,i,x,y)

if (params.version == 0) || (params.version == 1)
    version = 1;
elseif params.version == 2
    version = 2;
end

switch version
    
    case 1
        
        switch params.sampling
            case 1
                cdf = cumsum(S_bar.W);
                S.X = zeros(size(S_bar.X));
                r_0 = rand / params.nparticles;
                for m = 1 : params.nparticles
                    i = find(cdf >= r_0,1,'first');
                    S.X(:,m) = S_bar.X(:,i);
                    r_0 = r_0 + 1/params.nparticles;
                end
                S.W = 1/params.nparticles * ones(size(S_bar.W));
                
            case 2
                cdf = cumsum(S_bar.W);
                S.X = zeros(size(S_bar.X));
                for m = 1 : params.nparticles
                    r_m = rand;
                    i = find(cdf >= r_m,1,'first');
                    S.X(:,m) = S_bar.X(:,i);
                end
                S.W = 1/params.nparticles*ones(size(S_bar.W));
        end
        
    case 2
        
        S.K = (params.Phat * params.H') / ...
            (params.H * params.Phat * params.H' + params.R);
        S.U(i,:) = S_bar.P + S.K * ...
            ([x y]' - params.H * S_bar.P);
        params.P = params.Phat - S.K * params.H * params.Phat;


end