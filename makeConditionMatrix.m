nruns = 4
sub_number = 6
% Creates order of trials counterbalanced based on subject number. 

if mod(sub_number,6) == 0 
    % First row determines task (0 = 0-back, 1 = 1-back, 2= 2-back)
    conditionMatrix(1:nruns) = 0;
    conditionMatrix((nruns+1):2*nruns) = 1;
    conditionMatrix((2*nruns+1):3*nruns) = 2;
    
    % Second row determines degradation level, first half of trials are
    % intact, second half are degraded 
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
    
