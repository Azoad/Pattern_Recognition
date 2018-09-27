file = open('input-32.txt')

list = [l.strip() for l in file]

x1 = []
x2 = []
d = []
for l in list:
    a, b, c = l.split()
    x1.append(int(a))
    x2.append(int(b))
    d.append(int(c))

def w0_calculation(w0, c, d, k):
    w = w0 + (c*d*k)
    return w

def w1_calculation(w1, c, d, x):
    w = w1 + (c*d*x)
    return w

def D_calculation(w0, w1, w2, x1, x2):
    D = w0 + (w1*x1) + (w2*x2)
    return D

w0 = 0
w1 = 0
w2 = 0
c = 1
k = 1
D = 0
iteration = 0
error = []

for i in range(100000):
    for l in range(len(x1)):
        D = D_calculation(w0, w1, w2, x1[l], x2[l])

        if (d[l]>=0 and D>=0) or (d[l]<0 and D<0):
            error.append(False)
        else:
            error.append(True)
            w0 = w0_calculation(w0, c, d[l], k)
            w1 = w1_calculation(w1, c, d[l], x1[l])
            w2 = w1_calculation(w2, c, d[l], x2[l])

        iteration += 1
        e = 0
        count = 0
        for m in reversed(error):
            e += 1
            if m == False:
                count += 1    
            if e == len(x1):
                break
        if count == len(x1):
            break

    if count == len(x1):
        break

print("Number of iteration:", iteration)