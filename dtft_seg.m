      dir_str='H:\ly\v_CliffDiving_g18_c05\';
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files); 
      len=uint8(num_feat/4);
   for seg=1:4
      for j = (seg-1)*len+1 : min(seg*len,num_feat)
          feat_path = strcat(dir_str,  feat_files(j).name);
          X(j-(seg-1)*len,:) = read_image(feat_path);
      end
      for t=1:112*112
          [H(:,t),W(:,t)]=freqz(X(:,t)',1,8,'whole');
      end
      H=abs(H);
      H=mapminmax(H,0,255);
      for cc=1:8
          a=reshape(H(cc,:),112,112);
          imshow(uint8(a));
           %save_dir=strcat(dir_str,'dtft_',int2str(cc),'.jpg');
          %save (save_dir, 'a');
          %imwrite(uint8(a),save_dir,'jpg');
      end
      clear X;
      clear F;
      clear a;
      clear H;
      clear W;
   end