% Read in file  
T = readtable('output.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f');

% Get number of subs 
nsubs = length(T.RT00);

% Preallocate new cell for data (4 columns and nSubs rows) 
C = cell(nsubs,4);

% Take the average of RTs for intact and then put into new cell 

for ii = 1:nsubs
    avg = (T.RT00(ii) + T.RT10(ii) + T.RT20(ii))/3;
    C(ii,1) = {round(avg,3)};
end 

% Do the same for degraded 

for ii = 1:nsubs
    avg = (T.RT01(ii) + T.RT11(ii) + T.RT21(ii))/3;
    C(ii,2) = {round(avg,3)};
end 

% Repeat for intact accuracy 

for ii = 1:nsubs
    avg = (T.Acc00(ii) + T.Acc10(ii) + T.Acc20(ii))/3;
    C(ii,3) = {round(avg,3)};
end 

% And degraded accuracy

for ii = 1:nsubs
    avg = (T.Acc01(ii) + T.Acc11(ii) + T.Acc21(ii))/3;
    C(ii,4) = {round(avg,3)};
end 

  % Put data into a table.

T = cell2table(C, 'VariableNames', {'RTI', 'RTD', 'AccI', 'AccD'});
    
% Name file using sub_num & write table 
file_name = 'mainEffect_degradation.txt';

% Write table
writetable(T, file_name)   
