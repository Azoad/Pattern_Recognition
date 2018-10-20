clear;
close all;

n = 9;
X=   [1,2,2;
    2,3,3;
    3,3,4;
    4,4.5,5;
    5,6,6;
    6,6,8;
    7,7,9;
    8,8,8;
    9,9,10;
    ];

k=3;
P=zeros(k,3);

for i=1:k
    P(i,:)=X(i,:);
end

rM = zeros(n,2);
rMtemp=rM;
itr=0;


while(true)
    rMtemp=rM;
    for j=1:n
        rM(j,1)=j;
        rM(j,2)=findd(P,k,X(j,2),X(j,3));
    end
    for i=1:k
        [x,y]=avrg(X,rM,i);
        P(i,2)=x;
        P(i,3)=y;
    end
    itr=itr+1;
    if(isequal(rM,rMtemp)==1)
        break;
    end    
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
