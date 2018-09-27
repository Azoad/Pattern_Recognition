n = input('Enter the features: ');
r = input('Enter data number: ');
c = 1;
k = 1;
mat = input('')

for j = 1:1:n+1
    w(1,j) = 0;
end


loop_count = 0;

count = 0;
for i=1:1:10000
    if (count == r)
        loop_count
        break
    else
        for j=1:1:r
            D = Dcalc(w,mat,j);
            if (mat(j,n+1)>=0 && D >=0)||(mat(j,n+1)<0 && D <0)
                count = count+1;
                loop_count = loop_count+1;
                if (count==r)
                    break
                end
                continue
            else
                count = 0;
                N = Dcheck(mat(j,n+1),w,c,k,mat,j);
                %w(1,1) = N (1,1);
                for z=1:length(N)
                    w(1,z) = N (1,z);
                end
                loop_count = loop_count+1;
            end
        end
    end
end
w

function DD = Dcalc(old_w,x,j)
sum = 0;
for i=2:length(old_w)
    sum = sum+old_w(1,i)*x(j,i-1);
end
DD = old_w(1,1)+sum;
end

function DC = Dcheck(d,old_w,c,k,x,j)

DC(1,1) = old_w(1,1)+ c*d*k;

for i=2:length(old_w)
    DC(1,i) = old_w(1,i)+c*d*x(j,i-1);
end
end