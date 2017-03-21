nruns = 4
sub_number = 6
% Creates order of trials counterbalanced based on subject number. 

if mod(sub_number,6) == 0 
    % First row determines task (0 = 0-back, 1 = 1-back, 2= 2-back)
    % First index will be practice 
    conditionMatrix(1:nruns+1) = 0;
    % After first task is completed, it will switch to a screen to notify
    % experimenter (code = 3) 
    conditionMatrix(nruns+2) = 3;
    %Move on to second task, with practice first. 
    conditionMatrix((nruns+4):((2*nruns)+4)) = 1;
    % Once task is complete, notify experimenter again 
    conditionMatrix(nruns+5) = 3;
    % Move onto final task
    conditionMatrix((2*nruns+6):(3*nruns)+6) = 2;
    % Experiment is finished 
    
    % Second row determines degradation level, first half of trials are
    % degraded second half are intact 
    conditionMatrix(2,1:(nruns/2)) = 0;
    conditionMatrix(2,((nruns/2)+1):nruns) = 1;
    conditionMatrix(2, (nruns+1):(nruns+(nruns/2))) = 0;
    conditionMatrix(2,(nruns+1+(nruns/2)):(2*nruns)) = 1;
    conditionMatrix(2, ((2*nruns)+1):((2*nruns)+(nruns/2))) = 0;
    conditionMatrix(2,((2*nruns)+1+(nruns/2)):(3*nruns)) = 1;


elseif mod(sub_number, 5) == 0
    conditionMatrix(1:nruns) = 1;
    conditionMatrix((nruns+1):2*nruns) = 2;
    conditionMatrix((2*nruns+1):3*nruns) = 0;
    conditionMatrix(2,1:(nruns/2)) = 0;
    conditionMatrix(2,((nruns/2)+1):nruns) = 1;
    conditionMatrix(2, (nruns+1):(nruns+(nruns/2))) = 0;
    conditionMatrix(2,(nruns+1+(nruns/2)):(2*nruns)) = 1;
    conditionMatrix(2, ((2*nruns)+1):((2*nruns)+(nruns/2))) = 0;
    conditionMatrix(2,((2*nruns)+1+(nruns/2)):(3*nruns)) = 1;
   
elseif mod(sub_number, 4) == 0
    conditionMatrix(1:nruns) = 2;
    conditionMatrix((nruns+1):2*nruns) = 0;
    conditionMatrix((2*nruns+1):3*nruns) = 1;
    conditionMatrix(2,1:(nruns/2)) = 0; 
    conditionMatrix(2,((nruns/2)+1):nruns) = 1;
    conditionMatrix(2, (nruns+1):(nruns+(nruns/2))) = 0;
    conditionMatrix(2,(nruns+1+(nruns/2)):(2*nruns)) = 1;
    conditionMatrix(2, ((2*nruns)+1):((2*nruns)+(nruns/2))) = 0;
    conditionMatrix(2,((2*nruns)+1+(nruns/2)):(3*nruns)) = 1;
    
elseif mod(sub_number, 3) == 0
    conditionMatrix(1:nruns) = 0;
    conditionMatrix((nruns+1):2*nruns) = 2;
    conditionMatrix((2*nruns+1):3*nruns) = 1;
    conditionMatrix(2,1:(nruns/2)) = 1;
    conditionMatrix(2,((nruns/2)+1):nruns) = 0;
    conditionMatrix(2, (nruns+1):(nruns+(nruns/2))) = 1;
    conditionMatrix(2,(nruns+1+(nruns/2)):(2*nruns)) = 0;
    conditionMatrix(2, ((2*nruns)+1):((2*nruns)+(nruns/2))) = 1;
    conditionMatrix(2,((2*nruns)+1+(nruns/2)):(3*nruns)) = 0;
 

elseif mod(sub_number, 2) == 0
    conditionMatrix(1:nruns) = 1;
    conditionMatrix((nruns+1):2*nruns) = 0;
    conditionMatrix((2*nruns+1):3*nruns) = 2;
    conditionMatrix(2,1:(nruns/2)) = 1;
    conditionMatrix(2,((nruns/2)+1):nruns) = 0;
    conditionMatrix(2, (nruns+1):(nruns+(nruns/2))) = 1;
    conditionMatrix(2,(nruns+1+(nruns/2)):(2*nruns)) = 0;
    conditionMatrix(2, ((2*nruns)+1):((2*nruns)+(nruns/2))) = 1;
    conditionMatrix(2,((2*nruns)+1+(nruns/2)):(3*nruns)) = 0;
    
else
    conditionMatrix(1:nruns) = 2;
    conditionMatrix((nruns+1):2*nruns) = 1;
    conditionMatrix((2*nruns+1):3*nruns) = 0;
    conditionMatrix(2,1:(nruns/2)) = 1;
    conditionMatrix(2,((nruns/2)+1):nruns) = 0;
    conditionMatrix(2, (nruns+1):(nruns+(nruns/2))) = 1;
    conditionMatrix(2,(nruns+1+(nruns/2)):(2*nruns)) = 0;
    conditionMatrix(2, ((2*nruns)+1):((2*nruns)+(nruns/2))) = 1;
    conditionMatrix(2,((2*nruns)+1+(nruns/2)):(3*nruns)) = 0;
end 
    
