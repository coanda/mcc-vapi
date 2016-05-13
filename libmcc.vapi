namespace Mcc {

    [CCode (cheader_filename = "usb-1208FS.h", unref_function = "", free_function = "")]
    public class Usb1208FS {

        [CCode (cname = "USB1208FS_PID")]
        public const int PID;

        [CCode (cname = "DIO_PORTA")]
        public const int DIO_PORTA;

        [CCode (cname = "DIO_PORTB")]
        public const int DDIO_PORTB;

        [CCode (cname = "DIO_DIR_IN")]
        public const int DIO_DIR_IN;

        [CCode (cname = "DIO_DIR_OUT")]
        public const int DIO_DIR_OUT;

        [CCode (cname = "DCONFIG")]
        public const int DCONFIG;

        [CCode (cname = "DIN")]
        public const int DIN;

        [CCode (cname = "DOUT")]
        public const int DOUT;

        [CCode (cname = "AIN")]
        public const int AIN;

        [CCode (cname = "AIN_SCAN")]
        public const int AIN_SCAN;

        [CCode (cname = "AIN_STOP")]
        public const int AIN_STOP;

        [CCode (cname = "ALOAD_QUEUE")]
        public const int ALOAD_QUEUE;

        [CCode (cname = "AOUT_SCAN")]
        public const int AOUT_SCAN;

        [CCode (cname = "AOUT_STOP")]
        public const int AOUT_STOP;

        [CCode (cname = "CINIT")]
        public const int CINIT;

        [CCode (cname = "CIN")]
        public const int CIN;

        [CCode (cname = "MEM_READ")]
        public const int MEM_READ;

        [CCode (cname = "MEM_WRITE")]
        public const int MEM_WRITE;

        [CCode (cname = "BLINK_LED")]
        public const int BLINK_LED;

        [CCode (cname = "RESET")]
        public const int RESET;

        [CCode (cname = "SET_TRIGGER")]
        public const int SET_TRIGGER;

        [CCode (cname = "SET_SYNC")]
        public const int SET_SYNC;

        [CCode (cname = "GET_STATUS")]
        public const int GET_STATUS;

        [CCode (cname = "SET_CAL")]
        public const int SET_CAL;

        [CCode (cname = "GET_ALL")]
        public const int GET_ALL;

        [CCode (cname = "PREPARE_DOWNLOAD")]
        public const int PREPARE_DOWNLOAD;

        [CCode (cname = "WRITE_CODE")]
        public const int WRITE_CODE;

        [CCode (cname = "WRITE_SERIAL")]
        public const int WRITE_SERIAL;

        [CCode (cname = "READ_CODE")]
        public const int READ_CODE;

        [CCode (cname = "EXT_TRIG_FAILING_EDGE")]
        public const int EXT_TRIG_FAILING_EDGE;

        [CCode (cname = "EXT_TRIG_RAISING_EDGE")]
        public const int EXT_TRIG_RAISING_EDGE;

        [CCode (cname = "SYNC_MASTER")]
        public const int SYNC_MASTER;

        [CCode (cname = "SYNC_SLAVE")]
        public const int SYNC_SLAVE;

        [CCode (cname = "SE_10_00V")]
        public const int SE_10_00V;

        [CCode (cname = "BP_20_00V")]
        public const int BP_20_00V;

        [CCode (cname = "BP_10_00V")]
        public const int BP_10_00V;

        [CCode (cname = "BP_5_00V")]
        public const int BP_5_00V;

        [CCode (cname = "BP_4_00V")]
        public const int BP_4_00V;

        [CCode (cname = "BP_2_50V")]
        public const int BP_2_50V;

        [CCode (cname = "BP_2_00V")]
        public const int BP_2_00V;

        [CCode (cname = "BP_1_25V")]
        public const int BP_1_25V;

        [CCode (cname = "BP_1_00V")]
        public const int BP_1_00V;

        [CCode (cname = "AIN_EXECUTION")]
        public const int AIN_EXECUTION;

        [CCode (cname = "AIN_TRANSFER_MODE")]
        public const int AIN_TRANSFER_MODE;

        [CCode (cname = "AIN_TRIGGER")]
        public const int AIN_TRIGGER;

        [CCode (cname = "AIN_DEBUG")]
        public const int AIN_DEBUG;

        [CCode (cname = "AIN_GAIN_QUEUE")]
        public const int AIN_GAIN_QUEUE;

        [CCode (cname = "_vala_mcc_usb1208fs_new")]
        public Usb1208FS () {
            /* empty */
        }

        [CCode (cname = "usbDConfigPort_USB1208FS")]
        public void config_port (LibUSB.DeviceHandle udev, uint8 port, uint8 direction);

        [CCode (cname = "usbDIn_USB1208FS")]
        public void d_in (LibUSB.DeviceHandle udev, uint8 port, uint8 din_value);

        [CCode (cname = "usbDOut_USB1208FS")]
        public void d_out (LibUSB.DeviceHandle udev, uint8 port, uint8 value);

        [CCode (cname = "usbAIn_USB1208FS")]
        public short a_in (LibUSB.DeviceHandle udev, uint8 channel, uint8 range);

        [CCode (cname = "usbAOut_USB1208FS")]
        public void a_out (LibUSB.DeviceHandle udev, uint8 channel, uint8 value);

        [CCode (cname = "usbAOutScan_USB1208FS")]
        public int a_out_scan (LibUSB.DeviceHandle udev,
                            uint8 lowchannel, uint8 highchannel, uint32 count,
                                 float frequency, uint16[] data, uint8 options);

        [CCode (cname = "usbAOutStop_USB1208FS")]
        public void a_out_stop (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbAInStop_USB1208FS")]
        public void a_in_stop (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbAInScan_USB1208FS")]
        public int a_in_scan (LibUSB.DeviceHandle udev, uint8 lowchannel,
                            uint8 highchannel, uint32 count, float frequency,
                                                   uint8 options, int16[] data);

        [CCode (cname = "usbAInScan_USB1208FS_SE")]
        public int a_in_scan_se (LibUSB.DeviceHandle udev, uint8 lowchannel,
                            uint8 highchannel, uint32 count, float frequency,
                                                   uint8 options, int16[] data);

        [CCode (cname = "usbALoadQueue_USB1208FS")]
        public void a_load_queue (LibUSB.DeviceHandle udev, uint8 num,
                                                   uint8[] chan, uint8[] gains);

        [CCode (cname = "usbInitCounter_USB1208FS")]
        public void init_counter (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbReadCounter_USB1208FS")]
        public uint32 read_counter (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbReadMemory_USB1208FS")]
        public void read_memory (LibUSB.DeviceHandle udev, uint16 address,
                                                   uint8 count, uint8[] memory);

        [CCode (cname = "usbWriteMemory_USB1208FS")]
        public int write_memory (LibUSB.DeviceHandle udev, uint16 address, uint8 count, uint[] data);

        [CCode (cname = "usbBlink_USB1208FS")]
        public void blink (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbReset_USB1208FS")]
        public int reset (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbGetStatus_USB1208FS")]
        public uint16 get_status (LibUSB.deviceHandle udev);

        [CCode (cname = "usbSetTrigger_USB1208FS")]
        public void set_trigger (LibUSB.DeviceHandle udev,uint8 type);

        [CCode (cname = "usbSetSync_USB1208FS")]
        public void set_sync (LibUSB.DeviceHandle udev, uint8 type);

        [CCode (cname = "usbGetAll_USB1208FS")]
        public void get_all (LibUSB.DeviceHandle udev, uint8[] data);

        [CCode (cname = "volts_FS")]
        //public float volts_fs (const int gain, const short num);
        public float volts_fs (int gain, short num);

        [CCode (cname = "volts_SE")]
        //public float volts_se (const short num);
        public float volts_se (short num);

        [CCode (cname = "init_USB1208FS")]
        public void init (LibUSB.DeviceHandle udev);
    }
}
