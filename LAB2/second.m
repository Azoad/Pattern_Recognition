% clc
% 
% file = fopen('input4.txt','r');
% f = fscanf(file,'%f');
% setup();
% n = f(1,1);
% 
% for i=2:2:length(f)
%     x(i/2) = f(i);
%     y(i/2) = f(i+1);
%     plot(x(i/2),y(i/2),'r*');
%     hold on
% end
% slope = (-1) * eye(n);
% for i = 1: n
%     for j = 1:n
%         if (i ~= j)
%             slope(i,j) = abs((y(j)- y(i))/(x(j)-x(i)));
%             if isinf(slope(i,j))
%                 slope(i,j) = 0;
%             end
%         end
%     end
% end
% 
% for i = 1:length(slope)
%     tab = tabulate(slope(i,:));
%     [E,I] = sortrows(tab,2,'descend');
%     if E(1,2) >= 2
%         k = 1;
%         l = 1;
%         px(k) = x(i);
%         py(l) = y(i);
%         fprintf('(%d, %d)',x(i),y(i));
%         for j = 1: length(slope)
%             if E(1,1) == slope(i,j)
%                 k = k+1;
%                 l = l+1;
%                 px(k) = x(j);
%                 py(l) = y(j);
%                 fprintf('->(%d, %d)',x(j),y(j));
%             end
%         end
%         plot(px,py,'b-');
%         hold on
%         fprintf('\n');
%         %break
%     end
% end
% 
% function setup()
% set(gca,'xtick',0:1000:35000);
% set(gca,'ytick',0:1000:35000);
% hold on;
% axis([0 35000 0 35000]);
% end

clc;
clear;

file = fopen('input4.txt','r');
f = fscanf(file,'%f');
setup();
n = f(1,1);

for i=2:2:length(f)
    x(i/2) = f(i);
    y(i/2) = f(i+1);
    plot(x(i/2),y(i/2),'black*');
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
    %sx = x(C(i,4));
    %sy = y(C(i,4));
    slpq = abs((qy-py)/(qx-px));
    slpr = abs((ry-py)/(rx-px));
    %slps = abs((sy-py)/(sx-px));
    if (slpq == slpr )%&& slpr == slps)
        ni(j) = i;
        j = j+1;
        plot([px;qx;rx],[py;qy;ry],'black-')
        fprintf('\n(%d, %d)->(%d, %d)->(%d, %d)',px,py,qx,qy,rx,ry);
    end
end
fprintf('\n');

function setup()
set(gca,'xtick',0:1000:35000);
set(gca,'ytick',0:1000:35000);
hold on;
axis([0 35000 0 35000]);
end