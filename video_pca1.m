function [s, data] = video_pca(output_list_relative)
  
      dir_list = importdata('jpgs.txt');
      m= size(dir_list,1);
  for i=1: size(dir_list, 1)               %文件路径
      dir_str = 'H:\jpgs\BandMarching\v_BandMarching_g01_c06\';
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files);
      for j = 1 : num_feat
          feat_path = strcat(dir_str,  feat_files(j).name);
          X(j,:) = read_image(feat_path);      
      end
        [coeff,score,latent] = pca(X);
          latent=100*latent/sum(latent)%将latent总和统一为100，便于观察贡献率
          mypareto(length(latent),latent);%调用matla画图
          %选取前10个主特征组成新的特征空间  
         % COEFF=load('COEFF.mat');
          pca16 = coeff(:,1:32); 
   %%  
    %人脸的读取及重构  
   
         %fagr=zeros(112*112,16,'double');%每一张非人脸图像映射到特征空间的系数  
      for i=1:num_feat  
         fagr(i,:) = (X(i,:))*pca16;   
      end  
  
      for i=1:num_feat  
        i=6;
        Img(i,:)=avg+(pca16*(fagr(i,:)'))';%人脸图像图像重构
       % Img(i,:)=mapminmax(Img(i,:)+128,0,255);
        im=reshape(Img(i,:),112,112);
        imshow(uint8(im));
      end 
  end     
   
  %end