clc;clear
class_a = input('Enter the values:');
class_b = input('Enter the values:');

combined = sort(horzcat(class_a,class_b));

medcom = median(combined);

threshold = medcom;

[height,length_A] = size(class_a);
mismatch_1_array = [];
mismatch_1 = 0;
k = 1;
for i=1:length_A
    if(threshold < class_a(1,i))
        mismatch_1 = mismatch_1+1;
        mismatch_1_array(1,k) = class_a(1,i);
        k = k+1;
    end
end

[height,length_B] = size(class_b);
for i=1:length_B
    if(threshold > class_b(1,i))
        mismatch_1 = mismatch_1+1;
        mismatch_1_array(1,k) = class_b(1,i);
        k = k+1;
    end
end

mismatch_2_array = [];
mismatch_2 = 0;
k = 1;
for i=1:length_A
    if(threshold > class_a(1,i))
        mismatch_2 = mismatch_2+1;
        mismatch_2_array(1,k) = class_a(1,i);
        k = k+1;
    end
end

for i=1:length_B
    if(threshold < class_b(1,i))
        mismatch_2 = mismatch_2+1;
        mismatch_2_array(1,k) = class_b(1,i);
        k = k+1;
    end
end

if (mismatch_1 > mismatch_2)
    mismatch_2_array
else
    mismatch_1_array
end