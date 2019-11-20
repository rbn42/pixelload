#!/bin/bash
rm ./pixelload/**/__pycache__/ -r
rm ./pixelload.plasmoid
zip -r pixelload.plasmoid ./plasmoid 
