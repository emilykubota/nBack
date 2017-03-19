<<<<<<< HEAD
=======
%% General set-up

>>>>>>> 2844185f14c6822109822e23d3f916c2aa9b68d8
% Clear screen and workspace
sca;
close all;
clearvars;
 
% Perform standard setup for Psychtoolbox
PsychDefaultSetup(2);
<<<<<<< HEAD
 
=======

>>>>>>> 2844185f14c6822109822e23d3f916c2aa9b68d8
% Define black, white, and gray
black = BlackIndex(0);
white = WhiteIndex(0);
gray = white / 2;
 
% Open the window 
PsychImaging('PrepareConfiguration');
<<<<<<< HEAD
% PsychI maging('AddTask', 'General', 'UseRetinaResolution');
[window, rect] = PsychImaging('OpenWindow', 0);
=======
PsychImaging('AddTask', 'General', 'UseRetinaResolution');
[window, rect] = PsychImaging('OpenWindow', 0, [], [0 0 1280 1024]);
>>>>>>> 2844185f14c6822109822e23d3f916c2aa9b68d8
 
% Get the center coordinates of the screen
[centerX, centerY] = RectCenter(rect);    
 
% Get the size of the screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get names of task source images
sourceImages = dir(fullfile(pwd,'stimuli','*.jpg'));

%% Choose stimuli sample for task
 
% Choose random sample of 8 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 8, 'Replace', false);

% Choose first image as target image
targetImage = imread(fullfile(pwd, 'stimuli', imageSample(1).name));
 
% Create the full set of images to display, repeating the target image 3
% times
fullImageSampleIdx = [imageSampleIdx imageSampleIdx(1) imageSampleIdx(1)];
shuffledImageSampleIdx = fullImageSampleIdx(randperm(length(fullImageSampleIdx)));
<<<<<<< HEAD
 
=======

%% Main routine for zero-back task

>>>>>>> 2844185f14c6822109822e23d3f916c2aa9b68d8
% Calculate size and x-coordinate of target image in instructions
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;

% Store image textures in an array
images = [];
for ii = 1:length(shuffledImageSampleIdx)
    image = imread(fullfile(pwd, 'stimuli', sourceImages(shuffledImageSampleIdx(ii)).name));
    images(ii) = Screen('MakeTexture', window, image);
end

% Display instructions for the task
instructions = 'Press the spacebar when you see the image below.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', .25 * screenYpixels, 0);
 
% Display target image
targetImageTexture = Screen('MakeTexture', window, targetImage);
Screen('DrawTexture', window, targetImageTexture, [],... 
        [(targetImageX) (screenYpixels -  s1)... 
        (targetImageX + s2) (screenYpixels)], 0);
Screen('Flip', window);

<<<<<<< HEAD
% Wait until user presses key
KbWait;
 
=======
% Wait until user presses a key
KbWait; 

>>>>>>> 2844185f14c6822109822e23d3f916c2aa9b68d8
% Draw fixation cross
drawFixation(window, rect, 40, black, 4);
Screen('Flip', window);
WaitSecs(1);

fprintf('pressed,time,correct\n');
% Display each image followed by fixation cross 
for ii = 1:length(shuffledImageSampleIdx)  
    % Draw the image so that its bottom edge aligns with the bottom of the
    % window
    Screen('DrawTexture', window, images(ii), [],... 
        [(targetImageX) (screenYpixels - s1)... 
        (targetImageX + s2) (screenYpixels)], 0);
    
    % Save the time the screen was flipped
    stimulusStartTime = Screen('Flip', window);
    
    [keyWasPressed, responseTime] = recordKeys(stimulusStartTime, 1);
    if shuffledImageSampleIdx(ii) == imageSampleIdx(1)
        wasTarget = 'true';                
    else         
        wasTarget = 'false'; 
    end
    fprintf('%s,%0.4f,%s\n', keyWasPressed, responseTime, wasTarget);   
       
    drawFixation(window, rect, 40, black, 4);
    Screen('Flip', window);
    WaitSecs(1);
end
 
% Exit
sca;