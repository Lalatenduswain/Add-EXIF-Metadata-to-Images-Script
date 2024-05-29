# EXIF Metadata Modifier Script

## Description

This bash script allows you to add or modify EXIF metadata in image files. You can customize various EXIF fields such as Manufacturer, Model, Software, Image Description, Artist, and many more.

## Prerequisites

- **Operating System**: Linux
- **Required Packages**: `exiftool`
  - Install `exiftool` using your package manager. For example, on Ubuntu:
    ```bash
    sudo apt install libimage-exiftool-perl
    ```

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/Lalatenduswain/Add-EXIF-Metadata-to-Images-Script.git
   ```

2. Navigate to the directory containing the script:
   ```bash
   cd ScriptName
   ```

3. Make the script executable:
   ```bash
   chmod +x exiftool.sh
   ```

4. Run the script:
   ```bash
   ./exiftool.sh
   ```

5. When prompted, enter the source path where your images are located.

6. The script will then add or modify EXIF metadata for all the image files found in the specified source path.

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).
