%% General set-up

% Get names of task source images
if stim == 0 
    sourceImages = dir(fullfile(pwd,'../stimuli', 'intact','*.jpg'));
else
    sourceImages = dir(fullfile(pwd,'../stimuli', 'degraded','*.jpg'));
end;

%% Choose stimuli sample for task
 
% Choose random sample of 8 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 8, 'Replace', false);

% Choose first image as target image
if stim == 0
    targetImage = imread(fullfile(pwd, '../stimuli','intact', imageSample(1).name));
else 
    targetImage = imread(fullfile(pwd, '../stimuli','degraded', imageSample(1).name));
end 
 
% Create the full set of images to display, repeating the target image 3
% times
fullImageSampleIdx = [imageSampleIdx imageSampleIdx(1) imageSampleIdx(1)];
shuffledImageSampleIdx = fullImageSampleIdx(randperm(length(fullImageSampleIdx)));
 
%% Main routine for zero-back task

% Calculate size and x-coordinate of target image in instructions
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;
targetImageY = (screenYpixels - s1)/ 2;

% Store image textures in an array
images = [];
for ii = 1:length(shuffledImageSampleIdx)
    if stim == 0
        image = imread(fullfile(pwd, '../stimuli', 'intact', sourceImages(shuffledImageSampleIdx(ii)).name));
    else 
        image = imread(fullfile(pwd, '../stimuli','degraded', sourceImages(shuffledImageSampleIdx(ii)).name));
    end 
    images(ii) = Screen('MakeTexture', window, image);
end

% Display instructions for the task
instructions = 'Press the spacebar when you see the image below.\n This is a practice. Press space to begin.  \n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 60);
DrawFormattedText(window, instructions, 'center', .25 * screenYpixels);
 
% Display target image
targetImageTexture = Screen('MakeTexture', window, targetImage);
Screen('DrawTexture', window, targetImageTexture, [],... 
        [(targetImageX) (screenYpixels -  s1)... 
        (targetImageX + s2) (screenYpixels)], 0);
Screen('Flip', window);

% Wait until user presses a key
[~, ~, ~] = KbWait([], 2);

% Draw fixation cross
drawFixation(window, rect, 40, black, 4);
Screen('Flip', window);
WaitSecs(1);

fprintf('pressed,time,correct\n');
% Display each image followed by fixation cross 
for ii = 1:length(shuffledImageSampleIdx)  
    % Draw the image so that it is centered 
    Screen('DrawTexture', window, images(ii), [],... 
        [(targetImageX) (targetImageY)... 
        (targetImageX + s2) (targetImageY + s1)], 0);
    
    
    % Save the time the screen was flipped
    stimulusStartTime = Screen('Flip', window);
    
    [keyWasPressed, responseTime] = recordKeys(stimulusStartTime, 1);
    if shuffledImageSampleIdx(ii) == imageSampleIdx(1)
        wasTarget = 'true';                
    else         
        wasTarget = 'false'; 
    end
    fprintf('%s,%0.4f,%s\n', keyWasPressed, responseTime, wasTarget); 
    
    % Displays a red or green fixation depending on whether the response is
    % correct. 
    
    if strcmp    (keyWasPressed,wasTarget)
        % Green fixation as feedback
        drawFixation(window, rect, 40, [0 1 0], 4);
        Screen('Flip', window);
        WaitSecs(1);
    else
        % Red fixation as feedback
        drawFixation(window, rect, 40, [1 0 0], 4);
        Screen('Flip', window);
        WaitSecs(1);  
    end    
        
end
Screen('Close');
