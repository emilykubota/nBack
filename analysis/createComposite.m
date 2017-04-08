% Reads in the output file and creates composites of RT and accuracy to
% deal with the speed/accuracy trade-off. 

T = readtable('output.txt','Delimiter', ',', 'Format', '%f %f %f %f %f %f %f %f %f %f %f %f');

% Create cell for storing new data 

C = cell(24,6);

% Divide RT by accuracy and store in a cell
for ii = 1:24
    C(ii,1) = {round((T.RT00(ii)/T.Acc00(ii)),3)};
    C(ii,2) = {round((T.RT01(ii)/T.Acc01(ii)),3)};
    C(ii,3) = {round((T.RT10(ii)/T.Acc10(ii)),3)};
    C(ii,4) = {round((T.RT11(ii)/T.Acc11(ii)),3)};
    C(ii,5) = {round((T.RT20(ii)/T.Acc20(ii)),3)};
    C(ii,6) = {round((T.RT21(ii)/T.Acc21(ii)),3)};
end 

 % Put data into a table.

T = cell2table(C, 'VariableNames', {'com00', 'com01', 'com10', 'com11', 'com20'...
    'com21'});
    
% Name file using sub_num & write table 
file_name = 'composite.txt';

% Move back to analysis folder and write table
writetable(T, file_name)   
        
