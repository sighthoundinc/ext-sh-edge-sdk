# See https://github.com/mutgarth/LSM303DLHC_Python/blob/master/acc_LSM303DLHC.py
from acc_LSM303DLHC import acc_LSM303DLHC
import time

while True:
    acc=acc_LSM303DLHC(0x19)
    data = acc.get_acc_data()
    print(f"X = {data[0]}\nY = {data[1]}\nZ = {data[2]}\033[F\033[F\033[F")
