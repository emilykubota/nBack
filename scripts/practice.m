
%% Instructions

intro = 'Welcome to the experiment! \n Press space to continue.';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, intro, 'center', 'center', 0, [], [], [], 1.5);
Screen('Flip', window);

[~, ~, ~] = KbWait([], 2);

instructions = 'In this experiment, \n you will be asked to respond \n to faces as quickly and accurately as possible. \n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', 'center', 0, [], [], [], 1.5);
Screen('Flip', window);

[~, ~, ~] = KbWait([], 2);

instructions = 'Now we will practice the tasks. \n In these rounds, you will see a green fixation cross if \n you are correct and a red fixation cross if you are incorrect. \n Press space to begin.';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', 'center', 0, [], [], [], 1.5);
Screen('Flip', window);

[~, ~, ~] = KbWait([], 2);

% Practice task intact 
stim = 0;
zero_back_practice 
one_back_practice 
two_back_practice

intro = 'Sometimes the faces will be more difficult to see.\n Press space to practice.';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, intro, 'center', 'center', 0, [], [], [], 1.5);
Screen('Flip', window);

[~, ~, ~] = KbWait([], 2);

stim = 1;
zero_back_practice 
one_back_practice 
two_back_practice

% Close all screens 
Screen('Close')