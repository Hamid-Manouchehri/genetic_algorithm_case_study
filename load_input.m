
function [match_matrix, m] = load_input(input_file)

    cd D:\HW\Bio_Inspired_Computing\HW1\q1\files% cd to 'files' folder
    fid = fopen(input_file);
    % 'm' number of simultaneous occurence of matches:
    m = str2num(fgetl(fid));% read first line 
    cd D:\HW\Bio_Inspired_Computing\HW1\q1% cd back to 'Codes' folder

    i = 1;
    condition = true;
    while condition

        fgetl_output = fgetl(fid);% each call of 'fgetl()', will read next line of file, so we call it once and save the result in a variable.
        if (-1 == fgetl_output)
            condition = false;
        else
            loaded_input(i,:) = str2num(fgetl_output);
            i = i + 1;
        end

    end

    match_matrix = loaded_input;
    fclose(fid);% close the file to avoid instability within iterations.
    
end

