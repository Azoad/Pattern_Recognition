clc

file = fopen('input2.txt','r');
f = fscanf(file,'%f');

n = f(1,1);

for i=2:2:length(f)
    x(i/2) = f(i);
    y(i/2) = f(i+1);
end
slope = zeros(n);
for i = 1: n
    for j = i+1:n
        if (i ~= j)
            slope(i,j) = abs((y(j)- y(i))/(x(j)-x(i)));
        end
    end
end
ts = transpose(slope);
for i =1:length(slope)
    [freq,num] = max(hist(ts(:,i),1:99));
    fprintf('%d %d %d\n',i,num,freq);
end
fprintf('\n\n');