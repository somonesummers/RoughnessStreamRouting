clear;
[thwaiteslat,thwaiteslon] = scarloc('thwaites glacier');
[X,Y,head] = bedhead(thwaiteslat,thwaiteslon,200);

%% Chose DEM product
load Instance3.mat

surfDEM = bedmachine_interp('surface',X,Y);
bedDEM = interp2(Xi,Yi,bed_depth,X,Y);
% bedDEM = bedmachine_interp('bed',X,Y);
% surfDEM =  bedmap2_interp(X,Y,'surface');
% bedDEM =  bedmap2_interp(X,Y,'bed');

spd = measures_interp('speed',X,Y);
head = bedhead('surface',surfDEM,'bed',bedDEM);
DEM = GRIDobj(X,Y,head);
DEMf = fillsinks(DEM);
FD = FLOWobj(DEMf);
Accum = flowacc(FD);

% figure(1)
% clf
% imagesc(dilate(Accum,ones(5)))
% cb = colorbar;
% ylabel(cb,'total contributing pixels')

% figure(2)
%  clf
% h = pcolor(X,Y,measures_interp('speed',X,Y));
% colorbar
% set(h, 'EdgeColor', 'none');

HeatFlux = heatflux_interp(X,Y);

%Set heat flux to zero except where there is grounded ice:
HeatFlux(bedmap2_interp(X,Y,'icemask','nearest')~=0) = 0;

%Create GRID object for basal melt:
BasalMelt = GRIDobj(X,Y,HeatFlux);

%Calculate flow accumulation
Accumw = flowacc(FD,BasalMelt);

thresh = 25;
S = STREAMobj(FD,Accumw>thresh);

drain_dist =@(xq,yq,r) arrayfun(@(xqq,yqq) sum(exp(-norms([S.x S.y]-[xqq yqq],2,2)/r)),xq,yq);

Dist = 60e3*drain_dist(X,Y,5e3);

%% Plotting 
figure
clf
p = plot(S.x,S.y,'.','linewidth',3,'color',rgb('black'));
hold on
surf(X,Y,-Dist*60e3,'edgecolor','none')
contour(X,Y,spd,[10,30,100,300,1000,3000],'k')
view(2)
colorbar
axis equal
% 
save('Streams_Instance3','S','drain_dist')

