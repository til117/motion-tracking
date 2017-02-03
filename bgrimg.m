
% Calculates the backgroud image by
% taking the mean of the 10 first frames.

function background = bgrimg(video,params)

tmp = zeros(params.rows,params.columns,params.sheets);
for i = 1:10
    tmp = double(read(video,i)) + tmp;
end
background = tmp/10;