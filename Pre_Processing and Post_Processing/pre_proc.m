clear;
clc;
close all;
% final_features={};
% label={};
for i=1:1
    dp=load(sprintf('./total_features_%d.mat',i));
%     dpp=dp.total_features(1:200,:);
    dpp=dp.total_features;
    final_features=dpp;
    temp=ones(size(dpp,1),1);
    temp=temp.*i;
    label=temp;
end
for i=2:10
    dp=load(sprintf('./total_features_%d.mat',i));
%     dpp=dp.total_features(1:200,:);
    dpp=dp.total_features;
    final_features=[final_features; dpp];
    temp=ones(size(dpp,1),1);
    temp=temp.*i;
    label=[label;temp];
end
    