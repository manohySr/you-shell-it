#!/bin/bash

# Define variables
MOUNT_POINT="$HOME/mnt/data"
PARTITION="/dev/sda5"

# Check if the mount point exists; create it if it doesn't
if [ ! -d "$MOUNT_POINT" ]; then
    echo "Creating mount point at $MOUNT_POINT..."
    mkdir -p "$MOUNT_POINT" || { echo "Failed to create directory $MOUNT_POINT"; exit 1; }
fi

# Attempt to mount the partition
echo "Mounting $PARTITION to $MOUNT_POINT..."
sudo mount -t ntfs-3g "$PARTITION" "$MOUNT_POINT"
if [ $? -ne 0 ]; then
    echo "Failed to mount $PARTITION. Please check the filesystem or partition."
    exit 1
fi

# List the contents of the mounted partition
echo "Contents of $MOUNT_POINT:"
ls "$MOUNT_POINT"

# End of script
