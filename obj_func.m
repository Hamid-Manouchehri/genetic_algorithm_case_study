% compute objective value for each chromosome:
function y = obj_func(input_file, parent_chrom)

    [match_matrix, m] = load_input(input_file);
    
    [numOf_chrom, numOf_gene] = size(parent_chrom);
    
    value = 0;% it holds objective value of each chromosome
    obj_value = zeros(1, numOf_chrom);
    
    for i = 1:numOf_chrom
        [~, column] = find(parent_chrom(i,:));
        column_length = length(column);
        
        if m == column_length  
            for j = 1:column_length
                for k = 1:column_length 
                    if 1 == match_matrix(column(j), column(k))
                        value = value + 1; 
                    end
                end
            end
            obj_value(i) = value / 2;
            value = 0;
        else
            obj_value(i) = numOf_gene + numOf_chrom;% assign a high value to delete it soon from population
        end 
        
    end
    y = obj_value;
end

