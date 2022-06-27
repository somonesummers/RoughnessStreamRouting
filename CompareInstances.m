clear; close all; clc;

alpha   = load('Instance0.mat');
bravo   = load('Instance1.mat');
charlie = load('Instance2.mat');
delta   = load('Instance3.mat');

Xi = alpha.Xi;
Yi = alpha.Yi;

control = bedmap2_interp(Xi,Yi,'bed');
% control = bedmachine_interp('bed', Xi,Yi,'linear');


figure(1)
clf
subplot(221)
surf(Xi,Yi,alpha.bed_depth,'edgecolor','none')
colorbar
view(2)
subplot(222)
surf(Xi,Yi,bravo.bed_depth,'edgecolor','none')
colorbar
view(2)
subplot(223)
surf(Xi,Yi,charlie.bed_depth,'edgecolor','none')
colorbar
view(2)
subplot(224)
surf(Xi,Yi,control,'edgecolor','none')
colorbar
view(2)

figure(2)
clf
subplot(221)
surf(Xi,Yi,alpha.bed_depth-control,'edgecolor','none')
view(2)
colormap redblue
colorbar
subplot(222)
surf(Xi,Yi,bravo.bed_depth-control,'edgecolor','none')
view(2)
colormap redblue
colorbar
subplot(223)
surf(Xi,Yi,charlie.bed_depth-control,'edgecolor','none')
view(2)
colormap redblue
colorbar
subplot(224)
surf(Xi,Yi,delta.bed_depth-control,'edgecolor','none')
view(2)
colormap redblue
colorbar