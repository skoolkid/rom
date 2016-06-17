;
; SkoolKit control file for the 48K Spectrum ROM.
;
; Annotations taken from 'The Complete Spectrum ROM Disassembly' by Dr Ian
; Logan and Dr Frank O'Hara, published by Melbourne House.
;

@ $0000 start
@ $0000 replace=/#pi/#CHR(960)
@ $0000 replace=/#power/#CHR(8593)
@ $0000 org=$0000
@ $0000 set-handle-unsupported-macros=1
@ $0000 label=START
c $0000 THE 'START'
D $0000 The maskable interrupt is disabled and the #REGde register pair set to hold the 'top of possible RAM'.
  $0000 Disable the 'keyboard interrupt'.
  $0001 +00 for start (but +FF for 'NEW').
  $0002 Top of possible RAM.
  $0005 Jump forward.
@ $0008 label=ERROR_1
c $0008 THE 'ERROR' RESTART
D $0008 The error pointer is made to point to the position of the error.
  $0008 The address reached by the interpreter is copied to the error pointer before proceeding.
@ $0010 label=PRINT_A_1
c $0010 THE 'PRINT A CHARACTER' RESTART
D $0010 The #REGa register holds the code of the character that is to be printed.
  $0010 Jump forward immediately.
s $0013
  $0013,5,5:$FF Unused locations.
@ $0018 label=GET_CHAR
c $0018 THE 'COLLECT CHARACTER' RESTART
D $0018 The contents of the location currently addressed by CH-ADD are fetched. A return is made if the value represents a printable character, otherwise CH-ADD is incremented and the tests repeated.
  $0018 Fetch the value that is addressed by CH-ADD.
@ $001C label=TEST_CHAR
  $001C Find out if the character is printable.
  $001F Return if it is so.
@ $0020 label=NEXT_CHAR
c $0020 THE 'COLLECT NEXT CHARACTER' RESTART
D $0020 As a BASIC line is interpreted, this routine is called repeatedly to step along the line.
  $0020 CH-ADD needs to be incremented.
  $0023 Jump back to test the new value.
s $0025
  $0025,3,3:$FF Unused locations.
@ $0028 label=FP_CALC
c $0028 THE 'CALCULATOR' RESTART
D $0028 The floating point calculator is entered at #R$335B.
  $0028 Jump forward immediately.
s $002B
  $002B,5,5:$FF Unused locations.
@ $0030 label=BC_SPACES
c $0030 THE 'MAKE BC SPACES' RESTART
D $0030 This routine creates free locations in the work space. The number of locations is determined by the current contents of the #REGbc register pair.
  $0030 Save the 'number'.
  $0031 Fetch the present address of the start of the work space and save that also before proceeding.
@ $0038 label=MASK_INT
c $0038 THE 'MASKABLE INTERRUPT' ROUTINE
D $0038 The real time clock is incremented and the keyboard scanned whenever a maskable interrupt occurs.
  $0038 Save the current values held in these registers.
  $003A The lower two bytes of the frame counter are incremented every 20 ms. (U.K.) The highest byte of the frame counter is only incremented when the value of the lower two bytes is zero.
@ $0048 label=KEY_INT
  $0048 Save the current values held in these registers.
  $004A Now scan the keyboard.
  $004D Restore the values.
  $0051 The maskable interrupt is enabled before returning.
@ $0053 label=ERROR_2
c $0053 THE 'ERROR-2' ROUTINE
@ $0055 label=ERROR_3
s $005F
  $005F,7,7:$FF Unused locations.
@ $0066 label=RESET
c $0066 THE 'NON-MASKABLE INTERRUPT' ROUTINE
@ $0070 label=NO_RESET
@ $0074 label=CH_ADD_1
c $0074 THE 'CH-ADD+1' SUBROUTINE
@ $0077 label=TEMP_PTR1
@ $0078 label=TEMP_PTR2
@ $007D label=SKIP_OVER
c $007D THE 'SKIP-OVER' SUBROUTINE
@ $0090 label=SKIPS
@ $0095 label=TOKENS
t $0095 THE TOKEN TABLE
D $0095 All the tokens used by the Spectrum are expanded by reference to this table. The last code of each token is 'inverted' by having its bit 7 set.
  $0096,3,2:B1
  $0099,6,5:B1
  $009F,2,1:B1
  $00A1,2,1:B1
  $00A3,5,4:B1
  $00A8,7,6:B1
  $00AF,4,3:B1
  $00B3,2,1:B1
  $00B5,3,2:B1
  $00B8,4,3:B1
  $00BC,4,3:B1
  $00C0,3,2:B1
  $00C3,3,2:B1
  $00C6,3,2:B1
  $00C9,3,2:B1
  $00CC,3,2:B1
  $00CF,3,2:B1
  $00D2,3,2:B1
  $00D5,3,2:B1
  $00D8,2,1:B1
  $00DA,3,2:B1
  $00DD,3,2:B1
  $00E0,3,2:B1
  $00E3,3,2:B1
  $00E6,3,2:B1
  $00E9,4,3:B1
  $00ED,2,1:B1
  $00EF,3,2:B1
  $00F2,4,3:B1
  $00F6,4,3:B1
  $00FA,3,2:B1
  $00FD,3,2:B1
  $0100,2,1:B1
  $0102,3,2:B1
  $0105,2,1:B1
  $0107,2,1:B1
  $0109,2,1:B1
  $010B,4,3:B1
  $010F,4,3:B1
  $0113,2,1:B1
  $0115,4,3:B1
  $0119,6,5:B1
  $011F,3,2:B1
  $0122,6,5:B1
  $0128,4,3:B1
  $012C,5,4:B1
  $0131,6,5:B1
  $0137,7,6:B1
  $013E,5,4:B1
  $0143,6,5:B1
  $0149,4,3:B1
  $014D,6,5:B1
  $0153,3,2:B1
  $0156,5,4:B1
  $015B,5,4:B1
  $0160,6,5:B1
  $0166,7,6:B1
  $016D,4,3:B1
  $0171,3,2:B1
  $0174,6,5:B1
  $017A,5,4:B1
  $017F,4,3:B1
  $0183,4,3:B1
  $0187,4,3:B1
  $018B,7,6:B1
  $0192,3,2:B1
  $0195,6,5:B1
  $019B,8,7:B1
  $01A3,3,2:B1
  $01A6,3,2:B1
  $01A9,3,2:B1
  $01AC,5,4:B1
  $01B1,6,5:B1
  $01B7,5,4:B1
  $01BC,4,3:B1
  $01C0,4,3:B1
  $01C4,3,2:B1
  $01C7,5,4:B1
  $01CC,4,3:B1
  $01D0,4,3:B1
  $01D4,5,4:B1
  $01D9,4,3:B1
  $01DD,3,2:B1
  $01E0,4,3:B1
  $01E4,9,8:B1
  $01ED,2,1:B1
  $01EF,3,2:B1
  $01F2,4,3:B1
  $01F6,5,4:B1
  $01FB,6,5:B1
  $0201,4,3:B1
@ $0205 label=KEYTABLE_A
b $0205 THE KEY TABLES
D $0205 There are six separate key tables. The final character code obtained depends on the particular key pressed and the 'mode' being used.
N $0205 (a) The main key table - L mode and CAPS SHIFT.
  $0205 B
  $0206 H
  $0207 Y
  $0208 6
  $0209 5
  $020A T
  $020B G
  $020C V
  $020D N
  $020E J
  $020F U
  $0210 7
  $0211 4
  $0212 R
  $0213 F
  $0214 C
  $0215 M
  $0216 K
  $0217 I
  $0218 8
  $0219 3
  $021A E
  $021B D
  $021C X
  $021D SYMBOL SHIFT
  $021E L
  $021F O
  $0220 9
  $0221 2
  $0222 W
  $0223 S
  $0224 Z
  $0225 SPACE
  $0226 ENTER
  $0227 P
  $0228 0
  $0229 1
  $022A Q
  $022B A
@ $022C label=KEYTABLE_B
N $022C (b) Extended mode. Letter keys and unshifted.
  $022C READ
  $022D BIN
  $022E LPRINT
  $022F DATA
  $0230 TAN
  $0231 SGN
  $0232 ABS
  $0233 SQR
  $0234 CODE
  $0235 VAL
  $0236 LEN
  $0237 USR
  $0238 PI
  $0239 INKEY$
  $023A PEEK
  $023B TAB
  $023C SIN
  $023D INT
  $023E RESTORE
  $023F RND
  $0240 CHR$
  $0241 LLIST
  $0242 COS
  $0243 EXP
  $0244 STR$
  $0245 LN
@ $0246 label=KEYTABLE_C
N $0246 (c) Extended mode. Letter keys and either shift.
  $0246 ~
  $0247 BRIGHT
  $0248 PAPER
  $0249 \
  $024A ATN
  $024B {
  $024C }
  $024D CIRCLE
  $024E IN
  $024F VAL$
  $0250 SCREEN$
  $0251 ATTR
  $0252 INVERSE
  $0253 OVER
  $0254 OUT
  $0255 #CHR169
  $0256 ASN
  $0257 VERIFY
  $0258 |
  $0259 MERGE
  $025A ]
  $025B FLASH
  $025C ACS
  $025D INK
  $025E [
  $025F BEEP
@ $0260 label=KEYTABLE_D
N $0260 (d) Control codes. Digit keys and CAPS SHIFT.
  $0260 DELETE
  $0261 EDIT
  $0262 CAPS LOCK
  $0263 TRUE VIDEO
  $0264 INV. VIDEO
  $0265 Cursor left
  $0266 Cursor down
  $0267 Cursor up
  $0268 Cursor right
  $0269 GRAPHICS
@ $026A label=KEYTABLE_E
N $026A (e) Symbol code. Letter keys and symbol shift.
  $026A STOP
  $026B *
  $026C ?
  $026D STEP
  $026E >=
  $026F TO
  $0270 THEN
  $0271 #power
  $0272 AT
  $0273 -
  $0274 +
  $0275 =
  $0276 .
  $0277 ,
  $0278 ;
  $0279 "
  $027A <=
  $027B <
  $027C NOT
  $027D >
  $027E OR
  $027F /
  $0280 <>
  $0281 #CHR163
  $0282 AND
  $0283 :
@ $0284 label=KEYTABLE_F
N $0284 (f) Extended mode. Digit keys and symbol shift.
  $0284 FORMAT
  $0285 DEF FN
  $0286 FN
  $0287 LINE
  $0288 OPEN
  $0289 CLOSE
  $028A MOVE
  $028B ERASE
  $028C POINT
  $028D CAT
@ $028E label=KEY_SCAN
c $028E THE 'KEYBOARD SCANNING' SUBROUTINE
@ $0296 label=KEY_LINE
@ $029F label=KEY_3KEYS
@ $02A1 label=KEY_BITS
@ $02AB label=KEY_DONE
@ $02BF label=KEYBOARD
c $02BF THE 'KEYBOARD' SUBROUTINE
@ $02C6 label=K_ST_LOOP
@ $02D1 label=K_CH_SET
@ $02F1 label=K_NEW
@ $0308 label=K_END
@ $0310 label=K_REPEAT
c $0310 THE 'REPEATING KEY' SUBROUTINE
@ $031E label=K_TEST
c $031E THE 'K-TEST' SUBROUTINE
@ $032C label=K_MAIN
@ $0333 label=K_DECODE
c $0333 THE 'KEYBOARD DECODING' SUBROUTINE
@ $0341 ssub=LD HL,$022C-$41
@ $0341 label=K_E_LET
@ $034A label=K_LOOK_UP
@ $034F ssub=LD HL,$026A-$41
@ $034F label=K_KLC_LET
@ $0367 label=K_DIGIT
  $0367,c2
@ $0370 ssub=LD HL,$0284-$30
  $0377,c2
@ $0382 label=K_8_9
@ $0389 ssub=LD HL,$0260-$30
@ $0389 label=K_GRA_DGT
  $038C,c2
  $0390,c2
@ $039D label=K_KLC_DGT
@ $03A1 ssub=LD HL,$0260-$30
  $03AF,c2
@ $03B2 label=K_AT_CHAR
  $03B2,c2
@ $03B5 label=BEEPER
c $03B5 THE 'BEEPER' SUBROUTINE
@ $03C1 nowarn
@ $03D1 label=BE_IX_3
@ $03D2 label=BE_IX_2
@ $03D3 label=BE_IX_1
@ $03D4 label=BE_IX_0
@ $03D6 label=BE_H_L_LP
@ $03F2 label=BE_AGAIN
@ $03F6 label=BE_END
@ $03F8 label=BEEP
c $03F8 THE 'BEEP' COMMAND ROUTINE
D $03F8 The subroutine is entered with two numbers on the calculator stack. The topmost number (P) represents the 'pitch' of the note and the number underneath it (t) represents the 'duration'.
  $03F8 The floating-point calculator is used to manipulate the two values: t, P.
B $03F9,1 #R$33C0: t, P, P
B $03FA,1 #R$36AF: t, P, i (where i=INT P)
B $03FB,1 #R$342D(st_mem_0): t, P, i (mem-0 holds i)
B $03FC,1 #R$300F: t, p (where p is the fractional part of P)
B $03FD,6,1,5 #R$33C6: Stack the decimal value K=0.0577622606 (which is a little below 12*(2#power0.5)-1)
B $0403,1 #R$30CA: t, pK
B $0404,1 #R$341B(stk_one): t, pK, 1
B $0405,1 #R$3014: t, pK+1
B $0406,1 #R$369B
N $0407 Now perform several tests on i, the integer part of the 'pitch'.
  $0407 This is 'mem-0-1st' (MEMBOT).
  $040A Fetch the exponent of i.
  $040B Give an error if i is not in the integral (short) form.
  $040E Copy the sign byte to the #REGc register.
  $0410 Copy the low-byte to the #REGb register, and to the #REGa register.
  $0413 Again give report B if i does not satisfy the test: -128<=i<=+127.
  $041C Fetch the low-byte and test it further.
  $041F Accept -60<=i<=67.
  $0422 Reject -128 to -61.
N $0425 Note: The range +70 to +127 will be rejected later on.
N $0425 The correct frequency for the 'pitch' i can now be found.
@ $0425 label=BE_i_OK
  $0425 Start '6' octaves below middle C.
@ $0427 label=BE_OCTAVE
  $0427 Repeatedly reduce i in order to find the correct octave.
  $042C Add back the last subtraction.
  $042E Save the octave number.
  $042F The base address of the '#R$046E(semitone table)'.
  $0432 Consider the table and pass the 'A th.' value to the calculator stack. (Call it C.)
N $0438 Now the fractional part of the 'pitch' can be taken into consideration.
  $0438 t, pK+1, C
B $0439,1 #R$30CA: t, C(pK+1)
B $043A,1 #R$369B
N $043B The final frequency f is found by modifying the 'last value' according to the octave number.
  $043B Fetch the octave number.
  $043C Multiply the 'last value' by 2 to the power of the octave number.
  $043E t, f
B $043F,1 #R$342D(st_mem_0): Copy the frequency (f) to mem-0
B $0440,1 #R$33A1: t
N $0441 Attention is now turned to the 'duration'.
B $0441,1 #R$33C0
B $0441,1 #R$33C0: t, t
B $0442,1 #R$369B
  $0443 The value 'INT t' must be in the range +00 to +0A.
N $044A The number of complete cycles in the 'beep' is given by f*t so this value is now found.
  $044A t
B $044B,1 #R$340F(get_mem_0): t, f
B $044C,1 #R$30CA: f*t
N $044D The result is left on the calculator stack whilst the length of the 'timing loop' required for the 'beep' is computed;
B $044D,1 #R$340F(get_mem_0)
B $044D,1 #R$340F(get_mem_0): f*t, f
B $044E,6,1,5 #R$33C6: Stack the value (3.5*10#power6)/8=437500
B $0454,1 #R$343C: f*t, 437500, f
B $0455,1 #R$31AF: f*t, 437500/f
B $0456,3,1,2 #R$33C6: f*t, 437500/f, 30.125 (dec.)
B $0459,1 #R$300F: f*t, 437500/f-30.125
B $045A,1 #R$369B
N $045B Note: The value 437500/f gives the 'half-cycle' length of the note and reducing it by 30.125 allows for 120.5 T states in which to actually produce the note and adjust the counters etc.
N $045B The values can now be transferred to the required registers.
  $045B The 'timing loop' value is compressed into the #REGbc register pair and saved.
N $045F Note: If the timing loop value is too large then an error will occur (returning via #R$0008), thereby excluding 'pitch' values of +70 to +127.
  $045F The f*t value is compressed into the #REGbc register pair.
  $0462 Move the 'timing loop' value to the #REGhl register pair.
  $0463 Move the f*t value to the #REGde register pair.
N $0465 However before making the 'beep' test the value f*t.
  $0465 Return if f*t has given the result of 'no cycles' required.
  $0468 Decrease the cycle number and jump to #R$03B5 (making at least one pass).
N $046C Report B - integer out of range
@ $046C label=REPORT_B
M $046C,2 Call the error handling routine.
B $046D,1
@ $046E label=SEMITONES
b $046E THE 'SEMI-TONE' TABLE
D $046E This table holds the frequencies of the twelve semi-tones in an octave.
  $046E 261.63 Hz - C
  $0473 277.18 Hz - C#
  $0478 293.66 Hz - D
  $047D 311.13 Hz - D#
  $0482 329.63 Hz - E
  $0487 349.23 Hz - F
  $048C 369.99 Hz - F#
  $0491 392.00 Hz - G
  $0496 415.30 Hz - G#
  $049B 440.00 Hz - A
  $04A0 466.16 Hz - A#
  $04A5 493.88 Hz - B
@ $04AA label=PROGNAME
c $04AA THE 'PROGRAM NAME' SUBROUTINE (ZX81)
@ $04C2 nowarn
@ $04C2 label=SA_BYTES
c $04C2 THE 'SA-BYTES' SUBROUTINE
@ $04C6 keep
@ $04CD keep
@ $04D0 label=SA_FLAG
@ $04D8 label=SA_LEADER
@ $04EA label=SA_SYNC_1
@ $04F2 label=SA_SYNC_2
@ $04F6 keep
@ $04FE label=SA_LOOP
@ $0505 label=SA_LOOP_P
@ $0507 label=SA_START
@ $050E label=SA_PARITY
@ $0511 label=SA_BIT_2
@ $0514 label=SA_BIT_1
@ $051A label=SA_SET
@ $051C label=SA_OUT
@ $0525 label=SA_8_BITS
@ $053C label=SA_DELAY
@ $053F label=SA_LD_RET
c $053F THE 'SA/LD-RET' SUBROUTINE
@ $0552 label=REPORT_D
B $0553,1
@ $0554 label=SA_LD_END
@ $0556 label=LD_BYTES
c $0556 THE 'LD-BYTES' SUBROUTINE
@ $055E nowarn
@ $056B label=LD_BREAK
@ $056C label=LD_START
@ $0571 keep
@ $0574 label=LD_WAIT
@ $0580 label=LD_LEADER
@ $058F label=LD_SYNC
@ $05A9 label=LD_LOOP
@ $05B3 label=LD_FLAG
@ $05BD label=LD_VERIFY
@ $05C2 label=LD_NEXT
@ $05C4 label=LD_DEC
@ $05C8 label=LD_MARKER
@ $05CA label=LD_8_BITS
@ $05E3 label=LD_EDGE_2
c $05E3 THE 'LD-EDGE-2' AND 'LD-EDGE-1' SUBROUTINES
@ $05E7 label=LD_EDGE_1
@ $05E9 label=LD_DELAY
@ $05ED label=LD_SAMPLE
@ $0605 label=SAVE_ETC
c $0605 THE 'SAVE, LOAD, VERIFY & MERGE' COMMAND ROUTINES
D $0605 This entry point is used for all four commands. The value held in T-ADDR, however, distinguishes between the four commands. The first part of the following routine is concerned with the construction of the 'header information' in the work space.
  $0605 Drop the address - #R$1B52.
  $0606 Reduce T-ADDR-lo by +E0, giving +00 for SAVE, +01 for LOAD, +02 for VERIFY and +03 for MERGE.
  $060E Pass the parameters of the 'name' to the calculator stack.
  $0611 Jump forward if checking syntax.
@ $0616 keep
  $0616 Allow seventeen locations for the header of a SAVE but thirty four for the other commands.
@ $0621 label=SA_SPACE
  $0621 The required amount of space is made in the work space.
  $0622 Copy the start address to the #REGix register pair.
  $0625,8,2,c2,4 A program name can have up to ten characters but first enter eleven space characters into the prepared area.
@ $0629 label=SA_BLANK
  $062D A null name is +FF only.
  $0631 The parameters of the name are fetched and its length is tested.
  $0634 This is '-10'.
  $0637 In effect jump forward if the length of the name is not too long (i.e. no more than ten characters).
  $063C But allow for the LOADing, VERIFYing and MERGEing of programs with 'null' names or extra long names.
@ $0642 label=REPORT_F
N $0642 Report F - Invalid file name
M $0642,2 Call the error handling routine.
B $0643,1
@ $0644 label=SA_NULL
N $0644 Continue to handle the name of the program.
  $0644 Jump forward if the name has a 'null' length.
@ $0648 keep
  $0648 But truncate longer names.
@ $064B label=SA_NAME
N $064B The name is now transferred to the work space (second location onwards).
  $064B Copy the start address to the #REGhl register pair.
  $064E Step to the second location.
  $064F Switch the pointers over and copy the name.
@ $0652 label=SA_DATA
N $0652 The many different parameters, if any, that follow the command are now considered. Start by handling 'xxx "name" DATA'.
  $0652 Is the present code the token 'DATA'?
  $0655 Jump if not.
  $0657 However it is not possible to have 'MERGE name DATA'.
  $065F Advance CH-ADD.
  $0660 Look in the variables area for the array.
  $0663 Set bit 7 of the array's name.
  $0665 Jump if handling an existing array.
@ $0667 keep
  $0667 Signal 'using a new array'.
  $066A Consider the value in T-ADDR and give an error if trying to SAVE or VERIFY a new array.
@ $0670 label=REPORT_2
N $0670 Report 2 - Variable not found
M $0670,2 Call the error handling routine.
B $0671,1
@ $0672 label=SA_V_OLD
N $0672 Continue with the handling of an existing array.
  $0672 Note: This fails to exclude simple strings.
  $0675 Jump forward if checking syntax.
  $067A Point to the 'low length' of the variable.
  $067B The low length byte goes into the work space, followed by the high length byte.
  $0684 Step past the length bytes.
@ $0685 label=SA_V_NEW
N $0685 The next part is common to both 'old' and 'new' arrays. Note: Syntax path error.
  $0685 Copy the array's name.
  $0688 Assume an array of numbers.
  $068A Jump if it is so.
  $068E It is an array of characters.
@ $068F label=SA_V_TYPE
  $068F Save the 'type' in the first location of the header area.
@ $0692 label=SA_DATA_1
N $0692 The last part of the statement is examined before joining the other pathways.
  $0692 Save the pointer in #REGde.
  $0693,3,1,c2 Is the next character a ')'?
  $0696 Give report C if it is not.
  $0698 Advance CH-ADD.
  $0699 Move on to the next statement if checking syntax.
  $069C Return the pointer to the #REGhl register pair before jumping forward. (The pointer indicates the start of an existing array's contents.)
@ $06A0 label=SA_SCR
N $06A0 Now consider 'SCREEN$'.
  $06A0 Is the present code the token SCREEN$?
  $06A2 Jump if not.
  $06A4 However it is not possible to have 'MERGE name SCREEN$'.
  $06AC Advance CH-ADD.
  $06AD Move on to the next statement if checking syntax.
  $06B0 The display area and the attribute area occupy +1B00 locations and these locations start at +4000; these details are passed to the header area in the work space.
  $06C1 Jump forward.
@ $06C3 label=SA_CODE
N $06C3 Now consider 'CODE'.
  $06C3 Is the present code the token 'CODE'?
  $06C5 Jump if not.
  $06C7 However it is not possible to have 'MERGE name CODE'.
  $06CF Advance CH-ADD.
  $06D0 Jump forward if the statement has not finished.
  $06D5 However it is not possible to have 'SAVE name CODE' by itself.
  $06DC Put a zero on the calculator stack - for the 'start'.
  $06DF Jump forward.
@ $06E1 label=SA_CODE_1
N $06E1 Look for a 'starting address'.
  $06E1 Fetch the first number.
  $06E4,3,1,c2 Is the present character a comma?
  $06E7 Jump if it is - the number was a 'starting address'.
  $06E9 However refuse 'SAVE name CODE' that does not have a 'start' and a 'length'.
@ $06F0 label=SA_CODE_2
  $06F0 Put a zero on the calculator stack - for the 'length'.
  $06F3 Jump forward.
@ $06F5 label=SA_CODE_3
N $06F5 Fetch the 'length' as it was specified.
  $06F5 Advance CH-ADD.
  $06F6 Fetch the 'length'.
@ $06F9 label=SA_CODE_4
N $06F9 The parameters are now stored in the header area of the work space.
  $06F9 But move on to the next statement now if checking syntax.
  $06FC Compress the 'length' into the #REGbc register pair and store it.
  $0705 Compress the 'starting address' into the #REGbc register pair and store it.
  $070E Transfer the 'pointer' to the #REGhl register pair as usual.
@ $0710 label=SA_TYPE_3
N $0710 'SCREEN$' and 'CODE' are both of type 3.
  $0710 Enter the 'type' number.
  $0714 Rejoin the other pathways.
@ $0716 label=SA_LINE
N $0716 Now consider 'LINE' and 'no further parameters'.
  $0716 Is the present code the token 'LINE'?
  $0718 Jump if it is.
  $071A Move on to the next statement if checking syntax.
  $071D When there are no further parameters an +80 is entered.
  $0721 Jump forward.
@ $0723 label=SA_LINE_1
N $0723 Fetch the 'line number' that must follow 'LINE'.
  $0723 However only allow 'SAVE name LINE number'.
  $072A Advance CH-ADD.
  $072B Pass the number to the calculator stack.
  $072E Move on to the next statement if checking syntax.
  $0731 Compress the 'line number' into the #REGbc register pair and store it.
@ $073A label=SA_TYPE_0
N $073A 'LINE' and 'no further parameters' are both of type 0.
  $073A Enter the 'type' number.
N $073E The parameters that describe the program, and its variables, are found and stored in the header area of the work space.
  $073E The pointer to the end of the variables area.
  $0741 The pointer to the start of the BASIC program.
  $0745 Now perform the subtraction to find the length of the 'program + variables'; store the result.
  $074E Repeat the operation but this time storing the length of the 'program' only.
  $0759 Transfer the 'pointer' to the #REGhl register pair as usual.
@ $075A label=SA_ALL
N $075A In all cases the header information has now been prepared.
N $075A #LIST { The location 'IX+00' holds the type number. } { Locations 'IX+01 to IX+0A' hold the name (+FF in 'IX+01' if null). } { Locations 'IX+0B & IX+0C' hold the number of bytes that are to be found in the 'data block'. } { Locations 'IX+0D to IX+10' hold a variety of parameters whose exact interpretation depends on the 'type'. } LIST#
N $075A The routine continues with the first task being to separate SAVE from LOAD, VERIFY and MERGE.
  $075A Jump forward when handling a SAVE command.
N $0761 In the case of a LOAD, VERIFY or MERGE command the first seventeen bytes of the 'header area' in the work space hold the prepared information, as detailed above; and it is now time to fetch a 'header' from the tape.
  $0761 Save the 'destination' pointer.
@ $0762 keep
  $0762 Form in the #REGix register pair the base address of the 'second header area'.
@ $0767 label=LD_LOOK_H
N $0767 Now enter a loop, leaving it only when a 'header' has been LOADed.
  $0767 Make a copy of the base address.
@ $0769 keep
  $0769 LOAD seventeen bytes.
  $076C Signal 'header'.
  $076D Signal 'LOAD'.
  $076E Now look for a header.
  $0771 Retrieve the base address.
  $0773 Go round the loop until successful.
N $0775 The new 'header' is now displayed on the screen but the routine will only proceed if the 'new' header matches the 'old' header.
  $0775 Ensure that channel 'S' is open.
  $077A Set the scroll counter.
  $077E Signal 'names do not match'.
  $0780 Compare the 'new' type against the 'old' type.
  $0786 Jump if the 'types' do not match.
  $0788 But if they do, signal 'ten characters are to match'.
@ $078A label=LD_TYPE
  $078A Clearly the 'header' is nonsense if 'type 4 or more'.
@ $078E ssub=LD DE,$09C1-1
N $078E The appropriate message - 'Program:', 'Number array:', 'Character array:' or 'Bytes:' is printed.
  $078E The base address of the message block.
  $0791 Save the #REGc register whilst the appropriate message is printed.
N $0796 The 'new name' is printed and as this is done the 'old' and the 'new' names are compared.
  $0796 Make the #REGde register pair point to the 'new name' and the #REGhl register pair to the 'old name'.
  $079D Ten characters are to be considered.
  $079F Jump forward if the match is to be against an actual name.
  $07A3 But if the 'old name' is 'null' then signal 'ten characters already match'.
@ $07A6 label=LD_NAME
N $07A6 A loop is entered to print the characters of the 'new name'. The name will be accepted if the 'counter' reaches zero, at least.
  $07A6 Consider each character of the 'new name' in turn.
  $07A8 Match it against the appropriate character of the 'old name'.
  $07AA Do not count it if it does not does not match.
@ $07AD label=LD_CH_PR
  $07AD Print the 'new' character.
  $07AE Loop for ten characters.
  $07B0 Accept the name only if the counter has reached zero.
  $07B4 Follow the 'new name' with a 'carriage return'.
N $07B7 The correct header has been found and the time has come to consider the three commands LOAD, VERIFY, & MERGE separately.
  $07B7 Fetch the pointer.
  $07B8 'SCREEN$' and 'CODE' are handled with VERIFY.
  $07BF Jump forward if using a LOAD command.
  $07C6 Jump forward if using a MERGE command; continue into #R$07CB with a VERIFY command.
@ $07CB label=VR_CONTRL
c $07CB THE 'VERIFY' CONTROL ROUTINE
@ $07E9 label=VR_CONT_1
@ $07F4 label=VR_CONT_2
@ $0800 label=VR_CONT_3
@ $0802 label=LD_BLOCK
c $0802 THE 'LOAD A DATA BLOCK' SUBROUTINE
@ $0806 label=REPORT_R
B $0807,1
@ $0808 label=LD_CONTRL
c $0808 THE 'LOAD' CONTROL ROUTINE
@ $0819 label=LD_CONT_1
@ $0825 keep
@ $0825 label=LD_CONT_2
@ $082E label=LD_DATA
@ $084C label=LD_DATA_1
@ $0873 label=LD_PROG
@ $08AD label=LD_PROG_1
@ $08B6 label=ME_CONTRL
c $08B6 THE 'MERGE' CONTROL ROUTINE
@ $08D2 label=ME_NEW_LP
@ $08D7 label=ME_OLD_LP
@ $08DF label=ME_OLD_L1
@ $08EB label=ME_NEW_L2
@ $08F0 label=ME_VAR_LP
@ $08F9 label=ME_OLD_VP
@ $0901 label=ME_OLD_V1
@ $0909 label=ME_OLD_V2
@ $0912 label=ME_OLD_V3
@ $091E label=ME_OLD_V4
@ $0921 label=ME_VAR_L1
@ $0923 label=ME_VAR_L2
@ $092C label=ME_ENTER
c $092C THE 'MERGE A LINE OR A VARIABLE' SUBROUTINE
@ $093E label=ME_ENT_1
@ $0955 label=ME_ENT_2
@ $0958 label=ME_ENT_3
@ $0970 label=SA_CONTRL
c $0970 THE 'SAVE' CONTROL ROUTINE
@ $0986 keep
@ $0991 label=SA_1_SEC
@ $09A1 label=CASSETTE
t $09A1 THE CASSETTE MESSAGES
D $09A1 Each message is given with the last character inverted (+80 hex.).
  $09A1 Initial byte is stepped over.
  $09A2,31,30:B1
@ $09C1 label=BLOCK_HDR
  $09C1,10,B1:8:B1
  $09CB,15,B1:13:B1
  $09DA,18,B1:16:B1
  $09EC,8,B1:6:B1
@ $09F4 label=PRINT_OUT
c $09F4 THE 'PRINT-OUT' ROUTINES
  $09F7,c2
@ $0A04 nowarn
b $0A11 THE 'CONTROL CHARACTER' TABLE
  $0A11 PRINT comma
  $0A12 EDIT
  $0A13 Cursor left
  $0A14 Cursor right
  $0A15 Cursor down
  $0A16 Cursor up
  $0A17 DELETE
  $0A18 ENTER
  $0A19 Not used
  $0A1A Not used
  $0A1B INK control
  $0A1C PAPER control
  $0A1D FLASH control
  $0A1E BRIGHT control
  $0A1F INVERSE control
  $0A20 OVER control
  $0A21 AT control
  $0A22 TAB control
@ $0A23 label=PO_BACK_1
c $0A23 THE 'CURSOR LEFT' SUBROUTINE
@ $0A38 label=PO_BACK_2
@ $0A3A label=PO_BACK_3
@ $0A3D label=PO_RIGHT
c $0A3D THE 'CURSOR RIGHT' SUBROUTINE
  $0A45,c2
@ $0A4F label=PO_ENTER
c $0A4F THE 'CARRIAGE RETURN' SUBROUTINE
@ $0A5F label=PO_COMMA
c $0A5F THE 'PRINT COMMA' SUBROUTINE
@ $0A69 label=PO_QUEST
c $0A69 THE 'PRINT A QUESTION MARK' SUBROUTINE
  $0A69,c2
@ $0A6D nowarn
@ $0A6D label=PO_TV_2
c $0A6D THE 'CONTROL CHARACTERS WITH OPERANDS' ROUTINE
@ $0A75 nowarn
@ $0A75 label=PO_2_OPER
@ $0A7A nowarn
@ $0A7A label=PO_1_OPER
@ $0A7D label=PO_TV_1
@ $0A87 nowarn
@ $0A87 label=PO_CONT
@ $0AAC label=PO_AT_ERR
@ $0ABF label=PO_AT_SET
@ $0AC2 label=PO_TAB
@ $0AC3 label=PO_FILL
@ $0AD0 label=PO_SPACE
  $0AD0,c2
@ $0AD9 label=PO_ABLE
c $0AD9 PRINTABLE CHARACTER CODES
@ $0ADC label=PO_STORE
c $0ADC THE 'POSITION STORE' SUBROUTINE
@ $0AF0 label=PO_ST_E
@ $0AFC label=PO_ST_PR
@ $0B03 label=PO_FETCH
c $0B03 THE 'POSITION FETCH' SUBROUTINE
@ $0B1D label=PO_F_PR
@ $0B24 label=PO_ANY
c $0B24 THE 'PRINT ANY CHARACTER(S)' SUBROUTINE
@ $0B38 label=PO_GR_1
@ $0B3E label=PO_GR_2
@ $0B4C label=PO_GR_3
@ $0B52 label=PO_T_UDG
@ $0B5F label=PO_T
@ $0B65 label=PO_CHAR
@ $0B6A label=PO_CHAR_2
  $0B70,c2
@ $0B76 label=PO_CHAR_3
@ $0B7F label=PR_ALL
c $0B7F THE 'PRINT ALL CHARACTERS' SUBROUTINE
@ $0B93 label=PR_ALL_1
@ $0BA4 label=PR_ALL_2
@ $0BB6 label=PR_ALL_3
@ $0BB7 label=PR_ALL_4
@ $0BC1 label=PR_ALL_5
@ $0BDB label=PO_ATTR
c $0BDB THE 'SET ATTRIBUTE BYTE' SUBROUTINE
@ $0BFA label=PO_ATTR_1
@ $0C08 label=PO_ATTR_2
@ $0C0A label=PO_MSG
c $0C0A THE 'MESSAGE PRINTING' SUBROUTINE
@ $0C10 label=PO_TOKENS
@ $0C14 label=PO_TABLE
  $0C19,c2
@ $0C22 label=PO_EACH
@ $0C35 label=PO_TR_SP
  $0C39,c2
@ $0C3B label=PO_SAVE
c $0C3B THE 'PO-SAVE' SUBROUTINE
@ $0C41 label=PO_SEARCH
c $0C41 THE 'TABLE SEARCH' SUBROUTINE
@ $0C44 label=PO_STEP
@ $0C55 label=PO_SCR
c $0C55 THE 'TEST FOR SCROLL' SUBROUTINE
@ $0C5A nowarn
@ $0C86 label=REPORT_5
B $0C87,1
@ $0C88 label=PO_SCR_2
@ $0CA1 nowarn
@ $0CD2 label=PO_SCR_3
@ $0CF0 label=PO_SCR_3A
@ $0CF8 label=SCROLL
B $0CF8,1
T $0CF9,7,6:B1
@ $0D00 label=REPORT_D_2
B $0D01,1
@ $0D02 label=PO_SCR_4
@ $0D1C label=PO_SCR_4A
@ $0D2D label=PO_SCR_4B
@ $0D4D label=TEMPS
c $0D4D THE 'TEMPORARY COLOUR ITEMS' SUBROUTINE
@ $0D5B label=TEMPS_1
@ $0D65 label=TEMPS_2
@ $0D6B label=CLS
c $0D6B THE 'CLS COMMAND' ROUTINE
@ $0D6E label=CLS_LOWER
@ $0D87 label=CLS_1
@ $0D89 label=CLS_2
@ $0D8E label=CLS_3
@ $0D94 label=CL_CHAN
@ $0D9C nowarn
@ $0DA0 label=CL_CHAN_A
@ $0DA4 nowarn
@ $0DAA keep
@ $0DAF label=CL_ALL
c $0DAF THE 'CLEARING THE WHOLE DISPLAY AREA' SUBROUTINE
@ $0DAF keep
@ $0DCC nowarn
@ $0DD6 keep
@ $0DD9 label=CL_SET
c $0DD9 THE 'CL-SET' SUBROUTINE
@ $0DEE label=CL_SET_1
@ $0DF4 label=CL_SET_2
@ $0DFE label=CL_SC_ALL
c $0DFE THE 'SCROLLING' SUBROUTINE
@ $0E00 label=CL_SCROLL
@ $0E05 label=CL_SCR_1
@ $0E13 keep
@ $0E19 label=CL_SCR_3
@ $0E44 label=CL_LINE
c $0E44 THE 'CLEAR LINES' SUBROUTINE
@ $0E4A label=CL_LINE_1
@ $0E4D label=CL_LINE_2
@ $0E5E keep
@ $0E80 label=CL_LINE_3
@ $0E88 label=CL_ATTR
c $0E88 THE 'CL-ATTR' SUBROUTINE
@ $0E9B label=CL_ADDR
c $0E9B THE 'CL-ADDR' SUBROUTINE
@ $0EAC label=COPY
c $0EAC THE 'COPY' COMMAND ROUTINE
@ $0EB2 label=COPY_1
@ $0EC9 label=COPY_2
@ $0ECD label=COPY_BUFF
c $0ECD THE 'COPY-BUFF' SUBROUTINE
@ $0ED3 label=COPY_3
@ $0EDA label=COPY_END
@ $0EDF label=CLEAR_PRB
c $0EDF THE 'CLEAR PRINTER BUFFER' SUBROUTINE
@ $0EE7 label=PRB_BYTES
@ $0EF4 label=COPY_LINE
c $0EF4 THE 'COPY-LINE' SUBROUTINE
@ $0EFD label=COPY_L_1
B $0F0B,1
@ $0F0C label=COPY_L_2
@ $0F14 label=COPY_L_3
@ $0F18 label=COPY_L_4
@ $0F1E label=COPY_L_5
@ $0F2C label=EDITOR
c $0F2C THE 'EDITOR' ROUTINES
@ $0F30 nowarn
@ $0F30 label=ED_AGAIN
@ $0F38 label=ED_LOOP
@ $0F41 keep
@ $0F48 nowarn
@ $0F58 keep
@ $0F6C label=ED_CONTR
@ $0F81 label=ADD_CHAR
c $0F81 THE 'ADD-CHAR' SUBROUTINE
@ $0F8B label=ADD_CH_1
@ $0F92 label=ED_KEYS
@ $0F95 nowarn
b $0FA0 THE 'EDITING KEYS' TABLE
  $0FA0 EDIT
  $0FA1 Cursor left
  $0FA2 Cursor right
  $0FA3 Cursor down
  $0FA4 Cursor up
  $0FA5 DELETE
  $0FA6 ENTER
  $0FA7 SYMBOL SHIFT
  $0FA8 GRAPHICS
@ $0FA9 label=ED_EDIT
c $0FA9 THE 'EDIT KEY' SUBROUTINE
@ $0FC3 keep
@ $0FF3 label=ED_DOWN
c $0FF3 THE 'CURSOR DOWN EDITING' SUBROUTINE
@ $1001 label=ED_STOP
@ $1007 label=ED_LEFT
c $1007 THE 'CURSOR LEFT EDITING' SUBROUTINE
@ $100C label=ED_RIGHT
c $100C THE 'CURSOR RIGHT EDITING' SUBROUTINE
@ $1011 label=ED_CUR
@ $1015 label=ED_DELETE
c $1015 THE 'DELETE EDITING' SUBROUTINE
@ $1018 keep
@ $101E label=ED_IGNORE
c $101E THE 'ED-IGNORE' SUBROUTINE
@ $1024 label=ED_ENTER
c $1024 THE 'ENTER EDITING' SUBROUTINE
@ $1026 label=ED_END
@ $1031 label=ED_EDGE
c $1031 THE 'ED-EDGE' SUBROUTINE
@ $103E label=ED_EDGE_1
@ $1051 label=ED_EDGE_2
@ $1059 label=ED_UP
c $1059 THE 'CURSOR UP EDITING' SUBROUTINE
@ $106E label=ED_LIST
@ $1076 label=ED_SYMBOL
c $1076 THE 'ED-SYMBOL' SUBROUTINE
@ $107C label=ED_GRAPH
@ $107F label=ED_ERROR
c $107F THE 'ED-ERROR' SUBROUTINE
@ $1097 label=CLEAR_SP
c $1097 THE 'CLEAR-SP' SUBROUTINE
@ $10A8 label=KEY_INPUT
c $10A8 THE 'KEYBOARD INPUT' SUBROUTINE
  $10C5,c2
@ $10DB label=KEY_M_CL
@ $10E6 label=KEY_MODE
@ $10F4 label=KEY_FLAG
@ $10FA label=KEY_CONTR
@ $1105 label=KEY_DATA
@ $1108 nowarn
@ $110D label=KEY_NEXT
@ $1110 nowarn
@ $1113 label=KEY_CHAN
@ $111B label=KEY_DONE_2
@ $111D label=ED_COPY
c $111D THE 'LOWER SCREEN COPYING' SUBROUTINE
@ $1130 nowarn
@ $1150 label=ED_BLANK
@ $115E label=ED_SPACES
  $115E,c2
@ $1167 label=ED_FULL
@ $117C label=ED_C_DONE
@ $117E label=ED_C_END
@ $1190 label=SET_HL
c $1190 THE 'SET-HL' AND 'SET-DE' SUBROUTINES
@ $1195 label=SET_DE
@ $11A7 label=REMOVE_FP
c $11A7 THE 'REMOVE-FP' SUBROUTINE
@ $11AA keep
@ $11B7 label=NEW
c $11B7 THE 'NEW COMMAND' ROUTINE
@ $11CB label=START_NEW
@ $11DA label=RAM_CHECK
@ $11DC label=RAM_FILL
@ $11E2 label=RAM_READ
@ $11EF label=RAM_DONE
@ $1203 nowarn
@ $1206 keep
@ $1212 keep
@ $1219 label=RAM_SET
@ $121C ssub=LD HL,$3D00-$100
@ $123E keep
@ $1270 keep
@ $1282 keep
@ $1296 ssub=LD DE,$1539-1
@ $12A2 label=MAIN_EXEC
c $12A2 THE 'MAIN EXECUTION' LOOP
@ $12A9 label=MAIN_1
@ $12AC label=MAIN_2
@ $12CF label=MAIN_3
@ $1303 label=MAIN_4
@ $1313 label=MAIN_G
@ $1314 keep
@ $1320 keep
@ $133C label=MAIN_5
  $133F,c2
@ $134A ssub=LD DE,$1537-1
  $1357,c2
@ $1373 label=MAIN_6
@ $1376 keep
@ $1376 label=MAIN_7
@ $1384 label=MAIN_8
@ $1386 label=MAIN_9
@ $1391 label=REPORTS
t $1391 THE REPORT MESSAGES
D $1391 Each message is given with the last character inverted (+80 hex.).
  $1391 Initial byte is stepped over.
  $1392,2,1:B1
  $1394,16,15:B1
  $13A4,18,17:B1
  $13B6,15,14:B1
  $13C5,13,12:B1
  $13D2,13,12:B1
  $13DF,14,13:B1
  $13ED,20,19:B1
  $1401,11,10:B1
  $140C,14,13:B1
  $141A,16,15:B1
  $142A,20,19:B1
  $143E,17,16:B1
  $144F,20,19:B1
  $1463,11,10:B1
  $146E,17,16:B1
  $147F,16,15:B1
  $148F,13,12:B1
  $149C,16,15:B1
  $14AC,18,17:B1
  $14BE,14,13:B1
  $14CC,18,17:B1
  $14DE,14,13:B1
  $14EC,14,13:B1
  $14FA,14,13:B1
  $1508,14,13:B1
  $1516,15,14:B1
  $1525,18,17:B1
@ $1537 label=COMMA_SPC
N $1537 There are also the following two messages.
  $1537,2,1:B1
@ $1539 label=COPYRIGHT
  $1539,28,B1:26:B1
@ $1555 label=REPORT_G
c $1555 Report G - No room for line
@ $1557 keep
@ $155D label=MAIN_ADD
c $155D THE 'MAIN-ADD' SUBROUTINE
@ $1565 nowarn
@ $157D label=MAIN_ADD1
@ $15AB label=MAIN_ADD2
@ $15AF label=CHANINFO
b $15AF THE 'INITIAL CHANNEL INFORMATION'
D $15AF Initially there are four channels - 'K', 'S', 'R', & 'P' - for communicating with the 'keyboard', 'screen', 'work space' and 'printer'.  For each channel the output routine address comes before the input routine address and the channel's code.
W $15AF,4,2
  $15B3,1,T1
L $15AF,5,4
  $15C3,1 End marker
@ $15C4 label=REPORT_J
c $15C4 Report J - Invalid I/O device
B $15C5,1
@ $15C6 label=STRMDATA
b $15C6 THE 'INITIAL STREAM DATA'
D $15C6 Initially there are seven streams - +FD to +03.
  $15C6,2 Leads to channel 'K' (keyboard)
  $15C8,2 Leads to channel 'S' (screen)
  $15CA,2 Leads to channel 'R' (work space)
  $15CC,2 Leads to channel 'K' (keyboard)
  $15CE,2 Leads to channel 'K' (keyboard)
  $15D0,2 Leads to channel 'S' (screen)
  $15D2,2 Leads to channel 'P' (printer)
@ $15D4 label=WAIT_KEY
c $15D4 THE 'WAIT-KEY' SUBROUTINE
@ $15DE label=WAIT_KEY1
@ $15E4 label=REPORT_8
B $15E5,1
@ $15E6 label=INPUT_AD
c $15E6 THE 'INPUT-AD' SUBROUTINE
@ $15EF label=OUT_CODE
c $15EF THE 'MAIN PRINTING' SUBROUTINE
@ $15F2 label=PRINT_A_2
@ $15F7 label=CALL_SUB
@ $1601 label=CHAN_OPEN
c $1601 THE 'CHAN-OPEN' SUBROUTINE
@ $160E label=REPORT_O
B $160F,1
@ $1610 label=CHAN_OP_1
@ $1615 label=CHAN_FLAG
c $1615 THE 'CHAN-FLAG' SUBROUTINE
@ $162C label=CALL_JUMP
@ $162D label=CHANCODE
b $162D THE 'CHANNEL CODE LOOK-UP' TABLE
  $162D,2,T1:1 Channel 'K', offset +06 (#R$1634).
  $162F,2,T1:1 Channel 'S', offset +12 (#R$1642).
  $1631,2,T1:1 Channel 'P', offset +1B (#R$164D).
  $1633,1 End marker.
@ $1634 label=CHAN_K
c $1634 THE 'CHANNEL 'K' FLAG' SUBROUTINE
@ $1642 label=CHAN_S
c $1642 THE 'CHANNEL 'S' FLAG' SUBROUTINE
@ $1646 label=CHAN_S_1
@ $164D label=CHAN_P
c $164D THE 'CHANNEL 'P' FLAG' SUBROUTINE
@ $1652 keep
@ $1652 label=ONE_SPACE
c $1652 THE 'MAKE-ROOM' SUBROUTINE
@ $1655 label=MAKE_ROOM
@ $1664 label=POINTERS
c $1664 THE 'POINTERS' SUBROUTINE
@ $166B label=PTR_NEXT
@ $167F label=PTR_DONE
@ $168F label=LINE_ZERO
c $168F THE 'COLLECT A LINE NUMBER' SUBROUTINE
B $168F,2
@ $1691 label=LINE_NO_A
@ $1692 nowarn
@ $1695 label=LINE_NO
@ $169E label=RESERVE
c $169E THE 'RESERVE' SUBROUTINE
@ $16B0 label=SET_MIN
c $16B0 THE 'SET-MIN' SUBROUTINE
@ $16BF label=SET_WORK
@ $16C5 label=SET_STK
@ $16D4 label=REC_EDIT
c $16D4 THE 'RECLAIM THE EDIT-LINE' SUBROUTINE
@ $16DB label=INDEXER_1
c $16DB THE 'INDEXER' SUBROUTINE
@ $16DC label=INDEXER
@ $16E5 label=CLOSE
c $16E5 THE 'CLOSE #' COMMAND ROUTINE
@ $16EB keep
@ $16F5 keep
@ $16F5 ssub=LD BC,$15C6+$0E
@ $16FC label=CLOSE_1
@ $1701 label=CLOSE_2
c $1701 THE 'CLOSE-2' SUBROUTINE
@ $1716 label=CLOSESTRM
b $1716 THE 'CLOSE STREAM LOOK-UP' TABLE
  $1716,2,T1:1 Channel 'K', offset +05 (#R$171C)
  $1718,2,T1:1 Channel 'S', offset +03 (#R$171C)
  $171A,2,T1:1 Channel 'P', offset +01 (#R$171C)
E $1716 Note: There is no end marker at the end of this table.
@ $171C label=CLOSE_STR
c $171C THE 'CLOSE STREAM' SUBROUTINE
@ $171E label=STR_DATA
c $171E THE 'STREAM DATA' SUBROUTINE
@ $1725 label=REPORT_O_2
B $1726,1
@ $1727 label=STR_DATA1
@ $1736 label=OPEN
c $1736 THE 'OPEN#' COMMAND ROUTINE
B $1737,2,1
  $174A,c2
  $174E,c2
  $1752,c2
@ $1756 label=OPEN_1
@ $175D label=OPEN_2
c $175D THE 'OPEN-2' SUBROUTINE
@ $1765 label=REPORT_F_2
B $1766,1
@ $1767 label=OPEN_3
@ $177A label=OPENSTRM
b $177A THE 'OPEN STREAM LOOK-UP' TABLE
  $177A,2,T1:1 Channel 'K', offset +06 (#R$1781)
  $177C,2,T1:1 Channel 'S', offset +08 (#R$1785)
  $177E,2,T1:1 Channel 'P', offset +0A (#R$1789)
  $1780 End marker.
@ $1781 label=OPEN_K
c $1781 THE 'OPEN-K' SUBROUTINE
@ $1785 label=OPEN_S
c $1785 THE 'OPEN-S' SUBROUTINE
@ $1789 label=OPEN_P
c $1789 THE 'OPEN-P' SUBROUTINE
@ $178B label=OPEN_END
@ $1793 label=CAT_ETC
c $1793 THE 'CAT, ERASE, FORMAT & MOVE' COMMAND ROUTINES
@ $1795 label=AUTO_LIST
c $1795 THE 'LIST & LLIST' COMMAND ROUTINES
@ $17C3 keep
@ $17CE label=AUTO_L_1
@ $17E1 label=AUTO_L_2
@ $17E4 label=AUTO_L_3
@ $17ED label=AUTO_L_4
@ $17F5 label=LLIST
c $17F5 THE 'LLIST' ENTRY POINT
@ $17F9 label=LIST
c $17F9 THE 'LIST' ENTRY POINT
@ $17FB label=LIST_1
  $180C,c2
  $1810,c2
@ $1814 label=LIST_2
@ $181A label=LIST_3
@ $181F label=LIST_4
@ $1822 label=LIST_5
@ $1833 label=LIST_ALL
@ $1835 label=LIST_ALL_1
@ $1855 label=OUT_LINE
c $1855 THE 'PRINT A WHOLE BASIC LINE' SUBROUTINE
@ $1860 keep
@ $1865 label=OUT_LINE1
@ $187D label=OUT_LINE2
@ $1881 label=OUT_LINE3
@ $1894 label=OUT_LINE4
@ $18A1 label=OUT_LINE5
@ $18B4 label=OUT_LINE6
@ $18B6 label=NUMBER
c $18B6 THE 'NUMBER' SUBROUTINE
@ $18C1 label=OUT_FLASH
c $18C1 THE 'PRINT A FLASHING CHARACTER' SUBROUTINE
@ $18E1 label=OUT_CURS
c $18E1 THE 'PRINT THE CURSOR' SUBROUTINE
@ $18F3 label=OUT_C_1
  $18F8,c2
  $1907,c2
@ $1909 label=OUT_C_2
@ $190F label=LN_FETCH
c $190F THE 'LN-FETCH' SUBROUTINE
@ $191C label=LN_STORE
@ $1925 label=OUT_SP_2
c $1925 THE 'PRINTING CHARACTERS IN A BASIC LINE' SUBROUTINE
@ $192A label=OUT_SP_NO
@ $192B label=OUT_SP_1
@ $1937 label=OUT_CHAR
  $1948,c2
  $195A,c2
@ $1968 label=OUT_CH_2
@ $196C label=OUT_CH_3
@ $196E label=LINE_ADDR
c $196E THE 'LINE-ADDR' SUBROUTINE
@ $1974 label=LINE_AD_1
@ $1980 label=CP_LINES
c $1980 THE 'COMPARE LINE NUMBERS' SUBROUTINE
@ $1988 label=FIND_EACH
c $1988 THE 'FIND EACH STATEMENT' SUBROUTINE
@ $198B label=EACH_STMT
@ $1990 label=EACH_S_1
@ $1998 label=EACH_S_2
@ $199A label=EACH_S_3
  $19A0,c2
@ $19A5 label=EACH_S_4
  $19A5,c2
@ $19AD label=EACH_S_5
@ $19B1 label=EACH_S_6
@ $19B8 label=NEXT_ONE
c $19B8 THE 'NEXT-ONE' SUBROUTINE
@ $19C7 keep
@ $19C7 label=NEXT_O_1
@ $19CE label=NEXT_O_2
@ $19D5 label=NEXT_O_3
@ $19D6 label=NEXT_O_4
@ $19DB label=NEXT_O_5
@ $19DD label=DIFFER
c $19DD THE 'DIFFERENCE' SUBROUTINE
@ $19E5 label=RECLAIM_1
c $19E5 THE 'RECLAIMING' SUBROUTINE
@ $19E8 label=RECLAIM_2
@ $19FB label=E_LINE_NO
c $19FB THE 'E-LINE-NO' SUBROUTINE
@ $1A15 label=E_L_1
@ $1A1B label=OUT_NUM_1
c $1A1B THE 'REPORT AND LINE NUMBER PRINTING' SUBROUTINE
@ $1A28 label=OUT_NUM_2
@ $1A30 label=OUT_NUM_3
@ $1A42 label=OUT_NUM_4
@ $1A48 label=SYNTAX
b $1A48 THE SYNTAX TABLES
D $1A48 i. The offset table
D $1A48 There is an offset value for each of the fifty BASIC commands.
  $1A48 #R$1AF9
  $1A49 #R$1B14
  $1A4A #R$1B06
  $1A4B #R$1B0A
  $1A4C #R$1B10
  $1A4D #R$1AFC
  $1A4E #R$1B02
  $1A4F #R$1AE2
  $1A50 #R$1AE1
  $1A51 #R$1AE3
  $1A52 #R$1AE7
  $1A53 #R$1AEB
  $1A54 #R$1AEC
  $1A55 #R$1AED
  $1A56 #R$1AEE
  $1A57 #R$1AEF
  $1A58 #R$1AF0
  $1A59 #R$1AF1
  $1A5A #R$1AD9
  $1A5B #R$1ADC
  $1A5C #R$1A8A
  $1A5D #R$1AC9
  $1A5E #R$1ACC
  $1A5F #R$1ACF
  $1A60 #R$1AA8
  $1A61 #R$1AF5
  $1A62 #R$1AB8
  $1A63 #R$1AA2
  $1A64 #R$1AA5
  $1A65 #R$1A90
  $1A66 #R$1A7D
  $1A67 #R$1A86
  $1A68 #R$1A9F
  $1A69 #R$1AE0
  $1A6A #R$1AAE
  $1A6B #R$1A7A
  $1A6C #R$1AC5
  $1A6D #R$1A98
  $1A6E #R$1AB1
  $1A6F #R$1A9C
  $1A70 #R$1AC1
  $1A71 #R$1AAB
  $1A72 #R$1ADF
  $1A73 #R$1AB5
  $1A74 #R$1A81
  $1A75 #R$1ABE
  $1A76 #R$1AD2
  $1A77 #R$1ABB
  $1A78 #R$1A8D
  $1A79 #R$1AD6
N $1A7A ii. The parameter table
N $1A7A For each of the fifty BASIC commands there are up to eight entries in the parameter table. These entries comprise command class details, required separators and, where appropriate, command routine addresses.
@ $1A7A label=P_LET
  $1A7A #R$1C1F
  $1A7B,1,T1
  $1A7C #R$1C4E
@ $1A7D label=P_GO_TO
  $1A7D #R$1C82(CLASS_06)
  $1A7E #R$1C10
W $1A7F
@ $1A81 label=P_IF
  $1A81 #R$1C82(CLASS_06)
  $1A82 THEN
  $1A83 #R$1C11
W $1A84
@ $1A86 label=P_GO_SUB
  $1A86 #R$1C82(CLASS_06)
  $1A87 #R$1C10
W $1A88
@ $1A8A label=P_STOP
  $1A8A #R$1C10
W $1A8B
@ $1A8D label=P_RETURN
  $1A8D #R$1C10
W $1A8E
@ $1A90 label=P_FOR
  $1A90 #R$1C6C
  $1A91,1,T1
  $1A92 #R$1C82(CLASS_06)
  $1A93 TO
  $1A94 #R$1C82(CLASS_06)
  $1A95 #R$1C11
W $1A96
@ $1A98 label=P_NEXT
  $1A98 #R$1C6C
  $1A99 #R$1C10
W $1A9A
@ $1A9C label=P_PRINT
  $1A9C #R$1C11
W $1A9D
@ $1A9F label=P_INPUT
  $1A9F #R$1C11
W $1AA0
@ $1AA2 label=P_DIM
  $1AA2 #R$1C11
W $1AA3
@ $1AA5 label=P_REM
  $1AA5 #R$1C11
W $1AA6
@ $1AA8 label=P_NEW
  $1AA8 #R$1C10
W $1AA9
@ $1AAB label=P_RUN
  $1AAB #R$1C0D
W $1AAC
@ $1AAE label=P_LIST
  $1AAE #R$1C11
W $1AAF
@ $1AB1 label=P_POKE
  $1AB1 #R$1C7A(CLASS_08)
  $1AB2 #R$1C10
W $1AB3
@ $1AB5 label=P_RANDOM
  $1AB5 #R$1C0D
W $1AB6
@ $1AB8 label=P_CONT
  $1AB8 #R$1C10
W $1AB9
@ $1ABB label=P_CLEAR
  $1ABB #R$1C0D
W $1ABC
@ $1ABE label=P_CLS
  $1ABE #R$1C10
W $1ABF
@ $1AC1 label=P_PLOT
  $1AC1 #R$1CBE
  $1AC2 #R$1C10
W $1AC3
@ $1AC5 label=P_PAUSE
  $1AC5 #R$1C82(CLASS_06)
  $1AC6 #R$1C10
W $1AC7
@ $1AC9 label=P_READ
  $1AC9 #R$1C11
W $1ACA
@ $1ACC label=P_DATA
  $1ACC #R$1C11
W $1ACD
@ $1ACF label=P_RESTORE
  $1ACF #R$1C0D
W $1AD0
@ $1AD2 label=P_DRAW
  $1AD2 #R$1CBE
  $1AD3 #R$1C11
W $1AD4
@ $1AD6 label=P_COPY
  $1AD6 #R$1C10
W $1AD7
@ $1AD9 label=P_LPRINT
  $1AD9 #R$1C11
W $1ADA
@ $1ADC label=P_LLIST
  $1ADC #R$1C11
W $1ADD
@ $1ADF label=P_SAVE
  $1ADF #R$1CDB
@ $1AE0 label=P_LOAD
  $1AE0 #R$1CDB
@ $1AE1 label=P_VERIFY
  $1AE1 #R$1CDB
@ $1AE2 label=P_MERGE
  $1AE2 #R$1CDB
@ $1AE3 label=P_BEEP
  $1AE3 #R$1C7A(CLASS_08)
  $1AE4 #R$1C10
W $1AE5
@ $1AE7 label=P_CIRCLE
  $1AE7 #R$1CBE
  $1AE8 #R$1C11
W $1AE9
@ $1AEB label=P_INK
  $1AEB #R$1C96(CLASS_07)
@ $1AEC label=P_PAPER
  $1AEC #R$1C96(CLASS_07)
@ $1AED label=P_FLASH
  $1AED #R$1C96(CLASS_07)
@ $1AEE label=P_BRIGHT
  $1AEE #R$1C96(CLASS_07)
@ $1AEF label=P_INVERSE
  $1AEF #R$1C96(CLASS_07)
@ $1AF0 label=P_OVER
  $1AF0 #R$1C96(CLASS_07)
@ $1AF1 label=P_OUT
  $1AF1 #R$1C7A(CLASS_08)
  $1AF2 #R$1C10
W $1AF3
@ $1AF5 label=P_BORDER
  $1AF5 #R$1C82(CLASS_06)
  $1AF6 #R$1C10
W $1AF7
@ $1AF9 label=P_DEF_FN
  $1AF9 #R$1C11
W $1AFA
@ $1AFC label=P_OPEN
  $1AFC #R$1C82(CLASS_06)
  $1AFD,1,T1
  $1AFE #R$1C8C(CLASS_0A)
  $1AFF #R$1C10
W $1B00
@ $1B02 label=P_CLOSE
  $1B02 #R$1C82(CLASS_06)
  $1B03 #R$1C10
W $1B04
@ $1B06 label=P_FORMAT
  $1B06 #R$1C8C(CLASS_0A)
  $1B07 #R$1C10
W $1B08
@ $1B0A label=P_MOVE
  $1B0A #R$1C8C(CLASS_0A)
  $1B0B,1,T1
  $1B0C #R$1C8C(CLASS_0A)
  $1B0D #R$1C10
W $1B0E
@ $1B10 label=P_ERASE
  $1B10 #R$1C8C(CLASS_0A)
  $1B11 #R$1C10
W $1B12
@ $1B14 label=P_CAT
  $1B14 #R$1C10
E $1A48 Note: The requirements for the different command classes are as follows:
E $1A48 #LIST { #R$1C10 - No further operands. } { #R$1C1F - Used in LET. A variable is required. } { #R$1C4E - Used in LET. An expression, numeric or string, must follow. } { #R$1C0D - A numeric expression may follow. Zero to be used in case of default. } { #R$1C6C - A single character variable must follow. } { #R$1C11 - A set of items may be given. } { #R$1C82(CLASS_06) - A numeric expression must follow. } { #R$1C96(CLASS_07) - Handles colour items. } { #R$1C7A(CLASS_08) - Two numeric expressions, separated by a comma, must follow. } { #R$1CBE - As for CLASS_08 but colour items may precede the expressions. } { #R$1C8C(CLASS_0A) - A string expression must follow. } { #R$1CDB - Handles cassette routines. } LIST#
W $1B15
@ $1B17 label=LINE_SCAN
c $1B17 THE 'MAIN PARSER' OF THE BASIC INTERPRETER
@ $1B28 label=STMT_LOOP
c $1B28 THE STATEMENT LOOP
@ $1B29 label=STMT_L_1
  $1B39,c2
@ $1B3D nowarn
@ $1B52 label=SCAN_LOOP
@ $1B55 label=GET_PARAM
@ $1B5A nowarn
@ $1B6F label=SEPARATOR
c $1B6F THE 'SEPARATOR' SUBROUTINE
@ $1B76 label=STMT_RET
c $1B76 THE 'STMT-RET' SUBROUTINE
@ $1B7B label=REPORT_L
B $1B7C,1
@ $1B7D label=STMT_R_1
@ $1B8A label=LINE_RUN
c $1B8A THE 'LINE-RUN' ENTRY POINT
@ $1B9E label=LINE_NEW
c $1B9E THE 'LINE-NEW' SUBROUTINE
@ $1BB0 label=REPORT_0
B $1BB1,1
@ $1BB2 label=REM
c $1BB2 THE 'REM' COMMAND ROUTINE
@ $1BB3 label=LINE_END
c $1BB3 THE 'LINE-END' ROUTINE
@ $1BBF label=LINE_USE
c $1BBF THE 'LINE-USE' ROUTINE
@ $1BD1 label=NEXT_LINE
c $1BD1 THE 'NEXT-LINE' ROUTINE
@ $1BEC label=REPORT_N
B $1BED,1
@ $1BEE label=CHECK_END
c $1BEE THE 'CHECK-END' SUBROUTINE
@ $1BF4 label=STMT_NEXT
c $1BF4 THE 'STMT-NEXT' ROUTINE
  $1BF9,c2
@ $1C01 label=CMDCLASS
b $1C01 THE 'COMMAND CLASS' TABLE
  $1C01 #R$1C10
  $1C02 #R$1C1F
  $1C03 #R$1C4E
  $1C04 #R$1C0D
  $1C05 #R$1C6C
  $1C06 #R$1C11
  $1C07 #R$1C82(CLASS_06)
  $1C08 #R$1C96(CLASS_07)
  $1C09 #R$1C7A(CLASS_08)
  $1C0A #R$1CBE
  $1C0B #R$1C8C(CLASS_0A)
  $1C0C #R$1CDB
@ $1C0D label=CLASS_03
c $1C0D THE 'COMMAND CLASSES - 00, 03 & 05'
@ $1C10 label=CLASS_00
@ $1C11 label=CLASS_05
@ $1C16 label=JUMP_C_R
c $1C16 THE 'JUMP-C-R' ROUTINE
@ $1C1F label=CLASS_01
c $1C1F THE 'COMMAND CLASSES - 01, 02 & 04'
@ $1C22 label=VAR_A_1
c $1C22 THE 'VARIABLE IN ASSIGNMENT' SUBROUTINE
@ $1C2E label=REPORT_2_2
B $1C2F,1
@ $1C30 label=VAR_A_2
@ $1C46 label=VAR_A_3
@ $1C4E label=CLASS_02
@ $1C56 label=VAL_FET_1
c $1C56 THE 'FETCH A VALUE' SUBROUTINE
@ $1C59 label=VAL_FET_2
@ $1C6C label=CLASS_04
c $1C6C THE 'COMMAND CLASS 04' ROUTINE
@ $1C79 label=NEXT_2NUM
c $1C79 THE 'EXPECT NUMERIC/STRING EXPRESSIONS' SUBROUTINE
@ $1C7A label=EXPT_2NUM
  $1C7D,c2
@ $1C82 label=EXPT_1NUM
@ $1C8A label=REPORT_C
B $1C8B,1
@ $1C8C label=EXPT_EXP
@ $1C96 label=PERMS
c $1C96 THE 'SET PERMANENT COLOURS' SUBROUTINE (EQU. CLASS-07)
@ $1CBE label=CLASS_09
c $1CBE THE 'COMMAND CLASS 09' ROUTINE
@ $1CD6 label=CL_09_1
@ $1CDB label=CLASS_0B
c $1CDB THE 'COMMAND CLASS 0B' ROUTINE
@ $1CDE label=FETCH_NUM
c $1CDE THE 'FETCH A NUMBER' SUBROUTINE
  $1CE2,c2
@ $1CE6 label=USE_ZERO
B $1CEB,2,1
@ $1CEE label=STOP
c $1CEE THE 'STOP' COMMAND ROUTINE
B $1CEF,1
@ $1CF0 label=IF_CMD
c $1CF0 THE 'IF' COMMAND ROUTINE
B $1CF7,2,1
@ $1D00 label=IF_1
@ $1D03 label=FOR
c $1D03 THE 'FOR' COMMAND ROUTINE
D $1D03 This command routine is entered with the VALUE and the LIMIT of the FOR statement already on the top of the calculator stack.
  $1D03 Jump forward unless a 'STEP' is given.
  $1D07 Advance CH-ADD and fetch the value of the STEP.
  $1D0B Move on to the next statement if checking syntax; otherwise jump forward.
N $1D10 There has not been a STEP supplied so the value '1' is to be used.
@ $1D10 label=F_USE_1
  $1D10 Move on to the next statement if checking syntax
  $1D13 Otherwise use the calculator to place a '1' on the calculator stack.
B $1D14,1 #R$341B(stk_one)
B $1D15,1 #R$369B
N $1D16 The three values on the calculator stack are the VALUE (v), the LIMIT (l) and the STEP (s). These values now have to be manipulated.
@ $1D16 label=F_REORDER
  $1D16 v, l, s
B $1D17,1 #R$342D(st_mem_0): v, l, s (mem-0=s)
B $1D18,1 #R$33A1: v, l
B $1D19,1 #R$343C: l, v
B $1D1A,1 #R$340F(get_mem_0): l, v, s
B $1D1B,1 #R$343C: l, s, v
B $1D1C,1 #R$369B
N $1D1D #REGa FOR control variable is now established and treated as a temporary calculator memory area.
  $1D1D The variable is found, or created if needed (v is used).
  $1D20 Make it a 'memory area'.
N $1D23 The variable that has been found may be a simple numeric variable using only six locations in which case it will need extending.
  $1D23 Fetch the variable's single character name.
  $1D25 Ensure bit 7 of the name is set.
@ $1D27 keep
  $1D27 It will have six locations at least.
  $1D2A Make #REGhl point after them.
  $1D2B Rotate the name and jump if it was already a FOR variable.
  $1D2E Otherwise create thirteen more locations.
  $1D33 Again make #REGhl point to the LIMIT position.
N $1D34 The initial values for the LIMIT and the STEP are now added.
@ $1D34 label=F_L_S
  $1D34 The pointer is saved.
  $1D35 l, s
B $1D36,1 #R$33A1: l
B $1D37,1 #R$33A1: -
B $1D38,1 #R$369B: #REGde still points to 'l'
  $1D39 The pointer is restored and both pointers exchanged.
  $1D3B The ten bytes of the LIMIT and the STEP are moved.
N $1D3F The looping line number and statement number are now entered.
  $1D3F The current line number.
  $1D42 Exchange the registers before adding the line number to the FOR control variable.
  $1D46 The looping statement is always the next statement whether it exists or not.
N $1D4C The #R$1DDA subroutine is called to test the possibility of a 'pass' and a return is made if one is possible; otherwise the statement after for FOR - NEXT loop has to be identified.
  $1D4C Is a 'pass' possible?
  $1D4F Return now if it is.
  $1D50 Fetch the variable's name.
  $1D53 Copy the present line number to NEWPPC.
  $1D59 Fetch the current statement number and two's complement it.
  $1D5E Transfer the result to the #REGd register.
  $1D5F Fetch the current value of CH-ADD.
  $1D62 The search will be for 'NEXT'.
N $1D64 Now a search is made in the program area, from the present point onwards, for the first occurrence of NEXT followed by the correct variable.
@ $1D64 label=F_LOOP
  $1D64 Save the variable's name.
  $1D65 Fetch the current value of NXTLIN.
  $1D69 The program area is now searched and #REGbc will change with each new line examined.
  $1D6C Upon return save the pointer.
  $1D70 Restore the variable's name.
  $1D71 If there are no further NEXTs then give an error.
  $1D73 Advance past the NEXT that was found.
  $1D74 Allow for upper and lower case letters before the new variable name is tested.
  $1D77 Jump forward if it matches.
  $1D79 Advance CH-ADD again and jump back if not the correct variable.
N $1D7C NEWPPC holds the line number of the line in which the correct NEXT was found. Now the statement number has to be found and stored in NSPPC.
@ $1D7C label=F_FOUND
  $1D7C Advance CH-ADD.
  $1D7D The statement counter in the #REGd register counted statements back from zero so it has to be subtracted from '1'.
  $1D80 The result is stored.
  $1D83 Now return - to #R$1B76.
N $1D84 REPORT I - FOR without NEXT
@ $1D84 label=REPORT_I
M $1D84,2 Call the error handling routine.
B $1D85,1
@ $1D86 label=LOOK_PROG
c $1D86 THE 'LOOK-PROG' SUBROUTINE
  $1D87,c2
@ $1D8B label=LOOK_P_1
@ $1DA3 label=LOOK_P_2
@ $1DAB label=NEXT
c $1DAB THE 'NEXT' COMMAND ROUTINE
B $1DBE,6,1
@ $1DCB keep
@ $1DD8 label=REPORT_1
B $1DD9,1
@ $1DDA label=NEXT_LOOP
c $1DDA THE 'NEXT-LOOP' SUBROUTINE
D $1DDA This subroutine is used to determine whether the LIMIT (l) has been exceeded by the present VALUE (v). Note has to be taken of the sign of the STEP (s).
D $1DDA The subroutine returns the carry flag set if the LIMIT is exceeded.
  $1DDA -
B $1DDB,1 #R$340F(get_mem_1): l
B $1DDC,1 #R$340F(get_mem_0): l, v
B $1DDD,1 #R$340F(get_mem_2): l, v, s
B $1DDE,1 #R$3506: l, v,( 1/0)
B $1DDF,2,1 #R$368F to #R$1DE2: l, v, (1/0)
B $1DE1,1 #R$343C: v, l
@ $1DE2 label=NEXT_1
B $1DE2,1 #R$300F: v-l or l-v
B $1DE3,1 #R$34F9: (1/0)
B $1DE4,2,1 #R$368F to #R$1DE9: (1/0)
B $1DE6,1 #R$369B: -
  $1DE7 Clear the carry flag and return - loop is possible.
N $1DE9 However if the loop is impossible the carry flag has to be set.
@ $1DE9 label=NEXT_2
B $1DE9,1 #R$369B: -
  $1DEA Set the carry flag and return.
@ $1DEC label=READ_3
c $1DEC THE 'READ' COMMAND ROUTINE
@ $1DED label=READ
  $1DFD,c2
@ $1E08 label=REPORT_E
B $1E09,1
@ $1E0A label=READ_1
@ $1E1E label=READ_2
  $1E1F,c2
@ $1E27 label=DATA
c $1E27 THE 'DATA' COMMAND ROUTINE
@ $1E2C label=DATA_1
  $1E2F,c2
@ $1E37 label=DATA_2
@ $1E39 label=PASS_BY
c $1E39 THE 'PASS-BY' SUBROUTINE
@ $1E3C keep
@ $1E42 label=RESTORE
c $1E42 THE 'RESTORE' COMMAND ROUTINE
@ $1E45 label=REST_RUN
@ $1E4F label=RANDOMIZE
c $1E4F THE 'RANDOMIZE' COMMAND ROUTINE
@ $1E5A label=RAND_1
@ $1E5F label=CONTINUE
c $1E5F THE 'CONTINUE' COMMAND ROUTINE
@ $1E67 label=GO_TO
c $1E67 THE 'GO TO' COMMAND ROUTINE
@ $1E73 label=GO_TO_2
@ $1E7A label=OUT_CMD
c $1E7A THE 'OUT' COMMAND ROUTINE
@ $1E80 label=POKE
c $1E80 THE 'POKE' COMMAND ROUTINE
@ $1E85 label=TWO_PARAM
c $1E85 THE 'TWO-PARAM' SUBROUTINE
@ $1E8E label=TWO_P_1
@ $1E94 label=FIND_INT1
c $1E94 THE 'FIND INTEGERS' SUBROUTINE
@ $1E99 label=FIND_INT2
@ $1E9C label=FIND_I_1
@ $1E9F label=REPORT_B_2
B $1EA0,1
@ $1EA1 label=RUN
c $1EA1 THE 'RUN' COMMAND ROUTINE
@ $1EA4 keep
@ $1EAC label=CLEAR
c $1EAC THE 'CLEAR' COMMAND ROUTINE
@ $1EAF label=CLEAR_RUN
@ $1EB7 label=CLEAR_1
@ $1EC9 keep
@ $1EDA label=REPORT_M
B $1EDB,1
@ $1EDC label=CLEAR_2
@ $1EED label=GO_SUB
c $1EED THE 'GO SUB' COMMAND ROUTINE
@ $1F02 keep
@ $1F05 label=TEST_ROOM
c $1F05 THE 'TEST-ROOM' SUBROUTINE
@ $1F0C keep
@ $1F15 label=REPORT_4
@ $1F1A label=FREE_MEM
c $1F1A THE 'FREE MEMORY' SUBROUTINE
@ $1F1A keep
@ $1F23 label=RETURN
c $1F23 THE 'RETURN' COMMAND ROUTINE
@ $1F36 label=REPORT_7
B $1F39,1
@ $1F3A label=PAUSE
c $1F3A THE 'PAUSE' COMMAND ROUTINE
@ $1F3D label=PAUSE_1
@ $1F49 label=PAUSE_2
@ $1F4F label=PAUSE_END
@ $1F54 label=BREAK_KEY
c $1F54 THE 'BREAK-KEY' SUBROUTINE
@ $1F60 label=DEF_FN
c $1F60 THE 'DEF FN' COMMAND ROUTINE
@ $1F6A label=DEF_FN_1
  $1F74,c2
@ $1F7D label=DEF_FN_2
  $1F7D,c2
  $1F82,c2
@ $1F86 label=DEF_FN_3
@ $1F89 label=DEF_FN_4
  $1F8E,c2
@ $1F94 label=DEF_FN_5
@ $1F95 keep
  $1F9F,c2
@ $1FA6 label=DEF_FN_6
  $1FA6,c2
  $1FAB,c2
@ $1FBD label=DEF_FN_7
@ $1FC3 label=UNSTACK_Z
c $1FC3 THE 'UNSTACK-Z' SUBROUTINE
@ $1FC9 label=LPRINT
c $1FC9 THE 'LPRINT & PRINT' COMMAND ROUTINES
@ $1FCD label=PRINT
@ $1FCF label=PRINT_1
@ $1FDF label=PRINT_2
@ $1FE5 label=PRINT_3
@ $1FF2 label=PRINT_4
  $1FF2,c2
@ $1FF5 label=PRINT_CR
c $1FF5 THE 'PRINT A CARRIAGE RETURN' SUBROUTINE
@ $1FFC label=PR_ITEM_1
c $1FFC THE 'PRINT ITEMS' SUBROUTINE
@ $200E label=PR_ITEM_2
@ $201E label=PR_AT_TAB
@ $2024 label=PR_ITEM_3
@ $203C label=PR_STRING
@ $2045 label=PR_END_Z
c $2045 THE 'END OF PRINTING' SUBROUTINE
  $2045,c2
@ $2048 label=PR_ST_END
  $204B,c2
@ $204E label=PR_POSN_1
c $204E THE 'PRINT POSITION' SUBROUTINE
  $204F,c2
  $2053,c2
@ $2061 label=PR_POSN_2
  $2061,c2
@ $2067 label=PR_POSN_3
@ $206E label=PR_POSN_4
@ $2070 label=STR_ALTER
c $2070 THE 'ALTER STREAM' SUBROUTINE
  $2070,c2
@ $2089 label=INPUT
c $2089 THE 'INPUT' COMMAND ROUTINE
D $2089 This routine allows for values entered from the keyboard to be assigned to variables. It is also possible to have print items embedded in the INPUT statement and these items are printed in the lower part of the display.
  $2089 Jump forward if syntax is being checked.
  $208E Open channel 'K'.
  $2093 The lower part of the display is cleared.
@ $2096 label=INPUT_1
  $2096 Signal that the lower screen is being handled. Reset all other bits.
  $209A Call the subroutine to deal with the INPUT items.
  $209D Move on to the next statement if checking syntax.
  $20A0 Fetch the current print position.
  $20A4 Jump forward if the current position is above the lower screen.
  $20AA Otherwise set the print position to the top of the lower screen.
@ $20AD label=INPUT_2
  $20AD Reset S-POSN.
  $20B1 Now set the scroll counter.
  $20B7 Signal 'main screen'.
  $20BB Set the system variables and exit via #R$0D6E.
N $20C1 The INPUT items and embedded PRINT items are dealt with in turn by the following loop.
@ $20C1 label=IN_ITEM_1
  $20C1 Consider first any position control characters.
  $20C6,4,c2,2 Jump forward if the present character is not a '('.
  $20CA Fetch the next character.
  $20CB Now call the PRINT command routine to handle the items inside the brackets.
  $20CE Fetch the present character.
  $20CF,5,c2,3 Give report C unless the character is a ')'.
  $20D4 Fetch the next character and jump forward to see if there are any further INPUT items.
N $20D8 Now consider whether INPUT LINE is being used.
@ $20D8 label=IN_ITEM_2
  $20D8 Jump forward if it is not 'LINE'.
  $20DC Advance CH-ADD.
  $20DD Determine the destination address for the variable.
  $20E0 Signal 'using INPUT LINE'.
  $20E4 Give report C unless using a string variable.
  $20EB Jump forward to issue the prompt message.
N $20ED Proceed to handle simple INPUT variables.
@ $20ED label=IN_ITEM_3
  $20ED Jump to consider going round the loop again if the present character is not a letter.
  $20F3 Determine the destination address for the variable.
  $20F6 Signal 'not INPUT LINE'.
N $20FA The prompt message is now built up in the work space.
@ $20FA label=IN_PROMPT
  $20FA Jump forward if only checking syntax.
  $2100 The work space is set to null.
  $2103 This is FLAGX.
  $2106 Signal 'string result'.
  $2108 Signal 'INPUT mode'.
@ $210A keep
  $210A Allow the prompt message only a single location.
  $210D Jump forward if using 'LINE'.
  $2111 Jump forward if awaiting a numeric entry.
  $2118 A string entry will need three locations.
@ $211A label=IN_PR_1
  $211A Bit 6 of FLAGX will become set for a numeric entry.
@ $211C label=IN_PR_2
  $211C The required number of locations is made available.
  $211D A 'carriage return' goes into the last location.
  $211F Test bit 6 of the #REGc register and jump forward if only one location was required.
  $2124,5,c2,3 A 'double quotes' character goes into the first and second locations.
@ $2129 label=IN_PR_3
  $2129 The position of the cursor can now be saved.
N $212C In the case of INPUT LINE the EDITOR can be called without further preparation but for other types of INPUT the error stack has to be changed so as to trap errors.
  $212C Jump forward with 'INPUT LINE'.
  $2132 Save the current values of CH-ADD and ERR-SP on the machine stack.
@ $213A nowarn
@ $213A label=IN_VAR_1
  $213A This will be the 'return point' in case of errors.
  $213E Only change the error stack pointer if using channel 'K'.
@ $2148 label=IN_VAR_2
  $2148 Set #REGhl to the start of the INPUT line and remove any floating-point forms. (There will not be any except perhaps after an error.)
  $214E Signal 'no error yet'.
  $2152 Now get the INPUT and with the syntax/run flag indicating syntax, check the INPUT for errors; jump if in order; return to IN-VAR-1 if not.
@ $215E label=IN_VAR_3
  $215E Get a 'LINE'.
N $2161 All the system variables have to be reset before the actual assignment of a value can be made.
@ $2161 label=IN_VAR_4
  $2161 The cursor address is reset.
  $2165 The jump is taken if using other than channel 'K'.
  $216A The input-line is copied to the display and the position in ECHO-E made the current position in the lower screen.
@ $2174 label=IN_VAR_5
  $2174 This is FLAGX.
  $2177 Signal 'edit mode'.
  $2179 Jump forward if handling an INPUT LINE.
  $217F Drop the address IN-VAR-1.
  $2180 Reset the ERR-SP to its original address.
  $2184 Save the original CH-ADD address in X-PTR.
  $2188 Now with the syntax/run flag indicating 'run' make the assignment.
  $218F Restore the original address to CH-ADD and clear X-PTR.
  $2199 Jump forward to see if there are further INPUT items.
@ $219B label=IN_VAR_6
  $219B The length of the 'LINE' in the work space is found.
  $21A5 #REGde points to the start and #REGbc holds the length.
  $21A7 These parameters are stacked and the actual assignment made.
  $21AD Also jump forward to consider further items.
N $21AF Further items in the INPUT statement are considered.
@ $21AF label=IN_NEXT_1
  $21AF Handle any print items.
@ $21B2 label=IN_NEXT_2
  $21B2 Handle any position controllers.
  $21B5 Go around the loop again if there are further items; otherwise return.
@ $21B9 label=IN_ASSIGN
c $21B9 THE 'IN-ASSIGN' SUBROUTINE
@ $21CE label=REPORT_C_2
B $21CF,1
@ $21D0 label=IN_STOP
@ $21D4 label=REPORT_H
B $21D5,1
@ $21D6 label=IN_CHAN_K
c $21D6 THE 'IN-CHAN-K' SUBROUTINE
  $21DE,c2
@ $21E1 label=CO_TEMP_1
c $21E1 THE 'COLOUR ITEM' ROUTINES
@ $21E2 label=CO_TEMP_2
  $21E7,c2
  $21EB,c2
@ $21F2 label=CO_TEMP_3
@ $21FC label=CO_TEMP_4
@ $2211 label=CO_TEMP_5
@ $2228 label=CO_TEMP_6
@ $2234 label=CO_TEMP_7
@ $223E label=CO_TEMP_8
@ $2244 label=REPORT_K
B $2245,1
@ $2246 label=CO_TEMP_9
@ $2257 label=CO_TEMP_A
@ $2258 label=CO_TEMP_B
@ $226C label=CO_CHANGE
c $226C THE 'CO-CHANGE' SUBROUTINE
@ $227D label=CO_TEMP_D
@ $2287 label=CO_TEMP_E
@ $2294 label=BORDER
c $2294 THE 'BORDER' COMMAND ROUTINE
@ $22A6 label=BORDER_1
@ $22AA label=PIXEL_ADD
c $22AA THE 'PIXEL ADDRESS' SUBROUTINE
@ $22CB label=POINT_SUB
c $22CB THE 'POINT' SUBROUTINE
@ $22D4 label=POINT_LP
@ $22DC label=PLOT
c $22DC THE 'PLOT' COMMAND ROUTINE
@ $22E5 label=PLOT_SUB
@ $22F0 label=PLOT_LOOP
@ $22FD label=PL_TST_IN
@ $2303 label=PLOT_END
@ $2307 label=STK_TO_BC
c $2307 THE 'STK-TO-BC' SUBROUTINE
@ $2314 label=STK_TO_A
c $2314 THE 'STK-TO-A' SUBROUTINE
@ $2320 label=CIRCLE
c $2320 THE 'CIRCLE' COMMAND ROUTINE
D $2320 This routine draws an approximation to the circle with centre co-ordinates X and Y and radius Z. These numbers are rounded to the nearest integer before use. Thus Z must be less than 87.5, even when (X,Y) is in the centre of the screen. The method used is to draw a series of arcs approximated by straight lines.
D $2320 CIRCLE has four parts:
D $2320 #LIST { i. Tests the radius. If its modulus is less than 1, just plot X,Y. } { ii. Calls #R$247D, which is used to set the initial parameters for both CIRCLE and DRAW. } { iii. Sets up the remaining parameters for CIRCLE, including the initial displacement for the first 'arc' (a straight line in fact). } { iv. Jumps to #R$2420 to use the arc-drawing loop. } LIST#
D $2320 Parts i. to iii. will now be explained in turn.
D $2320 i. The radius, say Z', is obtained from the calculator stack. Its modulus Z is formed and used from now on. If Z is less than 1, it is deleted from the stack and the point X,Y is plotted by a jump to PLOT.
  $2320 Get the present character.
  $2321,c2 Test for comma.
  $2323 If not so, report the error.
  $2326 Get next character (the radius).
  $2327 Radius to calculator stack.
  $232A Move to consider next statement if checking syntax.
  $232D Use calculator.
B $232E,1 #R$346A: X, Y, Z
B $232F,1 #R$3297: Z is re-stacked; its exponent is therefore available.
B $2330,1 #R$369B
  $2331 Get exponent of radius.
  $2332 Test whether radius less than 1.
  $2334 If not, jump.
  $2336 If less, delete it from the stack.
B $2337,1 #R$33A1: X, Y
B $2338,1 #R$369B
  $2339 Just plot the point X, Y.
N $233B ii. 2#pi is stored in mem-5 and #R$247D is called. This subroutine stores in the #REGb register the number of arcs required for the circle, viz. A=4*INT (#pi*SQR Z/4)+4, hence 4, 8, 12, etc., up to a maximum of 32. It also stores in mem-0 to mem-4 the quantities 2#pi/A, SIN(#pi/A), 0, COS (2#pi/A) and SIN (2#pi/A).
@ $233B label=C_R_GRE_1
B $233C,1 #R$341B(stk_pi_2): X, Y, Z, #pi/2
B $233D,1 #R$369B
  $233E Now increase exponent to 83 hex, changing #pi/2 into 2#pi.
  $2340 X, Y, Z, 2#pi.
B $2341,1 #R$342D(st_mem_5): (2#pi is copied to mem-5)
B $2342,1 #R$33A1: X, Y, Z
B $2343,1 #R$369B
  $2344 Set the initial parameters.
N $2347 iii. A test is made to see whether the initial 'arc' length is less than 1. If it is, a jump is made simply to plot X, Y. Otherwise, the parameters are set: X+Z and X-Z*SIN (#pi/A) are stacked twice as start and end point, and copied to COORDS as well; zero and 2*Z*SIN (#pi/A) are stored in mem-1 and mem-2 as initial increments, giving as first 'arc' the vertical straight line joining X+Z, y-Z*SIN (#pi/A) and X+Z, Y+Z*SIN (#pi/A). The arc-drawing loop at #R$2420 will ensure that all subsequent points remain on the same circle as these two points, with incremental angle 2#pi/A. But it is clear that these 2 points in fact subtend this angle at the point X+Z*(1-COS (#pi/A)), Y not at X, Y. Hence the end points of each arc of the circle are displaced right by an amount 2*(1-COS (#pi/A)), which is less than half a pixel, and rounds to one pixel at most.
@ $2347 label=C_ARC_GE1
  $2347 Save the arc-count in #REGb.
  $2348 X, Y, Z
B $2349,1 #R$33C0: X, Y, Z, Z
B $234A,1 #R$340F(get_mem_1): X, Y, Z, Z, SIN (#pi/A)
B $234B,1 #R$30CA: X, Y, Z, Z*SIN (#pi/A)
B $234C,1 #R$369B
  $234D Z*SIN (#pi/A) is half the initial 'arc' length; it is tested to see whether it is less than 0.5.
  $2350 If not, the jump is made.
  $2352
B $2353,1 #R$33A1: X, Y, Z
B $2354,1 #R$33A1: X, Y
B $2355,1 #R$369B
  $2356 Clear the machine stack.
  $2357 Jump to plot X, Y.
  $235A X, Y, Z, Z*SIN (#pi/A)
B $235B,1 #R$342D(st_mem_2): (Z*SIN (#pi/A) to mem-2 for now)
B $235C,1 #R$343C: X, Y, Z*SIN (#pi/A), Z
B $235D,1 #R$342D(st_mem_0): X, Y, Z*SIN (#pi/A), Z (Z is copied to mem-0)
B $235E,1 #R$33A1: X, Y, Z*SIN (#pi/A)
B $235F,1 #R$300F: X, Y-Z*SIN (#pi/A)
B $2360,1 #R$343C: Y-Z*SIN (#pi/A), X
B $2361,1 #R$340F(get_mem_0): Y-Z*SIN (#pi/A), X, Z
B $2362,1 #R$3014: Y-Z*SIN (#pi/A), X+Z
B $2363,1 #R$342D(st_mem_0): (X+Z is copied to mem-0)
B $2364,1 #R$343C: X+Z, Y-Z*SIN (#pi/A)
B $2365,1 #R$33C0: X+Z, Y-Z*SIN (#pi/A), Y-Z*SIN (#pi/A)
B $2366,1 #R$340F(get_mem_0): sa, sb, sb, sa
B $2367,1 #R$343C: sa, sb, sa, sb
B $2368,1 #R$33C0: sa, sb, sa, sb, sb
B $2369,1 #R$340F(get_mem_0): sa, sb, sa, sb, sb, sa
B $236A,1 #R$341B(stk_zero): sa, sb, sa, sb, sb, sa, 0
B $236B,1 #R$342D(st_mem_1): (mem-1 is set to zero)
B $236C,1 #R$33A1: sa, sb, sa, sb, sb, sa
B $236D,1 #R$369B
N $236E (Here sa denotes X+Z and sb denotes Y-Z*SIN (#pi/A).)
  $236E Incrementing the exponent byte of mem-2 sets mem-2 to 2*Z*SIN(#pi/A).
  $2371 The last value X+Z is moved from the stack to #REGa and copied to #REGl.
  $2375 It is saved in #REGhl.
  $2376 Y-Z*SIN (#pi/A) goes from the stack to #REGa and is copied to #REGh. #REGhl now holds the initial point.
  $237B It is copied to COORDS.
  $237E The arc-count is restored.
  $237F The jump is made to #R$2420.
E $2320 (The stack now holds X+Z, Y-Z*SIN (#pi/A), Y-Z*SIN (#pi/A), X+Z.)
@ $2382 label=DRAW
c $2382 THE 'DRAW' COMMAND ROUTINE
D $2382 This routine is entered with the co-ordinates of a point X0, Y0, say, in COORDS. If only two parameters X, Y are given with the DRAW command, it draws an approximation to a straight line from the point X0, Y0 to X0+X, Y0+Y. If a third parameter G is given, it draws an approximation to a circular arc from X0, Y0 to X0+X, Y0+Y turning anti-clockwise through an angle G radians.
D $2382 The routine has four parts:
D $2382 #LIST { i. Just draws a line if only 2 parameters are given or if the diameter of the implied circle is less than 1. } { ii. Calls #R$247D to set the first parameters. } { iii. Sets up the remaining parameters, including the initial displacements for the first arc. } { iv. Enters the arc-drawing loop and draws the arc as a series of smaller arcs approximated by straight lines, calling the line-drawing subroutine at #R$24B7 as necessary. } LIST#
D $2382 Two subroutines, #R$247D and #R$24B7, follow the main routine. The above 4 parts of the main routine will now be treated in turn.
D $2382 i. If there are only 2 parameters, a jump is made to #R$2477. A line is also drawn if the quantity Z=(ABS X + ABS Y)/ABS SIN(G/2) is less than 1. Z lies between 1 and 1.5 times the diameter of the implied circle. In this section mem-0 is set to SIN (G/2), mem-1 to Y, and mem-5 to G.
  $2382 Get the current character.
  $2383,4,c2,2 If it is a comma, then jump.
  $2387 Move on to next statement if checking syntax.
  $238A Jump to just draw the line.
@ $238D label=DR_3_PRMS
  $238D Get next character (the angle).
  $238E Angle to calculator stack.
  $2391 Move on to next statement if checking syntax.
  $2394 X, Y, G are on the stack.
B $2395,1 #R$342D(st_mem_5): (G is copied to mem-5)
B $2396,1 #R$341B(stk_half): X, Y, G, 0.5
B $2397,1 #R$30CA: X, Y, G/2
B $2398,1 #R$37B5: X, Y, SIN (G/2)
B $2399,1 #R$33C0: X, Y, SIN (G/2), SIN (G/2)
B $239A,1 #R$3501: X, Y, SIN (G/2), (0/1)
B $239B,1 #R$3501: X, Y, SIN (G/2), (1/0)
B $239C,1 #R$368F: X, Y, SIN (G/2)
B $239D,1 to #R$23A3 (if SIN (G/2)=0 i.e. G=2#piN just draw a straight line).
B $239E,1 #R$33A1: X, Y
B $239F,1 #R$369B
  $23A0 Line X0, Y0 to X0+X, Y0+Y.
@ $23A3 label=DR_SIN_NZ
B $23A3,1 #R$342D(st_mem_0): (SIN (G/2) is copied to mem-0)
B $23A4,1 #R$33A1: X, Y are now on the stack.
B $23A5,1 #R$342D(st_mem_1): (Y is copied to mem-1).
B $23A6,1 #R$33A1: X
B $23A7,1 #R$33C0: X, X
B $23A8,1 #R$346A: X, X' (X'=ABS X)
B $23A9,1 #R$340F(get_mem_1): X, X', Y
B $23AA,1 #R$343C: X, Y, X'
B $23AB,1 #R$340F(get_mem_1): X, Y, X', Y
B $23AC,1 #R$346A: X, Y, X', Y' (Y'=ABS Y)
B $23AD,1 #R$3014: X, Y, X'+Y'
B $23AE,1 #R$340F(get_mem_0): X, Y, X'+Y', SIN (G/2)
B $23AF,1 #R$31AF: X, Y, (X'+Y')/SIN (G/2)=Z', say
B $23B0,1 #R$346A: X, Y, Z (Z=ABS Z')
B $23B1,1 #R$340F(get_mem_0): X, Y, Z, SIN (G/2)
B $23B2,1 #R$343C: X, Y, SIN (G/2), Z
B $23B3,1 #R$3297: (Z is re-stacked to make sure that its exponent is available).
B $23B4,1 #R$369B
  $23B5 Get exponent of Z.
  $23B6 If Z is greater than or equal to 1, jump.
  $23BA X, Y, SIN (G/2), Z
B $23BB,1 #R$33A1: X, Y, SIN (G/2)
B $23BC,1 #R$33A1: X, Y
B $23BD,1 #R$369B
  $23BE Just draw the line from X0, Y0 to X0+X, Y0+Y.
N $23C1 ii. Just calls #R$247D. This subroutine saves in the #REGb register the number of shorter arcs required for the complete arc, viz. A=4*INT (G'*SQR Z/8)+4, where G' = mod G, or 252 if this expression exceeds 252 (as can happen with a large chord and a small angle). So A is 4, 8, 12, ... , up to 252. The subroutine also stores in mem-0 to mem-4 the quantities G/A, SIN (G/2*A), 0, COS (G/A), SIN (G/A).
@ $23C1 label=DR_PRMS
  $23C1 The subroutine is called.
N $23C4 iii. Sets up the rest of the parameters as follow. The stack will hold these 4 items, reading up to the top: X0+X and Y0+Y as end of last arc; then X0 and Y0 as beginning of first arc. Mem-0 will hold X0 and mem-5 Y0. Mem-1 and mem-2 will hold the initial displacements for the first arc, U and V; and mem-3 and mem-4 will hold COS (G/A) and SIN (G/A) for use in the arc-drawing loop.
N $23C4 The formulae for U and V can be explained as follows. Instead of stepping along the final chord, of length L, say, with displacements X and Y, we want to step along an initial chord (which may be longer) of length L*W, where W=SIN (G/2*A)/SIN (G/2), with displacements X*W and Y*W, but turned through an angle - (G/2 - G/2*A), hence with true displacements:
N $23C4 #LIST { U = Y*W*SIN (G/2 - G/2*A) + X*W*COS (G/2 - G/2*A) } { Y = Y*W*COS (G/2 - G/2*A) - X*W*SIN (G/2 - G/2*A) } LIST#
N $23C4 These formulae can be checked from a diagram, using the normal expansion of COS (P - Q) and SIN (P - Q), where Q = G/2 - G/2*A.
  $23C4 Save the arc-counter in #REGb.
  $23C5 X, Y, SIN(G/2), Z
B $23C6,1 #R$33A1: X, Y, SIN(G/2)
B $23C7,1 #R$340F(get_mem_1): X, Y, SIN(G/2), SIN(G/2*A)
B $23C8,1 #R$343C: X, Y, SIN(G/2*A), SIN(G/2)
B $23C9,1 #R$31AF: X, Y, SIN(G/2*A)/SIN(G/2)=W
B $23CA,1 #R$342D(st_mem_1): (W is copied to mem-1).
B $23CB,1 #R$33A1: X, Y
B $23CC,1 #R$343C: Y, X
B $23CD,1 #R$33C0: Y, X, X
B $23CE,1 #R$340F(get_mem_1): Y, X, X, W
B $23CF,1 #R$30CA: Y, X, X*W
B $23D0,1 #R$342D(st_mem_2): (X*W is copied to mem-2).
B $23D1,1 #R$33A1: Y, X
B $23D2,1 #R$343C: X, Y
B $23D3,1 #R$33C0: X, Y, Y
B $23D4,1 #R$340F(get_mem_1): X, Y, Y, W
B $23D5,1 #R$30CA: X, Y, Y*W
B $23D6,1 #R$340F(get_mem_2): X, Y, Y*W, X*W
B $23D7,1 #R$340F(get_mem_5): X, Y, Y*W, X*W,G
B $23D8,1 #R$340F(get_mem_0): X, Y, Y*W, X*W, G, G/A
B $23D9,1 #R$300F: X, Y, Y*W, X*W, G-G/A
B $23DA,1 #R$341B(stk_half): X, Y, Y*W, X*W, G-G/A, 1/2
B $23DB,1 #R$30CA: X, Y, Y*W, X*W, G/2-G/2*A=F
B $23DC,1 #R$33C0: X, Y, Y*W, X*W, F, F
B $23DD,1 #R$37B5: X, Y, Y*W, X*W, F, SIN F
B $23DE,1 #R$342D(st_mem_5): (SIN F is copied to mem-5).
B $23DF,1 #R$33A1: X, Y, Y*W, X*W,F
B $23E0,1 #R$37AA: X, Y, Y*W, X*W, COS F
B $23E1,1 #R$342D(st_mem_0): (COS F is copied to mem-0).
B $23E2,1 #R$33A1: X, Y, Y*W, X*W
B $23E3,1 #R$342D(st_mem_2): (X*W is copied to mem-2).
B $23E4,1 #R$33A1: X, Y, Y*W
B $23E5,1 #R$342D(st_mem_1): (Y*W is copied to mem-1).
B $23E6,1 #R$340F(get_mem_5): X, Y, Y*W, SIN F
B $23E7,1 #R$30CA: X, Y, Y*W*SIN F
B $23E8,1 #R$340F(get_mem_0): X, Y, Y*W*SIN F, X*W
B $23E9,1 #R$340F(get_mem_2): X, Y, Y*W*SIN F, X*W, COS F
B $23EA,1 #R$30CA: X, Y, Y*W*SIN F, X*W*COS F
B $23EB,1 #R$3014: X, Y, Y*W*SIN F+X*W*COS F=U
B $23EC,1 #R$340F(get_mem_1): X, Y, U, Y*W
B $23ED,1 #R$343C: X, Y, Y*W, U
B $23EE,1 #R$342D(st_mem_1): (U is copied to mem-1)
B $23EF,1 #R$33A1: X, Y, Y*W
B $23F0,1 #R$340F(get_mem_0): X, Y, Y*W, COS F
B $23F1,1 #R$30CA: X, Y, Y*W*COS F
B $23F2,1 #R$340F(get_mem_2): X, Y, Y*W*COS F, X*W
B $23F3,1 #R$340F(get_mem_5): X, Y, Y*W*COS F, X*W, SIN F
B $23F4,1 #R$30CA: X, Y, Y*W*COS F, X*W*SIN F
B $23F5,1 #R$300F: X, Y, Y*W*COS F - X*W*SIN F=V
B $23F6,1 #R$342D(st_mem_2): (V is copied to mem-2).
B $23F7,1 #R$346A: X, Y, V' (V'=ABS V)
B $23F8,1 #R$340F(get_mem_1): X, Y, V', U
B $23F9,1 #R$346A: X, Y, V', U' (U'=ABS U)
B $23FA,1 #R$3014: X, Y, U'+V'
B $23FB,1 #R$33A1: X, Y
B $23FC,1 #R$369B: (#REGde now points to U'+V').
  $23FD Get exponent of U'+V'.
  $23FE If U'+V' is less than 1, just tidy the stack and draw the line from X0, Y0 to X0+X, Y0+Y.
  $2404 Otherwise, continue with the parameters: X, Y, on the stack.
B $2406,1 #R$343C: Y, X
B $2407,1 #R$369B
  $2408 Get X0 into #REGa and so on to the stack.
  $240E Y, X, X0
B $240F,1 #R$342D(st_mem_0): (X0 is copied to mem-0).
B $2410,1 #R$3014: Y, X0+X
B $2411,1 #R$343C: X0+X, Y
B $2412,1 #R$369B
  $2413 Get Y0 into #REGa and so on to the stack.
  $2419 X0+X, Y, Y0
B $241A,1 #R$342D(st_mem_5): (Y0 is copied to mem-5).
B $241B,1 #R$3014: X0+X, Y0+Y
B $241C,1 #R$340F(get_mem_0): X0+X, Y0+Y, X0
B $241D,1 #R$340F(get_mem_5): X0+X, Y0+Y, X0, Y0
B $241E,1 #R$369B
  $241F Restore the arc-counter in #REGb.
N $2420 iv. The arc-drawing loop. This is entered at #R$2439 with the co-ordinates of the starting point on top of the stack, and the initial displacements for the first arc in mem-1 and mem-2. It uses simple trigonometry to ensure that all subsequent arcs will be drawn to points that lie on the same circle as the first two, subtending the same angle at the centre. It can be shown that if 2 points X1, Y1 and X2, Y2 lie on a circle and subtend an angle N at the centre, which is also the origin of co-ordinates, then X2 = X1*COS N - Y1*SIN N, and Y2 = X1*SIN N + Y1*COS N. But because the origin is here at the increments, say Un = Xn+1 - Xn and Vn = Yn+1 - Yn, thus achieving the desired result. The stack is shown below on the (n+1)th pass through the loop, as Xn and Yn are incremented by Un and Vn, after these are obtained from Un-1 and Vn-1. The 4 values on the top of the stack at #R$2425 are, in DRAW, reading upwards, X0+X, Y0+Y, Xn and Yn but to save space these are not shown until #R$2439. For the initial values in CIRCLE, see the end of CIRCLE, above. In CIRCLE too, the angle G must be taken to be 2#pi.
@ $2420 label=DRW_STEPS
  $2420 #REGb counts the passes through the loop.
  $2421 Jump when #REGb has reached zero.
  $2423 Jump into the loop to start.
@ $2425 label=ARC_LOOP
  $2425 (See text above for the stack).
B $2426,1 #R$340F(get_mem_1): Un-1
B $2427,1 #R$33C0: Un-1, Un-1
B $2428,1 #R$340F(get_mem_3): Un-1, Un-1, COS(G/A)
B $2429,1 #R$30CA: Un-1, Un-1*COS(G/A)
B $242A,1 #R$340F(get_mem_2): Un-1, Un-1*COS(G/A), Vn-1
B $242B,1 #R$340F(get_mem_4): Un-1, Un-1*COS(G/A), Vn-1, SIN(G/A)
B $242C,1 #R$30CA: Un-1, Un-1*COS(G/A), Vn-1*SIN(G/A)
B $242D,1 #R$300F: Un-1, Un-1*COS(G/A)-Vn-1*SIN(G/A)=Un
B $242E,1 #R$342D(st_mem_1): (Un is copied to mem-1).
B $242F,1 #R$33A1: Un-1
B $2430,1 #R$340F(get_mem_4): Un-1, SIN(G/A)
B $2431,1 #R$30CA: Un-1*SIN(G/A)
B $2432,1 #R$340F(get_mem_2): Un-1*SIN(G/A), Vn-1
B $2433,1 #R$340F(get_mem_3): Un-1*SIN(G/A), Vn-1, COS(G/A)
B $2434,1 #R$30CA: Un-1*SIN(G/A), Vn-1*COS(G/A)
B $2435,1 #R$3014: Un-1*SIN(G/A)+Vn-1*COS(G/A)=Vn
B $2436,1 #R$342D(st_mem_2): (Vn is copied to mem-2).
B $2437,1 #R$33A1: (As noted in the text, the stack in fact holds X0+X, Y0+Y, Xn and Yn).
B $2438,1 #R$369B
@ $2439 label=ARC_START
  $2439 Save the arc-counter.
  $243A X0+X, Y0+y, Xn, Yn
B $243B,1 #R$342D(st_mem_0): (Yn is copied to mem-0).
B $243C,1 #R$33A1: X0+X, Y0+Y, Xn
B $243D,1 #R$340F(get_mem_1): X0+X, Y0+Y, Xn, Un
B $243E,1 #R$3014: X0+X, Y0+Y, Xn+Un=Xn+1
B $243F,1 #R$33C0: X0+X, Y0+Y, Xn+1, Xn+1
B $2440,1 #R$369B
  $2441 Next Xn', the approximate value of Xn reached by the line-drawing subroutine is copied to #REGa and hence to the stack.
  $2447 X0+X, Y0+Y, Xn+1, Xn'
B $2448,1 #R$300F: X0+X, Y0+Y, Xn+1, Xn+1, Xn'-Xn'=Un'
B $2449,1 #R$340F(get_mem_0): X0+X, Y0+Y, Xn+1, Un', Yn
B $244A,1 #R$340F(get_mem_2): X0+X, Y0+Y, Xn+1, Un', Yn, Vn
B $244B,1 #R$3014: X0+X, Y0+Y, Xn+1, Un', Yn+Vn=Yn+1
B $244C,1 #R$342D(st_mem_0): (Yn+1 is copied to mem-0).
B $244D,1 #R$343C: X0+X, Y0+Y, Xn+1, Yn+1, Un'
B $244E,1 #R$340F(get_mem_0): X0+X, Y0+Y, Xn+1, Yn+1, Un', Yn+1
B $244F,1 #R$369B
  $2450 Yn', approximate like Xn', is copied to #REGa and hence to the stack.
  $2456 X0+X, Y0+Y, Xn+1, Yn+1, Un', Yn+1, Yn'
B $2457,1 #R$300F: X0+X, Y0+Y, Xn+1, Yn+1, Un', Vn'
B $2458,1 #R$369B
  $2459 The next 'arc' is drawn.
  $245C The arc-counter is restored.
  $245D Jump if more arcs to draw.
@ $245F label=ARC_END
B $2460,2,1 #R$33A1: The co-ordinates of the end of the last arc that was drawn are now deleted from the stack.
B $2462,1 #R$343C: Y0+Y, X0+X
B $2463,1 #R$369B
  $2464,6 The X-co-ordinate of the end of the last arc that was drawn, say Xz', is copied to the stack.
B $246B,1 #R$300F: Y0+Y, X0+X-Xz'
B $246C,1 #R$343C: X0+X-Xz', Y0+Y
B $246D,1 #R$369B
  $246E The Y-co-ordinate is obtained.
  $2474 X0+X-Xz', Y0+Y, Yz'
B $2475,1 #R$300F: X0+X-Xz', Y0+Y-Yz'
B $2476,1 #R$369B
@ $2477 label=LINE_DRAW
  $2477 The final arc is drawn to reach X0+X, Y0+Y (or close the circle).
  $247A Exit, setting temporary colours.
@ $247D label=CD_PRMS1
c $247D THE 'INITIAL PARAMETERS' SUBROUTINE
D $247D This subroutine is called by both #R$2320 and #R$2382 to set their initial parameters. It is called by #R$2320 with X, Y and the radius Z on the top of the stack, reading upwards. It is called by #R$2382 with its own X, Y, SIN (G/2) and Z, as defined in #R$2382 i., on the top of the stack. In what follows the stack is only shown from Z upwards.
D $247D The subroutine returns in #REGb the arc-count A as explained in both #R$2320 and #R$2382, and in mem-0 to mem-5 the quantities G/A, SIN (G/2*A), 0, COS (G/A), SIN (G/A) and G. For a circle, G must be taken to be equal to 2#pi.
  $247D Z
B $247E,1 #R$33C0: Z, Z
B $247F,1 #R$384A: Z, SQR Z
B $2480,3,1,2 #R$33C6: Z, SQR Z, 2
B $2483,1 #R$343C: Z, 2, SQR Z
B $2484,1 #R$31AF: Z, 2/SQR Z
B $2485,1 #R$340F(get_mem_5): Z, 2/SQR Z, G
B $2486,1 #R$343C: Z, G, 2/SQR Z
B $2487,1 #R$31AF: Z, G*SQR Z/2
B $2488,1 #R$346A: Z, G'*SQR Z/2 (G' = mod G)
B $2489,1 #R$369B: Z, G'*SQR Z/2 = A1, say
  $248A A1 to #REGa from the stack, if possible.
  $248D If A1 rounds to 256 or more, use 252.
  $248F 4*INT (A1/4) to #REGa.
  $2491 Add 4, giving the arc-count A.
  $2493 Jump if still under 256.
  $2495 Here, just use 252 decimal.
@ $2495 label=USE_252
  $2497 Now save the arc-count.
@ $2497 label=DRAW_SAVE
  $2498 Copy it to calculator stack too.
  $249B Z, A
B $249C,1 #R$340F(get_mem_5): Z, A, G
B $249D,1 #R$343C: Z, G, A
B $249E,1 #R$31AF: Z, G/A
B $249F,1 #R$33C0: Z, G/A, G/A
B $24A0,1 #R$37B5: Z, G/A, SIN (G/A)
B $24A1,1 #R$342D(st_mem_4): (SIN (G/A) is copied to mem-4)
B $24A2,1 #R$33A1: Z, G/A
B $24A3,1 #R$33C0: Z, G/A, G/A
B $24A4,1 #R$341B(stk_half): Z, G/A, G/A, 0.5
B $24A5,1 #R$30CA: Z, G/A, G/2*A
B $24A6,1 #R$37B5: Z, G/A, SIN (G/2*A)
B $24A7,1 #R$342D(st_mem_1): (SIN (G/2*A) is copied to mem-1)
B $24A8,1 #R$343C: Z, SIN (G/2*A), G/A
B $24A9,1 #R$342D(st_mem_0): (G/A is copied to mem-0)
B $24AA,1 #R$33A1: Z, SIN (G/2*A)=S
B $24AB,1 #R$33C0: Z, S, S
B $24AC,1 #R$30CA: Z, S*S
B $24AD,1 #R$33C0: Z, S*S, S*S
B $24AE,1 #R$3014: Z, 2*S*S
B $24AF,1 #R$341B(stk_one): Z, 2*S*S, 1
B $24B0,1 #R$300F: Z, 2*S*S-1
B $24B1,1 #R$346E: Z, 1-2*S*S=COS (G/A)
B $24B2,1 #R$342D(st_mem_3): (COS (G/A) is copied to mem-3)
B $24B3,1 #R$33A1: Z
B $24B4,1 #R$369B
  $24B5 Restore the arc-count to #REGb.
  $24B6 Finished.
@ $24B7 label=DRAW_LINE
c $24B7 THE LINE-DRAWING SUBROUTINE
@ $24C4 label=DL_X_GE_Y
@ $24CB label=DL_LARGER
@ $24CE label=D_L_LOOP
@ $24D4 label=D_L_DIAG
@ $24DB label=D_L_HR_VT
@ $24DF label=D_L_STEP
@ $24EC label=D_L_PLOT
@ $24F9 label=REPORT_B_3
B $24FA,1
@ $24FB label=SCANNING
c $24FB THE 'SCANNING' SUBROUTINE
@ $24FF label=S_LOOP_1
@ $250F label=S_QUOTE_S
  $2518,c2
  $251F,c2
@ $2522 label=S_2_COORD
  $2523,c2
  $252B,c2
@ $252D label=S_RPORT_C
@ $2530 label=SYNTAX_Z
c $2530 THE 'SYNTAX-Z' SUBROUTINE
@ $2535 label=S_SCRN_S
@ $253B keep
@ $254F label=S_SCRN_LP
@ $255A label=S_SC_MTCH
@ $255D label=S_SC_ROWS
@ $256C keep
@ $2573 label=S_SCR_NXT
@ $2574 keep
@ $257D label=S_SCR_STO
@ $2580 label=S_ATTR_S
@ $2596 label=SCANFUNC
b $2596 THE SCANNING FUNCTION TABLE
D $2596 This table contains 8 functions and 4 operators. It thus incorporates 5 new Spectrum functions and provides a neat way of accessing some functions and operators which already existed on the ZX81.
  $2596,2,T1:1 #R$25B3
  $2598,2,T1:1 #R$25E8
  $259A,2,T1:1 #R$268D
  $259C,2,T1:1 #R$25AF
  $259E #R$25F5
  $25A0 #R$25F8
  $25A2 #R$2627
  $25A4 #R$2634
  $25A6 #R$268D
  $25A8 #R$2668
  $25AA #R$2672
  $25AC #R$267B
  $25AE End marker.
@ $25AF label=S_U_PLUS
c $25AF THE SCANNING FUNCTION ROUTINES
  $25AF For unary plus, simply move on to the next character and jump back to the main re-entry of #R$24FB.
N $25B3 The 'scanning QUOTE' routine. This routine deals with string quotes, whether simple like "name" or more complex like "a ""white"" lie" or the seemingly redundant VAL$ """a""".
@ $25B3 label=S_QUOTE
  $25B3 Fetch the current character.
  $25B4 Point to the start of the string.
  $25B5 Save the start address.
@ $25B6 keep
  $25B6 Set the length to zero.
  $25B9 Call the "matching" subroutine.
  $25BC Jump if zero reset - no more quotes.
@ $25BE label=S_Q_AGAIN
  $25BE Call it again for a third quote.
  $25C1 And again for the fifth, seventh etc.
  $25C3 If testing syntax, jump to reset bit 6 of FLAGS and to continue scanning.
  $25C8 Make space in the work space for the string and the terminating quote.
  $25C9 Get the pointer to the start.
  $25CA Save the pointer to the first space.
@ $25CB label=S_Q_COPY
  $25CB Get a character from the string.
  $25CC Point to the next one.
  $25CD Copy last one to work space.
  $25CE Point to the next space.
  $25CF,c2 Is last character a '"'?
  $25D1 If not, jump to copy next one.
  $25D3,6,2,c2,2 But if it was, do not copy next one; if next one is a '"', jump to copy the one after it; otherwise, finished with copying.
@ $25D9 label=S_Q_PRMS
  $25D9 Get true length to #REGbc.
N $25DA Note that the first quote was not counted into the length; the final quote was, and is discarded now. Inside the string, the first, third, fifth, etc., quotes were counted in but the second, fourth, etc., were not.
  $25DA Restore start of copied string.
@ $25DB label=S_STRING
  $25DB This is FLAGS; this entry point is used whenever bit 6 is to be reset and a string stacked if executing a line. This is done now.
  $25E5 Jump to continue scanning the line.
N $25E8 Note that in copying the string to the work space, every two pairs of string quotes inside the string ("") have been reduced to one pair of string quotes(").
@ $25E8 label=S_BRACKET
  $25E8 The 'scanning BRACKET routine' simply gets the character and calls #R$24FB recursively.
  $25EC,5,c2,3 Report the error if no matching bracket.
  $25F1 Continue scanning.
@ $25F5 label=S_FN
  $25F5 The 'scanning FN' routine.
N $25F8 This routine, for user-defined functions, just jumps to the 'scanning FN' subroutine.
@ $25F8 label=S_RND
  $25F8 Unless syntax is being checked, jump to calculate a random number.
  $25FD Fetch the current value of SEED.
  $2601 Put it on the calculator stack.
  $2604 Now use the calculator,
B $2605,1 #R$341B(stk_one)
B $2606,1 #R$3014: The 'last value' is now SEED+1.
B $2607,3,1,2 #R$33C6: Put the decimal number 75 on the calculator stack.
B $260A,1 #R$30CA: 'last value' (SEED+1)*75.
B $260B,6,1,5 #R$33C6: Put the decimal number 65537 on the calculator stack.
B $2611,1 #R$36A0: Divide (SEED+1)*75 by 65537 to give a 'remainder' and an 'answer'.
B $2612,1 #R$33A1: Discard the 'answer'.
B $2613,1 #R$341B(stk_one)
B $2614,1 #R$300F: The 'last value' is now 'remainder' - 1.
B $2615,1 #R$33C0: Make a copy of the 'last value'.
B $2616,1 #R$369B: The calculation is finished.
  $2617 Use the 'last value' to give the new value for SEED.
  $261E Fetch the exponent of 'last value'.
  $261F Jump forward if the exponent is zero.
  $2622 Reduce the exponent, i.e. divide 'last value' by 65536 to give the required 'last value'.
@ $2625 label=S_RND_END
  $2625 Jump past the #R$2627 routine.
N $2627 The 'scanning-PI' routine. Unless syntax is being checked the value of 'PI' is calculated and forms the 'last value' on the calculator stack.
@ $2627 label=S_PI
  $2627 Test for syntax checking.
  $262A Jump if required.
  $262C Now use the calculator.
B $262D,1 #R$341B(stk_pi_2): The value of #pi/2 is put on the calculator stack as the 'last value'.
B $262E,1 #R$369B
  $262F The exponent is incremented thereby doubling the 'last value' giving #pi.
@ $2630 label=S_PI_END
  $2630 Move on to the next character.
  $2631 Jump forward.
@ $2634 keep
@ $2634 label=S_INKEY
  $2634 Priority +10 hex, operation code +5A for the 'read-in' subroutine.
  $2638,5,c2,3 If next char. is '#', jump. There will be a numerical argument.
  $263D This is FLAGS.
  $2640 Reset bit 6 for a string result.
  $2642 Test for syntax checking.
  $2644 Jump if required.
  $2646 Fetch a key-value in #REGde.
  $2649 Prepare empty string; stack it if too many keys pressed.
  $264D Test the key value; stack empty string if unsatisfactory.
  $2652 +FF to #REGd for 'L' mode (bit 3 set).
  $2653 Key-value to #REGe for decoding.
  $2654 Decode the key-value.
  $2657 Save the ASCII value briefly.
@ $2658 keep
  $2658 One space is needed in the work space.
  $265B Make it now.
  $265C Restore the ASCII value.
  $265D Prepare to stack it as a string.
  $265E Its length is one.
@ $2660 label=S_IK_STK
  $2660 Complete the length parameter.
  $2662 Stack the required string.
@ $2665 label=S_INK_EN
  $2665 Jump forward.
@ $2668 label=S_SCREEN
  $2668 Check that 2 co-ordinates are given.
  $266B Call the subroutine unless checking syntax; then get the next character and jump back.
@ $2672 label=S_ATTR
  $2672 Check that 2 co-ordinates are given.
  $2675 Call the subroutine unless checking syntax; then get the next character and jump forward.
@ $267B label=S_POINT
  $267B Check that 2 co-ordinates are given.
  $267E Call the subroutine unless checking syntax; then get the next character and jump forward.
@ $2684 label=S_ALPHNUM
  $2684 Is the character alphanumeric?
  $2687 Jump if not a letter or a digit.
  $2689,4,c2,2 Now jump if it is a letter; otherwise continue on into #R$268D.
N $268D The 'scanning DECIMAL' routine which follows deals with a decimal point or a number that starts with a digit. It also takes care of the expression 'BIN', which is dealt with in the 'decimal to floating-point' subroutine.
@ $268D label=S_DECIMAL
  $268D Jump forward if a line is being executed.
N $2692 The action taken is now very different for syntax checking and line execution. If syntax is being checked then the floating-point form has to be calculated and copied into the actual BASIC line. However when a line is being executed the floating-point form will always be available so it is copied to the calculator stack to form a 'last value'.
N $2692 During syntax checking:
  $2692 The floating-point form is found.
  $2695 Set #REGhl to point one past the last digit.
@ $2696 keep
  $2696 Six locations are required.
  $2699 Make the room in the BASIC line.
  $269C Point to the first free space.
  $269D Enter the number marker code.
  $269F Point to the second location.
  $26A0 This pointer is wanted in #REGde.
  $26A1 Fetch the 'old' STKEND.
  $26A4 There are 5 bytes to move.
  $26A6 Clear the carry flag.
  $26A7 The 'new' STKEND = 'old' STKEND - 5.
  $26A9 Move the floating-point number from the calculator stack to the line.
  $26AE Put the line pointer in #REGhl.
  $26AF Point to the last byte added.
  $26B0 This sets CH-ADD.
  $26B3 Jump forward.
N $26B5 During line execution:
@ $26B5 label=S_STK_DEC
  $26B5 Get the current character.
@ $26B6 label=S_SD_SKIP
  $26B6 Now move on to the next character in turn until the number marker code (0E hex) is found.
  $26BC Point to the first byte of the number.
  $26BD Move the floating-point number.
  $26C0 Set CH-ADD.
N $26C3 A numeric result has now been identified, coming from RND, PI, ATTR, POINT or a decimal number, therefore bit 6 of FLAGS must be set.
@ $26C3 label=S_NUMERIC
  $26C3 Set the numeric marker flag.
  $26C7 Jump forward.
@ $26C9 label=S_LETTER
c $26C9 THE SCANNING VARIABLE ROUTINE
@ $26DD label=S_CONT_1
@ $26DF keep
@ $26DF label=S_NEGATE
  $26E2,c2
@ $26E6 keep
@ $26F2 keep
@ $2707 label=S_NO_TO_S
@ $270D label=S_PUSH_PO
@ $2712 label=S_CONT_2
@ $2713 label=S_CONT_3
  $2713,c2
@ $2723 label=S_OPERTR
@ $272F nowarn
@ $2734 label=S_LOOP
@ $274C label=S_STK_LST
B $2757,2,1
@ $275B label=S_SYNTEST
@ $2761 label=S_RPORT_C_2
@ $2764 label=S_RUNTEST
@ $2770 label=S_LOOPEND
@ $2773 label=S_TIGHTER
@ $2788 label=S_NOT_AND
@ $2790 label=S_NEXT
@ $2795 label=OPERATORS
b $2795 THE TABLE OF OPERATORS
  $2795,2,T1:1 +
  $2797,2,T1:1 -
  $2799,2,T1:1 *
  $279B,2,T1:1 /
  $279D,2 #power
  $279F,2,T1:1 =
  $27A1,2,T1:1 >
  $27A3,2,T1:1 <
  $27A5,2 <=
  $27A7,2 >=
  $27A9,2 <>
  $27AB,2 OR
  $27AD,2 AND
  $27AF,1 End marker.
b $27B0 THE TABLE OF PRIORITIES
  $27B0 -
  $27B1 *
  $27B2 /
  $27B3 #power
  $27B4 OR
  $27B5 AND
  $27B6 <=
  $27B7 >=
  $27B8 <>
  $27B9 >
  $27BA <
  $27BB =
  $27BC +
@ $27BD label=S_FN_SBRN
c $27BD THE 'SCANNING FUNCTION' SUBROUTINE
  $27CA,c2
@ $27D0 label=SF_BRKT_1
  $27D0,c2
  $27D5,c2
@ $27D9 label=SF_ARGMTS
  $27DD,c2
@ $27E4 label=SF_BRKT_2
  $27E4,c2
@ $27E6 label=SF_RPRT_C
@ $27E9 label=SF_FLAG_6
@ $27F4 label=SF_SYN_EN
@ $27F7 label=SF_RUN
@ $2802 label=SF_ARGMT1
@ $2808 keep
@ $2808 label=SF_FND_DF
@ $2812 label=REPORT_P
B $2813,1
@ $2814 label=SF_CP_DEF
  $2820,c2
@ $2825 label=SF_NOT_FD
@ $2827 keep
@ $2831 label=SF_VALUES
  $283F,c2
@ $2843 label=SF_ARG_LP
@ $2852 label=SF_ARG_VL
@ $2865 keep
  $2874,c2
  $287A,c2
@ $2885 label=SF_R_BR_2
  $2887,c2
@ $288B label=REPORT_Q
B $288C,1
@ $288D label=SF_VALUE
@ $28AB label=FN_SKPOVR
c $28AB THE 'FUNCTION SKIPOVER' SUBROUTINE
@ $28B2 label=LOOK_VARS
c $28B2 THE 'LOOK-VARS' SUBROUTINE
  $28C3,c2
  $28C9,c2
@ $28D4 label=V_CHAR
@ $28DE label=V_STR_VAR
@ $28E3 label=V_TEST_FN
@ $28EF label=V_RUN_SYN
@ $28FD label=V_RUN
@ $2900 label=V_EACH
@ $2912 label=V_MATCHES
@ $2913 label=V_SPACES
  $2915,c2
@ $2929 label=V_GET_PTR
@ $292A label=V_NEXT
@ $2932 label=V_80_BYTE
@ $2934 label=V_SYNTAX
  $2936,c2
@ $293E label=V_FOUND_1
@ $293F label=V_FOUND_2
@ $2943 label=V_PASS
@ $294B label=V_END
@ $2951 label=STK_F_ARG
c $2951 THE 'STACK FUNCTION ARGUMENT' SUBROUTINE
  $2955,c2
@ $295A label=SFA_LOOP
@ $296B label=SFA_CP_VR
  $2977,c2
@ $2981 label=SFA_MATCH
@ $2991 label=SFA_END
@ $2996 label=STK_VAR
c $2996 THE 'STK-VAR' SUBROUTINE
@ $29A1 label=SV_SIMPLE
@ $29AE label=SV_ARRAYS
  $29BB,c2
@ $29C0 label=SV_PTR
@ $29C3 label=SV_COMMA
  $29C6,c2
  $29D2,c2
@ $29D8 label=SV_CLOSE
  $29D8,c2
@ $29E0 label=SV_CH_ADD
@ $29E7 keep
@ $29E7 label=SV_COUNT
@ $29EA label=SV_LOOP
  $29F3,c2
@ $29FB label=SV_MULT
@ $2A12 label=SV_RPT_C
  $2A1C,c2
@ $2A20 label=REPORT_3
B $2A21,1
@ $2A22 label=SV_NUMBER
@ $2A24 keep
@ $2A2C label=SV_ELEM
  $2A3D,c2
  $2A41,c2
@ $2A45 label=SV_SLICE
@ $2A48 label=SV_DIM
@ $2A49 label=SV_SLICE?
  $2A49,c2
@ $2A52 label=SLICING
c $2A52 THE 'SLICING' SUBROUTINE
  $2A59,c2
@ $2A61 keep
@ $2A7A label=SL_RPT_C
@ $2A81 label=SL_SECOND
  $2A84,c2
  $2A90,c2
@ $2A94 label=SL_DEFINE
@ $2A9C keep
@ $2AA8 label=SL_OVER
@ $2AB1 label=STK_ST_0
c $2AB1 THE 'STK-STORE' SUBROUTINE
@ $2AB2 label=STK_STO
@ $2AB6 label=STK_STORE
@ $2ACC label=INT_EXP1
c $2ACC THE 'INT-EXP' SUBROUTINE
@ $2ACD label=INT_EXP2
@ $2AE8 label=I_CARRY
@ $2AEB label=I_RESTORE
@ $2AEE label=DE_DE_1
c $2AEE THE 'DE,(DE+1)' SUBROUTINE
@ $2AF4 label=GET_HLxDE
c $2AF4 THE 'GET-HL*DE' SUBROUTINE
@ $2AFF label=LET
c $2AFF THE 'LET' COMMAND ROUTINE
@ $2B08 keep
@ $2B0B label=L_EACH_CH
@ $2B0C label=L_NO_SP
  $2B0E,c2
  $2B24,c2
@ $2B29 label=L_SPACES
@ $2B3E label=L_CHAR
@ $2B4F label=L_SINGLE
@ $2B59 label=L_NUMERIC
B $2B5B,2,1
@ $2B5E keep
@ $2B66 label=L_EXISTS
@ $2B6C keep
@ $2B72 label=L_DELETE
  $2B89,c2
@ $2B9B label=L_LENGTH
@ $2BA3 label=L_IN_W_S
@ $2BA6 label=L_ENTER
c $2BA6 THE 'L-ENTER' SUBROUTINE
@ $2BAF label=L_ADD
c $2BAF THE LET SUBROUTINE CONTINUES HERE
@ $2BC0 label=L_NEW
@ $2BC6 label=L_STRING
c $2BC6 THE 'L-STRING' SUBROUTINE
@ $2BEA label=L_FIRST
c $2BEA THE 'L-FIRST' SUBROUTINE
@ $2BF1 label=STK_FETCH
c $2BF1 THE 'STK-FETCH' SUBROUTINE
@ $2C02 label=DIM
c $2C02 THE 'DIM' COMMAND ROUTINE
@ $2C05 label=D_RPORT_C
@ $2C15 label=D_RUN
@ $2C1F label=D_LETTER
@ $2C24 keep
@ $2C2D label=D_SIZE
@ $2C2E label=D_NO_LOOP
  $2C42,c2
  $2C46,c2
  $2C7A,c2
@ $2C7C label=DIM_CLEAR
@ $2C7F label=DIM_SIZES
@ $2C88 label=ALPHANUM
c $2C88 THE 'ALPHANUM' SUBROUTINE
@ $2C8D label=ALPHA
c $2C8D THE 'ALPHA' SUBROUTINE
  $2C8D,c2
  $2C91,c2
  $2C94,c2
  $2C98,c2
@ $2C9B label=DEC_TO_FP
c $2C9B THE 'DECIMAL TO FLOATING POINT' SUBROUTINE
D $2C9B As part of syntax checking decimal numbers that occur in a BASIC line are converted to their floating-point forms. This subroutine reads the decimal number digit by digit and gives its result as a 'last value' on the calculator stack. But first it deals with the alternative notation BIN, which introduces a sequence of 0's and 1's giving the binary representation of the required number.
  $2C9B Is the character a 'BIN'?
  $2C9D Jump if it is not 'BIN'.
@ $2C9F keep
  $2C9F Initialise result to zero in #REGde.
@ $2CA2 label=BIN_DIGIT
  $2CA2 Get the next character.
  $2CA3,c2 Subtract the character code for '1'.
  $2CA5 0 now gives 0 with carry set; 1 gives 0 with carry reset.
  $2CA7 Any other character causes a jump to #R$2CB3 and will be checked for syntax during or after scanning.
  $2CA9 Result so far to #REGhl now.
  $2CAA Complement the carry flag.
  $2CAB Shift the result left, with the carry going to bit 0.
  $2CAD Report overflow if more than 65535.
  $2CB0 Return the result so far to #REGde.
  $2CB1 Jump back for next 0 or 1.
@ $2CB3 label=BIN_END
  $2CB3 Copy result to #REGbc for stacking.
  $2CB5 Jump forward to stack the result.
N $2CB8 For other numbers, first any integer part is converted; if the next character is a decimal, then the decimal fraction is considered.
@ $2CB8 label=NOT_BIN
  $2CB8,c2 Is the first character a '.'?
  $2CBA If so, jump forward.
  $2CBC Otherwise, form a 'last value' of the integer.
  $2CBF,c2 Is the next character a '.'?
  $2CC1 Jump forward to see if it is an 'E'.
  $2CC3 Get the next character.
  $2CC4 Is it a digit?
  $2CC7 Jump if not (e.g. 1.E4 is allowed).
  $2CC9 Jump forward to deal with the digits after the decimal point.
@ $2CCB label=DECIMAL
  $2CCB If the number started with a decimal, see if the next character is a digit.
  $2CCF Report the error if it is not.
@ $2CCF label=DEC_RPT_C
  $2CD2 Use the calculator to stack zero as the integer part of such numbers.
B $2CD3,1 #R$341B(stk_zero)
B $2CD4,1 #R$369B
@ $2CD5 label=DEC_STO_1
  $2CD5 Use the calculator to copy the number 1 to mem-0.
B $2CD6,1 #R$341B(stk_one)
B $2CD7,1 #R$342D(st_mem_0)
B $2CD8,1 #R$33A1
B $2CD9,1 #R$369B
N $2CDA For each passage of the following loop, the number (N) saved in the memory area mem-0 is fetched, divided by 10 and restored, i.e. N goes from 1 to .1 to .01 to .001 etc. The present digit (D) is multiplied by N/10 and added to the 'last value' (V), giving V+D*N/10.
@ $2CDA label=NXT_DGT_1
  $2CDA Get the present character.
  $2CDB If it is a digit (D) then stack it.
  $2CDE If not jump forward.
  $2CE0 Now use the calculator.
B $2CE1,1 #R$340F(get_mem_0): V, D, N
B $2CE2,1 #R$341B(stk_ten): V, D, N, 10
B $2CE3,1 #R$31AF: V, D, N/10
B $2CE4,1 #R$342D(st_mem_0): V, D, N/10 (N/10 is copied to mem-0)
B $2CE5,1 #R$30CA: V, D*N/10
B $2CE6,1 #R$3014: V+D*N/10
B $2CE7,1 #R$369B
  $2CE8 Get the next character.
  $2CE9 Jump back (one more byte than needed) to consider it.
N $2CEB Next consider any 'E notation', i.e. the form xEm or xem where m is a positive or negative integer.
@ $2CEB label=E_FORMAT
  $2CEB,c2 Is the present character an 'E'?
  $2CED Jump forward if it is.
  $2CEF,c2 Is it an 'e'?
  $2CF1 Finished unless it is so.
@ $2CF2 label=SIGN_FLAG
  $2CF2 Use #REGb as a sign flag, FF for '+'.
  $2CF4 Get the next character.
  $2CF5,c2 Is it a '+'?
  $2CF7 Jump forward.
  $2CF9,c2 Is it a '-'?
  $2CFB Jump if neither '+' nor '-'.
  $2CFD Change the sign of the flag.
@ $2CFE label=SIGN_DONE
  $2CFE Point to the first digit.
@ $2CFF label=ST_E_PART
  $2CFF Is it indeed a digit?
  $2D02 Report the error if not.
  $2D04 Save the flag in #REGb briefly.
  $2D05 Stack ABS m, where m is the exponent.
  $2D08 Transfer ABS m to #REGa.
  $2D0B Restore the sign flag to #REGb.
  $2D0C Report the overflow now if ABS m is greater than 255 or indeed greater than 127 (other values greater than about 39 will be detected later).
  $2D13 Test the sign flag in #REGb; '+' (i.e. +FF) will now set the zero flag.
  $2D14 Jump if sign of m is '+'.
  $2D16 Negate m if sign is '-'.
@ $2D18 label=E_FP_JUMP
  $2D18 Jump to assign to the 'last value' the result of x*10#powerm.
@ $2D1B label=NUMERIC
c $2D1B THE 'NUMERIC' SUBROUTINE
  $2D1B,c2
  $2D1E,c2
@ $2D22 label=STK_DIGIT
c $2D22 THE 'STK-DIGIT' SUBROUTINE
  $2D26,c2
@ $2D28 label=STACK_A
c $2D28 THE 'STACK-A' SUBROUTINE
@ $2D2B label=STACK_BC
c $2D2B THE 'STACK-BC' SUBROUTINE
B $2D38,1
@ $2D3B label=INT_TO_FP
c $2D3B THE 'INTEGER TO FLOATING-POINT' SUBROUTINE
B $2D3D,2,1
B $2D45,5,1
@ $2D4F label=E_TO_FP
c $2D4F THE 'E-FORMAT TO FLOATING-POINT' SUBROUTINE
D $2D4F This subroutine gives a 'last value' on the top of the calculator stack that is the result of converting a number given in the form xEm, where m is a positive or negative integer. The subroutine is entered with x at the top of the calculator stack and m in the #REGa register.
D $2D4F The method used is to find the absolute value of m, say p, and to multiply or divide x by 10#powerp according to whether m is positive or negative.
D $2D4F To achieve this, p is shifted right until it is zero, and x is multiplied or divided by 10#power(2#powern) for each set bit b(n) of p. Since p is never much more than decimal 39, bits 6 and 7 of p will not normally be set.
  $2D4F Test the sign of m by rotating bit 7 of #REGa into the carry without changing #REGa.
  $2D51 Jump if m is positive.
  $2D53 Negate m in #REGa without disturbing the carry flag.
@ $2D55 label=E_SAVE
  $2D55 Save m in #REGa briefly.
  $2D56 This is MEMBOT; a sign flag is now stored in the first byte of mem-0, i.e. 0 for '+' and 1 for '-'.
  $2D5C The stack holds x.
B $2D5D,1 #R$341B(stk_ten): x, 10 (decimal)
B $2D5E,1 #R$369B: x, 10
  $2D5F Restore m in #REGa.
@ $2D60 label=E_LOOP
  $2D60 In the loop, shift out the next bit of m, modifying the carry and zero flags appropriately; jump if carry reset.
  $2D64 Save the rest of m and the flags.
  $2D65 The stack holds x' and 10#power(2#powern), where x' is an interim stage in the multiplication of x by 10#powerm, and n=0, 1, 2, 3, 4 or 5.
B $2D66,1 #R$342D(st_mem_1): (10#power(2#powern) is copied to mem-1)
B $2D67,1 #R$340F(get_mem_0): x', 10#power(2#powern), (1/0)
B $2D68,2,1 #R$368F to #R$2D6D: x', 10#power(2#powern)
B $2D6A,1 #R$30CA: x'*10#power(2#powern)= x"
B $2D6B,2,1 #R$3686 to #R$2D6E: x''
@ $2D6D label=E_DIVSN
B $2D6D,1 #R$31AF: x/10#power(2#powern)=x'' (x'' is x'*10#power(2#powern) or x'/10#power(2#powern) according as m is '+' or '-')
@ $2D6E label=E_FETCH
B $2D6E,1 #R$340F(get_mem_1): x'', 10#power(2#powern)
B $2D6F,1 #R$369B: x'', 10#power(2#powern)
  $2D70 Restore the rest of m in #REGa, and the flags.
@ $2D71 label=E_TST_END
  $2D71 Jump if m has been reduced to zero.
  $2D73 Save the rest of m in #REGa.
  $2D74 x'', 10#power(2#powern)
B $2D75,1 #R$33C0: x'', 10#power(2#powern), 10#power(2#powern)
B $2D76,1 #R$30CA: x'', 10#power(2#power(n+1))
B $2D77,1 #R$369B: x'', 10#power(2#power(n+1))
  $2D78 Restore the rest of m in #REGa.
  $2D79 Jump back for all bits of m.
@ $2D7B label=E_END
  $2D7B Use the calculator to delete the final power of 10 reached leaving the 'last value' x*10#powerm on the stack.
B $2D7C,1 #R$33A1
B $2D7D,1 #R$369B
  $2D7E
@ $2D7F label=INT_FETCH
c $2D7F THE 'INT-FETCH' SUBROUTINE
@ $2D8C label=P_INT_STO
c $2D8C THE 'INT-STORE' SUBROUTINE
@ $2D8E label=INT_STORE
@ $2DA2 label=FP_TO_BC
c $2DA2 THE 'FLOATING-POINT TO BC' SUBROUTINE
B $2DA3,1
B $2DA9,4,1
@ $2DAD label=FP_DELETE
B $2DAE,2,1
@ $2DC1 label=LOG_2_A
c $2DC1 THE 'LOG(2#powerA)' SUBROUTINE
B $2DCC,9,1*2,4,1
@ $2DD5 label=FP_TO_A
c $2DD5 THE 'FLOATING-POINT TO A' SUBROUTINE
@ $2DE1 label=FP_A_END
@ $2DE3 label=PRINT_FP
c $2DE3 THE 'PRINT A FLOATING-POINT NUMBER' SUBROUTINE
D $2DE3 This subroutine prints x, the 'last value' on the calculator stack. The print format never occupies more than 14 spaces.
D $2DE3 The 8 most significant digits of x, correctly rounded, are stored in an ad hoc print buffer in mem-3 and mem-4. Small numbers, numerically less than 1, and large numbers, numerically greater than 2#power27, are dealt with separately. The former are multiplied by 10#powern, where n is the approximate number of leading zeros after the decimal, while the latter are divided by 10#power(n-7), where n is the approximate number of digits before the decimal. This brings all numbers into the middle range, and the number of digits required before the decimal is built up in the second byte of mem-5. Finally the printing is done, using E-format if there are more than 8 digits before the decimal or, for small numbers, more than 4 leading zeros after the decimal.
D $2DE3 The following program shows the range of print formats:
D $2DE3 10 FOR a=-11 TO 12: PRINT SGN a*9#powera,: NEXT a
D $2DE3 i. First the sign of x is taken care of:
D $2DE3 #LIST { If x is negative, the subroutine jumps to #R$2DF2, takes ABS x and prints the minus sign. } { If x is zero, x is deleted from the calculator stack, a '0' is printed and a return is made from the subroutine. } { If x is positive, the subroutine just continues. } LIST#
  $2DE3 Use the calculator.
B $2DE4,1 #R$33C0: x, x
B $2DE5,1 #R$3506: x, (1/0) Logical value of x.
B $2DE6,2 #R$368F to #R$2DF2: x
B $2DE8,1 #R$33C0: x, x
B $2DE9,1 #R$34F9: x, (1/0) Logical value of x.
B $2DEA,2 #R$368F to #R$2DF8: x Hereafter x'=ABS x.
B $2DEC,1 #R$33A1: -
B $2DED,1 #R$369B: -
  $2DEE,c2 Enter the character code for '0'.
  $2DF0 Print the '0'.
  $2DF1 Finished as the 'last value' is zero.
@ $2DF2 label=PF_NEGTVE
B $2DF2,1 #R$346A: x' x'=ABS x.
B $2DF3,1 #R$369B: x'
  $2DF4,c2 Enter the character code for '-'.
  $2DF6 Print the '-'.
  $2DF7 Use the calculator again.
@ $2DF8 label=PF_POSTVE
B $2DF8,4,1,3 #R$341B(stk_zero): The 15 bytes of mem-3, mem-4 and mem-5 are now initialised to zero to be used for a print buffer and two counters.
B $2DFC,1 #R$33A1: The stack is cleared, except for x'.
B $2DFD,1 #R$369B: x'
  $2DFE #REGhl', which is used to hold calculator offsets (e.g. for 'STR$'), is saved on the machine stack.
N $2E01 ii. This is the start of a loop which deals with large numbers. Every number x is first split into its integer part i and the fractional part f. If i is a small integer, i.e. if -65535 <= i <= 65535, it is stored in #REGde' for insertion into the print buffer.
@ $2E01 label=PF_LOOP
  $2E01 Use the calculator again.
B $2E02,1 #R$33C0: x', x'
B $2E03,1 #R$36AF: x', INT (x')=i
B $2E04,1 #R$342D(st_mem_2): (i is stored in mem-2).
B $2E05,1 #R$300F: x'-i=f
B $2E06,1 #R$340F(get_mem_2): f, i
B $2E07,1 #R$343C: i, f
B $2E08,1 #R$342D(st_mem_2): (f is stored in mem-2).
B $2E09,1 #R$33A1: i
B $2E0A,1 #R$369B: i
  $2E0B Is i a small integer (first byte zero) i.e. is ABS i <= 65535?
  $2E0D Jump if it is not.
  $2E0F i is copied to #REGde (i, like x', >=0).
  $2E12 #REGb is set to count 16 bits.
  $2E14 #REGd is copied to #REGa for testing: is it zero?
  $2E16 Jump if it is not zero.
  $2E18 Now test #REGe.
  $2E19 Jump if #REGde is zero: x is a pure fraction.
  $2E1B Move #REGe to #REGd and set #REGb for 8 bits: #REGd was zero and #REGe was not.
@ $2E1E label=PF_SAVE
  $2E1E Transfer #REGde to #REGde', via the machine stack, to be moved into the print buffer at #R$2E7B.
  $2E22 Jump forward.
N $2E24 iii. Pure fractions are multiplied by 10#powern, where n is the approximate number of leading zeros after the decimal; and -n is added to the second byte of mem-5, which holds the number of digits needed before the decimal; a negative number here indicates leading zeros after the decimal;
@ $2E24 label=PF_SMALL
  $2E24 i (i=zero here)
B $2E25,1 #R$340F(get_mem_2): i, f
B $2E26,1 #R$369B: i, f
N $2E27 Note that the stack is now unbalanced. An extra byte 'DEFB +02, delete' is needed immediately after the RST 28. Now an expression like "2" +STR$ 0.5 is evaluated incorrectly as 0.5; the zero left on the stack displaces the "2" and is treated as a null string. Similarly all the string comparisons can yield incorrect values if the second string takes the form STR$ x where x is numerically less than 1; e.g. the expression "50"<STR$ 0.1 yields the logical value "true"; once again "" is used instead of "50".
  $2E27 The exponent byte e of f is copied to #REGa.
  $2E28 #REGa becomes e-126 dec i.e. e'+2, where e' is the true exponent of f.
  $2E2A The construction #REGa=ABS INT (LOG (2#power#REGa)) is performed (LOG is to base 10); i.e. #REGa=n, say: n is copied from #REGa to #REGd.
  $2E2E The current count is collected from the second byte of mem-5 and n is subtracted from it.
  $2E35 n is copied from #REGd to #REGa.
  $2E36 y=f*10#powern is formed and stacked.
  $2E39 i, y
B $2E3A,1 #R$33C0: i, y, y
B $2E3B,1 #R$36AF: i, y, INT (y) = i2
B $2E3C,1 #R$342D(st_mem_1): (i2 is copied to mem-1).
B $2E3D,1 #R$300F: i, y - i2
B $2E3E,1 #R$340F(get_mem_1): i, y - i2, i2
B $2E3F,1 #R$369B: i, f2, i2 (f2 = y - i2)
  $2E40 i2 is transferred from the stack to #REGa.
  $2E43 The pointer to f2 is saved.
  $2E44 i2 is stored in the first byte of mem-3: a digit for printing.
  $2E47 i2 will not count as a digit for printing if it is zero; #REGa is manipulated so that zero will produce zero but a non-zero digit will produce 1.
  $2E4B The zero or one is inserted into the first byte of mem-5 (the number of digits for printing) and added to the second byte of mem-5 (the number of digits before the decimal).
  $2E52 The pointer to f2 is restored.
  $2E53 Jump to store f2 in buffer (#REGhl now points to f2, #REGde to i2).
N $2E56 iv. Numbers greater than 2#power27 are similarly multiplied by 2#power(-n+7), reducing the number of digits before the decimal to 8, and the loop is re-entered at #R$2E01.
@ $2E56 label=PF_LARGE
  $2E56 e-80 hex = e', the true exponent of i.
  $2E58 Is e' less than 28 decimal?
  $2E5A Jump if it is less.
  $2E5C n is formed in #REGa.
  $2E5F And reduced to n-7.
  $2E61 Then copied to #REGb.
  $2E62 n-7 is added in to the second byte of mem-5, the number of digits required before the decimal in x.
  $2E67 Then i is multiplied by 10#power(-n+7). This will bring it into medium range for printing.
  $2E6D Round the loop again to deal with the now medium-sized number.
N $2E6F v. The integer part of x is now stored in the print buffer in mem-3 and mem-4.
@ $2E6F label=PF_MEDIUM
  $2E6F #REGde now points to i, #REGhl to f.
  $2E70 The mantissa of i is now in #REGd', #REGe', #REGd, #REGe.
  $2E73 Get the exchange registers.
  $2E74 True numerical bit 7 to #REGd'.
  $2E76 Exponent byte e of i to #REGa.
  $2E77 Back to the main registers.
  $2E78 True exponent e'=e-80 hex to #REGa.
  $2E7A This gives the required bit count.
N $2E7B Note that the case where i is a small integer (less than 65536) re-enters here.
@ $2E7B label=PF_BITS
  $2E7B The mantissa of i is now rotated left and all the bits of i are thus shifted into mem-4 and each byte of mem-4 is decimal adjusted at each shift.
  $2E84 Back to the main registers.
  $2E85 Address of fifth byte of mem-4 to #REGhl; count of 5 bytes to #REGc.
@ $2E8A label=PF_BYTES
  $2E8A Get the byte of mem-4.
  $2E8B Shift it left, taking in the new bit.
  $2E8C Decimal adjust the byte.
  $2E8D Restore it to mem-4.
  $2E8E Point to next byte of mem-4.
  $2E8F Decrease the byte count by one.
  $2E90 Jump for each byte of mem-4.
  $2E92 Jump for each bit of INT (x).
N $2E94 Decimal adjusting each byte of mem-4 gave 2 decimal digits per byte, there being at most 9 digits. The digits will now be re-packed, one to a byte, in mem-3 and mem-4, using the instruction RLD.
  $2E94 #REGa is cleared to receive the digits.
  $2E95 Source address: first byte of mem-4.
  $2E98 Destination: first byte of mem-3.
  $2E9B There are at most 9 digits.
  $2E9D The left nibble of mem-4 is discarded.
  $2E9F FF in #REGc will signal a leading zero, 00 will signal a non-leading zero.
@ $2EA1 label=PF_DIGITS
  $2EA1 Left nibble of (#REGhl) to #REGa, right nibble of (#REGhl) to left.
  $2EA3 Jump if digit in #REGa is not zero.
  $2EA5 Test for a leading zero: it will now give zero reset.
  $2EA7 Jump if it was a leading zero.
@ $2EA9 label=PF_INSERT
  $2EA9 Insert the digit now.
  $2EAA Point to next destination.
  $2EAB One more digit for printing, and one more before the decimal.
  $2EB1 Change the flag from leading zero to other zero.
@ $2EB3 label=PF_TEST_2
  $2EB3 The source pointer needs to be incremented on every second passage through the loop, when #REGb is odd.
@ $2EB8 label=PF_ALL_9
  $2EB8 Jump back for all 9 digits.
  $2EBA Get counter: were there 9 digits excluding leading zeros?
  $2EBF If not, jump to get more digits.
  $2EC1 Prepare to round: reduce count to 8.
  $2EC4 Compare 9th digit, byte 4 of mem-4, with 4 to set carry for rounding up.
  $2EC9 Jump forward to round up.
@ $2ECB label=PF_MORE
  $2ECB Use the calculator again.
B $2ECC,1 - (i is now deleted).
B $2ECD,1 f
B $2ECE,1 f
B $2ECC,1 #R$33A1: - (i is now deleted).
B $2ECD,1 #R$340F(get_mem_2): f
B $2ECE,1 #R$369B: f
N $2ECF vi. The fractional part of x is now stored in the print buffer.
@ $2ECF label=PF_FRACTN
  $2ECF #REGde now points to f.
  $2ED0 The mantissa of f is now in #REGd', #REGe', #REGd, #REGe.
  $2ED3 Get the exchange registers.
  $2ED4 The exponent of f is reduced to zero, by shifting the bits of f 80 hex - e places right, where #REGl' contained e.
  $2ED9 True numerical bit to bit 7 of #REGd'.
  $2EDB Restore the main registers.
  $2EDC Now make the shift.
  $2EDF Get the digit count.
  $2EE2 Are there already 8 digits?
  $2EE4 If not, jump forward.
  $2EE6 If 8 digits, just use f to round i up, rotating #REGd' left to set the carry.
  $2EE9 Restore main registers and jump forward to round up.
@ $2EEC keep
@ $2EEC label=PF_FR_DGT
  $2EEC Initial zero to #REGc, count of 2 to #REGb.
@ $2EEF label=PF_FR_EXX
  $2EEF #REGd'#REGe'#REGd#REGe is multiplied by 10 in 2 stages, first #REGde then #REGde', each byte by byte in 2 steps, and the integer part of the result is obtained in #REGc to be passed into the print buffer.
  $2EF9 The count and the result alternate between #REGbc and #REGbc'.
  $2EFC Loop back once through the exchange registers.
  $2EFE The start - 1st byte of mem-3.
  $2F01 Result to #REGa for storing.
  $2F02 Count of digits so far in number to #REGc.
  $2F05 Address the first empty byte.
  $2F06 Store the next digit.
  $2F07 Step up the count of digits.
  $2F0A Loop back until there are 8 digits.
N $2F0C vii. The digits stored in the print buffer are rounded to a maximum of 8 digits for printing.
@ $2F0C label=PF_ROUND
  $2F0C Save the carry flag for the rounding.
  $2F0D Base address of number: mem-3, byte 1.
  $2F10 Offset (number of digits in number) to #REGbc.
  $2F15 Address the last byte of the number.
  $2F16 Copy #REGc to #REGb as the counter.
  $2F17 Restore the carry flag.
@ $2F18 label=PF_RND_LP
  $2F18 This is the last byte of the number.
  $2F19 Get the byte into #REGa.
  $2F1A Add in the carry i.e. round up.
  $2F1C Store the rounded byte in the buffer.
  $2F1D If the byte is 0 or 10, #REGb will be decremented and the final zero (or the 10) will not be counted for printing.
  $2F22 Reset the carry for a valid digit.
  $2F23 Jump if carry reset.
@ $2F25 label=PF_R_BACK
  $2F25 Jump back for more rounding or more final zeros.
  $2F27 There is overflow to the left; an extra 1 is needed here.
  $2F2A It is also an extra digit before the decimal.
@ $2F2D label=PF_COUNT
  $2F2D #REGb now sets the count of the digits to be printed (final zeros will not be printed).
  $2F30 f is to be deleted.
B $2F31,1 #R$33A1: -
B $2F32,1 #R$369B: -
  $2F33 The calculator offset saved on the stack is restored to #REGhl'.
N $2F36 viii. The number can now be printed. First #REGc will be set to hold the number of digits to be printed, not counting final zeros, while #REGb will hold the number of digits required before the decimal.
  $2F36 The counters are set.
  $2F3A The start of the digits.
  $2F3D If more than 9, or fewer than minus 4, digits are required before the decimal, then E-format will be needed.
  $2F42 Fewer than 4 means more than 4 leading zeros after the decimal.
@ $2F46 label=PF_NOT_E
  $2F46 Are there no digits before the decimal? If so, print an initial zero.
N $2F4A The next entry point is also used to print the digits needed for E-format printing.
@ $2F4A label=PF_E_SBRN
  $2F4A Start by setting #REGa to zero.
  $2F4B Subtract #REGb: minus will mean there are digits before the decimal; jump forward to print them.
  $2F4F #REGa is now required as a counter.
  $2F50 Jump forward to print the decimal part.
@ $2F52 label=PF_OUT_LP
  $2F52 Copy the number of digits to be printed to #REGa. If #REGa is 0, there are still final zeros to print (#REGb is non-zero), so jump.
  $2F56 Get a digit from the print buffer.
  $2F57 Point to the next digit.
  $2F58 Decrease the count by one.
@ $2F59 label=PF_OUT_DT
  $2F59 Print the appropriate digit.
  $2F5C Loop back until #REGb is zero.
@ $2F5E label=PF_DC_OUT
  $2F5E It is time to print the decimal, unless #REGc is now zero; in that case, return - finished.
  $2F61 Add 1 to #REGb - include the decimal.
  $2F62,c2 Put the code for '.' into #REGa.
@ $2F64 label=PF_DEC_0S
  $2F64 Print the '.'.
  $2F65,c2 Enter the character code for '0'.
  $2F67 Loop back to print all needed zeros.
  $2F69 Set the count for all remaining digits.
  $2F6A Jump back to print them.
@ $2F6C label=PF_E_FRMT
  $2F6C The count of digits is copied to #REGd.
  $2F6D It is decremented to give the exponent.
  $2F6E One digit is required before the decimal in E-format.
  $2F70 All the part of the number before the 'E' is now printed.
  $2F73,c2 Enter the character code for 'E'.
  $2F75 Print the 'E'.
  $2F76 Exponent to #REGc now for printing.
  $2F77 And to #REGa for testing.
  $2F78 Its sign is tested.
  $2F79 Jump if it is positive.
  $2F7C Otherwise, negate it in #REGa.
  $2F7E Then copy it back to #REGc for printing.
  $2F7F,c2 Enter the character code for '-'.
  $2F81 Jump to print the sign.
@ $2F83 label=PF_E_POS
  $2F83,c2 Enter the character code for '+'.
@ $2F85 label=PF_E_SIGN
  $2F85 Now print the sign: '+' or '-'.
  $2F86 #REGbc holds the exponent for printing.
  $2F88 Jump back to print it and finish.
@ $2F8B label=CA_10A_C
c $2F8B THE 'CA=10*A+C' SUBROUTINE
@ $2F9B label=PREP_ADD
c $2F9B THE 'PREPARE TO ADD' SUBROUTINE
@ $2FA8 keep
@ $2FAF label=NEG_BYTE
@ $2FBA label=FETCH_TWO
c $2FBA THE 'FETCH TWO NUMBERS' SUBROUTINE
@ $2FDD label=SHIFT_FP
c $2FDD THE 'SHIFT ADDEND' SUBROUTINE
@ $2FE5 label=ONE_SHIFT
@ $2FF9 label=ADDEND_0
@ $2FFB label=ZEROS_4_5
@ $3000 keep
@ $3004 label=ADD_BACK
c $3004 THE 'ADD-BACK' SUBROUTINE
@ $300D label=ALL_ADDED
@ $300F label=SUBTRACT
c $300F THE 'SUBTRACTION' OPERATION
@ $3014 label=addition
c $3014 THE 'ADDITION' OPERATION
@ $303C label=ADDN_OFLW
@ $303E label=FULL_ADDN
@ $3055 label=SHIFT_LEN
@ $307C label=TEST_NEG
@ $309F label=ADD_REP_6
@ $30A3 label=END_COMPL
@ $30A5 label=GO_NC_MLT
@ $30A9 label=HL_HLxDE
c $30A9 THE 'HL=HL*DE' SUBROUTINE
@ $30AE keep
@ $30B1 label=HL_LOOP
@ $30BC label=HL_AGAIN
@ $30BE label=HL_END
@ $30C0 label=PREP_M_D
c $30C0 THE 'PREPARE TO MULTIPLY OR DIVIDE' SUBROUTINE
@ $30CA label=multiply
c $30CA THE 'MULTIPLICATION' OPERATION
@ $30EA label=MULT_RSLT
@ $30EF label=MULT_OFLW
@ $30F0 label=MULT_LONG
@ $3114 label=MLT_LOOP
@ $311B label=NO_ADD
@ $3125 label=STRT_MLT
@ $313B label=MAKE_EXPT
@ $313D label=DIVN_EXPT
@ $3146 label=OFLW1_CLR
@ $3151 label=OFLW2_CLR
@ $3155 label=TEST_NORM
@ $3159 label=NEAR_ZERO
@ $315D label=ZERO_RSLT
@ $315E label=SKIP_ZERO
@ $316C label=NORMALISE
@ $316E label=SHIFT_ONE
@ $3186 label=NORML_NOW
@ $3195 label=OFLOW_CLR
@ $31AD label=REPORT_6
B $31AE,1
@ $31AF label=division
c $31AF THE 'DIVISION' OPERATION
@ $31D2 label=DIV_LOOP
@ $31DB label=DIV_34TH
@ $31E2 label=DIV_START
@ $31F2 label=SUBN_ONLY
@ $31F9 label=NO_RSTORE
@ $31FA label=COUNT_ONE
@ $3214 label=truncate
c $3214 THE 'INTEGER TRUNCATION TOWARDS ZERO' SUBROUTINE
@ $3221 label=T_GR_ZERO
@ $3233 label=T_FIRST
@ $323F label=T_SMALL
@ $3252 label=T_NUMERIC
@ $325E label=T_TEST
@ $3261 label=T_SHIFT
@ $3267 label=T_STORE
@ $326C label=T_EXPNENT
@ $326D label=X_LARGE
@ $3272 label=NIL_BYTES
@ $327E label=BYTE_ZERO
@ $3283 label=BITS_ZERO
@ $328A label=LESS_MASK
@ $3290 label=IX_END
@ $3293 label=RE_ST_TWO
c $3293 THE 'RE-STACK TWO' SUBROUTINE
@ $3296 label=RESTK_SUB
@ $3297 label=RE_STACK
c $3297 THE 'RE-STACK' SUBROUTINE
@ $32B1 label=RS_NRMLSE
@ $32B2 label=RSTK_LOOP
@ $32BD label=RS_STORE
@ $32C5 label=CONSTANTS
b $32C5 THE TABLE OF CONSTANTS
D $32C5 This table holds five useful and frequently needed numbers: zero, one, a half, a half of pi, and ten. The numbers are held in a condensed form which is expanded by the routine at #R$33C6 to give the required floating-point form.
  $32C5,3 zero (00 00 00 00 00)
@ $32C8 label=stk_one
  $32C8,4 one (00 00 01 00 00)
@ $32CC label=stk_half
  $32CC,2 a half (80 00 00 00 00)
@ $32CE label=stk_pi_2
  $32CE,5 a half of pi (81 49 0F DA A2)
@ $32D3 label=stk_ten
  $32D3,4 ten (00 00 0A 00 00)
@ $32D7 label=CALCADDR
w $32D7 THE TABLE OF ADDRESSES
D $32D7 This table is a look-up table of the addresses of the sixty-six operational subroutines of the calculator. The offsets used to index into the table are derived either from the operation codes used in the routine at #R$24FB (see #R$2734, etc.) or from the literals that follow a 'RST 28' instruction.
  $32D7 00
  $32D9 01
  $32DB 02
  $32DD 03
  $32DF 04
  $32E1 05
  $32E3 06
  $32E5 07
  $32E7 08
  $32E9 09
  $32EB 0A
  $32ED 0B
  $32EF 0C
  $32F1 0D
  $32F3 0E
  $32F5 0F
  $32F7 10
  $32F9 11
  $32FB 12
  $32FD 13
  $32FF 14
  $3301 15
  $3303 16
  $3305 17
  $3307 18
  $3309 19
  $330B 1A
  $330D 1B
  $330F 1C
  $3311 1D
  $3313 1E
  $3315 1F
  $3317 20
  $3319 21
  $331B 22
  $331D 23
  $331F 24
  $3321 25
  $3323 26
  $3325 27
  $3327 28
  $3329 29
  $332B 2A
  $332D 2B
  $332F 2C
  $3331 2D
  $3333 2E
  $3335 2F
  $3337 30
  $3339 31
  $333B 32
  $333D 33
  $333F 34
  $3341 35
  $3343 36
  $3345 37
  $3347 38
  $3349 39
  $334B 3A
  $334D 3B
  $334F 3C
  $3351 3D
  $3353 3E
  $3355 3F
  $3357 40
  $3359 41
E $32D7 Note: The last four subroutines are multi-purpose subroutines and are entered with a parameter that is a copy of the right hand five bits of the original literal. The full set follows:
E $32D7 #LIST { Offset 3E: series-06, series-08 & series-0C; literals 86, 88 & 8C. } { Offset 3F: stk-zero, stk-one, stk-half, stk-pi/2 & stk-ten; literals A0 to A4. } { Offset 40: st-mem-0, st-mem-1, st-mem-2, st-mem-3, st-mem-4 & st-mem-5; literals C0 to C5. } { Offset 41: get-mem-0, get-mem-1, get-mem-2, get-mem-3, get-mem-4 & get-mem-5; literals E0 to E5. } LIST#
@ $335B label=CALCULATE
c $335B THE 'CALCULATE' SUBROUTINE
@ $335E label=GEN_ENT_1
@ $3362 label=GEN_ENT_2
@ $3365 label=RE_ENTRY
@ $336C label=SCAN_ENT
@ $3380 label=FIRST_3D
@ $338C label=DOUBLE_A
@ $338E label=ENT_TABLE
@ $3397 nowarn
@ $33A1 label=delete
@ $33A2 label=fp_calc_2
c $33A2 THE 'SINGLE OPERATION' SUBROUTINE
@ $33A9 label=TEST_5_SP
c $33A9 THE 'TEST 5-SPACES' SUBROUTINE
@ $33AB keep
@ $33B4 label=STACK_NUM
c $33B4 THE 'STACK NUMBER' SUBROUTINE
@ $33C0 label=MOVE_FP
c $33C0 THE 'MOVE A FLOATING-POINT NUMBER' SUBROUTINE
@ $33C6 label=STK_DATA
c $33C6 THE 'STACK LITERALS' SUBROUTINE
@ $33C8 label=STK_CONST
@ $33DE label=FORM_EXP
@ $33F1 label=STK_ZEROS
@ $33F7 label=SKIP_CONS
c $33F7 THE 'SKIP CONSTANTS' SUBROUTINE
@ $33F8 label=SKIP_NEXT
@ $33FB keep
@ $3406 label=LOC_MEM
c $3406 THE 'MEMORY LOCATION' SUBROUTINE
@ $340F label=get_mem_0
c $340F THE 'GET FROM MEMORY AREA' SUBROUTINE
@ $341B label=stk_zero_2
c $341B THE 'STACK A CONSTANT' SUBROUTINE
@ $342D label=st_mem_0
c $342D THE 'STORE IN MEMORY AREA' SUBROUTINE
@ $343C label=EXCHANGE
c $343C THE 'EXCHANGE' SUBROUTINE
@ $343E label=SWAP_BYTE
@ $3449 label=series_06
c $3449 THE 'SERIES GENERATOR' SUBROUTINE
B $344D,13,1
@ $3453 label=G_LOOP
B $3460,9,1
@ $346A label=abs
c $346A THE 'ABSOLUTE MAGNITUDE' FUNCTION
@ $346E label=NEGATE
c $346E THE 'UNARY MINUS' OPERATION
@ $3474 label=NEG_TEST
@ $3483 label=INT_CASE
@ $3492 label=sgn
c $3492 THE 'SIGNUM' FUNCTION
@ $3497 keep
@ $34A5 label=f_in
c $34A5 THE 'IN' FUNCTION
@ $34AC label=peek
c $34AC THE 'PEEK' FUNCTION
@ $34B0 label=IN_PK_STK
@ $34B3 label=usr_no
c $34B3 THE 'USR' FUNCTION
@ $34B6 nowarn
@ $34BC label=usr
c $34BC THE 'USR STRING' FUNCTION
@ $34D3 label=USR_RANGE
@ $34E4 label=USR_STACK
@ $34E7 label=REPORT_A
B $34E8,1
@ $34E9 label=TEST_ZERO
c $34E9 THE 'TEST-ZERO' SUBROUTINE
@ $34F9 label=GREATER_0
c $34F9 THE 'GREATER THAN ZERO' OPERATION
@ $3501 label=f_not
c $3501 THE 'NOT' FUNCTION
@ $3506 label=less_0
c $3506 THE 'LESS THAN ZERO' OPERATION
@ $3507 label=SIGN_TO_C
@ $350B label=FP_0_1
c $350B THE 'ZERO OR ONE' SUBROUTINE
@ $351B label=OR_CMD
c $351B THE 'OR' OPERATION
@ $3524 label=no_no
c $3524 THE 'NUMBER AND NUMBER' OPERATION
@ $352D label=str_no
c $352D THE 'STRING AND NUMBER' OPERATION
@ $353B label=no_l_eql
c $353B THE 'COMPARISON' OPERATIONS
@ $3543 label=EX_OR_NOT
@ $354E label=NU_OR_STR
@ $3559 label=STRINGS
@ $3564 label=BYTE_COMP
@ $356B label=SECND_LOW
@ $3572 label=BOTH_NULL
@ $3575 label=SEC_PLUS
@ $3585 label=FRST_LESS
@ $3588 label=STR_TEST
B $358A,2,1
@ $358C label=END_TESTS
@ $359C label=strs_add
c $359C THE 'STRING CONCATENATION' OPERATION
@ $35B7 label=OTHER_STR
@ $35BF label=STK_PNTRS
c $35BF THE 'STK-PNTRS' SUBROUTINE
@ $35C9 label=chrs
c $35C9 THE 'CHR$' FUNCTION
@ $35D1 keep
@ $35DC label=REPORT_B_4
B $35DD,1
@ $35DE label=val
c $35DE THE 'VAL' AND 'VAL$' FUNCTION
@ $360C label=V_RPORT_C
@ $361F keep
@ $361F label=str
c $361F THE 'STR$' FUNCTION
@ $3645 label=read_in
c $3645 THE 'READ-IN' SUBROUTINE
@ $3657 keep
@ $365F label=R_I_STORE
@ $3669 label=code
c $3669 THE 'CODE' FUNCTION
@ $3671 label=STK_CODE
@ $3674 label=len
c $3674 THE 'LEN' FUNCTION
@ $367A label=dec_jr_nz
c $367A THE 'DECREASE THE COUNTER' SUBROUTINE
@ $3686 label=JUMP
c $3686 THE 'JUMP' SUBROUTINE
@ $3687 label=JUMP_2
@ $368F label=jump_true
c $368F THE 'JUMP ON TRUE' SUBROUTINE
@ $369B label=end_calc
c $369B THE 'END-CALC' SUBROUTINE
@ $36A0 label=n_mod_m
c $36A0 THE 'MODULUS' SUBROUTINE
D $36A0 This subroutine calculates N (mod M), where M is a positive integer held at the top of the calculator stack (the 'last value'), and N is the integer held on the stack beneath M.
D $36A0 The subroutine returns the integer quotient INT (N/M) at the top of the calculator stack (the 'last value'), and the remainder N-INT (N/M) in the second place on the stack.
D $36A0 This subroutine is called during the calculation of a random number to reduce N mod 65537 decimal.
  $36A0 N, M
B $36A1,1 #R$342D(st_mem_0): N, M (mem-0 holds M)
B $36A2,1 #R$33A1: N
B $36A3,1 #R$33C0: N, N
B $36A4,1 #R$340F(get_mem_0): N, N, M
B $36A5,1 #R$31AF: N, N/M
B $36A6,1 #R$36AF: N, INT (N/M)
B $36A7,1 #R$340F(get_mem_0): N, INT (N/M), M
B $36A8,1 #R$343C: N, M, INT (N/M)
B $36A9,1 #R$342D(st_mem_0): N, M, INT (N/M) (mem-0 holds INT (N/M))
B $36AA,1 #R$30CA: N, M*INT (N/M)
B $36AB,1 #R$300F: N-M*INT (N/M)
B $36AC,1 #R$340F(get_mem_0): N-M*INT (N/M), INT (N/M)
B $36AD,1 #R$369B
  $36AE Finished.
@ $36AF label=int
c $36AF THE 'INT' FUNCTION
D $36AF This subroutine handles the function INT X and returns a 'last value' that is the 'integer part' of the value supplied. Thus INT 2.4 gives 2 but as the subroutine always rounds the result down INT -2.4 gives -3.
D $36AF The subroutine uses #R$3214 to produce I(X) such that I(2.4)=2 and I(-2.4)=-2. Thus, INT X is given by I(X) when X>=0, and by I(X)-1 for negative values of X that are not already integers, when the result is, of course, I(X).
  $36AF X
B $36B0,1 #R$33C0: X, X
B $36B1,1 #R$3506: X, (1/0)
B $36B2,2,1 #R$368F to #R$36B7: X
N $36B4 For values of X that have been shown to be greater than or equal to zero there is no jump and I(X) is readily found.
B $36B4,1 #R$3214: I(X)
B $36B5,1 #R$369B
  $36B6 Finished.
N $36B7 When X is a negative integer I(X) is returned, otherwise I(X)-1 is returned.
@ $36B7 label=X_NEG
B $36B7,1 #R$33C0: X, X
B $36B8,1 #R$3214: X, I(X)
B $36B9,1 #R$342D(st_mem_0): X, I(X) (mem-0 holds I(X))
B $36BA,1 #R$300F: X-I(X)
B $36BB,1 #R$340F(get_mem_0): X-I(X), I(X)
B $36BC,1 #R$343C: I(X), X-I(X)
B $36BD,1 #R$3501: I(X), (1/0)
B $36BE,2,1 #R$368F to #R$36C2: I(X)
N $36C0 The jump is made for values of X that are negative integers, otherwise there is no jump and I(X)-1 is calculated.
B $36C0,1 #R$341B(stk_one): I(X), 1
B $36C1,1 #R$300F: I(X)-1
N $36C2 In either case the subroutine finishes with;
@ $36C2 label=EXIT
B $36C2,1 #R$369B: I(X) or I(X)-1
@ $36C4 label=EXP
c $36C4 THE 'EXPONENTIAL' FUNCTION
D $36C4 This subroutine handles the function EXP X and is the first of four routines that use the #R$3449(series generator) to produce Chebyshev polynomials.
D $36C4 The approximation to EXP X is found as follows:
D $36C4 #LIST { i. X is divided by LN 2 to give Y, so that 2**Y is now the required result. } { ii. The value N is found, such that N=INT Y. } { iii. The value W=Y-N is found; 0<=W<=1, as required for the series to converge. } { iv. The argument Z=2*W-1 is formed. } { v. The #R$3449(series generator) is used to return 2**W. } { vi. Finally N is added to the exponent, giving 2**(N+W), which is 2**Y and therefore the required answer. } LIST#
  $36C4 X
N $36C5 Perform step i.
B $36C5,1 #R$3297: X (in full floating-point form)
B $36C6,6,1,5 #R$33C6: X, 1/LN 2
B $36CC,1 #R$30CA: X/LN 2=Y
N $36CD Perform step ii.
B $36CD,1 #R$33C0
B $36CD,1 #R$33C0: Y, Y
B $36CE,1 #R$36AF: Y, INT Y=N
B $36CF,1 #R$342D(st_mem_3): Y, N (mem-3 holds N)
N $36D0 Perform step iii.
B $36D0,1 #R$300F
B $36D0,1 #R$300F: Y-N=W
N $36D1 Perform step iv.
B $36D1,1 #R$33C0
B $36D1,1 #R$33C0: W, W
B $36D2,1 #R$3014: 2*W
B $36D3,1 #R$341B(stk_one): 2*W, 1
B $36D4,1 #R$300F: 2*W-1=Z
N $36D5 Perform step v, passing to the #R$3449(series generator) the parameter '8' and the eight constants required.
B $36D5,1 #R$3449(series_08): Z
B $36D6,33,2,3,4,4,5
N $36F7 At the end of the last loop the 'last value' is 2**W.
N $36F7 Perform step vi.
B $36F7,1 #R$340F(get_mem_3): 2**W, N
B $36F8,1 #R$369B
  $36F9 The absolute value of N mod 256 decimal is put into the #REGa register.
  $36FC Jump forward if N was negative.
  $36FE Error if ABS N>255 dec.
  $3700 Now add ABS N to the exponent.
  $3701 Jump unless e>255 dec.
N $3703 Report 6 - Number too big
@ $3703 label=REPORT_6_2
M $3703,2 Call the error handling routine.
B $3704,1
@ $3705 label=N_NEGTV
  $3705 The result is to be zero if N<-255 decimal.
  $3707 Subtract ABS N from the exponent as N was negative.
  $3708 Zero result if e less than zero.
  $370A Minus e is changed to e.
@ $370C label=RESULT_OK
  $370C The exponent, e, is entered.
  $370D Finished: 'last value' is EXP X.
@ $370E label=RSLT_ZERO
  $370E Use the calculator to make the 'last value' zero.
B $370F,1 #R$33A1 (the stack is now empty)
B $3710,1 #R$341B(stk_zero): 0
B $3711,1 #R$369B
  $3712 Finished, with EXP X=0.
@ $3713 label=ln
c $3713 THE 'NATURAL LOGARITHM' FUNCTION
D $3713 This subroutine handles the function LN X and is the second of the four routines that use the #R$3449(series generator) to produce Chebyshev polynomials.
D $3713 The approximation to LN X is found as follows:
D $3713 #LIST { i. X is tested and report A is given if X is not positive. } { ii. X is then split into its true exponent, e', and its mantissa X'=X/(2**e'), where 0.5<=X'<1. } { iii. The required value Y1 or Y2 is formed: if X'>0.8 then Y1=e'*LN 2, otherwise Y2=(e'-1)*LN 2. } { iv. If X'>0.8 then the quantity X'-1 is stacked; otherwise 2*X'-1 is stacked. } { v. Now the argument Z is formed, being 2.5*X'-3 if X'>0.8, otherwise 5*X'-3. In each case, -1<=Z<=1, as required for the series to converge. } { vi. The #R$3449(series generator) is used to produce the required function. } { vii. Finally a simple multiplication and addition leads to LN X being returned as the 'last value'. } LIST#
  $3713 X
N $3714 Perform step i.
B $3714,1 #R$3297: X (in full floating-point form)
B $3715,1 #R$33C0: X, X
B $3716,1 #R$34F9: X, (1/0)
B $3717,1 #R$368F to #R$371C: X
B $3718,1 #R$30CA: X
B $3719,1 #R$369B: X
@ $371A label=REPORT_A_2
N $371A Report A - Invalid argument
M $371A,2 Call the error handling routine.
B $371B,1
N $371C Perform step ii.
@ $371C label=VALID
B $371C,1 #R$341B(stk_zero): X, 0 (the deleted 1 is overwritten with zero)
B $371D,1 #R$33A1: X
B $371E,1 #R$369B: X
  $371F The exponent, e, goes into #REGa.
  $3720 X is reduced to X'.
  $3722 The stack holds: X', e.
  $3725 X', e
B $3726,3,1,2 #R$33C6: X', e, 128 (decimal)
B $3729,1 #R$300F: X', e'
N $372A Perform step iii.
B $372A,1 #R$343C: e', X'
B $372B,1 #R$33C0: e', X', X'
B $372C,6,1,5 #R$33C6: e', X', X', 0.8 (decimal)
B $3732,1 #R$300F: e', X', X'-0.8
B $3733,1 #R$34F9: e', X', (1/0)
B $3734,2,1 #R$368F to #R$373D: e', X'
B $3736,1 #R$343C: X', e'
B $3737,1 #R$341B(stk_one): X', e', 1
B $3738,1 #R$300F: X', e'-1
B $3739,1 #R$343C: e'-1, X'
B $373A,1 #R$369B
  $373B Double X' to give 2*X'.
  $373C e'-1, 2*X'
@ $373D label=GRE_8
B $373D,1 #R$343C: X', e' (X'>0.8) or 2*X', e'-1 (X'<=0.8)
B $373E,6,1,5 #R$33C6: X', e', LN 2 or 2*X', e'-1, LN 2
B $3744,1 #R$30CA: X', e'*LN 2=Y1 or 2*X', (e'-1)*LN 2=Y2
N $3745 Perform step iv.
B $3745,1 #R$343C: Y1, X' (X'>0.8) or Y2, 2*X' (X'<=0.8)
B $3746,1 #R$341B(stk_half):  Y1, X', .5 or Y2, 2*X', .5
B $3747,1 #R$300F: Y1, X'-.5 or Y2, 2*X'-.5
B $3748,1 #R$341B(stk_half): Y1, X'-.5, .5 or Y2, 2*X'-.5, .5
B $3749,1 #R$300F: Y1, X'-1 or Y2, 2*X'-1
N $374A Perform step v.
B $374A,1 #R$33C0: Y, X'-1, X'-1 or Y2, 2*X'-1, 2*X'-1
B $374B,3,1,2 #R$33C6:  Y1, X'-1, X'-1, 2.5 (decimal) or Y2, 2*X'-1, 2*X'-1, 2.5
B $374E,1 #R$30CA: Y1, X'-1, 2.5*X'-2.5 or Y2, 2*X'-1, 5*X'-2.5
B $374F,1 #R$341B(stk_half): Y1, X'-1, 2.5*X'-2.5, .5 or Y2, 2*X'-1, 5*X'-2.5, .5
B $3750,1 #R$300F: Y1, X'-1, 2.5*X'-3=Z or Y2, 2*X'-1, 5*X'-3=Z
N $3751 Perform step vi, passing to the #R$3449(series generator) the parameter '12' decimal, and the twelve constants required.
B $3751,1 #R$3449(series_0C): Y1, X'-1, Z or Y2, 2*X'-1, Z
B $3752,45,2,2,3,3,3,4,4,4,5,5,5,5
N $377F At the end of the last loop the 'last value' is:
N $377F #LIST { LN X'/(X'-1) if X'>0.8 } { LN (2*X')/(2*X'-1) if X'<=0.8 } LIST#
N $377F Perform step vii.
B $377F,1 #R$30CA: Y1=LN (2**e'), LN X' or Y2=LN (2**(e'-1)), LN (2*X')
B $3780,1 #R$3014: LN (2**e')*X')=LN X or LN (2**(e'-1)*2*X')=LN X
B $3781,1 #R$369B: LN X
  $3782 Finished: 'last value' is LN X.
@ $3783 label=get_argt
c $3783 THE 'REDUCE ARGUMENT' SUBROUTINE
D $3783 This subroutine transforms the argument X of SIN X or COS X into a value V.
D $3783 The subroutine first finds the value Y=X/2#pi-INT(X/2#pi+0.5), where 0.5<=Y<0.5.
D $3783 The subroutine returns with:
D $3783 #LIST { V=4*Y if -1<=4*Y<=1 (case i) } { or V=2-4*Y if 1<4*Y<2 (case ii) } { or V=-4*Y-2 if -2<=4*Y<-1 (case iii) } LIST#
D $3783 In each case, -1<=V<=1 and SIN (#piV/2)=SIN X.
  $3783 X
B $3784,1 #R$3297: X (in full floating-point form)
B $3785,6,1,5 #R$33C6: X, 1/2#pi
B $378B,1 #R$30CA: X/2#pi
B $378C,1 #R$33C0: X/2#pi, X/2#pi
B $378D,1 #R$341B(stk_half): X/2#pi, X/2#pi, 0.5
B $378E,1 #R$3014: X/2#pi, X/2#pi+0.5
B $378F,1 #R$36AF: X/2#pi, INT (X/2#pi+0.5)
B $3790,1 #R$300F: X/2#pi-INT (X/2#pi+0.5)=Y
N $3791 Note: Adding 0.5 and taking INT rounds the result to the nearest integer.
B $3791,1 #R$33C0: Y, Y
B $3792,1 #R$3014: 2*Y
B $3793,1 #R$33C0: 2*Y, 2*Y
B $3794,1 #R$3014: 4*Y
B $3795,1 #R$33C0: 4*Y, 4*Y
B $3796,1 #R$346A: 4*Y, ABS (4*Y)
B $3797,1 #R$341B(stk_one): 4*Y, ABS (4*Y), 1
B $3798,1 #R$300F: 4*Y, ABS (4*Y)-1=Z
B $3799,1 #R$33C0: 4*Y, Z, Z
B $379A,1 #R$34F9: 4*Y, Z, (1/0)
B $379B,1 #R$342D(st_mem_0): (mem-0 holds the result of the test)
B $379C,2,1 #R$368F to #R$37A1: 4*Y, Z
B $379E,1 #R$33A1: 4*Y
B $379F,1 #R$369B: 4*Y=V (case i)
  $37A0 Finished.
N $37A1 If the jump was made then continue.
@ $37A1 label=ZPLUS
B $37A1,1 #R$341B(stk_one): 4*Y, Z, 1
B $37A2,1 #R$300F: 4*Y, Z-1
B $37A3,1 #R$343C: Z-1, 4*Y
B $37A4,1 #R$3506: Z-1, (1/0)
B $37A5,2,1 #R$368F to #R$37A8: Z-1
B $37A7,1 #R$346E: 1-Z
B $37A8,1 #R$369B: 1-Z=V (case ii) or Z-1=V (case iii)
@ $37A8 label=YNEG
  $37A9 Finished.
@ $37AA label=cos
c $37AA THE 'COSINE' FUNCTION
D $37AA This subroutine handles the function COS X and returns a 'last value' 'that is an approximation to COS X.
D $37AA The subroutine uses the expression COS X=SIN (#piW/2), where -1<=W<=1.
D $37AA In deriving W for X the subroutine uses the test result obtained in the previous subroutine and stored for this purpose in mem-0. It then jumps to the #R$37B5 subroutine, entering at #R$37B7, to produce a 'last value' of COS X.
  $37AA X
B $37AB,1 #R$3783: V
B $37AC,1 #R$346A: ABS V
B $37AD,1 #R$341B(stk_one): ABS V, 1
B $37AE,1 #R$300F: ABS V-1
B $37AF,1 #R$340F(get_mem_0): ABS V-1, (1/0)
B $37B0,2,1 #R$368F to #R$37B7: ABS V-1=W
N $37B2 If the jump was not made then continue.
B $37B2,1 #R$346E: 1-ABS V
B $37B3,2,1 #R$3686 to #R$37B7: 1-ABS V=W
@ $37B5 label=sin
c $37B5 THE 'SINE' FUNCTION
D $37B5 This subroutine handles the function SIN X and is the third of the four routines that use the #R$3449(series generator) to produce Chebyshev polynomials.
D $37B5 The approximation to SIN X is found as follows:
D $37B5 #LIST { i. The argument X is reduced to W, such that SIN (#pi*W/2)=SIN X. Note that -1<=W<=1, as required for the series to converge. } { ii. The argument Z=2*W*W-1 is formed. } { iii. The #R$3449(series generator) is used to return (SIN (#pi*W/2))/W. } { iv. Finally a simple multiplication by W gives SIN X. } LIST#
  $37B5 X
N $37B6 Perform step i.
B $37B6,1 #R$3783: W
N $37B7 Perform step ii. The subroutine from now on is common to both the SINE and COSINE functions.
@ $37B7 label=C_ENT
B $37B7,1 #R$33C0: W, W
B $37B8,1 #R$33C0: W, W, W
B $37B9,1 #R$30CA: W, W*W
B $37BA,1 #R$33C0: W, W*W, W*W
B $37BB,1 #R$3014: W, 2*W*W
B $37BC,1 #R$341B(stk_one): W, 2*W*W, 1
B $37BD,1 #R$300F: W, 2*W*W-1=Z
N $37BE Perform step iii, passing to the #R$3449(series generator) the parameter '6' and the six constants required.
B $37BE,1 #R$3449(series_06): W, Z
B $37BF,24,2,3,4,5
N $37D7 At the end of the last loop the 'last value' is (SIN (#pi*W/2))/W.
N $37D7 Perform step iv.
B $37D7,1 #R$30CA: SIN (#pi*W/2)=SIN X (or COS X)
B $37D8,1 #R$369B
  $37D9 Finished: 'last value'=SIN X (or COS X).
@ $37DA label=tan
c $37DA THE 'TAN' FUNCTION
B $37DB,6,1
@ $37E2 label=atn
c $37E2 THE 'ARCTAN' FUNCTION
D $37E2 This subroutine handles the function ATN X and is the last of the four routines that use the #R$3449(series generator) to produce Chebyshev polynomials. It returns a real number between -#pi/2 and #pi/2, which is equal to the value in radians of the angle whose tan is X.
D $37E2 The approximation to ATN X is found as follows:
D $37E2 i. The values W and Y are found for three cases of X, such that:
D $37E2 #LIST { if -1<X<1 then W=0, Y=X (case i) } { if 1<=X then W=#pi/2, Y=-1/X (case ii) } { if X<=-1 then W=-#pi/2, Y=-1/X (case iii) } LIST#
D $37E2 In each case, -1<=Y<=1, as required for the series to converge.
D $37E2 ii. The argument Z is formed, such that:
D $37E2 #LIST { if -1<X<1 then Z=2*Y*Y-1=2*X*X-1 (case i) } { otherwise Z=2*Y*Y-1=2/(X*X)-1 (cases ii and iii) } LIST#
D $37E2 iii. The #R$3449(series generator) is used to produce the required function.
D $37E2 iv. Finally a simple multiplication and addition give ATN X.
D $37E2 Perform step i.
  $37E2 Use the full floating-point form of X.
  $37E5 Fetch the exponent of X.
  $37E6 Jump forward for case i: Y=X.
  $37EA X
B $37EB,1 #R$341B(stk_one): X, 1
B $37EC,1 #R$346E: X, -1
B $37ED,1 #R$343C: -1, X
B $37EE,1 #R$31AF: -1/X
B $37EF,1 #R$33C0: -1/X, -1/X
B $37F0,1 #R$3506: -1/X, (1/0)
B $37F1,1 #R$341B(stk_pi_2): -1/X, (1/0), #pi/2
B $37F2,1 #R$343C: -1/X, #pi/2, (1/0)
B $37F3,2,1 #R$368F to #R$37FA for case ii: -1/X, #pi/2
B $37F5,1 #R$346E: -1/X, -#pi/2
B $37F6,2,1 #R$3686 to #R$37FA for case iii: -1/X, -#pi/2
@ $37F8 label=SMALL
B $37F9,1 #R$341B(stk_zero): Y, 0; continue for case i: W=0
N $37FA Perform step ii.
@ $37FA label=CASES
B $37FA,1 #R$343C: W, Y
B $37FB,1 #R$33C0: W, Y, Y
B $37FC,1 #R$33C0: W, Y, Y, Y
B $37FD,1 #R$30CA: W, Y, Y*Y
B $37FE,1 #R$33C0: W, Y, Y*Y, Y*Y
B $37FF,1 #R$3014: W, Y, 2*Y*Y
B $3800,1 #R$341B(stk_one): W, Y, 2*Y*Y, 1
B $3801,1 #R$300F: W, Y, 2*Y*Y-1=Z
N $3802 Perform step iii, passing to the #R$3449(series generator) the parameter '12' decimal, and the twelve constants required.
B $3802,1 #R$3449(series_0C): W, Y, Z
B $3803,44,2,2,3,3,3,4,4,3,5
N $382F At the end of the last loop the 'last value' is:
N $382F #LIST { ATN X/X (case i) } { ATN (-1/X)/(-1/X) (cases ii and iii) } LIST#
N $382F Perform step iv.
B $382F,1 #R$30CA: W, ATN X (case i) or W, ATN (-1/X) (cases ii and iii)
B $3830,1 #R$3014: ATN X (all cases now)
B $3831,1 #R$369B
  $3832 Finished: 'last value'=ATN X.
@ $3833 label=asn
c $3833 THE 'ARCSIN' FUNCTION
D $3833 This subroutine handles the function ASN X and returns a real real number from -#pi/2 to #pi/2 inclusive which is equal to the value in radians of the angle whose sine is X. Thereby if Y=ASN X then X=SIN Y.
D $3833 This subroutine uses the trigonometric identity TAN (Y/2)=SIN Y/1(1+COS Y) to obtain TAN (Y/2) and hence (using ATN) Y/2 and finally Y.
  $3833 X
B $3834,1 #R$33C0: X, X
B $3835,1 #R$33C0: X, X, X
B $3836,1 #R$30CA: X, X*X
B $3837,1 #R$341B(stk_one): X, X*X, 1
B $3838,1 #R$300F: X, X*X-1
B $3839,1 #R$346E: X, 1-X*X
B $383A,1 #R$384A: X, SQR (1-X*X)
B $383B,1 #R$341B(stk_one): X, SQR (1-X*X), 1
B $383C,1 #R$3014: X, 1+SQR (1-X*X)
B $383D,1 #R$31AF: X/(1+SQR (1-X*X))=TAN (Y/2)
B $383E,1 #R$37E2: Y/2
B $383F,1 #R$33C0: Y/2, Y/2
B $3840,1 #R$3014: Y=ASN X
B $3841,1 #R$369B
  $3842 Finished: 'last value'=ASN X.
@ $3843 label=acs
c $3843 THE 'ARCCOS' FUNCTION
B $3844,5,1
@ $384A label=sqr
c $384A THE 'SQUARE ROOT' FUNCTION
B $384B,6,1
@ $3851 label=to_power
c $3851 THE 'EXPONENTIATION' OPERATION
D $3851 This subroutine performs the binary operation of raising the first number, X, to the power of the second number, Y.
D $3851 The subroutine treats the result X**Y as being equivalent to EXP (Y*LN X). It returns this value unless X is zero, in which case it returns 1 if Y is also zero (0**0=1), returns zero if Y is positive, and reports arithmetic overflow if Y is negative.
  $3851 X, Y
B $3852,1 #R$343C: Y, X
B $3853,1 #R$33C0: Y, X, X
B $3854,1 #R$3501: Y, X, (1/0)
B $3855,2,1 #R$368F to #R$385D: Y, X
N $3857 The jump is made if X=0, otherwise EXP (Y*LN X) is formed.
B $3857,1 #R$3713: Y, LN X
N $3858 Giving report A if X is negative.
B $3858,1 #R$30CA: Y*LN X
B $3859,1 #R$369B
  $385A Exit via #R$36C4 to form EXP (Y*LN X).
N $385D The value of X is zero so consider the three possible cases involved.
@ $385D label=XIS0
B $385D,1 #R$33A1: Y
B $385E,1 #R$33C0: Y, Y
B $385F,1 #R$3501: Y, (1/0)
B $3860,2,1 #R$368F to #R$386A: Y
N $3862 The jump is made if X=0 and Y=0, otherwise proceed.
B $3862,1 #R$341B(stk_zero): Y, 0
B $3863,1 #R$343C: 0, Y
B $3864,1 #R$34F9: 0, (1/0)
B $3865,2,1 #R$368F to #R$386C: 0
N $3867 The jump is made if X=0 and Y is positive, otherwise proceed.
B $3867,1 #R$341B(stk_one): 0, 1
B $3868,1 #R$343C: 1, 0
B $3869,1 #R$31AF: Exit via #R$31AF as dividing by zero gives 'arithmetic overflow'.
N $386A The result is to be 1 for the operation.
@ $386A label=ONE
B $386A,1 #R$33A1: -
B $386B,1 #R$341B(stk_one): 1
N $386C Now return with the 'last value' on the stack being 0**Y.
@ $386C label=LAST
B $386C,1 #R$369B: (1/0)
  $386D Finished: 'last value' is 0 or 1.
s $386E
  $386E,1170,1170:$FF These locations are 'spare'. They all hold +FF.
@ $3D00 label=CHARSET
b $3D00 Character set
D $3D00 These locations hold the 'character set'. There are 8-byte representations for all the characters with codes +20 (space) to +7F (#CHR169).
  $3D00,8,b1 #UDG$3D00
  $3D08,8,b1 #UDG$3D08
  $3D10,8,b1 #UDG$3D10
  $3D18,8,b1 #UDG$3D18
  $3D20,8,b1 #UDG$3D20
  $3D28,8,b1 #UDG$3D28
  $3D30,8,b1 #UDG$3D30
  $3D38,8,b1 #UDG$3D38
  $3D40,8,b1 #UDG$3D40
  $3D48,8,b1 #UDG$3D48
  $3D50,8,b1 #UDG$3D50
  $3D58,8,b1 #UDG$3D58
  $3D60,8,b1 #UDG$3D60
  $3D68,8,b1 #UDG$3D68
  $3D70,8,b1 #UDG$3D70
  $3D78,8,b1 #UDG$3D78
  $3D80,8,b1 #UDG$3D80
  $3D88,8,b1 #UDG$3D88
  $3D90,8,b1 #UDG$3D90
  $3D98,8,b1 #UDG$3D98
  $3DA0,8,b1 #UDG$3DA0
  $3DA8,8,b1 #UDG$3DA8
  $3DB0,8,b1 #UDG$3DB0
  $3DB8,8,b1 #UDG$3DB8
  $3DC0,8,b1 #UDG$3DC0
  $3DC8,8,b1 #UDG$3DC8
  $3DD0,8,b1 #UDG$3DD0
  $3DD8,8,b1 #UDG$3DD8
  $3DE0,8,b1 #UDG$3DE0
  $3DE8,8,b1 #UDG$3DE8
  $3DF0,8,b1 #UDG$3DF0
  $3DF8,8,b1 #UDG$3DF8
  $3E00,8,b1 #UDG$3E00
  $3E08,8,b1 #UDG$3E08
  $3E10,8,b1 #UDG$3E10
  $3E18,8,b1 #UDG$3E18
  $3E20,8,b1 #UDG$3E20
  $3E28,8,b1 #UDG$3E28
  $3E30,8,b1 #UDG$3E30
  $3E38,8,b1 #UDG$3E38
  $3E40,8,b1 #UDG$3E40
  $3E48,8,b1 #UDG$3E48
  $3E50,8,b1 #UDG$3E50
  $3E58,8,b1 #UDG$3E58
  $3E60,8,b1 #UDG$3E60
  $3E68,8,b1 #UDG$3E68
  $3E70,8,b1 #UDG$3E70
  $3E78,8,b1 #UDG$3E78
  $3E80,8,b1 #UDG$3E80
  $3E88,8,b1 #UDG$3E88
  $3E90,8,b1 #UDG$3E90
  $3E98,8,b1 #UDG$3E98
  $3EA0,8,b1 #UDG$3EA0
  $3EA8,8,b1 #UDG$3EA8
  $3EB0,8,b1 #UDG$3EB0
  $3EB8,8,b1 #UDG$3EB8
  $3EC0,8,b1 #UDG$3EC0
  $3EC8,8,b1 #UDG$3EC8
  $3ED0,8,b1 #UDG$3ED0
  $3ED8,8,b1 #UDG$3ED8
  $3EE0,8,b1 #UDG$3EE0
  $3EE8,8,b1 #UDG$3EE8
  $3EF0,8,b1 #UDG$3EF0
  $3EF8,8,b1 #UDG$3EF8
  $3F00,8,b1 #UDG$3F00
  $3F08,8,b1 #UDG$3F08
  $3F10,8,b1 #UDG$3F10
  $3F18,8,b1 #UDG$3F18
  $3F20,8,b1 #UDG$3F20
  $3F28,8,b1 #UDG$3F28
  $3F30,8,b1 #UDG$3F30
  $3F38,8,b1 #UDG$3F38
  $3F40,8,b1 #UDG$3F40
  $3F48,8,b1 #UDG$3F48
  $3F50,8,b1 #UDG$3F50
  $3F58,8,b1 #UDG$3F58
  $3F60,8,b1 #UDG$3F60
  $3F68,8,b1 #UDG$3F68
  $3F70,8,b1 #UDG$3F70
  $3F78,8,b1 #UDG$3F78
  $3F80,8,b1 #UDG$3F80
  $3F88,8,b1 #UDG$3F88
  $3F90,8,b1 #UDG$3F90
  $3F98,8,b1 #UDG$3F98
  $3FA0,8,b1 #UDG$3FA0
  $3FA8,8,b1 #UDG$3FA8
  $3FB0,8,b1 #UDG$3FB0
  $3FB8,8,b1 #UDG$3FB8
  $3FC0,8,b1 #UDG$3FC0
  $3FC8,8,b1 #UDG$3FC8
  $3FD0,8,b1 #UDG$3FD0
  $3FD8,8,b1 #UDG$3FD8
  $3FE0,8,b1 #UDG$3FE0
  $3FE8,8,b1 #UDG$3FE8
  $3FF0,8,b1 #UDG$3FF0
  $3FF8,8,b1 #UDG$3FF8
i $4000
