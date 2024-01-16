function [result] = get_255(r)

pixel_num = length(r);
nan_list = find(isnan(r));
r(nan_list)=0;


r_min = min(r(:));
r_max = max(r(:));


result = ((r - r_min)*255)/(r_max - r_min); 
result = reshape(result,1,pixel_num);
end
