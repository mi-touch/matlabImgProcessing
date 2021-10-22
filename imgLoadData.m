%----- This code by TIMILEHIN ADEFARE -----%
%--- Storing each dental images in matlab using image datastore
%--- This code reads the dataset images for the object detection 
trainData = 'TrainingSet';
datafile = ls(trainData);
%----- This code reads all the images and rename them starting from 1 to the last image 
datafile(1,:)=[]
datafile(1,:)=[]
%------------------function [A,junk] = readjpg(filename)
%------------------READJPG Read image data from a JPEG file.
%------------------ Create new directory called DATASET to store all the
%-------------------images 
mkdir('DATASET')
%------------------ This loop through each file 
% and resize each image to a 200 by 200 resolutiom
for i = 1:size(datafile)
   I = imread(fullfile(trainData,datafile(i,:)));
   I = imresize(I,[200 200]); 
   imshow(I)
   imwrite(I,fullfile('DATASET',strcat(num2str(i),'.png')));
end

%imwrite(I,)
% my_dataset = 'C:\Users\Oluwatimilehin\Desktop\P\Matlab\TrainingSet';
% greyImage =imageSet(my_dataset);
