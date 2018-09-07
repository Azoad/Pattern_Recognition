"""Classifier"""
input_value = input('Enter values for Class A: ')
classA = input_value.split(' ')

for i in range(0, len(classA)):
    classA[i] = float(classA[i])
# print(classA)

input_value = input('Enter values for Class B: ')
classB = input_value.split(' ')

for i in range(0, len(classB)):
    classB[i] = float(classB[i])
# print(classB)

all_val = list(set(classA + classB))
all_val.sort()
#print('All values in sorted order:\n', all_val)
# print('----------------------------------------------------------------------------')

total_mismatch = 0
mismatch_list = []
minimum = 9999
for threshold in all_val:
    total_mismatch = 0
    mismatch_list = []
    for i in classA:
        if threshold >= i:
            total_mismatch += 1
            mismatch_list.append(i)

    for i in classB:
        if threshold < i:
            total_mismatch += 1
            mismatch_list.append(i)
    # print('For threshold:', threshold, 'mismatch:',
    #      total_mismatch, 'mismatch_list:', mismatch_list)
    if total_mismatch < minimum:
        minimum = total_mismatch
        th = threshold
        ls = mismatch_list
# print('\n----------------------------------------------------------------------------')

#print('Considering the reverse order')
minimumi = 9999
total_mismatch_inv = 0
for threshold in all_val:
    total_mismatch_inv = 0
    mismatch_list_inv = []
    for i in classA:
        if threshold < i:
            total_mismatch_inv += 1
            mismatch_list_inv.append(i)

    for i in classB:
        if threshold >= i:
            total_mismatch_inv += 1
            mismatch_list_inv.append(i)
    # print('For threshold:', threshold, 'mismatch:',
    #      total_mismatch_inv, 'mismatch_list:', mismatch_list_inv)
    if total_mismatch_inv < minimumi:
        minimumi = total_mismatch_inv
        thi = threshold
        lsi = mismatch_list_inv
# print('\n----------------------------------------------------------------------------')

# print('Finally!!!')

if minimum < minimumi:
    print('Threshold:', th, '\nNumber of Mismatch:',
          minimum, '\nMismatches:', ls)
else:
    print('Threshold:', thi, '\nNumber of Mismatch:',
          minimumi, '\nMismatches:', lsi)
