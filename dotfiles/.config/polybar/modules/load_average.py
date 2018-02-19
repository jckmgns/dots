#!/usr/bin/env python3
import os


def main():
    load = os.popen("cut -d ' ' -f1 /proc/loadavg").read()
    load = float(load)
    rounded_load = round(load, 2)

    cores = os.popen("nproc").read()
    cores = int(cores)

    # print(f"{percent}%")
    print(f"{rounded_load}")


main()
