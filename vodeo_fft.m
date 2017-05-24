function []=vodeo_fft(fn)
      dir_list = importdata('test_ucf.txt');
      %m= size(dir_list,1);
  for i=224:561            %ÎÄ¼þÂ·¾¶
    if(i<224 || i>561)
      dir_str = char(dir_list(i));
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files);
      for j = 1 : num_feat
          feat_path = strcat(dir_str,  feat_files(j).name);
          X(j,:) = read_image(feat_path);
      end
      F=fft(X,16,1);
      F=abs(F);
      F=mapminmax(F,0,255);
      for cc=1:16
          a=reshape(F(cc,:),112,112);
          imshow(uint8(a));
          save_dir=strcat(dir_str,'fft1_',int2str(cc),'.jpg');
          %save (save_dir, 'a');
          imwrite(uint8(a),save_dir,'jpg');
%         ss=imread(save_dir)
%         imshow(uint8(ss))
      end
      clear coeff;  
      clear score;
      clear latent;
      clear X;
      clear F;
      clear a;
     % fclose(f);
    end
  end
end