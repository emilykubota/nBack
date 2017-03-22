%% General set-up

% Clear screens

% close all;

% Get names of task source images depending on stim type
if stim == 0 
    sourceImages = dir(fullfile(pwd,'stimuli','*.jpg'));
else
    sourceImages = dir(fullfile(pwd,'degraded','*.jpg'));
end;
%% Choose stimuli sample for task
 
% Choose random sample of 8 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 8, 'Replace', false);

% Choose first image as target image
if stim == 0
    targetImage = imread(fullfile(pwd, 'stimuli', imageSample(1).name));
else 
    targetImage = imread(fullfile(pwd, 'degraded', imageSample(1).name));
end 
 
% Create the full set of images to display, repeating the target image 3
% times
fullImageSampleIdx = [imageSampleIdx imageSampleIdx(1) imageSampleIdx(1)];
shuffledImageSampleIdx = fullImageSampleIdx(randperm(length(fullImageSampleIdx)));
 
%% Main routine for zero-back task

% Calculate size and x-coordinate of target image in instructions
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;

% Store image textures and filenames in arrays
images = [];
filenames = cell(1,length(shuffledImageSampleIdx));
for ii = 1:length(shuffledImageSampleIdx)
    if stim == 0
        image = imread(fullfile(pwd, 'stimuli', sourceImages(shuffledImageSampleIdx(ii)).name));
    else 
        image = imread(fullfile(pwd, 'degraded', sourceImages(shuffledImageSampleIdx(ii)).name));
    end 
    images(ii) = Screen('MakeTexture', window, image);
    filenames(ii) = {sourceImages(shuffledImageSampleIdx(ii)).name};
end

% Display instructions for the task
instructions = 'Press the spacebar when you see the image below.\n Press space to begin. ';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 70);
DrawFormattedText(window, instructions, 'center', .25 * screenYpixels, 0);
 
% Display target image
targetImageTexture = Screen('MakeTexture', window, targetImage);
Screen('DrawTexture', window, targetImageTexture, [],... 
        [(targetImageX) (screenYpixels -  s1)... 
        (targetImageX + s2) (screenYpixels)], 0);
Screen('Flip', window);

% Wait until user presses a key
KbWait; 

% Draw fixation cross
drawFixation(window, rect, 40, black, 4);
Screen('Flip', window);
WaitSecs(1);

%fprintf('pressed,time,correct\n');
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
    %fprintf('%s,%0.4f,%s\n', keyWasPressed, responseTime, wasTarget); 
    
    % Fill in data matrix accordingly 
    C(mi,1) = {trial}; %trial num ber
    C(mi,2) = {0};     %task (0,1,2)
    C(mi,3) = {stim};  %intact(0), degraded(1)
    C(mi,4) = filenames(ii);
    C(mi,5) = {responseTime};  
    if strcmp(keyWasPressed,wasTarget) %accuracy
        C(mi,6) = {1};
    else
        C(mi,6) = {0};
    end 
    raceGender;
    mi = mi + 1;
        
    drawFixation(window, rect, 40, black, 4);
    Screen('Flip', window);
    WaitSecs(1);
end
 
% Exit
%sca;

% Close screens so textures do not remain open

Screen('CloseAll');

