function [mean_image] = all_mean(fn)
    dir_list = importdata('jpgs.txt');
    m=1;
    
  for i=101:200          %文件路径
      dir_str = char(dir_list(i));
      feat_files = dir([dir_str, 'dtft_*.jpg']);
      num_feat = length(feat_files);
      for j = 1 : num_feat
          feat_path = strcat(dir_str,  feat_files(j).name);
           temp_image=imread(feat_path); 
         %temp_image=uint8(temp_image)
          temp_image = double(temp_image(:)); 
          X(m,:) = temp_image;
          
         % X(m,:)= mapminmax(X(m,:),0,255);
          m=m+1;
      end
      i
  end
  
 mean_image=mean(X,1);     %按列平均
 n=mean(mean_image,2);