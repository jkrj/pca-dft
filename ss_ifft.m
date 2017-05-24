      dir_str = 'J:\v_BaseballPitch_g08_c01\';
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files);
      seg=uint8(num_feat/3);
       for j = 1 :seg
          feat_path = strcat(dir_str,  feat_files(j).name);
          X1(j,:) = read_image(feat_path);
      end
      for j = seg+1 : 2*seg
          feat_path = strcat(dir_str,  feat_files(j).name);
          X2(j-seg,:) = read_image(feat_path);
      end
      for j = 2*seg+1 : min(3*seg,num_feat)
          feat_path = strcat(dir_str,  feat_files(j).name);
          X3(j-2*seg,:) = read_image(feat_path);
      end
      F1=fft(X1,16,1);
      F1=abs(F1);
      y1 = ifft(F1,[],1);
      for i=1:16  
        im=reshape(y1(i,:),112,112);
        imshow(uint8(im));
      end 
      F2=fft(X2,16,1);
      F2=abs(F2);
      y2 = ifft(F2,[],1);
      for i=1:16  
        im=reshape(y2(i,:),112,112);
        %save_dir=strcat(dir_str,'fft1_',int2str(cc),'.jpg');
          %save (save_dir, 'a');
       % imwrite(uint8(im),save_dir,'jpg');
        imshow(uint8(im));
      end 
      F3=fft(X3,16,1);
      F3=abs(F3);
      y3 = ifft(F3,[],1);
      for i=1:16  
        im=reshape(y3(i,:),112,112);
        imshow(uint8(im));
      end 