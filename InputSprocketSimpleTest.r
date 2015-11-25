/*	File:		InputSprocketSimpleTest.r	Contains:	xxx put contents here xxx	Version:	xxx put version here xxx	Copyright:	� 1998 by Apple Computer, Inc., all rights reserved.	File Ownership:		DRI:				xxx put dri here xxx		Other Contact:		xxx put other contact here xxx		Technology:			xxx put technology here xxx	Writers:		(BWS)	Brent Schorsch	Change History (most recent first):		 <1>	 7/17/98	BWS		first checked in*//*************************************************************************************File:      InputSprocketSimpleTest.rCopyright � 1996, 1997, 1998 Apple Computer, Inc., All Rights ReservedYou may incorporate this sample code into your applications withoutrestriction, though the sample code has been provided "AS IS" and theresponsibility for its operation is 100% yours.  However, what you arenot permitted to do is to redistribute the source as "DSC Sample Code"after having made changes. If you're going to re-distribute the source,we require that you make it clear in the source that the code wasdescended from Apple Sample Code, but that you've made changes.*************************************************************************************/#include "InputSprocket.r"/* the InputSprocket application resource tells utility programs how the *//* application uses InputSprocket */#define	kResourceID_isap						128#define	kResourceID_setl						128#define	kResourceID_tset_KeyboardDefaultSet		128#define	kResourceID_tset_MouseDefaultSet		256#define	kResourceID_tset_MouseAsDeltasSet		257resource 'isap' (kResourceID_isap){	callsISpInit,	usesInputSprocket};/* the set list resource contains the list of all the saved sets for devices *//* that are provided in the application's resource fork */resource 'setl' (kResourceID_setl, "InputSprocketTest sets"){	currentVersion,	{		"Default", 0, kISpDeviceClass_Keyboard, kISpKeyboardID_Apple, notApplSet, isDefaultSet, kResourceID_tset_KeyboardDefaultSet,				"Default", 0, kISpDeviceClass_Mouse, 'appl', notApplSet, isDefaultSet, kResourceID_tset_MouseDefaultSet,		"As Deltas", 0, kISpDeviceClass_Mouse, 'appl', isApplSet, notDefaultSet, kResourceID_tset_MouseAsDeltasSet	};};/* the set resources actually contain the saved sets for one  *//* Default keyboard set */resource 'tset' (kResourceID_tset_KeyboardDefaultSet, "Default (Keyboard)"){	supportedVersion,	{			/* Forward Thrust (z axis) need */		/* this need does not generate any items, because it has later button equivalents */				/* Side Thrust (x axis) need */		kpd4Key, 			/* min (left/down/back) */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,		 		kpd6Key, 			/* max (right/up/forward) */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Vertical Thrust (y axis) need */		zKey, 				/* min (left/down/back) */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,		 		aKey, 				/* max (right/up/forward) */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Look (movement) need */		upKey,	 			/* up */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,		 		downKey, 			/* down */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				leftKey, 			/* left */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,		 		rightKey, 			/* right */		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Fire (button) need */		kpd0Key,		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Secondary Fire (button) need */		optionKey,		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Thrust Forward (button) need */		kpd8Key,		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Thrust Backward (button) need */		kpd5Key,		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Pause (button) need */		escKey,		 rControlOff, rOptionOff, rShiftOff, controlOff, optionOff, shiftOff, commandOff,				/* Scroll (dpad) need */		upKey, 			/* up */		 rControlOff, rOptionOff, rShiftOff, controlOn, optionOff, shiftOff, commandOff,		 		downKey, 			/* down */		 rControlOff, rOptionOff, rShiftOff, controlOn, optionOff, shiftOff, commandOff,				leftKey, 			/* left */		 rControlOff, rOptionOff, rShiftOff, controlOn, optionOff, shiftOff, commandOff,		 		rightKey, 			/* right */		 rControlOff, rOptionOff, rShiftOff, controlOn, optionOff, shiftOff, commandOff		/* Delta X (x delta) need */		/* this need does not generate any items, because the keyboard driver */		/* does not support delta needs */				/* Delta Y (y delta) need */		/* this need does not generate any items, because the keyboard driver */		/* does not support delta needs */			};};/* Default mouse set (mapped to side thrust and forward thrust needs) */data 'tset' (kResourceID_tset_MouseDefaultSet, "Default (Mouse)"){	$"000000043F8000003F8000003F800000"	$"FFFF0001FFFF000100000004FFFF0001"	$"FFFF0001FFFF0001FFFF0001FFFF0001"	$"FFFF0001FFFF00010000000000000001"	$"0000000000000001FFFF0001FFFF0001"	$"FFFF0001000000000000000004715C20"	$"00000001000000110053000000550000"	$"0006000000000000007E0000007D0000"	$"007B0000007C00000052000000000000"	$"005B000000570000"};/* thrusts *//* 'as Deltas' mouse set (mapped to delta needs) */data 'tset' (kResourceID_tset_MouseAsDeltasSet, "As Deltas (Keyboard)"){	$"000000043F8000003F8000003F800000"	$"FFFF0001FFFF000100000004FFFF0001"	$"FFFF0001FFFF0001FFFF0001FFFF0001"	$"FFFF0001FFFF00010000000B0000000A"	$"0000000B0000000AFFFF0001FFFF0001"	$"FFFF0001000000000000000000000000"	$"000000000000000000000000014E014F"	$"04726370000000000000012004726F80"	$"04D2233C80C00000FFFF017C00000000"	$"0000000000000048"};