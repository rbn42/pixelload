import psutil
import numpy as np


def start(width):
    data = psutil.cpu_percent(percpu=True)
    num_cpu = len(data)
    hist = [[0] * num_cpu] * width
    while True:
        data = psutil.cpu_percent(percpu=True)
        hist.append(data)
        hist.pop(0)
        result = np.asarray(hist) / 100 / num_cpu
        yield result


if __name__ == '__main__':
    print(next(start(3)))
