## libmcc.vapi

Vala API wrapper for libmcc 1.0.X

### Overview

This repository contains Vala language bindings for the libmodbus library as
well as examples to show its use.

The libmcc:
    https://github.com/coanda/libmcc

The Vala langeuage:
    http://live.gnome.org/Vala/

For bug reports, or enhancement requests:
    https://github.com/coanda/mcc-vapi/issues

### Usage

To use libmcc.vapi simply include the 'using Mcc;' statement at the top of your
vala code and compile your application with '--pkg=libmcc' and the vapi in
either the configured system vapidir or using the '--vapidir=/path/to/your/dir'
option.

Example:

```bash
valac --pkg=libmcc --vapidir=/path/to/vapi/dir mycode.vala
```

### Licensing

Please see the file called COPYING.

