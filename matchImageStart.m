%% Load two original and grayscsle image to match
AMsampleFrame1 = imread('6.png');
grayAMSampleFrame1 = rgb2gray(AMsampleFrame1);
PMsampleFrame1 = imread('16.png');
grayPMSampleFrame1 = rgb2gray(PMsampleFrame1);

AMsampleFrame2 = imread('47.png');
grayAMSampleFrame2 = rgb2gray(AMsampleFrame2);
PMsampleFrame2 = imread('21.png');
grayPMSampleFrame2 = rgb2gray(PMsampleFrame2);

figure
subplot(2,2,1)
imshow(AMsampleFrame2)
title('Original Ante mortem')

subplot(2,2,2)
imshow(PMsampleFrame2)
title('post mortem X-ray photo')

subplot(2,2,3)
imshow(grayAMSampleFrame2)
title('Grayscale Ante mortem')

subplot(2,2,4)
imshow(grayPMSampleFrame2)
title('Grayscale post mortem')

%% Detect features using MinEigen Algorithm
mserRegion1 = detectMSERFeatures(grayAMSampleFrame2);
mserRegion2 = detectMSERFeatures(grayPMSampleFrame2);

%% To Show the matched features we have
figure 
subplot(1,2,1)
imshow(AMsampleFrame1)
title('Ante Mortem')
hold on
plot(mserRegion1)

subplot(1,2,2)
imshow(PMsampleFrame1)
title('Post Mortem')
hold on
plot(mserRegion2)

superTitle('Detected Features');

%% Extract Features descriptors and their corresponding location
[features1,points1] = extractFeatures(grayAMSampleFrame1,mserRegion1);
[features2,points2] = extractFeatures(grayPMSampleFrame1,mserRegion2);

%% To Visualise the Extracted features
figure 
subplot(1,2,1)
imshow(AMsampleFrame1)
title('Ante Mortem')
hold on
plot(points1)

subplot(1,2,2)
imshow(PMsampleFrame1)
title('Post Mortem')
hold on
plot(points2)

superTitle('Extracted Features');

%% Get the matched features
idxPairs = matchFeatures(features1,features2);

%% Get all the match by indexing into all points
matchedpts1 = points1(idxPairs(1:20, 1));
matchedpts2 = points2(idxPairs(1:20, 2));

%% Show matched features
figure ax = axes;
showMatchedFeatures(AMsampleFrame1,PMsampleFrame1,matchedpts1,matchedpts2,'montage','parent',ax);
title(ax, 'Radiograph point matched');
legend(ax, 'Matched points 1', 'Matched points 2');




