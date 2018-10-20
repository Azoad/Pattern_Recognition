clear;
close all;

X=  [1,2,2;
    2,6,6;
    3,8,8;
    4,3,3;
    5,3,4;
    6,4.5,5;
    7,6,8;
    8,7,9;
    9,9,10;
    ];
n = 9;
k=3;
P=zeros(k,3);
for i=1:k
    P(i,:)=X(i,:);
end

rM=zeros(n,2);

for j=1:n
    rM(j,1)=j;
    rM(j,2)=findd(P,k,X(j,2),X(j,3));
    for i=1:k
        [x,y,f]=avrg(X,rM,i);
        if(f~=0)
            P(i,2)=x;
            P(i,3)=y;
        end
    end
end


for j=1:n
    rM(j,1)=j;
    rM(j,2)=findd(P,k,X(j,2),X(j,3));
end

[Y,I] = sortrows(rM(:,2));
fprintf('{');
for i=1:n-1
    fprintf('%d  ',I(i));
    if(Y(i)~=Y(i+1))
         fprintf('} \n{ ');
    end
end
fprintf('%d  }\n',I(n));
%system('python k-means-clutering.py');