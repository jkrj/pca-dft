function [s, data] = video_pca(output_list_relative)
  
      dir_list = importdata('jpgs.txt');
      m= size(dir_list,1);
  for i=1: size(dir_list, 1)               %�ļ�·��
      dir_str = 'H:\jpgs\BandMarching\v_BandMarching_g01_c06\';
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files);
      for j = 1 : num_feat
          feat_path = strcat(dir_str,  feat_files(j).name);
          X(j,:) = read_image(feat_path);      
      end
        [coeff,score,latent] = pca(X);
          latent=100*latent/sum(latent)%��latent�ܺ�ͳһΪ100�����ڹ۲칱����
          mypareto(length(latent),latent);%����matla��ͼ
          %ѡȡǰ10������������µ������ռ�  
         % COEFF=load('COEFF.mat');
          pca16 = coeff(:,1:32); 
   %%  
    %�����Ķ�ȡ���ع�  
   
         %fagr=zeros(112*112,16,'double');%ÿһ�ŷ�����ͼ��ӳ�䵽�����ռ��ϵ��  
      for i=1:num_feat  
         fagr(i,:) = (X(i,:))*pca16;   
      end  
  
      for i=1:num_feat  
        i=6;
        Img(i,:)=avg+(pca16*(fagr(i,:)'))';%����ͼ��ͼ���ع�
       % Img(i,:)=mapminmax(Img(i,:)+128,0,255);
        im=reshape(Img(i,:),112,112);
        imshow(uint8(im));
      end 
  end     
   
  %end