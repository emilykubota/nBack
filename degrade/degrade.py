#!/usr/bin/python
# Degrades grayscale images by replacing randomly chosen pixels with a random gray color value.

from PIL import Image
import argparse
import numpy as np
import os
import random
import shutil
import sys

def degrade(image, amount, out_dir):
    # Open the image and load its pixels
    im = Image.open(image)
    im_pixels = im.load()
    width, height = im.size
    coordinates = []

    for x in range(width):
        for y in range(height):
            # Save non-white pixels
            if im_pixels[x,y] != 255:
                coordinates.append((x,y))

    num_pixels_to_degrade = len(coordinates) * amount
    # Choose a random sample of images to degrade.            
    coordinates_to_degrade = random.sample(coordinates, int(num_pixels_to_degrade))

    for x,y in coordinates_to_degrade:
        # Change the RGB value of the pixel to a random gray
        im_pixels[x,y] = random.randint(0,256)
            
    # Get the file name of the original image and save the degrade image to a new file
    filename = os.path.splitext(image)
    im.save(out_dir + filename[0] + "_degraded" + filename[1])

def main():
    # Parse the command line arguments for the image(s) to degrade
    parser = argparse.ArgumentParser()
    image_args = parser.add_argument_group('required arguments')
    image_args.add_argument('--source', '-s', required=True, help='Path to the image or directory images to degrade.')
    image_args.add_argument("--amount", '-a', type=float, required=True, help='Percentage amount to degrade the image(s) by (e.g., .60)')
    args = parser.parse_args()

    if os.path.isfile(args.source):
        degrade(args.source, args.amount, '')
    elif os.path.isdir(args.source):
        # Switch to the images folder
        os.chdir(args.source)
        if os.path.exists('out'):
            # Overwrite any previous runs of the script
            shutil.rmtree('out')
        os.makedirs('out')
        
        for image in os.listdir(os.getcwd()):
            if os.path.isfile(image):
                degrade(image, args.amount, 'out/')
    else:
        print 'Please provide a valid image file or directory of images.'

if __name__ == '__main__':
    main()
