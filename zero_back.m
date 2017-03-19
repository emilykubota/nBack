      % Clear screen and workspace
sca;
close all;
clearvars;
 
% Perform standard setup for Psychtoolbox
PsychDefaultSetup(2);

d = PsychHID ('Devices');
 
% Define black, white, and gray
black = BlackIndex(0);
white = WhiteIndex(0);
grey = white / 2;
 
% Open the window
PsychImaging('PrepareConfiguration');
PsychImaging('AddTask', 'General', 'UseRetinaResolution');
[window, rect] = PsychImaging('OpenWindow', 0, [], [0 0 1280 680]);
 
% Get the center coordinates of the screen
[centerX, centerY] = RectCenter(rect);
 
% Get the size of the screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
 
% Display instructions for the task
instructions = 'Press the spacebar when you see the image below.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', .25 * screenYpixels, 0);
 
% Get names of task source images
sourceImages = dir(fullfile(pwd,'stimuli','*.jpg'));
 
% Choose random sample of 8 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 8, 'Replace', false);
targetImage = imread(fullfile(pwd,'stimuli', imageSample(1).name));
 
% Create the full set of images to display, repeating the target image 3
% times
fullImageSampleIdx = [imageSampleIdx imageSampleIdx(1) imageSampleIdx(1)];
shuffledImageSampleIdx = fullImageSampleIdx(randperm(length(fullImageSampleIdx)));
 
% Calculate size and x-coordinate of task image in instructions
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;
 
% Display target image
targetImageTexture = Screen('MakeTexture', window, targetImage);
Screen('DrawTexture', window, targetImageTexture, [],... 
        [(targetImageX) (screenYpixels * .3)... 
        (targetImageX + s2) ((screenYpixels * .3) + s1)], 0);
Screen('Flip', window);
WaitSecs(4);
 
% Draw fixation cross
drawFixation(window, rect, 40, black, 4);
Screen('Flip', window);
WaitSecs(1);
 
% Display each image followed by fixation cross 
for ii = 1:length(shuffledImageSampleIdx)
    startTime = GetSecs;
    
    % TODO: Do this work beforehand to prevent lag
    image = imread(fullfile(pwd, 'stimuli', sourceImages(shuffledImageSampleIdx(ii)).name));
    imageTexture = Screen('MakeTexture', window, image);
     
    % Draw the image so that its bottom edge aligns with the bottom of the
    % window
    Screen('DrawTexture', window, imageTexture, [],... 
        [(targetImageX) (screenYpixels - s1)... 
        (targetImageX + s2) (screenYpixels)], 0);
    Screen('Flip', window);
    WaitSecs(1);
    
    endTime = GetSecs - startTime;
    [keyIsDown, s, kc   , delta] = KbCheck();
    g = sprintf('%d ', kc);       
    fprintf('Answer: %s\n', g)
    
    drawFixation(window, rect, 40, black, 4);
    Screen('Flip', window);
    WaitSecs(1);
end
 
% Exit
sca;