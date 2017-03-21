sub_num = 99;
nruns = 2;
C = cell(nruns*10,8);
mi = 1;

for ri = 1:nruns            
    trial = ri;
    stim = 0;
    zero_back  
end;     

T = cell2table(C, 'VariableNames', {'Trial', 'nBack', 'Degradation', 'Image',...
    'RT', 'Accuracy', 'Race', 'Gender'});
    
% Name file using sub_num & write table 
file_name = sprintf('sub_%d.txt',sub_num);

% move to data file and write table
cd data 
writetable(T, file_name)  

sca;                