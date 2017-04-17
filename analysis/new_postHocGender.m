% This script goes through each file and creates an output for statistical
% analysis 

% Change to data directory 
cd ../data

% Look for text files in directory and store names in a cell
s = dir('*.txt');
file_list = {s.name};

% Preallocate for number of subjects. There are values for RT and accuracy
% for same race and different race. 
C = cell(length(file_list),24);

% Read each file 
for ii = 1:length(file_list)
    
    %Set empty arrays to capture data 
    RTsame00 = [];
    RTsame01 = [];
    RTsame10 = [];
    RTsame11 = [];
    RTsame20 = [];
    RTsame21 = [];
    
    RTdiff00 = [];
    RTdiff01 = [];
    RTdiff10 = [];
    RTdiff11 = [];
    RTdiff20 = [];
    RTdiff21 = [];
   
    
    ACCsame00 = 0;
    ACCsame01 = 0;
    ACCsame10 = 0;
    ACCsame11 = 0;
    ACCsame20 = 0;
    ACCsame21 = 0;
  
    
    ACCdiff00 = 0;
    ACCdiff01 = 0;
    ACCdiff10 = 0;
    ACCdiff11 = 0;
    ACCdiff20 = 0;
    ACCdiff21 = 0;
   
    totalSame00 = 0;
    totalSame01 = 0;
    totalSame10 = 0;
    totalSame11 = 0;
    totalSame20 = 0;
    totalSame21 = 0;
   
    
    totalDiff00 = 0;
    totalDiff01 = 0;
    totalDiff10 = 0;
    totalDiff11 = 0;
    totalDiff20 = 0;
    totalDiff21 = 0;
  


    
    T = readtable(char(file_list(ii)),'Delimiter', ',', 'Format', '%d %d %d %s %f %d %s %s %s %s');
    % Get accurate RTs for same race and different race
    for ti = 1:720 % there are 720 trials for thesis experiment
        % Check for same race and for correct accuracy and RT
        if strcmp(T.SubGender(ti),T.Gender(ti)) && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
            if T.nBack(ti) == 0 && T.Degradation(ti) == 0 
                RTsame00 = [RTsame00 T.RT(ti)];
            elseif T.nBack(ti) == 0 && T.Degradation(ti) == 1 
                RTsame01 = [RTsame01 T.RT(ti)];
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 0
                % Add RT to matrix (we will later take mean)
                RTsame10 = [RTsame10 T.RT(ti)];
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 1 
                RTsame11 = [RTsame11 T.RT(ti)];
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 0
                RTsame20 = [RTsame20 T.RT(ti)];
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 1 
                RTsame21 = [RTsame21 T.RT(ti)];
            end    
           % If the race of subject is different than race of stim, do the
           % same thing...
        elseif ~strcmp(T.SubGender(ti),T.Gender(ti)) && ...
            T.Accuracy(ti) == 1 && ~isnan(T.RT(ti))
            if T.nBack(ti) == 0 && T.Degradation(ti) == 0
                RTdiff00 = [RTdiff00 T.RT(ti)];
            elseif T.nBack(ti) == 0 && T.Degradation(ti) == 1
                RTdiff01 = [RTdiff01 T.RT(ti)];
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 0 
                RTdiff10 = [RTdiff10 T.RT(ti)];
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 1
                RTdiff11 = [RTdiff11 T.RT(ti)];
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 0 
                RTdiff20 = [RTdiff20 T.RT(ti)];
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 1
                RTdiff21 = [RTdiff21 T.RT(ti)];
            end 
        end 
   
        % Now check accuracy
        if strcmp(T.SubGender(ti),T.Gender(ti)) 
            if T.nBack(ti) == 0 && T.Degradation(ti) == 0
                totalSame00 = totalSame00 + 1; 
                if T.Accuracy(ti) == 1
                ACCsame00 = ACCsame00 + 1;
                end 
            elseif T.nBack(ti) == 0 && T.Degradation(ti) == 1
                totalSame01 = totalSame01 + 1; 
                if T.Accuracy(ti) == 1
                ACCsame01 = ACCsame01 + 1;
                end 
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 0
                totalSame10 = totalSame10 + 1; 
                if T.Accuracy(ti) == 1
                ACCsame10 = ACCsame10 + 1;
                end 
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 1
                totalSame11 = totalSame11 + 1; 
                if T.Accuracy(ti) == 1
                ACCsame11 = ACCsame11 + 1;
                end 
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 0
                totalSame20 = totalSame20 + 1; 
                if T.Accuracy(ti) == 1
                ACCsame20 = ACCsame20 + 1;
                end 
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 1
                totalSame21 = totalSame21 + 1; 
                if T.Accuracy(ti) == 1
                ACCsame21 = ACCsame21 + 1;
                end  
            end
        elseif ~strcmp(T.SubGender(ti),T.Gender(ti)) 
            if T.nBack(ti) == 0 && T.Degradation(ti) == 0
                totalDiff00 = totalDiff00 + 1; 
                if T.Accuracy(ti) == 1
                ACCdiff00 = ACCdiff00 + 1;
                end 
            elseif T.nBack(ti) == 0 && T.Degradation(ti) == 1
                totalDiff01 = totalDiff01 + 1; 
                if T.Accuracy(ti) == 1
                ACCdiff01 = ACCdiff01 + 1;
                end 
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 0
                totalDiff10 = totalDiff10 + 1; 
                if T.Accuracy(ti) == 1
                ACCdiff10 = ACCdiff10 + 1;
                end 
            elseif T.nBack(ti) == 1 && T.Degradation(ti) == 1
                totalDiff11 = totalDiff11 + 1; 
                if T.Accuracy(ti) == 1
                ACCdiff11 = ACCdiff11 + 1;
                end 
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 0
                totalDiff20 = totalDiff20 + 1; 
                if T.Accuracy(ti) == 1
                ACCdiff20 = ACCdiff20 + 1;
                end 
            elseif T.nBack(ti) == 2 && T.Degradation(ti) == 1
                totalDiff21 = totalDiff21 + 1; 
                if T.Accuracy(ti) == 1
                ACCdiff21 = ACCdiff21 + 1;
                end 
            end 
        end
    end 
        
        % Round data to 3 decimals and put in cell
        C(ii,1) = {round(mean(RTsame00),3)};
        C(ii,2) = {round(mean(RTsame01),3)};
        C(ii,3) = {round(mean(RTsame10),3)};
        C(ii,4) = {round(mean(RTsame11),3)};
        C(ii,5) = {round(mean(RTsame20),3)};
        C(ii,6) = {round(mean(RTsame21),3)};
        C(ii,7) = {round(mean(RTdiff00),3)};
        C(ii,8) = {round(mean(RTdiff01),3)};
        C(ii,9) = {round(mean(RTdiff10),3)};
        C(ii,10) = {round(mean(RTdiff11),3)};
        C(ii,11) = {round(mean(RTdiff20),3)};
        C(ii,12) = {round(mean(RTdiff21),3)};
        C(ii,13) = {round(ACCsame00/totalSame00,3)};
        C(ii,14) = {round(ACCsame01/totalSame01,3)};
        C(ii,15) = {round(ACCsame10/totalSame10,3)};
        C(ii,16) = {round(ACCsame11/totalSame11,3)};
        C(ii,17) = {round(ACCsame20/totalSame20,3)};
        C(ii,18) = {round(ACCsame21/totalSame21,3)};
        C(ii,19) = {round(ACCdiff00/totalDiff00,3)};
        C(ii,20) = {round(ACCdiff01/totalDiff01,3)};
        C(ii,21) = {round(ACCdiff10/totalDiff10,3)};
        C(ii,22) = {round(ACCdiff11/totalDiff11,3)};
        C(ii,23) = {round(ACCdiff20/totalDiff20,3)};
        C(ii,24) = {round(ACCdiff21/totalDiff21,3)};
end 
 
    
    % Put data into a table.

T = cell2table(C, 'VariableNames', {'RTsame00','RTsame01','RTsame10','RTsame11','RTsame20','RTsame21', ...
    'RTdiff00','RTdiff01','RTdiff10','RTdiff11','RTdiff20','RTdiff21',...
    'ACCsame00','ACCsame01','ACCsame10','ACCsame11','ACCsame20','ACCsame21',...
    'ACCdiff00', 'ACCdiff01','ACCdiff10','ACCdiff11','ACCdiff20','ACCdiff21'});
    
% Name file using sub_num & write table 
file_name = 'NEW_posthocGender_E1.txt';

% Move back to analysis folder and write table
cd ../analysis
writetable(T, file_name)   
        

            