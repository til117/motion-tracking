
function particlemean = getmean(S,params,i,particlemean)

if params.errplot == 1
    if (params.version == 0) || (params.version == 1)
        version = 1;
    elseif params.version == 2
        version = 2;
    end
    switch version
        case 1
            meanx = sum(S.X(1,:)) / size(S.X(1,:),2);
            meany = sum(S.X(2,:)) / size(S.X(2,:),2);
            particlemean(i,1) = meanx;
            particlemean(i,2) = meany;
        case 2
            particlemean(i,1) = S.U(i,1);
            particlemean(i,2) = S.U(i,2);
    end

end
    