function y = mutation(mutation_rate, selected_crossovered_chrom)
% mutation_rate must be defined as a floating point number for instance:
% 10% ---> .10

    [numOf_selected_chrom, numOf_gene] = size(selected_crossovered_chrom);
    numOf_whole_genes = numOf_selected_chrom * numOf_gene;
    numOf_mutations = round(mutation_rate * numOf_whole_genes);
    random_gene_value = round(rand(1, numOf_mutations));
    random_int_num = randi(numOf_whole_genes, 1, numOf_mutations);% vector of 1*numOf_mutations of random integers,
    % be aware it is probable to have repeated numbers(more than one
    % mutation for a gene)
    
    % to access each gene apart from its chromosome by indice elements in matrix,
    % first transpose it, after mutation reverse it back:
    transposed_selected_crossovered_chrom = selected_crossovered_chrom';
    
    for i = 1:numOf_mutations
        transposed_selected_crossovered_chrom(random_int_num(i)) = random_gene_value(i);
    end
    
    selected_crossovered_mutated_chrom = transposed_selected_crossovered_chrom';
    y = selected_crossovered_mutated_chrom;
    
end

