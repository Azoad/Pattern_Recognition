clc;
totalSamples = 5;
mainLoop = totalSamples-1;
samples = [4 4;
      8 4;
      15 8;
      24 4
      24 12;];
  
totalCluster = 5;
cluster = [1 0 0 0 0;
          0 2 0 0 0; 
          0 0 3 0 0; 
          0 0 0 4 0 ; 
          0 0 0 0 5;];
for i=1:totalSamples
    for j=1:totalSamples
        if(i==j)
            distance(i,j) = 9999;
        else
            input = [i j];
            a = SquaredError(input,samples);
            distance(i,j) = a;
        end
    end
end
system('python ward-clustering.py');
