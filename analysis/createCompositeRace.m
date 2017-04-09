% Reads in the output file and creates composites of RT and accuracy to
% deal with the speed/accuracy trade-off. 

T = readtable('postHocRace.txt','Delimiter', ',', 'Format', '%f %f %f %f');

% Create cell for storing new data 

C = cell(24,2);

% Divide RT by accuracy and store in a cell
for ii = 1:24
    C(ii,1) = {round((T.RTsame(ii)/T.ACCsame(ii)),3)};
    C(ii,2) = {round((T.RTdiff(ii)/T.ACCdiff(ii)),3)};
    
end 

 % Put data into a table.

T = cell2table(C, 'VariableNames', {'COMsame', 'COMdiff'});
    
% Name file using sub_num & write table 
file_name = 'compositeRace.txt';

% Move back to analysis folder and write table
writetable(T, file_name)   
        
