% Clear screen and workspace
sca;
close all;
clearvars;

% Perform standard setup for Psychtoolbox
PsychDefaultSetup(2);

% Define black, white, and gray
black = BlackIndex(0);
white = WhiteIndex(0);
grey = white / 2;

% Open the window
PsychImaging('PrepareConfiguration');
PsychImaging('AddTask', 'Genera', 'UseRetinaResolution');
[window, rect] = PsychImaging('OpenWindow', 0, [], [0 0 1280 730]);

% Get the center coordinates of the screen
[centerX, centerY] = RectCenter(rect);

% Get the size of the screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Display instructions for the task
instructions = 'Press space when you see the image below.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', .25 * screenYpixels, 0);

% Read random task target image and calculate size
sourceImages = dir(fullfile(pwd,'stimuli','AF','*.jpg'));
randomImageIndex = randi([1 size(sourceImages,1)]);
imageName = fullfile(pwd, 'stimuli', 'AF', sourceImages(randomImageIndex).name);
targetImage = imread(imageName);
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;

% Display target image
targetImageTexture = Screen('MakeTexture', window, targetImage);
Screen('DrawTexture', window, targetImageTexture, [],... 
        [(targetImageX) (screenYpixels * .3)... 
        (targetImageX + s2) ((screenYpixels * .3) + s1)], 0);
 
% Flip the screen
Screen('Flip', window);

WaitSecs(4);

drawFixation(window, rect, 40, black, 4);
Screen('Flip', window);

WaitSecs(2);

% Exit
sca;