% Read in file  
T = readtable('output.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f');

% Get number of subs 
nsubs = length(T.RT00);

% Preallocate new cell for data (6 columns and nSubs rows) 
C = cell(nsubs,6);

% Take the average of RTs for 0back and then put into new cell 

for ii = 1:nsubs
    avg = (T.RT00(ii) + T.RT01(ii))/2;
    C(ii,1) = {round(avg,3)};
end 

% Do the same for 1back 
for ii = 1:nsubs 
    avg = (T.RT10(ii) + T.RT11(ii))/2;
    C(ii,2) = {round(avg,3)};
end

% And for 2back...

for ii = 1:nsubs 
    avg = (T.RT20(ii) + T.RT21(ii))/2;
    C(ii,3) = {round(avg,3)};
end

% Do the same for accuracy for 0-back

for ii = 1:nsubs
    avg = (T.Acc00(ii) + T.Acc01(ii))/2;
    C(ii,4) = {round(avg,3)};
end 

% And 1-back.

for ii = 1:nsubs
    avg = (T.Acc10(ii) + T.Acc11(ii))/2;
    C(ii,5) = {round(avg,3)};
end 

% And 2-back.

for ii = 1:nsubs
    avg = (T.Acc20(ii) + T.Acc21(ii))/2;
    C(ii,6) = {round(avg,3)};
end 

   % Put data into a table.

T = cell2table(C, 'VariableNames', {'RT0', 'RT1', 'RT2', 'Acc0', 'Acc1'...
    'Acc2'});
    
% Name file using sub_num & write table 
file_name = 'mainEffect_load.txt';

% Write table
writetable(T, file_name)   
