
% Returns the properties of the current image including:
% Region Areas
% Region Centroids
% Region Corners
%
% And sorts the regions by their Area size

function properties = funcprop(params,current_image,background)

thresh = 40;

% Get image regions
difference_image = (abs(current_image(:,:,1)-background(:,:,1))>thresh) ...
| (abs(current_image(:,:,2)-background(:,:,2))>thresh) ...
| (abs(current_image(:,:,3)-background(:,:,3))>thresh);

% Label image regions
labeled_image = bwlabel(difference_image,4);
properties = regionprops(labeled_image, ['basic']);
[nregions,~] = size(properties);

if nregions < params.ppl
    tmp = nregions;
else
    tmp = params.ppl;
end

% Sort image regions
for k = 1:tmp
    for j = k:nregions
        if properties(j).Area > properties(k).Area
            temp = properties(k);
            properties(k)= properties(j);
            properties(j)= temp;
        end
    end
end

end
