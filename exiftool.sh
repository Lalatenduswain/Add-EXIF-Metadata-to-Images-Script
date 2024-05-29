#!/bin/bash

# Function to add or modify EXIF metadata using exiftool
add_exif_info() {
    exiftool -overwrite_original \
    -Make="iQOO" \
    -Model="iQOO Z7 Pro 5G" \
    -Software="MediaTek Camera Application" \
    -ModifyDate="2024:05:28 17:31:02" \
    -Orientation="Horizontal (normal)" \
    -ImageDescription="Your Image Description Here" \
    -Artist="Your Name or Artist Name" \
    -XResolution="72" \
    -YResolution="72" \
    -ResolutionUnit="inches" \
    -ExposureTime="1/33" \
    -FNumber="1.79" \
    -ISO="144" \
    -ShutterSpeedValue="1/829" \
    -ApertureValue="1.79" \
    -BrightnessValue="1.8" \
    -MeteringMode="Center-weighted average" \
    -LightSource="D65" \
    -Flash="On, Fired" \
    -FocalLength="4.84" \
    -ExposureMode="Auto" \
    -WhiteBalance="Auto" \
    -DigitalZoomRatio="1" \
    -FocalLengthIn35mmFormat="26" \
    "$1"
}

# Check if libimage-exiftool-perl is installed
if ! dpkg -l libimage-exiftool-perl &> /dev/null; then
    echo "libimage-exiftool-perl is not installed. Please install it first."
    exit 1
fi

# Prompt for the source path
read -p "Enter the source path where images are available: " source_path

# Check if the source path is valid
if [ ! -d "$source_path" ]; then
    echo "Invalid source path. Please provide a valid directory."
    exit 1
fi

# Find image files in the source path
IFS=$'\n' image_files=($(find "$source_path" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" \)))
unset IFS

# Check if no image files were found
if [ ${#image_files[@]} -eq 0 ]; then
    echo "No image files found in the provided source path."
    exit 1
fi

# Loop through all image files found in the source path and add/modify EXIF metadata
for file in "${image_files[@]}"; do
    echo "Adding/Modifying EXIF metadata for: $file"
    if ! add_exif_info "$file"; then
        echo "Error: File not found - $file"
    fi
done

echo "All done!"
