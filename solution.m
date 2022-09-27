clc
clear 
close all

h = animatedline('Marker','.','Color','b');
xlabel('generation'); ylabel('minimum objective value');

input_file  = 'input30.txt';
output_file = 'output30.txt';% output file name

numOf_chrom    = 200;
crossover_rate = .1; %         25% crossover
mutation_rate  = .1; %         10% mutation
numOf_iterate  = 700; %<<<< termination condition >>>>>

indiceOf_obj_values = numOf_iterate + 1;
obj_values = zeros(numOf_iterate, numOf_chrom);

[match_matrix, m] = load_input(input_file);
[~, input_column] = size(match_matrix);% [input_row   input_column]

parent_chrom = round(rand(numOf_chrom, input_column));
obj_valueOf_chrom = obj_func(input_file, parent_chrom);

x = 1:numOf_iterate;% generation 
y = zeros(1,numOf_iterate);

while numOf_iterate 
    
    incremental_indice = indiceOf_obj_values - numOf_iterate;
    
    obj_values(incremental_indice,:) = obj_valueOf_chrom(1,:);
    
    selected_chrom = roulette_wheel(parent_chrom, obj_valueOf_chrom);
    
    selected_crossovered_chrom = crossover(crossover_rate, selected_chrom);
    
    selected_crossovered_mutated_chrom = mutation(mutation_rate, selected_crossovered_chrom);
    
    parent_chrom = selected_crossovered_mutated_chrom;
    
    obj_valueOf_chrom = obj_func(input_file, parent_chrom);
    
    y(incremental_indice) = min(obj_valueOf_chrom);% find fittest chromosome of this generation(of minimum objective value)
    
    addpoints(h,x(incremental_indice),y(incremental_indice)); drawnow% realtime drawing evolution procedure 

    numOf_iterate = numOf_iterate - 1;
    
end
 
[~, output] = find(~obj_valueOf_chrom(1,:));% find number of fittest chromosomes of the last generation
[~, numOf_matches] = find(parent_chrom(output(1),:));% extract only one solution of the population
numOf_write = length(numOf_matches);

cd D:\HW\Bio_Inspired_Computing\HW1\q1\files% cd to 'files' folder
fileID = fopen(output_file,'w');
for k = 1:numOf_write
    fprintf(fileID,'%d \n', numOf_matches(k));
end
fclose(fileID);
cd D:\HW\Bio_Inspired_Computing\HW1\q1% cd back to 'Codes' folder

