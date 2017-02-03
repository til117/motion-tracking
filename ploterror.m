
function ploterror(params,particlemean,centroidx,centroidy,a,b)

if params.errplot == 1
    err_z = zeros(1,params.nframes);

    for m = 1:params.nframes
        err_z(m) = sqrt((particlemean(m,1) - centroidx(m))^2 + (particlemean(m,2) - centroidy(m))^2);
    end   
    
    meanerror = mean(err_z);
    str = sprintf('The mean error is: %d',meanerror);
    
    ymax = max(err_z);
    xmin = a - 100;
    xmax = b + 100;
    
    figure
    plot(err_z)
    axis([xmin xmax 0 ymax])
    legend(str)
    title('Measurement Error Plot')

end