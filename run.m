 
sub_num = input ('Subject number: ');

nruns = 1;

C = cell(nruns*60,8);

mi = 1;

C(1:10,1) = trial;
C(1:10,2) = nBack;
C(1:10,3) = stim;
    
%if mod(sub_number,6) == 0 
    zero_back_practice
    for ii = 1:length(nruns) 
        stim = 0
        zero_back
        trial = ii;
        nBack = 0;
    end 
    for ii = 1:length(nruns)
        %stim_path = degraded 
        zero_back
        trial = ii + nruns;
    end 
    % TO-D0: transition_screen
    transition
    one_back_practice 
    
  %  for ii = 1:length(nruns);
        % stim_path = intact 
  %     one_back 
  %    trial = ii + (2*nruns);
  %  end 
  %  for ii = 1:length(nruns)
        % stim_path = degraded 
  %      one_back 
  %     trial = ii + (3*nruns);
  %  end 
    
    %Transition screen 
   % two_back_practice
   % for ii = 1:length(nruns)
        % stim_path = intact 
    %    two_back 
     %   trial = ii + (4*nruns);
    %end 
   % for ii = 1:length(nruns)
        % stim_path = degraded 
    %    two_back 
    %    trial = ii + (5*nruns);
    %end 
    
    
    
        
        
    
     
        