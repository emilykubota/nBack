% Sets order of conditions based on subject number 

%% Condition 1 

if mod(sub_num,6) == 0 
    zero_back_practice
    for ri = 1:length(nruns) 
        stim = 0; %0 = intact, 1 = degraded
        zero_back
        trial = ri;
    end 
    for ri = 1:length(nruns)
        stim = 1;
        zero_back
        trial = ri + nruns;
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    one_back_practice 
    for ri = 1:length(nruns);
        stim = 0;
        one_back 
        trial = ri + (2*nruns);
    end 
    for ri = 1:length(nruns)
        stim = 1;
        one_back 
        trial = ri + (3*nruns);
    end 
    
    %Transition once more 
    transition
    
    % Final task
    two_back_practice
    for ri = 1:length(nruns)
        stim = 0;
        two_back 
        trial = ri + (4*nruns);
    end
    for ri = 1:length(nruns)
        stim = 1; 
        two_back 
        trial = ri + (5*nruns);
    end  
  
%% Condition two
elseif mod(sub_num,5) == 0 
    one_back_practice
    for ri = 1:length(nruns) 
        stim = 0; %0 = intact, 1 = degraded
        one_back
        trial = ri;
    end 
    for ri = 1:length(nruns)
        stim = 1;
        one_back
        trial = ri + nruns;
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    two_back_practice 
    for ri = 1:length(nruns);
        stim = 0;
        two_back 
        trial = ri + (2*nruns);
    end 
    for ri = 1:length(nruns)
        stim = 1;
        two_back 
        trial = ri + (3*nruns);
    end 
    
    %Transition once more 
    transition
    
    % Final task
    zero_back_practice
    for ri = 1:length(nruns)
        stim = 0;
        zero_back 
        trial = ri + (4*nruns);
    end
    for ri = 1:length(nruns)
        stim = 1; 
        zero_back 
        trial = ri + (5*nruns);
    end 
    
 
 %% Condition 3
elseif mod(sub_num,4) == 0 
    two_back_practice
    for ri = 1:length(nruns) 
        stim = 0; %0 = intact, 1 = degraded
        two_back
        trial = ri;
    end 
    for ri = 1:length(nruns)
        stim = 1;
        two_back
        trial = ri + nruns;
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    zero_back_practice 
    for ri = 1:length(nruns);
        stim = 0;
        zero_back 
        trial = ri + (2*nruns);
    end 
    for ri = 1:length(nruns)
        stim = 1;
        zero_back 
        trial = ri + (3*nruns);
    end 
    
    %Transition once more 
    transition
    
    % Final task
    one_back_practice
    for ri = 1:length(nruns)
        stim = 0;
        one_back 
        trial = ri + (4*nruns);
    end
    for ri = 1:length(nruns)
        stim = 1; 
        one_back 
        trial = ri + (5*nruns);
    end 
 
 
    %% Condition 4 
    
elseif mod(sub_num,3) == 0 
    zero_back_practice
    for ri = 1:length(nruns) 
        stim = 1; %0 = intact, 1 = degraded
        zero_back
        trial = ri;
    end 
    for ri = 1:length(nruns)
        stim = 0;
        zero_back
        trial = ri + nruns;
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    two_back_practice 
    for ri = 1:length(nruns);
        stim = 1;
        two_back 
        trial = ri + (2*nruns);
    end 
    for ri = 1:length(nruns)
        stim = 0;
        two_back 
        trial = ri + (3*nruns);
    end 
    
    %Transition once more 
    transition
    
    % Final task
    one_back_practice
    for ri = 1:length(nruns)
        stim = 1;
        one_back 
        trial = ri + (4*nruns);
    end
    for ri = 1:length(nruns)
        stim = 0; 
        one_back 
        trial = ri + (5*nruns);
    end 

%% Condition 5 
elseif mod(sub_num,2) == 0 
    one_back_practice
    for ri = 1:length(nruns) 
        stim = 1; %0 = intact, 1 = degraded
        one_back
        trial = ri;
    end 
    for ri = 1:length(nruns)
        stim = 0;
        one_back
        trial = ri + nruns;
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    zero_back_practice 
    for ri = 1:length(nruns);
        stim = 1;
        zero_back 
        trial = ri + (2*nruns);
    end 
    for ri = 1:length(nruns)
        stim = 0;
        zero_back 
        trial = ri + (3*nruns);
    end 
    
    %Transition once more 
    transition
    
    % Final task
    two_back_practice
    for ri = 1:length(nruns)
        stim = 1;
        two_back 
        trial = ri + (4*nruns);
    end
    for ri = 1:length(nruns)
        stim = 0; 
        two_back 
        trial = ri + (5*nruns);
    end 
    
%% Condition 6 
else 
    two_back_practice
    for ri = 1:length(nruns) 
        stim = 1; %0 = intact, 1 = degraded
        two_back
        trial = ri;
    end 
    for ri = 1:length(nruns)
        stim = 0;
        two_back
        trial = ri + nruns;
    end 
    
    %Transition screens to notify experimenter 
    transition
    
    %Move on to next task
    one_back_practice 
    for ri = 1:length(nruns);
        stim = 1;
        one_back 
        trial = ri + (2*nruns);
    end 
    for ri = 1:length(nruns)
        stim = 0;
        one_back 
        trial = ri + (3*nruns);
    end 
    
    %Transition once more 
    transition
    
    % Final task
    zero_back_practice
    for ri = 1:length(nruns)
        stim = 1;
        zero_back 
        trial = ri + (4*nruns);
    end
    for ri = 1:length(nruns)
        stim = 0; 
        zero_back 
        trial = ri + (5*nruns);
    end 
end 
 % Final screen & Exit 
 finalScreen 
    