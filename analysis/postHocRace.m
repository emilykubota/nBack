% This script goes through each file and creates an output for statistical
% analysis 

% Change to data directory 
cd ../data

% Look for text files in directory and store names in a cell
s = dir('*.txt');
file_list = {s.name};

% Preallocate for number of subjects. There are values for RT and accuracy
% for same race and different race. 
C = cell(length(file_list),4);

% Can be changed based on number of runs
nruns = 12;

% Read each file 
for ii = 1:length(file_list)
    
    %Set empty arrays to capture data 
    RTsame = [];
    RTdiff = [];
    ACCsame = 0;
    ACCdiff = 0;
    totalSame = 0;
    totalDiff = 0;
    
    
    T = readtable(char(file_list(ii)),'Delimiter', ',', 'Format', '%d %d %d %s %f %d %s %s %s %s');
    % Get accurate RTs for same race and different race
    for ti = 1:720 % there are 720 trials for thesis experiment
        % Check condition and for correct accuracy and RT
        if strcmp(T.SubRace(ti),T.Race(ti)) && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RTsame = [RTsame T.RT(ti)];
        elseif ~strcmp(T.SubRace(ti),T.Race(ti)) && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RTdiff = [RTdiff T.RT(ti)];
        end 
        % Now check accuracy
        if strcmp(T.SubRace(ti),T.Race(ti)) && ...
            T.Accuracy(ti) == 1
        ACCsame = ACCsame + 1;
        totalSame = totalSame + 1; 
        %Also need to check how many runs were the same race 
        elseif strcmp(T.SubRace(ti),T.Race(ti))
            totalSame = totalSame + 1;
        elseif ~strcmp(T.SubRace(ti),T.Race(ti)) && ...
            T.Accuracy(ti) == 1
        ACCdiff = ACCdiff + 1;
        totalDiff = totalDiff + 1;
        else
            totalDiff = totalDiff + 1;
        end 
        
        % Round data to 3 decimals and put in cell
        C(ii,1) = {round(mean(RTsame),3)};
        C(ii,2) = {round(mean(RTdiff),3)};
        C(ii,3) = {round(ACCsame/totalSame,3)};
        C(ii,4) = {round(ACCdiff/totalDiff,3)};
    end 
end 
    
    % Put data into a table.

T = cell2table(C, 'VariableNames', {'RTsame', 'RTdiff', 'ACCsame', 'ACCdiff'});
    
% Name file using sub_num & write table 
file_name = 'posthocRace.txt';

% Move back to analysis folder and write table
cd ../analysis
writetable(T, file_name)   
        

            