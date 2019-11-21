import psutil
import numpy as np


def getData():
    net_io = psutil.net_io_counters(pernic=True)
    sum1, sum2 = 0, 0
    for key in net_io:
        if key == 'lo': continue
        data = net_io[key]
        sum1 += data.bytes_sent
        sum2 += data.bytes_recv
    return sum1, sum2


def start(width):
    hist = [[0] * 2] * width
    data = getData()
    while True:
        newdata = getData()
        hist.append([i - j for i, j in zip(newdata, data)])
        data = newdata
        hist.pop(0)
        result = np.asarray(hist)
        yield result / (np.max(result[:, 0] + result[:, 1]) + 1)


if __name__ == '__main__':
    print(next(start(3)))
