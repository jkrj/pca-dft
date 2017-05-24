function [temp_image] = read_image(fn)
    temp_image=imread(fn); 
    %temp_image=uint8(temp_image);
    temp_image=rgb2gray(temp_image);               % 将图象变为黑白 
    temp_image=imresize(temp_image,[112,112]); 
    temp_image = double(temp_image(:)); 
    temp_image=temp_image';          %将二维转为一维 
   