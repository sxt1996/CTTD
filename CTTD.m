 function  [result_2D] = CTTD(X_cube, target, column, row)
% paper:¡¶Information Retrieval with Chessboard-Shaped Topology for Hyperspectral Target Detection¡·
% Input:
% X_cube£ºan HSI being processed; target:a priori target spectrum;
% column:the number of columns on the chessboard; row: the number of rows on the chessboard   
% Output:
% result_2D: detection results


 
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;
X_use = reshape(X_cube,pixel_num,band_num);
X = X_use.'; 
clear('X_cube', 'X_use');


%% Construct the chessboard-shaped topological framework 
chessboard_cenvalue1 = [];
target_index_set = [];
target_card_set = [];

for i = 1:band_num
    X_dim = X(i,:);    
    [chessboard_i, X_dim_cen_i] = hist(X_dim, column);    
    chessboard_cenvalue1 = [chessboard_cenvalue1; X_dim_cen_i];
    b = target(i);
    [~, index_target] = min(abs(X_dim_cen_i(:) - b));
    target_j_cardinality = chessboard_i(index_target);
    target_index_set = [target_index_set;index_target];
        if target_j_cardinality == 0
            target_j_cardinality = 1;
        end 
        target_card_set = [target_card_set, target_j_cardinality];          
    
end
      
%% select the optimal separable bands 
[band_dis_target, chessboard_cenvalue_target] = hist(target, row);
optimal_separable_bands = [];

for k = 1:row     
    band_dis_target_k = band_dis_target(k);
    chessboard_cenvalue_target_k = chessboard_cenvalue_target(k);
    [~,target_index_k] = sort(abs(target - chessboard_cenvalue_target_k));


    if band_dis_target_k ~= 0
           
        target_index_k = target_index_k(1:band_dis_target_k);      

        [target_n_cardinality_min, min_po_target] = min(target_card_set(target_index_k));  
              
        min_band_target = target_index_k(min_po_target);       

        optimal_separable_bands = [optimal_separable_bands, min_band_target];
    end
                     
end

target_OBJ_index_set = target_index_set(optimal_separable_bands);

OBJ = length(optimal_separable_bands);

%% perform the information retrieval task
result = zeros(1, pixel_num);

for i = 1:pixel_num
    x = X(:,i);   
       
    x_OBJ_index_set = [];
   
        
    for n = 1:OBJ     
        
        j = optimal_separable_bands(n);      
        a = x(j);        
        X_dim_cen_j = chessboard_cenvalue1(j,:);
      
        
        [~, OBJ_index_x] = min(abs(X_dim_cen_j(:) - a));
        
        x_OBJ_index_set = [x_OBJ_index_set; OBJ_index_x];   
    
    end
        
        sub = x_OBJ_index_set - target_OBJ_index_set;
        x_target_index_differ_on_chess = norm(sub,1); 
            
        target_score = x_target_index_differ_on_chess / OBJ;  
       
        result(i) = exp(-target_score);
   
end   
     
r_255 = get_255(result);   
result_2D = reshape(r_255, samples, lines);   

end



