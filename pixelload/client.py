"""
panon client

Usage:
  freetile [options] <port> 
  freetile -h | --help

Options:
  -h --help                     Show this screen.
  --interval=I                  [default: 1]
  --unit-width=W                [default: 100]
  --debug                       Debug
"""
import asyncio
import numpy as np
import json
import websockets
import time

from docopt import docopt
arguments = docopt(__doc__)

if arguments['--debug']:
    import time
    #time.sleep(30)

server_port = int(arguments['<port>'])
cfg_interval = float(arguments['--interval'])
unitWidth = int(arguments['--unit-width'])

from .backend.cpu import start as gen
loop_cpu = gen(unitWidth)
from .backend.mem import start as gen
loop_mem = gen(unitWidth)
from .backend.disk import start as gen
loop_disk = gen(unitWidth)
from .backend.net import start as gen
loop_net = gen(unitWidth)

from PIL import Image
import io
import base64


def numpy2str(data):
    img_data = np.asarray(np.rollaxis(data, 1, 0) * 256, dtype='uint8')
    image = Image.fromarray(img_data)
    data = io.BytesIO()
    image.save(data, "bmp")
    message = 'data:img/bmp;base64,' + base64.b64encode(data.getvalue()).decode()
    return message


async def hello():
    uri = f"ws://localhost:{server_port}"
    async with websockets.connect(uri) as websocket:
        while True:
            time.sleep(cfg_interval)

            await websocket.send(json.dumps({
                'cpu': numpy2str(next(loop_cpu)),
                'net': numpy2str(next(loop_net)),
                'disk': numpy2str(next(loop_disk)),
                'mem': numpy2str(next(loop_mem)),
            }))


asyncio.get_event_loop().run_until_complete(hello())
