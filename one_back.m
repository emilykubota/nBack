%% General set-up 

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

%% Unique code for one-back begins here

% Display instructions for the task
instructions = 'Press the spacebar when you see an image repeat twice in a row.\n';
Screen('TextFont', window, 'Avenir');
Screen('TextSize', window, 80);
DrawFormattedText(window, instructions, 'center', .25 * screenYpixels, 0);
 
% Get names of task source images
sourceImages = dir(fullfile(pwd,'stimuli', 'AF','*.jpg'));
 
% Choose random sample of 7 images without replacement
[imageSample, imageSampleIdx] = datasample(sourceImages, 7, 'Replace', false);

% There is not a target image for 1-back and 2-back, this is for sizing
% purposes only.   
targetImage = imread(fullfile(pwd,'stimuli', 'AF', imageSample(1).name));

% Select index randomly to insert target image 3 times
targetIdx1 = randi(length(imageSampleIdx));
imageSampleIdx1 = [imageSampleIdx(1:targetIdx1) imageSampleIdx(targetIdx1)...
    imageSampleIdx((targetIdx1 + 1):end)];

targetIdx2 = randi(length(imageSampleIdx1));
imageSampleIdx2 = [imageSampleIdx1(1:targetIdx2) imageSampleIdx1(targetIdx2)...
    imageSampleIdx1((targetIdx2 + 1):end)];

targetIdx3 = randi(length(imageSampleIdx2));

%Final order of images. Named to match what we have in zeroBack for now....
shuffledImageSampleIdx = [imageSampleIdx2(1:targetIdx3) imageSampleIdx2(targetIdx3)...
    imageSampleIdx2((targetIdx3 + 1):end)];

%% Show images and collect response 

% DO NOT NEED to display target image FOR 1-back and 2-back

% Calculate size and x-coordinate of task image in instructions
[s1, s2, s3] = size(targetImage);
targetImageX = (screenXpixels - s2) / 2;
 
% DO NOT NEED to display target image FOR 1-back and 2-back

%targetImageTexture = Screen('MakeTexture', window, targetImage);
%Screen('DrawTexture', window, targetImageTexture, [],... 
%        [(targetImageX) (screenYpixels * .3)... 
%        (targetImageX + s2) ((screenYpixels * .3) + s1)], 0);
%Screen('Flip', window);
%WaitSecs(4);
 
% Draw fixation cross
drawFixation(window, rect, 40, black, 4);
Screen('Flip', window);
WaitSecs(1);
 
% Display each image followed by fixation cross 
for ii = 1:length(shuffledImageSampleIdx)
    startTime = GetSecs;
    
    % TODO: Do this work beforehand to prevent lag
    image = imread(fullfile(pwd, 'stimuli', 'AF', sourceImages(shuffledImageSampleIdx(ii)).name));
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

        
       

