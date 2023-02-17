# Muller's Recurrence for Python 3.11
# Based off Python 2 version by Marianne Bellotti at:
# https://medium.com/the-technical-archaeologist/is-cobol-holding-you-hostage-with-math-5498c0eb428b

from decimal import Decimal as _DEC
from sys import argv as _ARGS

def Recurrence(y, z):
	return 108 - ((815-1500/z)/y)

def Floating(n):
	x = [4, 4.25]
	for i in range(2, n+1):
		x.append(Recurrence(x[i-1], x[i-2]))
	return x

def Fixed(n):
	x = [_DEC(4), _DEC(17)/_DEC(4)]
	for i in range(2, n+1):
		x.append(Recurrence(x[i-1], x[i-2]))
	return x

n = 20
if len(_ARGS) > 1:
	n = int(_ARGS[1])

floating = Floating(n)
fixed = Fixed(n)

print("i   | floating pt        | fixed pt")
print("--- | ------------------ | ---------------------------")
for i in range(n):
	print(f"{i:3} | {floating[i]:18} | {fixed[i]:27}")
