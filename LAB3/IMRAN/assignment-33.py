from sympy import *

file = open('input-33.txt')

list = [l.strip() for l in file]

input_x1 = []
input_x2 = []
input_d = []
for l in list:
    a, b, c = l.split()
    input_x1.append(int(a))
    input_x2.append(int(b))
    input_d.append(int(c))

w0, w1, x1, w2, x2, d = symbols('w0 w1 x1 w2 x2 d')

E = 0

for i in range(len(input_x1)):
    expr = w0 + w1*input_x1[i] + w2*input_x2[i]
    E += (expr - input_d[i])**2

expr1 = diff(E, w0)
expr2 = diff(E, w1)
expr3 = diff(E, w2)

a = solve([expr1, expr2, expr3], (w0, w1, w2))

D = a[w0] + a[w1]*x1 + a[w2]*x2

print(D)
