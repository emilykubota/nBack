 %% General set-up 

% Clear screen and workspace
sca;
close all;    
clearvars;
 
% Perform standard setup for Psychtoolbox
PsychDefaultSetup(2);
 
% Define black, white, and gray
black = BlackIndex(0);
white = WhiteIndex(0);
gray = white / 2;
 
% Open the window
PsychImaging('PrepareConfiguration');
PsychImaging('AddTask', 'General', 'UseRetinaResolution');
[window, rect] = PsychImaging('OpenWindow', 0, [], [0 0 1280 1024]);
 
% Get the center coordinates of the screen
[centerX, centerY] = RectCenter(rect);
 
% Get the size of the screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get names of task source images
sourceImages = dir(fullfile(pwd,'stimuli','*.jpg'));

%% Choose stimuli sample for task

% Choose random sample of 7 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 7, 'Replace', false);

% There is not a target image for 1-back and 2-back, this is for sizing
% purposes only.
targetImage = imread(fullfile(pwd,'stimuli', imageSample(1).name));

% Select index randomly to insert target image 3 times
targetIdx1 = randi(length(imageSampleIdx));
imageSampleIdx1 = [imageSampleIdx(1:targetIdx1) imageSampleIdx(targetIdx1)...
    imageSampleIdx((targetIdx1 + 1):end)];

targetIdx2 = randi(length(imageSampleIdx1));
imageSampleIdx2 = [imageSampleIdx1(1:targetIdx2) imageSampleIdx1(targetIdx2)...
    imageSampleIdx1((targetIdx2 + 1):end)];

targetIdx3 = randi(length(imageSampleIdx2));

% Final order of images
shuffledImageSampleIdx = [imageSampleIdx2(1:targetIdx3) imageSampleIdx2(targetIdx3)...
    imageSampleIdx2((targetIdx3 + 1):end)];

%% Main routine for one-back task

% Calculate size and x-coordinate of target image. Used to position
% stimuli.
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;

% Store image textures in an array
images = [];
for ii = 1:length(shuffledImageSampleIdx)
    image = imread(fullfile(pwd, 'stimuli', sourceImages(shuffledImageSampleIdx(ii)).name));
    images(ii) = Screen('MakeTexture', window, image);
end

% Display instructions for the task
instructions = 'Press the spacebar when you see an image repeat twice in a row.\n Press space to begin.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', 'center', 0);
Screen('Flip', window);
 
% Wait until user presses a key
KbWait; 

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
    
    if ii ~= 1
        % Avoid negative indexing
        if shuffledImageSampleIdx(ii) == shuffledImageSampleIdx(ii - 1)
            wasTarget = 'true';                
        else         
            wasTarget = 'false';    
        end
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