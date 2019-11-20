import psutil
import numpy as np


def start(width):
    hist = [[0] * 1] * width
    while True:
        data = psutil.virtual_memory()
        hist.append([data.percent])
        hist.pop(0)
        result = np.asarray(hist) / 100
        yield result


if __name__ == '__main__':
    print(next(start(3)))
