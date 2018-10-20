x = input('Enter the data: ');
pd = pdist(x);
Data = squareform(pd);
% Data = [0,4.0,11.7,20.0,21.5;
%         4.0,0,8.1,16.0,17.9;
%         11.7,8.1,0,9.8,9.8;
%         20.0,16.0,9.8,0,8.0;
%         21.5,17.9,9.8,8.0,0;];
    
% Z = linkage(Data);    
% dendrogram(Z),title('default');
% 
z1 = linkage(pd,'average');
figure,dendrogram(z1),title('average');
% 
% z2 = linkage(Data,'centroid');
% figure,dendrogram(z2),title('centroid');
% 
z3 = linkage(pd,'complete');
figure,dendrogram(z3),title('complete');
% 
% z4 = linkage(Data,'median');
% figure,dendrogram(z4),title('median');

z5 = linkage(pd,'single');
figure,dendrogram(z5),title('single');

z6 = linkage(pd,'ward');
figure,dendrogram(z6),title('ward');
% 
% z7 = linkage(Data,'weighted');
% figure,dendrogram(z7),title('weighted');