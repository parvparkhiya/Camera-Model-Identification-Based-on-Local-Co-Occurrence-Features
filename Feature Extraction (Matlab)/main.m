clear;
clc;
close all;


im_class=1;
starting_index=1;
 
CFA=[2,3; 1,2];
q=2;
T=3;

im_path_raw='C:\Users\parvp\Desktop\SP_cup\';
im_path=strcat(im_path_raw,num2str(im_class),'_raw\');


%%
total_features=[];
ref_features=[];
% total_features=importdata('./features/total_features.mat');
% ref_features=importdata('./features/ref_features.mat');


for i=starting_index:275
    disp(i);
	I_big=double(imread(strcat(im_path,num2str(i),'.jpg')));

	trows=size(I_big,1);
	tcols=size(I_big,2);

	crop_r=1:512:trows;
	crop_c=1:512:tcols;

	crop_r=[crop_r,trows+1];
	crop_c=[crop_c,tcols+1];

	total_im=(size(crop_r,2)-1)*((size(crop_c,2)-1));
	crop_cordi=zeros(total_im,4);
    disp(total_im);
	for j=2:(size(crop_r,2))
		for k=2:(size(crop_c,2))
			crop_cordi(((j-2)*((size(crop_c,2)-1)))+(k-1),1)=crop_r(j)-512;
			crop_cordi(((j-2)*((size(crop_c,2)-1)))+(k-1),2)=crop_r(j)-1;
			crop_cordi(((j-2)*((size(crop_c,2)-1)))+(k-1),3)=crop_c(k)-512;
			crop_cordi(((j-2)*((size(crop_c,2)-1)))+(k-1),4)=crop_c(k)-1;		
		end
	end

	features=[];
	ref=[];

	for j=1:total_im
		I=I_big(crop_cordi(j,1):crop_cordi(j,2),crop_cordi(j,3):crop_cordi(j,4),:);

		E = Calculate_E(I,CFA,0);
		E_q=quant_trunc(E,q,T);
		Cr=co_occurance_red(E_q,T,CFA);
		Crg=co_occurance_red_green(E_q,T,CFA,2,1); %assuming standard CFA pattern

		featuret=[Cr(:)',Crg(:)'];

		E = Calculate_E(I,CFA,1);
		E_q=quant_trunc(E,q,T);
		Cr=co_occurance_red(E_q,T,CFA);
		Crg=co_occurance_red_green(E_q,T,CFA,2,1); %assuming standard CFA pattern

		featuret=[featuret,Cr(:)',Crg(:)'];
		features=[features;featuret];
		ref=[ref;[i,crop_cordi(j,1:4)]];
	end
	total_features=[total_features;features];
	ref_features=[ref_features;ref];
	save('./features/total_features.mat','total_features');
	save('./features/ref_features.mat','ref_features');
    
end

