data = input('Enter the Data: ');
c = input('Enter the value of c: ');
k = input('Enter the value of k: ');

features = length(data(1,:))-1;
samples = length(data(:,1));

for i=1:features+1
    w(1,i) = 0;
end

count = 0;
no = 0;
for i=1:1:10000
    if (no == samples)
        fprintf('Total iteration: %d\n',count);
        break
    else
        for j = 1:1:samples
            D = calculate_D(w,data,j);
            if((data(j,features+1)>=0 && D>=0) ||(data(j,features+1)<0 && D<0))
                no = no+1;
                count = count + 1;
                if (no == samples)
                    break
                end
                continue
            else
                no = 0;
                new_w = calculate_W(w,data,j,c,data(j,features+1),k);
                for l = 2:length(new_w)
                    w(1,l) = new_w(1,l);
                end
                count  = count + 1;
            end
        end
    end
end


function dc = calculate_D(old_w,x,column)
sum = 0;
for i=2:length(old_w)
    sum = sum + old_w(1,i)*x(column,i-1);
end
dc = old_w(1,1) + sum;
end

function wc = calculate_W(old_w,x,column,c,d,k)
wc(1,1) = old_w(1,1) + c*d*k;
for i=2:length(old_w)
    wc(1,i) = old_w(1,i) + c*d*x(column,i-1)
end
end