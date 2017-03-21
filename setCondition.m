% Sets order of conditions based on subject number 

%% Condition 1 

if mod(sub_num,6) == 0 
    zero_back_practice
    for ri = 1:length(nruns) 
        stim = 0; %0 = intact, 1 = degraded
        trial = ri;
        zero_back
    end 
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + nruns;
        zero_back
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    one_back_practice 
    for ri = 1:length(nruns);
        stim = 0;
        trial = ri + (2*nruns);
        one_back 
    end 
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + (3*nruns);
        one_back 
    end 
    
    %Transition once more 
    transition
    
    % Final task
    two_back_practice
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + (4*nruns);
        two_back 
    end
    for ri = 1:length(nruns)
        stim = 1; 
        trial = ri + (5*nruns);
        two_back 
    end  
  
%% Condition two
elseif mod(sub_num,5) == 0 
    one_back_practice
    for ri = 1:length(nruns) 
        stim = 0; %0 = intact, 1 = degraded
        trial = ri;
        one_back
    end 
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + nruns;
        one_back
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    two_back_practice 
    for ri = 1:length(nruns);
        stim = 0;
        trial = ri + (2*nruns);
        two_back 
    end 
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + (3*nruns);
        two_back 
    end 
    
    %Transition once more 
    transition
    
    % Final task
    zero_back_practice
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + (4*nruns);
        zero_back 
    end
    for ri = 1:length(nruns)
        stim = 1; 
        trial = ri + (5*nruns);
        zero_back 
    end 
    
 
 %% Condition 3
elseif mod(sub_num,4) == 0 
    two_back_practice
    for ri = 1:length(nruns) 
        stim = 0; %0 = intact, 1 = degraded
        trial = ri;
        two_back
    end 
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + nruns;
        two_back
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    zero_back_practice 
    for ri = 1:length(nruns);
        stim = 0;
        trial = ri + (2*nruns);
        zero_back 
    end 
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + (3*nruns);
        zero_back 
    end 
    
    %Transition once more 
    transition
    
    % Final task
    one_back_practice
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + (4*nruns);
        one_back 
    end
    for ri = 1:length(nruns)
        stim = 1; 
        trial = ri + (5*nruns);
        one_back 
    end 
 
 
    %% Condition 4 
    
elseif mod(sub_num,3) == 0 
    zero_back_practice
    for ri = 1:length(nruns) 
        stim = 1; %0 = intact, 1 = degraded
        trial = ri;
        zero_back
    end 
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + nruns;
        zero_back
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    two_back_practice 
    for ri = 1:length(nruns);
        stim = 1;
        trial = ri + (2*nruns);
        two_back 
    end 
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + (3*nruns);
        two_back 
    end 
    
    %Transition once more 
    transition
    
    % Final task
    one_back_practice
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + (4*nruns);
        one_back 
    end
    for ri = 1:length(nruns)
        stim = 0; 
        trial = ri + (5*nruns);
        one_back 
    end 

%% Condition 5 
elseif mod(sub_num,2) == 0 
    one_back_practice
    for ri = 1:length(nruns) 
        stim = 1; %0 = intact, 1 = degraded
        trial = ri;
        one_back
    end 
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + nruns;
        one_back
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    zero_back_practice 
    for ri = 1:length(nruns);
        stim = 1;
        trial = ri + (2*nruns);
        zero_back 
    end 
    for ri = 1:length(nruns)
        stim = 0;
         trial = ri + (3*nruns);
        zero_back
    end 
    
    %Transition once more 
    transition
    
    % Final task
    two_back_practice
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + (4*nruns);
        two_back 
    end
    for ri = 1:length(nruns)
        stim = 0; 
        trial = ri + (5*nruns);
        two_back
    end 
    
%% Condition 6 
else 
    two_back_practice
    for ri = 1:length(nruns) 
        stim = 1; %0 = intact, 1 = degraded
        trial = ri;
        two_back
    end 
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + nruns;
        two_back
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    one_back_practice 
    for ri = 1:length(nruns);
        stim = 1;
        trial = ri + (2*nruns);
        one_back 
    end 
    for ri = 1:length(nruns)
        stim = 0;
        trial = ri + (3*nruns);
        one_back 
    end 
    
    %Transition once more 
    transition
    
    % Final task
    zero_back_practice
    for ri = 1:length(nruns)
        stim = 1;
        trial = ri + (4*nruns);
        zero_back 
    end
    for ri = 1:length(nruns)
        stim = 0; 
        trial = ri + (5*nruns);
        zero_back 
    end 
end 
 % Final screen & Exit 
 finalScreen 
    