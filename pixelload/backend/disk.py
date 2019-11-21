import psutil
import numpy as np


def start(width):
    hist = [[0] * 2] * width
    data = psutil.disk_io_counters(perdisk=False)
    sum1, sum2 = data.write_bytes, data.read_bytes
    while True:
        data = psutil.disk_io_counters(perdisk=False)
        hist.append([data.write_bytes - sum1, data.read_bytes - sum2])
        sum1, sum2 = data.write_bytes, data.read_bytes
        hist.pop(0)
        result = np.asarray(hist)
        yield result / (np.max(result[:, 0] + result[:, 1]) + 1)


if __name__ == '__main__':
    print(next(start(3)))
