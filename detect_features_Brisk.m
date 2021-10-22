%% load Samples frames to detect each feature at the region of interest
% how to load a specific image in a folder
dataAMImg = imread('8.png');
dataPMImg = imread('16.png');
figure
subplot(1,2,1)
imshow(dataAMImg);
title('Ante mortem X-ray photo')

%% convert the images to grey scale to show distinct features
% To convert the image to a gray scale in other to show all the hidden
% features
grayImg = rgb2gray(dataAMImg);
subplot(1,2,2)
imshow(grayImg)
title('Grayscale Ante mortem X-ray photo')


%% Use the Region of interest to find the features
features = detectBRISKFeatures(grayImg);
figure
subplot(1,2,1)
imshow(grayImg)
hold on
plot(features)
title('All features Ante mortem X-ray photo')


%% Find specific features
specFeatures = detectBRISKFeatures(grayImg, 'Numoctaves', 4);
subplot(1,2,2)
imshow(grayImg)
hold on
plot(specFeatures)
title('Specific features')
