% 'input_file' is a the complete name of input file as string:
function parent_chrom = generation(numOf_chrom)
    
    input_file = 'input_filename.txt';
    
    [match_matrix, ~] = load_input(input_file);
    
    [~, numOf_gene] = size(match_matrix);
    
    parent_chrom = round(rand(numOf_chrom, numOf_gene));
    
end