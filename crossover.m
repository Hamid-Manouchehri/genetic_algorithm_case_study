function y = crossover(crossover_rate, parent_chrom)
% crossover_rate must be defined as a floating point number for instance:
% 25% ---> .25

    [numOf_chrom,~] = size(parent_chrom);
    new_chrom = parent_chrom;
    indiceOf_selected_chrom = zeros(0);
    minimum_selectionFlag = true;
    j = 1;% indice of vector containing 'indiceOf_selected_chrom'
    
    while  minimum_selectionFlag 
        
        random_num = rand(numOf_chrom, 1);
        for i = 1:numOf_chrom
            if random_num(i) < crossover_rate
                selected_chrom(j, :) = new_chrom(i, :);
                indiceOf_selected_chrom(j) = i;
                j = j + 1;
            end
        end
        
        if j > 2 % to ensure there is at-least two chromosomes to crossover
           minimum_selectionFlag = false; 
        end
        
        j = 1;% initialize again
        
    end
    
    [numOf_selected_chrom, numOf_gene] = size(selected_chrom);
    crossover_point = numOf_gene - 1;
    
    for i = 1:numOf_selected_chrom
        random_crossover_point = randi(crossover_point);
        sub_chrom = selected_chrom(i,1:random_crossover_point);
        indiceOf_next_chrom = i + 1;
        
        if indiceOf_next_chrom > numOf_selected_chrom% to detect last chromosome to be paired with the first one 
            indiceOf_next_chrom = 1;
        end
        
        new_chrom(indiceOf_selected_chrom(i),:) = [sub_chrom  selected_chrom(indiceOf_next_chrom,(random_crossover_point + 1):numOf_gene)];
    end
    
    selected_crossovered_chrom = new_chrom;
    y = selected_crossovered_chrom;
    
end


