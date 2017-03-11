% Open the window
[window, rect] = Screen('OpenWindow', 0);

% Display instructions for the task
instructions = 'Press space when you see the image below.\n';
DrawFormattedText(window,instructions,'center',rect(4)/2,0);
Screen('Flip', window);

WaitSecs(2);

sca;