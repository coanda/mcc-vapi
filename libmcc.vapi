namespace Mcc {

    [CCode (cheader_filename = "pmd.h", unref_function = "", free_function = "")]
    public class Pmd {

        [CCode (cname = "MCC_VID")]
        public const int MCC_VID;

        [CCode (cname = "CTRL_IN")]
        public const int CTRL_IN;

        [CCode (cname = "CTRL_OUT")]
        public const int CTRL_OUT;

        [CCode (cname = "INTR_LENGTH")]
        public const int INTR_LENGTH;

        [CCode (cname = "INPUT_REPORT")]
        public const int INPUT_REPORT;

        [CCode (cname = "OUTPUT_REPORT")]
        public const int OUTPUT_REPORT;

        [CCode (cname = "HOST_TO_DEVICE")]
        public const int HOST_TO_DEVICE;

        [CCode (cname = "DEVICE_TO_HOST")]
        public const int DEVICE_TO_HOST;

        [CCode (cname = "STANDARD_TYPE")]
        public const int STANDARD_TYPE;

        [CCode (cname = "CLASS_TYPE")]
        public const int CLASS_TYPE;

        [CCode (cname = "VENDOR_TYPE")]
        public const int VENDOR_TYPE;

        [CCode (cname = "RESERVED_TYPE")]
        public const int RESERVED_TYPE;

        [CCode (cname = "DEVICE_RECIPIENT")]
        public const int DEVICE_RECIPIENT;

        [CCode (cname = "INTERFACE_RECIPIENT")]
        public const int INTERFACE_RECIPIENT;

        [CCode (cname = "ENDPOINT_RECIPIENT")]
        public const int ENDPOINT_RECIPIENT;

        [CCode (cname = "OTHER_RECIPIENT")]
        public const int OTHER_RECIPIENT;

        [CCode (cname = "RESERVED_RECIPIENT")]
        public const int RESERVED_RECIPIENT;

        [CCode (cname = "MAX_MESSAGE_LENGTH")]
        public const int MAX_MESSAGE_LENGTH;

        [CCode (cname = "STRING_MESSAGE")]
        public const int STRING_MSSAGE;

        [CCode (cname = "RAW_DATA")]
        public const int RAW_DATA;

        [CCode (cname = "calibrationTimeStamp")]
        public struct CalibrationTimeStamp {
            uint8 year;
            uint8 month;
            uint8 day;
            uint8 hour;
            uint8 minute;
            uint8 second;
        }

        [CCode (cname = "usb_device_find_USB_MCC")]
        public static LibUSB.DeviceHandle usb_device_find_usb_mcc (int product_id,
                                                                   char *serialID);

        [CCode (cname = "usb_get_max_packet_size")]
        public static int usb_get_max_packet_size (LibUSB.DeviceHandle udev,
                                                   int endpoint_num);


        [CCode (cname = "PMD_SendOutputReport")]
        public static int send_output_report (HidApi.Device hid,
                                       uint8* values,
                                       size_t length);

        [CCode (cname = "PMD_GetInputReport")]
        public static int get_input_report (HidApi.Device hid, uint8* values,
                                     size_t length, int delay);

        [CCode (cname = "PMD_GetFeatureReport")]
        public static int get_feature_report (HidApi.Device hid, uint8* data,
                                       size_t length);

        [CCode (cname = "getUsbSerialNumber")]
        public static void get_usb_serial_number (LibUSB.DeviceHandle udev,
                                                  [CCode (array_length = false)]
                                                  uchar[] serial);

        [CCode (cname = "sendStringRequest")]
        public static int send_string_request (LibUSB.DeviceHandle udev, char* message);

        [CCode (cname = "getStringReturn")]
        public static int get_string_return (LibUSB.DeviceHandle udev, char* message);

        [CCode (cname = "getRawData")]
        public static void get_raw_data (LibUSB.DeviceHandle udev, void* data);

        [CCode (cname = "TYPE_J")]
        public const int TYPE_J;

        [CCode (cname = "TYPE_K")]
        public const int TYPE_K;

        [CCode (cname = "TYPE_T")]
        public const int TYPE_T;

        [CCode (cname = "TYPE_E")]
        public const int TYPE_E;

        [CCode (cname = "TYPE_R")]
        public const int TYPE_R;

        [CCode (cname = "TYPE_S")]
        public const int TYPE_S;

        [CCode (cname = "TYPE_B")]
        public const int TYPE_B;

        [CCode (cname = "TYPE_N")]
        public const int TYPE_N;

        [CCode (cname = "NIST_Table_t")]
        public struct NISTTable {
            public uchar n_coefficients;
            public double v_threshold;
            double* coefficients;
        }

        [CCode (cname = "NIST_Reverse_t")]
        public struct NISTReverse {
            public uchar n_coefficients;
            double* coefficients;
        }

        [CCode (cname = "Thermocouple_Data_t")]
        public struct Thermocouple_Data {
            uchar nTables;
            NISTReverse* reverse_table;
            NISTTable* tables;
        }

        [CCode (cname = "NISTCalcVoltage")]
        public double nist_calc_voltage (uchar tc_type, double temp);

        [CCode (cname = "NISTCalcTemp")]
        public double nist_calc_temp (uchar tc_type, double voltage);
    }



    [CCode (cheader_filename = "usb-1208FS.h", unref_function = "",
											   free_function = "")]
    public class Usb1208FS {

        [CCode (cname = "USB1208FS_PID")]
        public const uint8 PID;

        [CCode (cname = "DIO_PORTA")]
        public const uint8 DIO_PORTA;

        [CCode (cname = "DIO_PORTB")]
        public const uint8 DIO_PORTB;

        [CCode (cname = "DIO_DIR_IN")]
        public const uint8 DIO_DIR_IN;

        [CCode (cname = "DIO_DIR_OUT")]
        public const uint8 DIO_DIR_OUT;

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
        public const uint8 SE_10_00V;

        [CCode (cname = "BP_20_00V")]
        public const uint8 BP_20_00V;

        [CCode (cname = "BP_10_00V")]
        public const uint8 BP_10_00V;

        [CCode (cname = "BP_5_00V")]
        public const uint8 BP_5_00V;

        [CCode (cname = "BP_4_00V")]
        public const uint8 BP_4_00V;

        [CCode (cname = "BP_2_50V")]
        public const uint8 BP_2_50V;

        [CCode (cname = "BP_2_00V")]
        public const uint8 BP_2_00V;

        [CCode (cname = "BP_1_25V")]
        public const uint8 BP_1_25V;

        [CCode (cname = "BP_1_00V")]
        public const uint8 BP_1_00V;

        [CCode (cname = "AIN_EXECUTION")]
        public const uint8 AIN_EXECUTION;

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
        public static void config_port (LibUSB.DeviceHandle udev, uint8 port,
									    uint8 direction);

        [CCode (cname = "usbDIn_USB1208FS")]
        public static void d_in (LibUSB.DeviceHandle udev, uint8 port,
							     uint8* din_value);

        [CCode (cname = "usbDOut_USB1208FS")]
        public static void d_out (LibUSB.DeviceHandle udev, uint8 port,
							      uint8 value);

        [CCode (cname = "usbAIn_USB1208FS")]
        public static short a_in (LibUSB.DeviceHandle udev, uint8 channel,
							      uint8 range);

        [CCode (cname = "usbAOut_USB1208FS")]
        public static void a_out (LibUSB.DeviceHandle udev, uint8 channel,
								  uint8 value);

        [CCode (cname = "usbAOutScan_USB1208FS")]
        public static int a_out_scan (LibUSB.DeviceHandle udev, uint8 lowchannel,
				                      uint8 highchannel, uint32 count,
                                      float* frequency,
					                  [CCode (array_length = false)] uint16[] data,
									  uint8 options);

        [CCode (cname = "usbAOutStop_USB1208FS")]
        public static void a_out_stop (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbAInStop_USB1208FS")]
        public static void a_in_stop (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbAInScan_USB1208FS")]
        public static int a_in_scan (LibUSB.DeviceHandle udev,
					                 uint8 lowchannel, uint8 highchannel,
									 uint32 count, float* frequency,
                                     uint8 options,
									 [CCode (array_length = false)] int16[] data);

        [CCode (cname = "usbAInScan_USB1208FS_SE")]
        public static int a_in_scan_se (LibUSB.DeviceHandle udev,
									    uint8 lowchannel, uint8 highchannel,
									    uint32 count, float frequency,
                                        uint8 options, int16[] data);

        [CCode (cname = "usbALoadQueue_USB1208FS")]
        public static void a_load_queue (LibUSB.DeviceHandle udev, uint8 num,
                                                   uint8[] chan, uint8[] gains);

        [CCode (cname = "usbInitCounter_USB1208FS")]
        public static void init_counter (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbReadCounter_USB1208FS")]
        public static uint32 read_counter (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbReadMemory_USB1208FS")]
        public static void read_memory (LibUSB.DeviceHandle udev, uint16 address,
                                        uint8 count, uint8[] memory);

        [CCode (cname = "usbWriteMemory_USB1208FS")]
        public static int write_memory (LibUSB.DeviceHandle udev,
							            uint16 address, uint8 count,
                                        uint[] data);

        [CCode (cname = "usbBlink_USB1208FS")]
        public static void blink (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbReset_USB1208FS")]
        public static int reset (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbGetStatus_USB1208FS")]
        public static uint16 get_status (LibUSB.DeviceHandle udev);

        [CCode (cname = "usbSetTrigger_USB1208FS")]
        public static void set_trigger (LibUSB.DeviceHandle udev,uint8 type);

        [CCode (cname = "usbSetSync_USB1208FS")]
        public static void set_sync (LibUSB.DeviceHandle udev, uint8 type);

        [CCode (cname = "usbGetAll_USB1208FS")]
        public static void get_all (LibUSB.DeviceHandle udev, uint8[] data);

        [CCode (cname = "volts_FS")]
        //public float volts_fs (const int gain, const short num);
        public static float volts_fs (int gain, short num);

        [CCode (cname = "volts_SE")]
        //public float volts_se (const short num);
        public static float volts_se (short num);

        [CCode (cname = "init_USB1208FS")]
        public static void init (LibUSB.DeviceHandle udev);
    }
}
