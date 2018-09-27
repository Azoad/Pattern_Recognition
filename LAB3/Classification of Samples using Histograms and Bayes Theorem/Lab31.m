classA = input('Class A: ');
classB = input('Class B: ');

% histogram(classA,'BinWidth',1);
% hold on
% histogram(classB,'BinWidth',1);
% hold on

sample = input('Input the data to classify: ');
%histogram(sample);

numA = length(classA);
numB = length(classB);

total = numA+numB;

pA = numA/total;
pB = numB/total;

if (min(classA)<min(classB) && max(classA)<max(classB))
    if (floor(sample)<min(classA))
        fprintf('The sample belongs to Class A\n');
    elseif(ceil(sample)>max(classB))
        fprintf('The sample belongs to Class B\n');
    else
        countA = 0;
        for i=1:numA
            if ((classA(i)>=(floor(sample)-2)) && (classA(i)<(ceil(sample)+3)))
                countA = countA + 1 ;
            end
        end
        
        countB = 0;
        for i=1:numB
            if ((classB(i)>=(floor(sample)-2)) && (classB(i)<(ceil(sample)+3)))
                countB = countB + 1 ;
            end
        end
        
        PA = ((countA/numA)*pA)/(((countA/numA)*pA)+((countB/numB)*pB));
        PB = 1-PA;
        
        if (PA>PB)
            fprintf('The sample belongs to Class A with a probability of %f\n',PA);
        else
            fprintf('The sample belongs to Class B with a probability of %f\n',PB);
        end
    end
elseif(min(classB)<min(classA) && max(classB)<max(classA))
    if (floor(sample)<min(classB))
        fprintf('The sample belongs to Class B\n');
    elseif(ceil(sample)>max(classA))
        fprintf('The sample belongs to Class A\n');
    else
        countA = 0;
        for i=1:numA
            if ((classA(i)>=floor(sample)) && (classA(i)<ceil(sample)))
                countA = countA + 1 ;
            end
        end
        
        countB = 0;
        for i=1:numB
            if ((classB(i)>=floor(sample)) && (classB(i)<ceil(sample)))
                countB = countB + 1 ;
            end
        end
        
        PA = ((countA/numA)*pA)/(((countA/numA)*pA)+((countB/numB)*pB));
        PB = 1-PA;
        
        if (PA>PB)
            fprintf('The sample belongs to Class A\n');
        else
            fprintf('The sample belongs to Class B\n');
        end
    end
else
    fprintf('Classes overlaped!\n');
end
