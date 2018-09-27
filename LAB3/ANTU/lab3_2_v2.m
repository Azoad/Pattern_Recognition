table = input('');
M = length(table(1,:))-1;
V = length(table(:,1));

for i=1:M+1
    w(1,i) = 0;
end

function makeD = Dcalc(old_w,x,index)
    sum = 0;
    for i = 2:length(old_w)
        sum = sum + old_w(1,i)*x()
    end
end