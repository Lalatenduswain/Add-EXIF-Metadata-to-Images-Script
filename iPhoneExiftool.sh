#!/bin/bash

# Function to add or modify EXIF metadata using exiftool
add_exif_info() {
    exiftool -overwrite_original \
    -Make="Apple" \
    -Model="iPhone 15 Pro Max" \
    -Software="17.0.2" \
    -ModifyDate="$(date +'%Y:%m:%d %H:%M:%S')" \
    -Orientation="Horizontal (normal)" \
    -ImageDescription="Photo shoot by Lalatendu" \
    -XResolution="72" \
    -YResolution="72" \
    -ResolutionUnit="inches" \
    -ExposureTime="1/12346" \
    -FNumber="1.8" \
    -ExposureProgram="Program AE" \
    -ISO="100" \
    -ExifVersion="0232" \
    -DateTimeOriginal="$(date +'%Y:%m:%d %H:%M:%S')" \
    -CreateDate="$(date +'%Y:%m:%d %H:%M:%S')" \
    -OffsetTime="-07:00" \
    -OffsetTimeOriginal="-07:00" \
    -OffsetTimeDigitized="-07:00" \
    -ShutterSpeedValue="1/12346" \
    -ApertureValue="1.8" \
    -BrightnessValue="11.96591378" \
    -MeteringMode="Multi-segment" \
    -Flash="Off, Did not fire" \
    -FocalLength="6.9 mm" \
    -SubjectArea="4023 3017 4646 2661" \
    -LensMake="Apple" \
    -LensModel="iPhone 15 Pro Max back triple camera 6.86mm f/1.78" \
    -XMPToolkit="XMP Core 6.0.0" \
    -CreatorTool="17.0.2" \
    -Lens="iPhone 15 Pro Max back triple camera 6.86mm f/1.78" \
    -DateCreated="$(date +'%Y:%m:%d %H:%M:%S')" \
    -MPFVersion="0100" \
    -MPImageFlags="(none)" \
    -MPImageFormat="JPEG" \
    -MPImageType="Undefined" \
    -MPImageLength="710180" \
    -MPImageStart="9238013" \
    -DependentImage1EntryNumber="0" \
    -DependentImage2EntryNumber="0" \
    -ImageWidth="8064" \
    -ImageHeight="6048" \
    -EncodingProcess="Baseline DCT, Huffman coding" \
    -BitsPerSample="8" \
    -ColorComponents="3" \
    -YCbCrSubSampling="YCbCr4:2:0 (2 2)" \
    -RunTimeSincePowerUp="1 days 1:54:58" \
    -Aperture="1.8" \
    -ImageSize="8064x6048" \
    -Megapixels="48.8" \
    -ScaleFactorTo35mmEquivalent="3.5" \
    -ShutterSpeed="1/12346" \
    -CreateDate="$(date +'%Y:%m:%d %H:%M:%S')" \
    -DateTimeOriginal="$(date +'%Y:%m:%d %H:%M:%S')" \
    -ModifyDate="$(date +'%Y:%m:%d %H:%M:%S')" \
    -GPSLatitude="12.889568465397714" \
    -GPSLongitude="77.6032081735014" \
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
