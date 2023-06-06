clear,clc
f = figure;
axes = gca;
axes.Visible = 'off';

width = 20;
pos = f.Position;
w = pos(3);
h = pos(4);
center_0 = [0 0];
center_1 = [w h];
for i =  1:2*width:h
    viscircles(center_0,i,'Color','r','LineWidth',1.5);
    viscircles(center_1,i,'Color','r','LineWidth',1.5);
end