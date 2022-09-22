# Be sure you've done pip install z3-solver
from z3 import *

triangle = Real('triangle')
square = Real('square')
circle = Real('circle')
    

s = Solver()

s.add(triangle + square + circle == 10)
s.add(circle + square - triangle == 6)
s.add(circle + triangle - square == 4)

isSat = s.check()

if(isSat == sat):
    print(s.model())

