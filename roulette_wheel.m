% this function allows chromosomes to reproduce even deletion randomly 
% but the population will be fixed. 
function y = roulette_wheel(parent_chrom, obj_valueOf_chrom)

    [numOf_chrom, numOf_gene] = size(parent_chrom);
    fitness = 1./(1 + obj_valueOf_chrom);
    total = sum(fitness);
    probability = fitness / total;
    cumulative_sum = cumsum(probability);
    random_num = rand(numOf_chrom,1);
    zero_added_cumsum = [0 cumulative_sum];
    selected_chrom = zeros(numOf_chrom, numOf_gene);
    
    for i = 1:numOf_chrom
        for j = 1:(length(cumulative_sum))
            if ( random_num(i) >= zero_added_cumsum(j) ) && ( random_num(i) <= zero_added_cumsum(j+1) )
                selected_chrom(i,:) = parent_chrom(j,:);
            end
        end
    end
    
    y = selected_chrom;% new generation
    
end

