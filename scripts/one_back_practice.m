%% General set-up 

if stim == 0 
    sourceImages = dir(fullfile(pwd,'../stimuli', 'intact','*.jpg'));
else
    sourceImages = dir(fullfile(pwd,'../stimuli', 'degraded','*.jpg'));
end;

%% Choose stimuli sample for task

% Choose random sample of 7 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 7, 'Replace', false);

% There is not a target image for 1-back and 2-back, this is for sizing
% purposes only.
if stim == 0
    targetImage = imread(fullfile(pwd, '../stimuli','intact', imageSample(1).name));
else 
    targetImage = imread(fullfile(pwd, '../stimuli','degraded', imageSample(1).name));
end 
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
instructions = 'Press the spacebar when you see an image repeat twice in a row.\n This is a practice.\n Press space to begin.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center','center', 0, [], [], [], 1.5);
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
    % Draw the image so that it is centered 
    Screen('DrawTexture', window, images(ii), [],... 
        [(targetImageX) (targetImageY)... 
        (targetImageX + s2) (targetImageY + s1)], 0);
    
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