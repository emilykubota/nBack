% This script goes through each file and creates an output for statistical
% analysis 

% Change to data directory 
cd ../data

% Look for text files in directory and store names in a cell
s = dir('*.txt');
file_list = {s.name};

% Preallocate for number of subjects. There are values for RT and accuracy
% for the 6 conditions. 
C = cell(length(file_list),12);

% Can be changed based on number of runs
nruns = 12;

% Read each file 
for ii = 1:length(file_list)
    
    %Set empty arrays to capture data 
    RT00 = [];
    RT01 = [];
    RT10 = [];
    RT11 = [];
    RT20 = [];
    RT21 = [];
    Acc00 = 0;
    Acc01 = 0;
    Acc10 = 0;
    Acc11 = 0;
    Acc20 = 0;
    Acc21 = 0;
    
    T = readtable(char(file_list(ii)),'Delimiter', ',', 'Format', '%d %d %d %s %f %d %s %s');
    % Get accurate RTs for each condition
    for ti = 1:720 % there are 720 trials for thesis experiment
        % Check condition and for correct accuracy and RT
        if T.nBack(ti) == 0 && T.Degradation(ti) == 0 && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RT00 = [RT00 T.RT(ti)];
        elseif T.nBack(ti) == 0 && T.Degradation(ti) == 1 && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RT01 = [RT01 T.RT(ti)];
        elseif T.nBack(ti) == 1 && T.Degradation(ti) == 0 && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RT10 = [RT10 T.RT(ti)];
        elseif T.nBack(ti) == 1 && T.Degradation(ti) == 1 && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RT11 = [RT11 T.RT(ti)];
        elseif T.nBack(ti) == 2 && T.Degradation(ti) == 0 && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RT20 = [RT20 T.RT(ti)];
        elseif T.nBack(ti) == 2 && T.Degradation(ti) == 1 && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
        % Add RT to matrix (we will later take mean)
        RT21 = [RT21 T.RT(ti)];
        end 
        
        % Now check accuracy
        if T.nBack(ti) == 0 && T.Degradation(ti) == 0 && ...
            T.Accuracy(ti) == 1 
        Acc00 = Acc00 + 1;
        elseif T.nBack(ti) == 0 && T.Degradation(ti) == 1 && ...
            T.Accuracy(ti) == 1 
        Acc01 = Acc01 + 1;
        elseif T.nBack(ti) == 1 && T.Degradation(ti) == 0 && ...
            T.Accuracy(ti) == 1
        Acc10 = Acc10 + 1;
        elseif T.nBack(ti) == 1 && T.Degradation(ti) == 1 && ...
            T.Accuracy(ti) == 1 
        Acc11 = Acc11 + 1;
        elseif T.nBack(ti) == 2 && T.Degradation(ti) == 0 && ...
            T.Accuracy(ti) == 1 
        Acc20 = Acc20 + 1;
        elseif T.nBack(ti) == 2 && T.Degradation(ti) == 1 && ...
            T.Accuracy(ti) == 1
        Acc21 = Acc21 + 1;
        end 
        
        % Round data to 3 decimals and put in cell
        C(ii,1) = {round(mean(RT00),3)};
        C(ii,2) = {round(mean(RT01),3)};
        C(ii,3) = {round(mean(RT10),3)};
        C(ii,4) = {round(mean(RT11),3)};
        C(ii,5) = {round(mean(RT20),3)};
        C(ii,6) = {round(mean(RT21),3)};
        C(ii,7) = {round(Acc00/(nruns*10),3)};
        C(ii,8) = {round(Acc01/(nruns*10),3)};
        C(ii,9) = {round(Acc10/(nruns*10),3)};
        C(ii,10) = {round(Acc11/(nruns*10),3)};
        C(ii,11) = {round(Acc20/(nruns*10),3)};
        C(ii,12) = {round(Acc21/(nruns*10),3)};
    end 
end 
    
    % Put data into a table.

T = cell2table(C, 'VariableNames', {'RT00', 'RT01', 'RT10', 'RT11', 'RT20'...
    'RT21', 'Acc00', 'Acc01', 'Acc10', 'Acc11', 'Acc20', 'Acc21'});
    
% Name file using sub_num & write table 
file_name = 'output.txt';

% Move back to analysis folder and write table
cd ../analysis
writetable(T, file_name)   
        

            