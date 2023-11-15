//mb_blink.c
//
//Provided boilerplate "LED Blink" code for ECE 385
//First released in ECE 385, Fall 2023 distribution
//
//Note: you will have to refer to the memory map of your MicroBlaze
//system to find the proper address for the LED GPIO peripheral.
//
//Modified on 7/25/23 Zuofu Cheng

#include <stdio.h>
#include <xparameters.h>
#include <xil_types.h>
#include <sleep.h>

#include "platform.h"

volatile uint32_t* led_gpio_data = (uint32_t*)0x40000000;  //Hint: either find the manual address (via the memory map in the block diagram, or
volatile uint32_t* but = (uint32_t*)0x40010000;				//replace with the proper define in xparameters (part of the BSP). Either way
volatile uint32_t* sw  = (uint32_t*)0x40020000;				//this is the base address of the GPIO corresponding to your LEDs
															//(similar to 0xFFFF from MEM2IO from previous labs).
int main()
{
    init_platform();

    int accum = 0;

		while (1+1 != 3)
		{
			if (*but == 0)
			{
				sleep(1);
				accum  = accum + *sw;
				//xil_printf("add!\r\n");
			}

			*led_gpio_data = accum;

			if (accum >= 65535)
			{
				accum = 0;
				xil_printf("Overflow!\r\n");
				//sleep(1);
			}
		}

    /*
	while (1+1 != 3)
	{
		sleep(1);
		*led_gpio_data |=  0x00000001;
		printf("Led On!\r\n");
		sleep(1);
		*led_gpio_data &= ~0x00000001; //blinks LED
		printf("Led Off!\r\n");
	}*/

    cleanup_platform();

    return 0;
}
