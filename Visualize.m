clear;
[thwaiteslat,thwaiteslon] = scarloc('thwaites glacier');
[X,Y,head] = bedhead(thwaiteslat,thwaiteslon,200);

%% Chose DEM product
load Instance3.mat

surfDEM = bedmachine_interp('surface',X,Y);
bedDEM = interp2(Xi,Yi,bed_depth,X,Y);
spd = measures_interp('speed',X,Y);
bedDEM_BM = bedmachine_interp('bed',X,Y);
% surfDEM =  bedmap2_interp(X,Y,'surface');
% bedDEM =  bedmap2_interp(X,Y,'bed');

%%
figure(1)
clf
surf(X,Y,bedDEM,'edgecolor','none')
hold on
bedmachine('gl','k')
view(2)

figure(2)
clf
colormap redblue
surf(X,Y,bedDEM_BM-bedDEM,'edgecolor','none')
hold on
bedmachine('gl','k')
colorbar
view(2)