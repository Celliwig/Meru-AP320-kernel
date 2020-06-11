/* SPDX-License-Identifier: GPL-2.0 */
#include "ppc_asm.h"

#define SPRN_HID0	0x3F0		/* Hardware Implementation Register 0 */
#define SPRN_HID3	0x3F3		/* Hardware Implementation Register 3 */
#define HID0_ICE	(1<<15)		/* Instruction Cache Enable */
#define HID0_DCE	(1<<14)		/* Data Cache Enable */

#define MSR_IR		(1<<5)
#define MSR_DR		(1<<4)

	.text
	.global _zimage_start
_zimage_start:
	// HID0: d000
	// Turn off data/instruction cache, data cache lock
	li	r4, 0x0
	sync
	isync
	mtspr	SPRN_HID0, r4
	isync

	// MSR: b002
	// Disable External interrupts
	li	r4, 0x3002
	mtmsr	r4
	sync

	// WDT cfg: ffff0007
	// Disable WDT
	//lis	r9, -0x2000
	//ori	r9, r9, 0x204
	//li	r10, 0
	//stw	r10, 0(r9)

	b	_zimage_start_lib
