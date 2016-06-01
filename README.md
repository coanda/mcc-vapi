## libmcc.vapi

Vala API wrapper for libmcc 1.0.X

### Overview

This repository contains Vala language bindings for the libmccusb library as well as an examples to show its use.

MCCLIBUSB:
  ftp://lx10.tx.ncsu.edu/pub/Linux/drivers/USB/

The Vala language:
  http://live.gnome.org/Vala/

For bug reports, or enhancement requests:
  https://github.com/coanda/mcc-vapi/issues

### Installation

Installing Vapi files only requires copying them to the appropriate directory.

```bash
git clone https://github.com/coanda/mcc-vapi.git
cd mcc-vapi
sudo cp libmccusb.{deps,vapi} /usr/share/vala/vapi/
sudo cp libmccusb.pc /usr/share/pkgconfig/
```

### Usage

To use libmcc.vapi simply include the 'using Mcc;' statement at the top of your
vala code and compile your application with '--pkg libusb' and place the vapi in
either the configured system vapidir or using the '--vapidir=/path/to/your/dir'
option.

Example:

```bash
valac --pkg libusb --vapidir=/path/to/vapi/dir mycode.vala
```

### Example program

To compile and run the example program follow these instructions.

```bash
cd example
valac -v --pkg libmccusb test-usb1208FS.vala
./test-usb1208FS
```

### Licensing

Please see the file called COPYING.
