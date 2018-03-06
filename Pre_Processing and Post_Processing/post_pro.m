% clear;
clc;
close all;

cname={ 'HTC-1-M7','iPhone-4s','iPhone-6','LG-Nexus-5x','Motorola-Droid-Maxx','Motorola-Nexus-6','Motorola-X','Samsung-Galaxy-Note3','Samsung-Galaxy-S4','Sony-NEX-7' };

%labels=importdata('test_results_5.txt');
filename=importdata('ref_test_features_.mat');
filename=filename(:,6:26);

output_file=fopen('submission_7.csv','w');


fprintf(output_file,'fname,camera\n');

for i=1:size(labels,1)
    %if (filename(i,13)=='u')
        fprintf(output_file,'%s,%s\n',filename(i,:),cname{labels(i)});
   % else
    %    fprintf(output_file,'%s,%s\n',filename(i,:),cname{3});
    %end
   
end    

fclose(output_file);   