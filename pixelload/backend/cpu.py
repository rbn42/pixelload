import psutil
import numpy as np

def cpu_times():
    data = psutil.cpu_times_percent(percpu=False)
    return [data.user + data.steal, data.nice, data.irq + data.softirq + data.system, data.iowait]

def start(width):
    num_elems = len(cpu_times())
    hist = [[0] * num_elems] * width
    while True:
        data = cpu_times()
        hist.append(data)
        hist.pop(0)
        result = np.asarray(hist) / 100
        yield result


if __name__ == '__main__':
    print(next(start(3)))
