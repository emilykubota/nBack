

instructions = 'You have finished the task.\n Please notify the experimenter.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', 'center', 0);
Screen('Flip', window);


KbWait;

ready = 'Ready to continue?. \n Press space. \n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, ready, 'center', 'center', 0);
Screen('Flip', window);

KbWait;

sca;