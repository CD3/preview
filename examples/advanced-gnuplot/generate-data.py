import math
import pathlib


datafile = pathlib.Path("data.txt")

dx = 0.1
with datafile.open('w') as f:
    for i in range(100):
        f.write(f"{dx*i} {math.cos(dx*i)}\n")

