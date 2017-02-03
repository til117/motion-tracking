
% This function gets the measurements based on the output of
% the function funcprop.
%
% It calculates the centroid based on the previous measurement,
% in order to follow a target and not just take into account 
% the biggest region of change in the current frame

function [centroid,Index] = measurements(params,i,properties,pcx,pcy)

[a,~] = size(properties);

if a ~= 0
    
    if a < params.ppl
        tmp = a;
    else
        tmp = params.ppl;
    end
    
    distance = zeros(1,tmp);
    
    for k = 1:tmp
        distance(k) = sqrt(abs(properties(k).Centroid(1) - pcx)^2 + abs(properties(k).Centroid(2) - pcy)^2);
    end
    
    [~,Index] = min(distance);
    
    centroid = properties(Index).Centroid;
else
    Index = 0;
    centroid = [params.columns/2,params.rows/2];
end

if params.tt == 1;
    v = [100:100:params.nframes];
    l = length(v);
    for k = 1:l
        if v(k) == i
            [x,y] = ginput(1);
            centroid = [x,y];
        end
    end
end