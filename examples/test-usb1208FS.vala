public class Usb1208FsExample : GLib.Object {

    public static bool to_continue () {
        int answer = 0;
        stdout.printf ("Continue [yY]? ");
        while ((answer = stdin.getc ()) == '\0' || answer == '\n');
        return ((answer == 'y') || (answer == 'Y'));
    }

    public static int main (string[] args) {

        int flag;
        short svalue;
        uint8 input, channel, gain, options;
        uint8 lowchan, highchan;
        uint8 value = 0;
        uint16[] out_data = new uint16[512];
        short[] in_data = new short[1024];
        int count;
        int temp, i, j;
        int ch;
        float freq;
        int64 start_time, end_time;

        LibUSB.DeviceHandle udev = null;
        int ret;
        uchar[] serial = new uchar[9];
		temp = 0;
		input = 0;
		count = 0;
		gain = 0;
        lowchan = 0;
        highchan =0;


        ret = LibUSB.Context.init (null);
        if (ret < 0) {
            stderr.printf("LibUSB.init: Failed to initialize libusb");
            Posix.exit(1);
        }
        udev = Mcc.Pmd.usb_device_find_usb_mcc(Mcc.Usb1208FS.PID, null);

        if (udev != null) {
            stdout.printf ("USB-1208FS Device is found!\n");
            Mcc.Usb1208FS.init (udev);
        } else {
            stdout.printf ("No device found.\n");
            Posix.exit (0);
        }

        //print out the wMaxPacketSize.  Should be 64
       stdout.printf("wMaxPacketSize = %d\n",
                                      Mcc.Pmd.usb_get_max_packet_size (udev,0));

        /* config mask 0x01 means all inputs */
		Mcc.Usb1208FS.config_port (udev,
				                   Mcc.Usb1208FS.DIO_PORTA,
							       Mcc.Usb1208FS.DIO_DIR_OUT);
		Mcc.Usb1208FS.config_port (udev,
								   Mcc.Usb1208FS.DIO_PORTB,
								   Mcc.Usb1208FS.DIO_DIR_IN);
		Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA, 0);
		Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA, 0);

        while (true) {
            stdout.printf ("\nUSB 1208FS Testing\n");
            stdout.printf ("----------------\n");
            stdout.printf ("Hit 'b' to blink LED\n");
            stdout.printf ("Hit 'c' to test counter\n");
            stdout.printf ("Hit 'e' to exit\n");
            stdout.printf ("Hit 'd' to test digital I/O\n");
            stdout.printf ("Hit 'g' to test analog input scan (differential).\n");
            stdout.printf ("Hit 'j' to test analog input scan (single ended).\n");
            stdout.printf ("Hit 'i' to test analog input (differential mode)\n");
            stdout.printf ("Hit 'h' to test analog input (single ended)\n");
            stdout.printf ("Hit 'o' to test analog output\n");
            stdout.printf ("Hit 'O' to test analog output scan\n");
            stdout.printf ("Hit 'r' to reset\n");
            stdout.printf ("Hit 'S' to get status\n");
            stdout.printf ("Hit 's' to get serial number\n");

            ch = '\0';
            do {
                ch = stdin.getc ();
            } while ((ch =='\0') || (ch == '\n'));

            switch (ch) {
				case 'b':
					stdout.printf ("Blink!!!\n");
					Mcc.Usb1208FS.blink (udev);
					break;
				case 'c':
					stdout.printf ("connect pin 20 and 2\n");
					Mcc.Usb1208FS.init_counter (udev);
					Posix.sleep (1);
					flag = Posix.fcntl (Posix.STDIN_FILENO, Posix.F_GETFL);
					Posix.fcntl (0, Posix.F_SETFL, flag | Posix.O_NONBLOCK);
					do {
						Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA, 1);
						Posix.sleep (1);
						Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA, 0);
						stdout.printf ("Counter = %u\n",
											 Mcc.Usb1208FS.read_counter (udev));
					} while (!(Posix.isalpha (stdin.getc ())));
						Posix.fcntl (Posix.STDIN_FILENO, Posix.F_SETFL, flag);
					break;
				case 'd':
					stdout.printf ("\nTesting Digital I/O....\n");
					stdout.printf ("connect pins 21 through 28 <=> 32 through 39\n");
					do {
						stdout.printf ("Enter a byte number [0-0xff]: " );
						stdin.scanf("%x", &temp);
						Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA,
								            (uint8)temp);
						Mcc.Usb1208FS.d_in (udev, Mcc.Usb1208FS.DIO_PORTB,
                                            &input);
						stdout.printf ("The number you entered = %#x\n", input);
					} while (to_continue());
					break;
				case 'o': /* test the analog output */
					stdout.printf("Testing the analog output...\n");
					stdout.printf("Enter channel [0-1] => (pin 13-14):");
					stdin.scanf("%d", &temp);
					channel = (uint8)temp;
					stdout.printf("Enter a value: ");
					stdin.scanf("%hx", &value);
					Mcc.Usb1208FS.a_out (udev, channel, value);
					break;
				case 'O': /* test Analog Output Scan */
					stdout.printf("Enter desired frequency [Hz]: ");
					stdin.scanf ("%f", &freq);
					for ( j = 0; j <  200; j++ ) {
						for (i = 0; i < 512; i++) {
							out_data[i] = (i % 2 == 1) ? 0 : 0xfff;
						}
						Mcc.Usb1208FS.a_out_scan (udev, 0, 0, 512, &freq, out_data, 0);
					}
					Mcc.Usb1208FS.a_out_stop (udev);
					break;
				case 'g':
					stdout.printf ("Enter desired frequency [Hz]: ");
					stdin.scanf ("%f", &freq);
					stdout.printf ("Enter number of samples [1-1024]: ");
					stdin.scanf("%d", &count);
					stdout.printf ("\t\t1. +/- 20.V\n");
					stdout.printf ("\t\t2. +/- 10.V\n");
					stdout.printf ("\t\t3. +/- 5.V\n");
					stdout.printf ("\t\t4. +/- 4.V\n");
					stdout.printf ("\t\t5. +/- 2.5V\n");
					stdout.printf ("\t\t6. +/- 2.0V\n");
					stdout.printf ("\t\t7. +/- 1.25V\n");
					stdout.printf ("\t\t8. +/- 1.0V\n");
					stdout.printf ("Select gain: [1-8]\n");
					stdin.scanf("%d", &temp);
					switch(temp) {
						case 1: gain = Mcc.Usb1208FS.BP_20_00V;
							break;
						case 2: gain = Mcc.Usb1208FS.BP_10_00V;
							break;
						case 3: gain = Mcc.Usb1208FS.BP_5_00V;
							break;
						case 4: gain = Mcc.Usb1208FS.BP_4_00V;
							break;
						case 5: gain = Mcc.Usb1208FS.BP_2_50V;
							break;
						case 6: gain = Mcc.Usb1208FS.BP_2_00V;
							break;
						case 7: gain = Mcc.Usb1208FS.BP_1_25V;
							break;
						case 8: gain = Mcc.Usb1208FS.BP_1_00V;
							break;
						default:
							break;
					}
					svalue = Mcc.Usb1208FS.a_in (udev, 0, gain);
					options = Mcc.Usb1208FS.AIN_EXECUTION;
					for ( i = 0; i < 1024; i++ ) {  // load data with known value
						in_data[i] = 0xbeef;
					}
					Mcc.Usb1208FS.a_in_scan (udev, 0, 0, count, &freq, options, in_data);
					for ( i = 0; i < count; i++ ) {
						stdout.printf("data[%d] = %#hx  %.2fV\n", i, in_data[i],
                        Mcc.Usb1208FS.volts_fs(gain, in_data[i]));
					}
					break;
				case 'j':
					stdout.printf ("Test of scan mode (single ended).\n");
					stdout.printf ("Enter desired frequency [Hz]: ");
					stdin.scanf ("%f", &freq);
					stdout.printf("Enter number of samples [1-1024]: ");
					stdin.scanf("%d", &count);
					stdout.printf("Enter Low Channel [0-7]: ");
					stdin.scanf("%hhd", &lowchan);
					stdout.printf("Enter High Channel [0-7]: ");
					stdin.scanf("%hhd", &highchan);

					options = Mcc.Usb1208FS.AIN_EXECUTION |
						      Mcc.Usb1208FS.AIN_GAIN_QUEUE;
					for ( i = 0; i < 1024; i++ ) {  // load data with known value
						in_data[i] = 0xbeef;
					}
					Mcc.Usb1208FS.a_in_scan (udev, lowchan, highchan, count,
									         &freq, options, in_data);
					for ( i = 0; i < count; i++ ) {
						stdout.printf ("data[%d] = %#hx  %.2fV\n", i, in_data[i],
 						                Mcc.Usb1208FS.volts_se (in_data[i]));
					}
					break;
                case 'h':
                    stdout.printf ("Testing Analog Input Single Ended Mode\n");
                    stdout.printf ("Select channel [0-7]: ");
                    stdin.scanf("%d", &temp);
                    channel = (uint8)temp;
                    gain =  Mcc.Usb1208FS.SE_10_00V;
					flag = Posix.fcntl (Posix.STDIN_FILENO, Posix.F_GETFL);
					Posix.fcntl (0, Posix.F_SETFL, flag | Posix.O_NONBLOCK);
                    do {
                    Posix.sleep(1);
                    svalue = Mcc.Usb1208FS.a_in (udev, channel, gain);
                    stdout.printf("Channel: %d: value = %#hx, %.2fV\n",
                    channel, svalue, Mcc.Usb1208FS.volts_se (svalue));
					} while (!(Posix.isalpha (stdin.getc ())));
						Posix.fcntl (Posix.STDIN_FILENO, Posix.F_SETFL, flag);
                    break;
                case 'i':
                    stdout.printf("Connect pin 1 - pin 21  and pin 2 - pin 3\n");
                    stdout.printf("Select channel [0-3]: ");
                    stdin.scanf("%d", &temp);
                    if ( temp < 0 || temp > 3 ) break;
                    channel = (uint8) temp;
                    stdout.printf("\t\t1. +/- 20.V\n");
                    stdout.printf("\t\t2. +/- 10.V\n");
                    stdout.printf("\t\t3. +/- 5.V\n");
                    stdout.printf("\t\t4. +/- 4.V\n");
                    stdout.printf("\t\t5. +/- 2.5V\n");
                    stdout.printf("\t\t6. +/- 2.0V\n");
                    stdout.printf("\t\t7. +/- 1.25V\n");
                    stdout.printf("\t\t8. +/- 1.0V\n");
                    stdout.printf("Select gain: [1-8]\n");
                    stdin.scanf("%d", &temp);
                    switch(temp) {
                        case 1: gain = Mcc.Usb1208FS.BP_20_00V;
                            break;
                        case 2: gain = Mcc.Usb1208FS.BP_10_00V;
                            break;
                        case 3: gain = Mcc.Usb1208FS.BP_5_00V;
                            break;
                        case 4: gain = Mcc.Usb1208FS.BP_4_00V;
                            break;
                        case 5: gain = Mcc.Usb1208FS.BP_2_50V;
                            break;
                        case 6: gain = Mcc.Usb1208FS.BP_2_00V;
                            break;
                        case 7: gain = Mcc.Usb1208FS.BP_1_25V;
                            break;
                        case 8: gain = Mcc.Usb1208FS.BP_1_00V;
                            break;
                        default:
                            break;
                     }
					flag = Posix.fcntl (Posix.STDIN_FILENO, Posix.F_GETFL);
					Posix.fcntl (0, Posix.F_SETFL, flag | Posix.O_NONBLOCK);
                    do {
                        Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA, 0);
                        Posix.sleep(1);
                        svalue = Mcc.Usb1208FS.a_in (udev, channel, gain);
                        stdout.printf("Channel: %d: value = %#hx, %.2fV\n",
                        channel, svalue, Mcc.Usb1208FS.volts_fs (gain, svalue));
                        Mcc.Usb1208FS.d_out (udev, Mcc.Usb1208FS.DIO_PORTA, 0x1);
                        Posix.sleep (1);
                        svalue = Mcc.Usb1208FS.a_in (udev, channel, gain);
                        stdout.printf ("Channel: %d: value = %#hx, %.2fV\n",
                        channel, svalue, Mcc.Usb1208FS.volts_fs (gain, svalue));
					} while (!(Posix.isalpha (stdin.getc ())));
						Posix.fcntl (Posix.STDIN_FILENO, Posix.F_SETFL, flag);
                    stdout.printf ("Doing a timing test.  Please wait ...\n");
                    start_time = get_monotonic_time ();
                    for (count = 0; count < 500; count++) {
                        svalue = Mcc.Usb1208FS.a_in(udev, channel, gain);
                    }
                    end_time = get_monotonic_time ();
                    stdout.printf ("Sampling speed is %lld Hz.\n", 500/(end_time - start_time));
                    break;
                case 'S':
                    stdout.printf("Status = %#x\n", Mcc.Usb1208FS.get_status (udev));
                    break;
                case 'r':
                    Mcc.Usb1208FS.reset (udev);
                    break;
				case 'e':
                    udev.clear_halt (LibUSB.EndpointDirection.IN | 1);
                    udev.clear_halt (LibUSB.EndpointDirection.OUT | 2);
                    udev.clear_halt (LibUSB.EndpointDirection.IN | 3);
                    udev.clear_halt (LibUSB.EndpointDirection.IN | 4);
                    udev.clear_halt (LibUSB.EndpointDirection.IN | 5);
                    for (i = 0; i < 4; i++) {
                        udev.release_interface(i);
                    }
                    //libusb_close(udev);
					return 0;
                case 's':
                    Mcc.Pmd.get_usb_serial_number (udev, serial);
                    stdout.printf("Serial number = %s\n", (string)serial);
                    break;
                default:
                    break;
            }
        }
    }
}

/*
 *valac -C -H --vapidir=. --vapidir=.. --pkg libmcc --pkg hidapi test-usb1208FS.vala
 *gcc -o test-usb1208FS test-usb1208FS.c `pkg-config --cflags --libs hidapi-libusb libusb-1.0 libmccusb glib-2.0 gobject-2.0`
 *
 */
