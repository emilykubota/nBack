% Read in file  
T = readtable('output.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f');

% Create an empty cell and put mean values in it
C = cell(1,12);
C(1) = {round(mean(T.RT00),3)};
C(2) = {round(mean(T.RT01),3)};
C(3) = {round(mean(T.RT10),3)};
C(4) = {round(mean(T.RT11),3)};
C(5) = {round(mean(T.RT20),3)};
C(6) = {round(mean(T.RT21),3)};
C(7) = {round(mean(T.Acc00),3)};
C(8) = {round(mean(T.Acc01),3)};
C(9) = {round(mean(T.Acc10),3)};
C(10) = {round(mean(T.Acc11),3)};
C(11) = {round(mean(T.Acc20),3)};
C(12) = {round(mean(T.Acc21),3)};

% Put data into a table.
T2 = cell2table(C, 'VariableNames', {'RT00', 'RT01', 'RT10', 'RT11', 'RT20'...
    'RT21', 'Acc00', 'Acc01', 'Acc10', 'Acc11', 'Acc20', 'Acc21'});
