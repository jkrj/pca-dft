  dir_list = importdata('test_ucf.txt');
      %m= size(dir_list,1);
  for i=1:267           %ÎÄ¼þÂ·¾¶
      i
      %dir_str = char(dir_list(i));
     
      feat_files = dir([dir_str, 'image_*.jpg']);
      num_feat = length(feat_files); 
      for j = 1 : num_feat
          feat_path = strcat(dir_str,  feat_files(j).name);
          X(j,:) = read_image(feat_path);
      end
      for t=1:112*112
          [H(:,t),W(:,t)]=freqz(X(:,t)',1,32,'whole');
      end
      H=abs(H);
      H=mapminmax(H,0,255);
      for cc=1:32
          a=reshape(H(cc,:),112,112);
          %imshow(uint8(a));
           save_dir=strcat(dir_str,'dtft_',int2str(cc),'.jpg');
          %save (save_dir, 'a');
          imwrite(uint8(a),save_dir,'jpg');
      end
%       for or=1:112*112
%           [b1(:,or),a]=invfreqz(H(:,or),W(:,or),num_feat-1,0);
%       end
%        b1=mapminmax(b1,0,255);
%        for cc=1:num_feat
%           a=reshape(b1(cc,:),112,112);
%           imshow(uint8(a));
%       end
      clear X;
      clear F;
      clear a;
      clear H;
      clear W;
  end