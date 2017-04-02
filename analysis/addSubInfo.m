function addSubInfo(file_name, Race, Gender)
% Takes in subject file and subject race and gender and adds to data.

% Read in data
cd ../data
T = readtable(file_name,'Delimiter', ',', 'Format', '%d %d %d %s %f %d %s %s');

% Preallocate new cell for subject information 
C = cell(720,2);
C(:,1) = {Race}; % Insert race of subject 
C(:,2) = {Gender}; %Insert gender of subject 

% Turn into a table 
T1 = cell2table(C, 'VariableNames', {'SubRace', 'SubGender'});

% Concatenate two tables 
T = [T T1];

% Write table
writetable(T, file_name)