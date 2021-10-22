show = imread('8.png');
grayImg = rgb2gray(show);
features = detectMSERFeatures(grayImg)
figure
subplot(1,2,1)
imshow(grayImg)
subplot(1,2,2)
imshow(grayImg)
hold on
plot(features)
title('All features Ante mortem X-ray photo')