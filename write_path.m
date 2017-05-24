fl=fopen('test_lable.txt','wt');
fd=fopen('test_data.txt','wt');
dir_list = importdata('test_fc8.txt');
m= size(dir_list,1);
for i=1: size(dir_list, 1)               %文件路径
      dir_str = char(dir_list(i));
      s=split(dir_str,' ');
      fprintf(fd,'%s\n',s(1));
      fprintf(fl,'%s\n',s(3));
      
end
fclose(fl);
fclose(fd);




fd=fopen('test_feature_data.txt','wt');
dir_list = importdata('test_ucf101.lst');
m= size(dir_list,1);
for i=1: size(dir_list.textdata, 1)               %文件路径
      dir_str = char(dir_list.textdata(i));
      path=strcat(dir_str,'mean_pca');
      fprintf(fd,'%s\n',path);
      
end
fclose(fd);