namespace Mcc {

    [CCode (cheader_filename = "usb-1208FS.h", unref_function = "", free_function = "")]
    public class Usb1208FS {

        [CCode (cname = "USB1208FS_PID")]
        public const int PID;

        /* continue constants ... */

        [CCode (cname = "_vala_mcc_usb1208fs_new")]
        public Usb1208FS () {
            /* empty */
        }

        [CCode (cname = "usbDConfigPort_USB1208FS")]
        public config_port (LibUSB.DeviceHandle udev, uint8 port, uint8 direction);

        /* continue methods ... */
    }
}
