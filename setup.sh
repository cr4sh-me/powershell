#!/bin/bash

POWERSHELL_PATH="/opt/cybertools/powershell/pwsh"
POWERSHELL_VERSION="7.5.0-preview.3"
TARGET_ARCH="$(uname -m)"

if [ "$TARGET_ARCH" == "aarch64" ]; then
    FILE_ARCH="arm64"
elif [ "$TARGET_ARCH" == "armv6l" ] || [ "$TARGET_ARCH" == "armv7l" ]; then
    FILE_ARCH="arm"
else
    echo "$TARGET_ARCH not supported yet!"
    exit 1
fi

FILENAME="powershell-$POWERSHELL_VERSION-linux-$FILE_ARCH.tar.gz"

rm -rf $POWERSHELL_PATH
mkdir -p $POWERSHELL_PATH
wget https://github.com/PowerShell/PowerShell/releases/download/v$POWERSHELL_VERSION/$FILENAME
tar -xvf "$FILENAME" -C $POWERSHELL_PATH
rm -f "$FILENAME"

chmod +x $POWERSHELL_PATH/pwsh
ln -sf $POWERSHELL_PATH/pwsh /opt/cybertools/bin/powershell
ln -sf $POWERSHELL_PATH/pwsh /opt/cybertools/bin/pwsh
