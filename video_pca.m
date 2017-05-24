function [s, data] = video_pca(output_list_relative)
  
      dir_list = importdata('jpgs.txt');
      m= size(dir_list,1);
  for i=1: size(dir_list,1);            %文件路径
      i
      dir_str = char(dir_list(i));
      dir_str='J:\v_BaseballPitch_g08_c01\';
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files);
      for j = 1 : num_feat
          feat_path = strcat(dir_str,  feat_files(j).name);
          X(j,:) = read_image(feat_path);
      end
         avg=mean(X);
         X=X-avg;
         [coeff,score,latent] = pca(X);
         latent=100*latent/sum(latent);%将latent总和统一为100，便于观察贡献率
         pareto(latent);%调用matla画图
        % f=fopen('H:\jpgs\ApplyEyeMakeup\v_ApplyEyeMakeup_g08_c01\','w');
      for cc=1:min(48,num_feat-1)
          coeef_t=coeff(:,cc)';
          coeef_t=mapminmax(coeef_t,0,255);
          a=reshape(coeef_t,112,112);
          %imshow(uint8(a));
          save_dir=strcat(dir_str,'mean_pca_',int2str(cc),'.jpg');
          %save (save_dir, 'a');
          imwrite(uint8(a),save_dir,'jpg');
%          ss=imread(save_dir)
%          imshow(uint8(ss))
      end
      clear coeff;
      clear score;
      clear latent;
      clear X;
     % fclose(f);
  end     
   
  end