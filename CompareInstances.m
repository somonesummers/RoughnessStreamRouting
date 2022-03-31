clear; close all; clc;

alpha   = load('Instance0.mat');
bravo   = load('Instance1.mat');
charlie = load('Instance2.mat');
delta   = load('Instance3.mat');

Xi = alpha.Xi;
Yi = alpha.Yi;

figure(1)
clf
subplot(221)
surf(Xi,Yi,alpha.bed_depth,'edgecolor','none')
view(2)
subplot(222)
surf(Xi,Yi,bravo.bed_depth,'edgecolor','none')
view(2)
subplot(223)
surf(Xi,Yi,charlie.bed_depth,'edgecolor','none')
view(2)
subplot(224)
surf(Xi,Yi,delta.bed_depth,'edgecolor','none')
view(2)

figure(2)
clf
subplot(311)
surf(Xi,Yi,delta.bed_depth-alpha.bed_depth,'edgecolor','none')
view(2)
colormap redblue
colorbar
subplot(312)
surf(Xi,Yi,delta.bed_depth-bravo.bed_depth,'edgecolor','none')
view(2)
colormap redblue
colorbar
subplot(313)
surf(Xi,Yi,delta.bed_depth-charlie.bed_depth,'edgecolor','none')
view(2)
colormap redblue
colorbar