## libmcc.vapi

Vala API wrapper for libmcc 1.0.X

### Overview

This repository contains Vala language bindings for the libmccusb library as
well as an examples to show its use.

The libmcc:
    https://github.com/coanda/libmcc

The Vala language:
    http://live.gnome.org/Vala/

For bug reports, or enhancement requests:
    https://github.com/coanda/mcc-vapi/issues

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

To compile the example program follow these instructions. It should not be
neccessary to do this in two step but for now this is what works.

```bash
valac -C -v --pkg libmccusb test-usb1208FS.vala
gcc -o test-usb1208FS test-usb1208FS.c `pkg-config --cflags --libs hidapi-libusb libusb-1.0 libmccusb glib-2.0 gobject-2.0`
```


### Licensing

Please see the file called COPYING.

