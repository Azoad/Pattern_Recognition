clc;
clear;

file = fopen('input2.txt','r');
f = fscanf(file,'%f');
setup();
n = f(1,1);

for i=2:2:length(f)
    x(i/2) = f(i);
    y(i/2) = f(i+1);
    plot(x(i/2),y(i/2),'r*');
    hold on
end

C = nchoosek((1:1:n),4);
lc = length(C);
j = 1;

for i = 1: lc
    px = x(C(i,1));
    py = y(C(i,1));
    qx = x(C(i,2));
    qy = y(C(i,2));
    rx = x(C(i,3));
    ry = y(C(i,3));
    sx = x(C(i,4));
    sy = y(C(i,4));
    slpq = abs((qy-py)/(qx-px));
    slpr = abs((ry-py)/(rx-px));
    slps = abs((sy-py)/(sx-px));
    if (slpq == slpr && slpr == slps)
        ni(j) = i;
        j = j+1;
        plot([px;qx;rx;sx],[py;qy;ry;sy],'b-')
        fprintf('\n\n(%d, %d)->(%d, %d)->(%d, %d)->(%d, %d)',px,py,qx,qy,rx,ry,sx,sy);
    end
end
fprintf('\n\n');

function setup()
set(gca,'xtick',0:1000:35000);
set(gca,'ytick',0:1000:35000);
hold on;
axis([0 35000 0 35000]);
end