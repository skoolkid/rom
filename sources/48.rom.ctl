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
D $02BF This subroutine is called on every occasion that a maskable interrupt occurs. In normal operation this will happen once every 20 ms. The purpose of this subroutine is to scan the keyboard and decode the key value. The code produced will, if the 'repeat' status allows it, be passed to the system variable LAST-K. When a code is put into this system variable bit 5 of FLAGS is set to show that a 'new' key has been pressed.
  $02BF Fetch a key value in the #REGde register pair but return immediately if the zero flag is reset.
N $02C3 A double system of 'KSTATE system variables' (KSTATE0 - KSTATE 3 and KSTATE4 - KSTATE7) is used from now on.
N $02C3 The two sets allow for the detection of a new key being pressed (using one set) whilst still within the 'repeat period' of the previous key to have been pressed (details in the other set).
N $02C3 A set will only become free to handle a new key if the key is held down for about 1/10th. of a second, i.e. five calls to #R$02BF.
  $02C3 Start with KSTATE0.
@ $02C6 label=K_ST_LOOP
  $02C6 Jump forward if a 'set is free', i.e. KSTATE0/4 holds +FF.
  $02CA However if the set is not free decrease its '5 call counter' and when it reaches zero signal the set as free.
N $02D1 After considering the first set change the pointer and consider the second set.
@ $02D1 label=K_CH_SET
  $02D1 Fetch the low byte of the address and jump back if the second set has still to be considered.
N $02D8 Return now if the key value indicates 'no-key' or a shift key only.
  $02D8 Make the necessary tests and return if needed. Also change the key value to a 'main code'.
N $02DC A key stroke that is being repeated (held down) is now separated from a new key stroke.
  $02DC Look first at KSTATE0.
  $02DF Jump forward if the codes match - indicating a repeat.
  $02E2 Save the address of KSTATE0.
  $02E3 Now look at KSTATE4.
  $02E6 Jump forward if the codes match - indicating a repeat.
N $02E9 But a new key will not be accepted unless one of the sets of KSTATE system variables is 'free'.
  $02E9 Consider the second set.
  $02EB Jump forward if 'free'.
  $02ED Now consider the first set.
  $02EE Continue if the set is 'free' but exit if not.
N $02F1 The new key is to be accepted. But before the system variable LAST-K can be filled, the KSTATE system variables, of the set being used, have to be initialised to handle any repeats and the key's code has to be decoded.
@ $02F1 label=K_NEW
  $02F1 The code is passed to the #REGe register and to KSTATE0/4.
  $02F3 The '5 call counter' for this set is reset to '5'.
  $02F6 The third system variable of the set holds the REPDEL value (normally 0.7 secs.).
  $02FB Point to KSTATE3/7.
N $02FC The decoding of a 'main code' depends upon the present state of MODE, bit 3 of FLAGS and the 'shift byte'.
  $02FC Fetch MODE.
  $02FF Fetch FLAGS.
  $0302 Save the pointer whilst the 'main code' is decoded.
  $0307 The final code value is saved in KSTATE3/7, from where it is collected in case of a repeat.
N $0308 The next three instructions are common to the handling of both 'new keys' and 'repeat keys'.
@ $0308 label=K_END
  $0308 Enter the final code value into LAST-K and signal 'a new key'.
  $030F Finally return.
@ $0310 label=K_REPEAT
c $0310 THE 'REPEATING KEY' SUBROUTINE
@ $031E label=K_TEST
c $031E THE 'K-TEST' SUBROUTINE
@ $032C label=K_MAIN
@ $0333 label=K_DECODE
c $0333 THE 'KEYBOARD DECODING' SUBROUTINE
D $0333 This subroutine is entered with the 'main code' in the #REGe register, the value of FLAGS in the #REGd register, the value of MODE in the #REGc register and the 'shift byte' in the #REGb register.
D $0333 By considering these four values and referring, as necessary, to the #R$0205(six key tables) a 'final code' is produced. This is returned in the #REGa register.
  $0333 Copy the 'main code'.
  $0334 Jump forward if a digit key is being considered; also SPACE, ENTER and both shifts.
  $0338 Decrement the MODE value.
  $0339 Jump forward, as needed, for modes 'K', 'L', 'C' and 'E'.
N $033E Only 'graphics' mode remains and the 'final code' for letter keys in graphics mode is computed from the 'main code'.
  $033E Add the offset.
  $0340 Return with the 'final code'.
N $0341 Letter keys in extended mode are considered next.
@ $0341 ssub=LD HL,$022C-$41
@ $0341 label=K_E_LET
  $0341 The base address for #R$022C(table 'b').
  $0344 Jump forward to use this table if neither shift key is being pressed.
  $0347 Otherwise use the base address for #R$0246(table 'c').
N $034A Key tables 'b-f' are all served by the following look-up routine. In all cases a 'final code' is found and returned.
@ $034A label=K_LOOK_UP
  $034A Clear the #REGd register.
  $034C Index the required table and fetch the 'final code'.
  $034E Then return.
N $034F Letter keys in 'K', 'L' or 'C' modes are now considered. But first the special SYMBOL SHIFT codes have to be dealt with.
@ $034F ssub=LD HL,$026A-$41
@ $034F label=K_KLC_LET
  $034F The base address for #R$026A(table 'e').
  $0352 Jump back if using the SYMBOL SHIFT key and a letter key.
  $0356 Jump forward if currently in 'K' mode.
  $035A If CAPS LOCK is set then return with the 'main code'.
  $035F Also return in the same manner if CAPS SHIFT is being pressed.
  $0361 However if lower case codes are required then +20 has to be added to the 'main code' to give the correct 'final code'.
N $0364 The 'final code' values for tokens are found by adding +A5 to the 'main code'.
  $0364 Add the required offset and return.
N $0367 Next the digit keys, SPACE, ENTER and both shifts are considered.
@ $0367 label=K_DIGIT
  $0367,3,c2,1 Proceed only with the digit keys, i.e. return with SPACE (+20), ENTER (+0D) and both shifts (+0E).
  $036A Now separate the digit keys into three groups - according to the mode.
  $036B Jump with 'K', 'L' and 'C' modes, and also with 'G' mode. Continue with 'E' mode.
@ $0370 ssub=LD HL,$0284-$30
  $0370 The base address for #R$0284(table 'f').
  $0373 Use this table for SYMBOL SHIFT and a digit key in extended mode.
  $0377,4,c2,2 Jump forward with digit keys '8' and '9'.
N $037B The digit keys '0' to '7' in extended mode are to give either a 'paper colour code' or an 'ink colour code' depending on the use of CAPS SHIFT.
  $037B Reduce the range +30 to +37 giving +10 to +17.
  $037D Return with this 'paper colour code' if CAPS SHIFT is not being used.
  $037F But if it is then the range is to be +18 to +1F instead - indicating an 'ink colour code'.
N $0382 The digit keys '8' and '9' are to give 'BRIGHT' and 'FLASH' codes.
@ $0382 label=K_8_9
  $0382 +38 and +39 go to +02 and +03.
  $0384 Return with these codes if CAPS SHIFT is not being used. (These are 'BRIGHT' codes.)
  $0386 Subtract '2' if CAPS SHIFT is being used; giving +00 and +01 (as 'FLASH' codes).
N $0389 The digit keys in graphics mode are to give the block graphic characters (+80 to +8F), the GRAPHICS code (+0F) and the DELETE code (+0C).
@ $0389 ssub=LD HL,$0260-$30
@ $0389 label=K_GRA_DGT
  $0389 The base address of #R$0260(table 'd').
  $038C,8,c2,2,c2,2 Use this table directly for both digit key '9' that is to give GRAPHICS, and digit key '0' that is to give DELETE.
  $0394 For keys '1' to '8' make the range +80 to +87.
  $0398 Return with a value from this range if neither shift key is being pressed.
  $039A But if 'shifted' make the range +88 to +8F.
N $039D Finally consider the digit keys in 'K', 'L' and 'C' modes.
@ $039D label=K_KLC_DGT
  $039D Return directly if neither shift key is being used. (Final codes +30 to +39.)
  $039F Use #R$0260(table 'd') if the CAPS SHIFT key is also being pressed.
@ $03A1 ssub=LD HL,$0260-$30
N $03A6 The codes for the various digit keys and SYMBOL SHIFT can now be found.
  $03A6 Reduce the range to give +20 to +29.
  $03A8 Separate the '@' character from the others.
  $03AC The '_' character has also to be separated.
  $03AE Return now with the 'final codes' +21, +23 to +29.
  $03AF,3,c2,1 Give the '_' character a code of +5F.
@ $03B2 label=K_AT_CHAR
  $03B2,3,c2,1 Give the '@' character a code of +40.
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
D $04C2 This subroutine is called to save the header information and later the actual program/data block to tape.
  $04C2 Pre-load the machine stack with the address #R$053F.
@ $04C6 keep
  $04C6 This constant will give a leader of about 5 seconds for a 'header'.
  $04C9 Jump forward if saving a header.
@ $04CD keep
  $04CD This constant will give a leader of about 2 seconds for a program/data block.
@ $04D0 label=SA_FLAG
  $04D0 The flag is saved.
  $04D1 The 'length' is incremented and the 'base address' reduced to allow for the flag.
  $04D4 The maskable interrupt is disabled during the save.
  $04D5 Signal 'MIC on' and border to be red.
  $04D7 Give a value to #REGb.
N $04D8 A loop is now entered to create the pulses of the leader. Both the 'MIC on' and the 'MIC off' pulses are 2,168 T states in length. The colour of the border changes from red to cyan with each 'edge'.
@ $04D8 label=SA_LEADER
N $04D8 Note:             An 'edge' will be a transition either from 'on' to 'off', or from 'off' to 'on'.
  $04D8 The main timing period.
  $04DA MIC on/off, border red/cyan, on each pass.
  $04DE The main timing constant.
  $04E0 Decrease the low counter.
  $04E1 Jump back for another pulse.
  $04E3 Allow for the longer path (reduce by 13 T states).
  $04E4 Decrease the high counter.
  $04E5 Jump back for another pulse until completion of the leader.
N $04E8 A sync pulse is now sent.
@ $04EA label=SA_SYNC_1
  $04EA MIC off for 667 T states from 'OUT to OUT'.
  $04EC MIC on and red.
  $04EE Signal 'MIC off and cyan'.
  $04F0 MIC on for 735 T States from 'OUT to OUT'.
@ $04F2 label=SA_SYNC_2
  $04F4 Now MIC off and border cyan.
N $04F6 The header v. program/data flag will be the first byte to be saved.
@ $04F6 keep
  $04F6 +3B is a timing constant; +0E signals 'MIC off and yellow'.
  $04F9 Fetch the flag and pass it to the #REGl register for 'sending'.
  $04FB Jump forward into the saving loop.
N $04FE The byte saving loop is now entered. The first byte to be saved is the flag; this is followed by the actual data bytes and the final byte sent is the parity byte that is built up by considering the values of all the earlier bytes.
@ $04FE label=SA_LOOP
  $04FE The 'length' counter is tested and the jump taken when it has reached zero.
  $0502 Fetch the next byte that is to be saved.
@ $0505 label=SA_LOOP_P
  $0505 Fetch the current 'parity'.
  $0506 Include the present byte.
@ $0507 label=SA_START
  $0507 Restore the 'parity'. Note that on entry here the 'flag' value initialises 'parity'.
  $0508 Signal 'MIC on and blue'.
  $050A Set the carry flag. This will act as a 'marker' for the 8 bits of a byte.
  $050B Jump forward.
N $050E When it is time to send the 'parity' byte then it is transferred to the #REGl register for saving.
@ $050E label=SA_PARITY
  $050E Get final 'parity' value.
  $050F Jump back.
N $0511 The following inner loop produces the actual pulses. The loop is entered at #R$0514 with the type of the bit to be saved indicated by the carry flag. Two passes of the loop are made for each bit thereby making an 'off pulse' and an 'on pulse'. The pulses for a reset bit are shorter by 855 T states.
@ $0511 label=SA_BIT_2
  $0511 Come here on the second pass and fetch 'MIC off and yellow'.
  $0512 Set the zero flag to show 'second pass'.
@ $0514 label=SA_BIT_1
  $0514 The main timing loop; always 801 T states on a second pass.
  $0516 Jump, taking the shorter path, if saving a '0'.
  $0518 However if saving a '1' then add 855 T states.
@ $051A label=SA_SET
@ $051C label=SA_OUT
  $051C On the first pass 'MIC on and blue' and on the second pass 'MIC off and yellow'.
  $051E Set the timing constant for the second pass.
  $0520 Jump back at the end of the first pass; otherwise reclaim 13 T states.
  $0523 Clear the carry flag and set #REGa to hold +01 (MIC on and blue) before continuing into the '8 bit loop'.
N $0525 The '8 bit loop' is entered initially with the whole byte in the #REGl register and the carry flag set. However it is re-entered after each bit has been saved until the point is reached when the 'marker' passes to the carry flag leaving the #REGl register empty.
@ $0525 label=SA_8_BITS
  $0525 Move bit 7 to the carry and the 'marker' leftwards.
  $0527 Save the bit unless finished with the byte.
  $052A Decrease the 'counter'.
  $052B Advance the 'base address'.
  $052D Set the timing constant for the first bit of the next byte.
  $052F Return (to #R$053F) if the BREAK key is being pressed.
  $0535 Otherwise test the 'counter' and jump back even if it has reached zero (so as to send the 'parity' byte).
  $053A Exit when the 'counter' reaches +FFFF. But first give a short delay.
@ $053C label=SA_DELAY
E $04C2 Note: a reset bit will give a 'MIC off' pulse of 855 T states followed by a 'MIC on' pulse of 855 T states, whereas a set bit will give pulses of exactly twice as long. Note also that there are no gaps either between the sync pulse and the first bit of the flag, or between bytes.
@ $053F label=SA_LD_RET
c $053F THE 'SA/LD-RET' SUBROUTINE
@ $0552 label=REPORT_D
B $0553,1
@ $0554 label=SA_LD_END
@ $0556 label=LD_BYTES
c $0556 THE 'LD-BYTES' SUBROUTINE
D $0556 This subroutine is called to load the header information and later load or verify an actual block of data from a tape.
  $0556 This resets the zero flag. (#REGd cannot hold +FF.)
  $0557 The #REGa register holds +00 for a header and +FF for a block of data. The carry flag is reset for verifying and set for loading.
  $0558 Restore #REGd to its original value.
  $0559 The maskable interrupt is now disabled.
  $055A The border is made white.
@ $055E nowarn
  $055E Preload the machine stack with the address #R$053F.
  $0562 Make an initial read of port '254'.
  $0564 Rotate the byte obtained but keep only the EAR bit.
  $0567 Signal red border.
  $0569 Store the value in the #REGc register (+22 for 'off' and +02 for 'on' - the present EAR state).
  $056A Set the zero flag.
N $056B The first stage of reading a tape involves showing that a pulsing signal actually exists (i.e. 'on/off' or 'off/on' edges).
@ $056B label=LD_BREAK
  $056B Return if the BREAK key is being pressed.
@ $056C label=LD_START
  $056C Return with the carry flag reset if there is no 'edge' within approx. 14,000 T states. But if an 'edge' is found the border will go cyan.
N $0571 The next stage involves waiting a while and then showing that the signal is still pulsing.
@ $0571 keep
  $0571 The length of this waiting period will be almost one second in duration.
@ $0574 label=LD_WAIT
  $057B Continue only if two edges are found within the allowed time period.
N $0580 Now accept only a 'leader signal'.
@ $0580 label=LD_LEADER
  $0580 The timing constant.
  $0582 Continue only if two edges are found within the allowed time period.
  $0587 However the edges must have been found within about 3,000 T states of each other.
  $058C Count the pair of edges in the #REGh register until '256' pairs have been found.
N $058F After the leader come the 'off' and 'on' parts of the sync pulse.
@ $058F label=LD_SYNC
  $058F The timing constant.
  $0591 Every edge is considered until two edges are found close together - these will be the start and finishing edges of the 'off' sync pulse.
  $059B The finishing edge of the 'on' pulse must exist. (Return carry flag reset.)
N $059F The bytes of the header or the program/data block can now be loaded or verified. But the first byte is the type flag.
  $059F The border colours from now on will be blue and yellow.
  $05A3 Initialise the 'parity matching' byte to zero.
  $05A5 Set the timing constant for the flag byte.
  $05A7 Jump forward into the byte loading loop.
N $05A9 The byte loading loop is used to fetch the bytes one at a time. The flag byte is first. This is followed by the data bytes and the last byte is the 'parity' byte.
@ $05A9 label=LD_LOOP
  $05A9 Fetch the flags.
  $05AA Jump forward only when handling the first byte.
  $05AC Jump forward if verifying a tape.
  $05AE Make the actual load when required.
  $05B1 Jump forward to load the next byte.
@ $05B3 label=LD_FLAG
  $05B3 Keep the carry flag in a safe place temporarily.
  $05B5 Return now if the type flag does not match the first byte on the tape. (Carry flag reset.)
  $05B7 Restore the carry flag now.
  $05BA Increase the counter to compensate for its 'decrease' after the jump.
N $05BD If a data block is being verified then the freshly loaded byte is tested against the original byte.
@ $05BD label=LD_VERIFY
  $05BD Fetch the original byte.
  $05C0 Match it against the new byte.
  $05C1 Return if 'no match'. (Carry flag reset.)
N $05C2 A new byte can now be collected from the tape.
@ $05C2 label=LD_NEXT
  $05C2 Increase the 'destination'.
@ $05C4 label=LD_DEC
  $05C4 Decrease the 'counter'.
  $05C5 Save the flags.
  $05C6 Set the timing constant.
@ $05C8 label=LD_MARKER
  $05C8 Clear the 'object' register apart from a 'marker' bit.
N $05CA The following loop is used to build up a byte in the #REGl register.
@ $05CA label=LD_8_BITS
  $05CA Find the length of the 'off' and 'on' pulses of the next bit.
  $05CD Return if the time period is exceeded. (Carry flag reset.)
  $05CE Compare the length against approx. 2,400 T states, resetting the carry flag for a '0' and setting it for a '1'.
  $05D1 Include the new bit in the #REGl register.
  $05D3 Set the timing constant for the next bit.
  $05D5 Jump back whilst there are still bits to be fetched.
N $05D8 The 'parity matching' byte has to be updated with each new byte.
  $05D8 Fetch the 'parity matching' byte and include the new byte.
  $05DA Save it once again.
N $05DB Passes round the loop are made until the 'counter' reaches zero. At that point the 'parity matching' byte should be holding zero.
  $05DB Make a further pass if the #REGde register pair does not hold zero.
  $05DF Fetch the 'parity matching' byte.
  $05E0 Return with the carry flag set if the value is zero. (Carry flag reset if in error.)
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
D $0808 This routine controls the LOADing of a BASIC program, and its variables, or an array.
  $0808 Fetch the 'number of bytes' as given in the 'new header'.
  $080E Save the 'destination pointer'.
  $080F Jump forward unless trying to LOAD a previously undeclared array.
  $0813 Add three bytes to the length - for the name, the low length and the high length of a new variable.
  $0817 Jump forward.
N $0819 Consider now if there is enough room in memory for the new data block.
@ $0819 label=LD_CONT_1
  $0819 Fetch the size of the existing 'program+variables or array'.
  $0820 Jump forward if no extra room will be required (taking into account the reclaiming of the presently used memory).
N $0825 Make the actual test for room.
@ $0825 keep
@ $0825 label=LD_CONT_2
  $0825 Allow an overhead of five bytes.
  $0829 Move the result to the #REGbc register pair and make the test.
N $082E Now deal with the LOADing of arrays.
@ $082E label=LD_DATA
  $082E Fetch the 'pointer' anew.
  $082F Jump forward if LOADing a BASIC program.
  $0835 Jump forward if LOADing a new array.
  $0839 Fetch the 'length' of the existing array by collecting the length bytes from the variables area.
  $083D Point to its old name.
  $083E Add three bytes to the length - one for the name and two for the 'length'.
  $0841 Save the #REGix register pair temporarily whilst the old array is reclaimed.
N $084C Space is now made available for the new array - at the end of the present variables area.
@ $084C label=LD_DATA_1
  $084C Find the pointer to the end-marker of the variables area - the '80-byte'.
  $0850 Fetch the 'length' of the new array.
  $0856 Save this 'length'.
  $0857 Add three bytes - one for the name and two for the 'length'.
  $085A '#REGix+0E' of the old header gives the name of the array.
  $085D The name is saved whilst the appropriate amount of room is made available. In effect '#REGbc' spaces before the 'new 80-byte'.
  $0863 The name is entered.
  $0864 The 'length' is fetched and its two bytes are also entered.
  $0869 #REGhl now points to the first location that is to be filled with data from the tape.
  $086A This address is moved to the #REGix register pair; the carry flag set; 'data block' is signalled; and the block LOADed.
N $0873 Now deal with the LOADing of a BASIC program and its variables
@ $0873 label=LD_PROG
  $0873 Save the 'destination pointer'.
  $0874 Find the address of the end marker of the current variables area - the '80-byte'.
  $0878 Save #REGix temporarily.
  $087C Fetch the 'length' of the new data block.
  $0882 Keep a copy of the 'length' whilst the present program and variables areas are reclaimed.
  $0887 Save the pointer to the program area and the length of the new data block.
  $0889 Make sufficient room available for the new program and its variables.
  $088C Restore the #REGix register pair.
  $0890 The system variable VARS has also to be set for the new program.
  $089B If a line number was specified then it too has to be considered.
  $08A1 Jump if 'no number'; otherwise set NEWPPC and NSPPC.
N $08AD The data block can now be LOADed.
@ $08AD label=LD_PROG_1
  $08AD Fetch the 'length'.
  $08AE Fetch the 'start'.
  $08B0 Signal 'LOAD'.
  $08B1 Signal 'data block' only.
  $08B3 Now LOAD it.
@ $08B6 label=ME_CONTRL
c $08B6 THE 'MERGE' CONTROL ROUTINE
D $08B6 There are three main parts to this routine.
D $08B6 #LIST { Load the data block into the work space. } { Merge the lines of the new program into the old program. } { Merge the new variables into the old variables. } LIST#
D $08B6 Start therefore with the loading of the data block.
  $08B6 Fetch the 'length' of the data block.
  $08BC Save a copy of the 'length'.
  $08BD Now make 'length+1' locations available in the work space.
  $08BF Place an end marker in the extra location.
  $08C1 Move the 'start' pointer to the #REGhl register pair.
  $08C2 Fetch the original 'length'.
  $08C3 Save a copy of the 'start'.
  $08C4 Now set the #REGix register pair for the actual load.
  $08C7 Signal 'LOAD'.
  $08C8 Signal 'data block only'.
  $08CA Load the data block.
N $08CD The lines of the new program are merged with the lines of the old program.
  $08CD Fetch the 'start' of the new program.
  $08CE Initialise #REGde to the 'start' of the old program.
N $08D2 Enter a loop to deal with the lines of the new program.
@ $08D2 label=ME_NEW_LP
  $08D2 Fetch a line number and test it.
  $08D5 Jump when finished with all the lines.
N $08D7 Now enter an inner loop to deal with the lines of the old program.
@ $08D7 label=ME_OLD_LP
  $08D7 Fetch the high line number byte and compare it. Jump forward if it does not match but in any case advance both pointers.
  $08DD Repeat the comparison for the low line number bytes.
@ $08DF label=ME_OLD_L1
  $08DF Now retreat the pointers.
  $08E1 Jump forward if the correct place has been found for a line of the new program.
  $08E3 Otherwise find the address of the start of the next old line.
  $08E9 Go round the loop for each of the 'old lines'.
@ $08EB label=ME_NEW_L2
  $08EB Enter the 'new line' and go round the outer loop again.
N $08F0 In a similar manner the variables of the new program are merged with the variables of the old program.
@ $08F0 label=ME_VAR_LP
  $08F0 the new variables in turn.
  $08F0 Fetch each variable name in turn and test it.
  $08F2 Return when all the variables have been considered.
  $08F5 Save the current new pointer.
  $08F6 Fetch VARS (for the old program).
N $08F9 Now enter an inner loop to search the existing variables area.
@ $08F9 label=ME_OLD_VP
  $08F9 Fetch each variable name and test it.
  $08FC Jump forward once the end marker is found. (Make an 'addition'.)
  $08FE Compare the names (first bytes).
  $08FF Jump forward to consider it further, returning here if it proves not to match fully.
@ $0901 label=ME_OLD_V1
  $0901 Save the new variable's name whilst the next 'old variable' is located.
  $0906 Restore the pointer to the #REGde register pair and go round the loop again.
N $0909 The old and new variables match with respect to their first bytes but variables with long names will need to be matched fully.
@ $0909 label=ME_OLD_V2
  $0909 Consider bits 7, 6 and 5 only.
  $090B Accept all the variable types except 'long named variables'.
  $090F Make #REGde point to the first character of the 'new name'.
  $0911 Save the pointer to the 'old name'.
N $0912 Enter a loop to compare the letters of the long names.
@ $0912 label=ME_OLD_V3
  $0912 Update both the 'old' and the 'new' pointers.
  $0914 Compare the two letters Jump forward if the match fails.
  $0918 Go round the loop until the 'last character' is found.
  $091B Fetch the pointer to the start of the 'old' name and jump forward - successful.
@ $091E label=ME_OLD_V4
  $091E Fetch the pointer and jump back - unsuccessful.
N $0921 Come here if the match was found.
@ $0921 label=ME_VAR_L1
  $0921 Signal 'replace' variable.
N $0923 And here if not. (#REGa holds +80 - variable to be 'added'.)
@ $0923 label=ME_VAR_L2
  $0923 Fetch pointer to 'new' name.
  $0924 Switch over the registers.
  $0925 The zero flag is to be set if there is to be a 'replacement', reset for an 'addition'.
  $0926 Signal 'handling variables'.
  $0927 Now make the entry.
  $092A Go round the loop to consider the next new variable.
@ $092C label=ME_ENTER
c $092C THE 'MERGE A LINE OR A VARIABLE' SUBROUTINE
D $092C This subroutine is entered with the following parameters:
D $092C #LIST { Carry flag reset - MERGE a BASIC line. } { Carry flag set - MERGE a variable. } { Zero flag reset - it will be an 'addition'. } { Zero flag set - it is a 'replacement'. } { #REGhl register pair - points to the start of the new entry. } { #REGde register pair - points to where it is to MERGE. } LIST#
  $092C Jump if handling an 'addition'.
  $092E Save the flags.
  $092F Save the 'new' pointer whilst the 'old' line or variable is reclaimed.
  $093D Restore the flags.
N $093E The new entry can now be made.
@ $093E label=ME_ENT_1
  $093E Save the flags.
  $093F Make a copy of the 'destination' pointer.
  $0940 Find the length of the 'new' variable/line.
  $0943 Save the pointer to the 'new' variable/line.
  $0946 Fetch PROG - to avoid corruption.
  $0949 Save PROG on the stack and fetch the 'new' pointer.
  $094A Save the length.
  $094B Retrieve the flags.
  $094C Jump forward if adding a new variable.
  $094E A new line is added before the 'destination' location.
  $094F,3 Make the room for the new line.
  $0953 Jump forward.
@ $0955 label=ME_ENT_2
  $0955 Make the room for the new variable.
@ $0958 label=ME_ENT_3
  $0958 Point to the first new location.
  $0959 Retrieve the length.
  $095A Retrieve PROG and store it in its correct place.
  $095F Also fetch the 'new' pointer.
  $0963 Again save the length and the 'new' pointer.
  $0965 Switch the pointers and copy the 'new' variable/line into the room made for it.
N $0968 The 'new' variable/line has now to be removed from the work space.
  $0968 Fetch the 'new' pointer.
  $0969 Fetch the length.
  $096A Save the 'old' pointer. (Points to the location after the 'added' variable/line.)
  $096B Remove the variable/line from the work space.
  $096E Return with the 'old' pointer in the #REGde register pair.
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
D $0A6D The control characters from INK to OVER require a single operand whereas the control characters AT and TAB are required to be followed by two operands.
D $0A6D The present routine leads to the control character code being saved in TVDATA-lo, the first operand in TVDATA-hi or the #REGa register if there is only a single operand required, and the second operand in the #REGa register.
  $0A6D Save the first operand in TVDATA-hi and change the address of the 'output' routine to #R$0A87.
N $0A75 Enter here when handling the characters AT and TAB.
@ $0A75 nowarn
@ $0A75 label=PO_2_OPER
  $0A75 The character code will be saved in TVDATA-lo and the address of the 'output' routine changed to #R$0A6D.
N $0A7A Enter here when handling the colour items - INK to OVER.
@ $0A7A nowarn
@ $0A7A label=PO_1_OPER
  $0A7A The 'output' routine is to be changed to #R$0A87.
@ $0A7D label=PO_TV_1
  $0A7D Save the control character code.
N $0A80 The current 'output' routine address is changed temporarily.
  $0A80 #REGhl will point to the 'output' routine address.
  $0A83 Enter the new 'output' routine address and thereby force the next character code to be considered as an operand.
N $0A87 Once the operands have been collected the routine continues.
@ $0A87 nowarn
@ $0A87 label=PO_CONT
  $0A87 Restore the original address for #R$09F4.
  $0A8D Fetch the control code and the first operand if there are indeed two operands.
  $0A90 The 'last' operand and the control code are moved.
  $0A92 Jump forward if handling INK to OVER.
  $0A97 Jump forward if handling TAB.
N $0A99 Now deal with the AT control character.
  $0A99 The line number.
  $0A9A The column number.
  $0A9B Reverse the column number, i.e. +00 to +1F becomes +1F to +00.
  $0A9E Must be in range.
  $0AA0 Add in the offset to give #REGc holding +21 to +02.
  $0AA3 Jump forward if handling the printer.
  $0AA9 Reverse the line number, i.e. +00 to +15 becomes +16 to +01.
@ $0AAC label=PO_AT_ERR
  $0AAC If appropriate jump forward.
  $0AAF The range +16 to +01 becomes +17 to +02.
  $0AB1 And now +18 to +03.
  $0AB2 If printing in the lower part of the screen then consider whether scrolling is needed.
  $0AB9 Give report 5 - Out of screen, if required.
@ $0ABF label=PO_AT_SET
  $0ABF Return via #R$0DD9 and #R$0ADC.
N $0AC2 And the TAB control character.
@ $0AC2 label=PO_TAB
  $0AC2 Fetch the first operand.
@ $0AC3 label=PO_FILL
  $0AC3 The current print position.
  $0AC6 Add the current column value.
  $0AC7 Find how many spaces, modulo 32, are required and return if the result is zero.
  $0ACB Use #REGd as the counter.
  $0ACC Suppress 'leading space'.
@ $0AD0 label=PO_SPACE
  $0AD0,8,c2,6 Print '#REGd' number of spaces.
  $0AD8 Now finished.
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
D $0B24 Ordinary character codes, token codes and user-defined graphic codes, and graphic codes are dealt with separately.
  $0B24 Jump forward with ordinary character codes.
  $0B28 Jump forward with token codes and UDG codes.
  $0B2C Move the graphic code.
  $0B2D Construct the graphic form.
  $0B30 #REGhl has been disturbed so 'fetch' again.
  $0B33 Make #REGde point to the start of the graphic form, i.e. MEMBOT.
  $0B36 Jump forward to print the graphic character.
N $0B38 Graphic characters are constructed in an ad hoc manner in the calculator's memory area, i.e. mem-0 and mem-1.
@ $0B38 label=PO_GR_1
  $0B38 This is MEMBOT.
  $0B3B In effect call the following subroutine twice.
@ $0B3E label=PO_GR_2
  $0B3E Determine bit 0 (and later bit 2) of the graphic code.
  $0B41 The #REGa register will hold +00 or +0F depending on the value of the bit in the code.
  $0B43 Save the result in #REGc.
  $0B44 Determine bit 1 (and later bit 3) of the graphic code.
  $0B47 The #REGa register will hold +00 or +F0.
  $0B49 The two results are combined.
  $0B4A The #REGa register holds half the character form and has to be used four times. This is done for the upper half of the character form and then the lower.
@ $0B4C label=PO_GR_3
N $0B52 Token codes and user-defined graphic codes are now separated.
@ $0B52 label=PO_T_UDG
  $0B52 Jump forward with token codes.
  $0B56 UDG codes are now +00 to +0F.
  $0B58 Save the current position values on the machine stack.
  $0B59 Fetch the base address of the UDG area and jump forward.
@ $0B5F label=PO_T
  $0B5F Now print the token and return via #R$0B03.
N $0B65 The required character form is identified.
@ $0B65 label=PO_CHAR
  $0B65 The current position is saved.
  $0B66 The base address of the character area is fetched.
@ $0B6A label=PO_CHAR_2
  $0B6A The print address is saved.
  $0B6B This is FLAGS.
  $0B6E Allow for a leading space.
  $0B70,4,c2,2 Jump forward if the character is not a 'space'.
  $0B74 But 'suppress' if it is.
@ $0B76 label=PO_CHAR_3
  $0B76 Now pass the character code to the #REGhl register pair.
  $0B79 The character code is in effect multiplied by 8.
  $0B7C The base address of the character form is found.
  $0B7D The current position is fetched and the base address passed to the #REGde register pair.
@ $0B7F label=PR_ALL
c $0B7F THE 'PRINT ALL CHARACTERS' SUBROUTINE
D $0B7F This subroutine is used to print all '8*8' bit characters. On entry the #REGde register pair holds the base address of the character form, the #REGhl register the destination address and the #REGbc register pair the current 'line and column' values.
  $0B7F Fetch the column number.
  $0B80 Move one column rightwards.
  $0B81 Jump forward unless a new line is indicated.
  $0B85 Move down one line.
  $0B86 Column number is +21.
  $0B87 Jump forward if handling the screen.
  $0B8D Save the base address whilst the printer buffer is emptied.
  $0B92 Copy the new column number.
@ $0B93 label=PR_ALL_1
  $0B93 Test whether a new line is being used. If it is see if the display requires to be scrolled.
N $0B99 Now consider the present state of INVERSE and OVER
  $0B99 Save the position values and the destination address on the machine stack.
  $0B9B Fetch P-FLAG and read bit 0.
  $0B9E Prepare the 'OVER mask' in the #REGb register, i.e. OVER 0=+00 and OVER 1=+FF.
@ $0BA4 label=PR_ALL_2
  $0BA4 Read bit 2 of P-FLAG and prepare the 'INVERSE mask' in the #REGc register, i.e. INVERSE 0=+00 and INVERSE 1=+FF.
  $0BA8 Set the #REGa register to hold the 'pixel-line' counter and clear the carry flag.
  $0BAB Jump forward if handling the screen.
  $0BB1 Signal 'printer buffer no longer empty'.
  $0BB5 Set the carry flag to show that the printer is being used.
@ $0BB6 label=PR_ALL_3
  $0BB6 Exchange the destination address with the base address before entering the loop.
N $0BB7 The character can now be printed. Eight passes of the loop are made - one for each 'pixel-line'.
@ $0BB7 label=PR_ALL_4
  $0BB7 The carry flag is set when using the printer. Save this flag in F'.
  $0BB8 Fetch the existing 'pixel-line'.
  $0BB9 Use the 'OVER mask' and then XOR the result with the 'pixel-line' of the character form.
  $0BBB Finally consider the 'INVERSE mask'.
  $0BBC Enter the result.
  $0BBD Fetch the printer flag and jump forward if required.
  $0BC0 Update the destination address.
@ $0BC1 label=PR_ALL_5
  $0BC1 Update the 'pixel-line' address of the character form.
  $0BC2 Decrease the counter and loop back unless it is zero.
N $0BC5 Once the character has been printed the attribute byte is to be set as required.
  $0BC5 Make the #REGh register hold a correct high-address for the character area.
  $0BC7 Set the attribute byte only if handling the screen.
  $0BCE Restore the original destination address and the position values.
  $0BD0 Decrease the column number and increase the destination address before returning.
N $0BD3 When the printer is being used the destination address has to be updated in increments of +20.
  $0BD3 Save the printer flag again.
  $0BD4 The required increment value.
  $0BD6 Add the value and pass the result back to the #REGe register.
  $0BD8 Fetch the flag.
  $0BD9 Jump back into the loop.
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
D $0C55 This subroutine is called whenever there might be the need to scroll the display. This occurs on three occasions:
D $0C55 #LIST { when handling a 'carriage return' character } { when using AT in an INPUT line } { when the current line is full and the next line has to be used } LIST#
D $0C55 On entry the #REGb register holds the line number under test.
  $0C55 Return immediately if the printer is being used.
@ $0C5A nowarn
  $0C5A Pre-load the machine stack with the address of #R$0DD9.
  $0C5E Transfer the line number.
  $0C5F Jump forward if considering 'INPUT ... AT ..'.
  $0C66 Return, via #R$0DD9, if the line number is greater than the value of DF-SZ; give report 5 if it is less; otherwise continue.
  $0C6C Jump forward unless dealing with an 'automatic listing'.
  $0C72 Fetch the line counter.
  $0C75 Decrease this counter.
  $0C76 Jump forward if the listing is to be scrolled.
  $0C78 Otherwise open channel 'K', restore the stack pointer, flag that the automatic listing has finished and return via #R$0DD9.
N $0C86 Report 5 - Out of screen
@ $0C86 label=REPORT_5
M $0C86,2 Call the error handling routine.
B $0C87,1
N $0C88 Now consider if the prompt 'scroll?' is required.
@ $0C88 label=PO_SCR_2
  $0C88 Decrease the scroll counter and proceed to give the prompt only if it becomes zero.
N $0C8D Proceed to give the prompt message.
  $0C8D The counter is reset.
  $0C93 The current values of ATTR-T and MASK-T are saved.
  $0C97 The current value of P-FLAG is saved.
  $0C9B Channel 'K' is opened.
  $0CA0 The message 'scroll?' is message '0'. This message is now printed.
@ $0CA1 nowarn
  $0CA7 Signal 'clear the lower screen after a keystroke'.
  $0CAB This is FLAGS.
  $0CAE Signal 'L mode'.
  $0CB0 Signal 'no key yet'.
  $0CB2 Note: #REGde should be pushed also.
  $0CB3 Fetch a single key code.
  $0CB6 Restore the registers.
  $0CB7,14,c2,8,c2,2 There is a jump forward to #R$0D00 - 'BREAK - CONT repeats' - if the keystroke was 'BREAK', 'STOP', 'N' or 'n'; otherwise accept the keystroke as indicating the need to scroll the display.
  $0CC5 Open channel 'S'.
  $0CCA Restore the value of P-FLAG.
  $0CCE Restore the values of ATTR-T and MASK-T.
N $0CD2 The display is now scrolled.
@ $0CD2 label=PO_SCR_3
  $0CD2 The whole display is scrolled.
  $0CD5 The line and column numbers for the start of the line above the lower part of the display are found and saved.
  $0CDC The corresponding attribute byte for this character area is then found. The #REGhl register pair holds the address of the byte.
N $0CE8 The line in question will have 'lower part' attribute values and the new line at the bottom of the display may have 'ATTR-P' values so the attribute values are exchanged.
  $0CE8 #REGde points to the first attribute byte of the bottom line.
  $0CEB The value is fetched.
  $0CEC The 'lower part' value.
  $0CED There are thirty two bytes.
  $0CEF Exchange the pointers.
@ $0CF0 label=PO_SCR_3A
  $0CF0 Make the first exchange and then proceed to use the same values for the thirty two attribute bytes of the two lines being handled.
  $0CF6 The line and column numbers of the bottom line of the 'upper part' are fetched before returning.
N $0CF8 The 'scroll?' message.
@ $0CF8 label=SCROLL
B $0CF8,1 Initial marker - stepped over.
T $0CF9,7,6:B1 The '?' is inverted.
N $0D00 Report D - BREAK - CONT repeats
@ $0D00 label=REPORT_D_2
M $0D00,2 Call the error handling routine.
B $0D01,1
N $0D02 The lower part of the display is handled as follows:
@ $0D02 label=PO_SCR_4
  $0D02 The 'out of screen' error is given if the lower part is going to be 'too large' and a return made if scrolling is unnecessary.
  $0D0C The #REGa register will now hold 'the number of scrolls to be made'.
  $0D0E The line and column numbers are now saved.
  $0D0F The 'scroll number', ATTR-T, MASK-T & P-FLAG are all saved.
  $0D18 The 'permanent' colour items are to be used.
  $0D1B The 'scroll number' is fetched.
N $0D1C The lower part of the screen is now scrolled '#REGa' number of times.
@ $0D1C label=PO_SCR_4A
  $0D1C Save the 'number'.
  $0D1D This is DF-SZ.
  $0D20 The value in DF-SZ is incremented; the #REGb register set to hold the former value and the #REGa register the new value.
  $0D24 This is S-POSN-hi.
  $0D27 The jump is taken if only the lower part of the display is to be scrolled (#REGb=old DF-SZ).
  $0D2A Otherwise S-POSN-hi is incremented and the whole display scrolled (#REGb=+18).
@ $0D2D label=PO_SCR_4B
  $0D2D Scroll '#REGb' lines.
  $0D30 Fetch and decrement the 'scroll number'.
  $0D32 Jump back until finished.
  $0D34 Restore the value of P-FLAG.
  $0D38 Restore the values of ATTR-T and MASK-T.
  $0D3C In case S-POSN has been changed #R$0DD9 is called to give a matching value to DF-CC.
  $0D47 Reset the flag to indicate that the lower screen is being handled, fetch the line and column numbers, and then return.
@ $0D4D label=TEMPS
c $0D4D THE 'TEMPORARY COLOUR ITEMS' SUBROUTINE
@ $0D5B label=TEMPS_1
@ $0D65 label=TEMPS_2
@ $0D6B label=CLS
c $0D6B THE 'CLS' COMMAND ROUTINE
D $0D6B In the first instance the whole of the display is 'cleared' - the 'pixels' are all reset and the attribute bytes are set to equal the value in ATTR-P - then the lower part of the display is reformed.
  $0D6B The whole of the display is 'cleared'.
@ $0D6E label=CLS_LOWER
  $0D6E This is TV-FLAG.
  $0D71 Signal 'do not clear the lower screen after keystroke'.
  $0D73 Signal 'lower part'.
  $0D75 Use the permanent values, i.e. ATTR-T is copied from BORDCR.
  $0D78 The lower part of the screen is now 'cleared' with these values.
N $0D7E With the exception of the attribute bytes for lines 22 and 23 the attribute bytes for the lines in the lower part of the display will need to be made equal to ATTR-P.
  $0D7E Attribute byte at start of line 22.
  $0D81 Fetch ATTR-P.
  $0D84 The line counter.
  $0D85 Jump forward into the loop.
@ $0D87 label=CLS_1
  $0D87 +20 characters per line.
@ $0D89 label=CLS_2
  $0D89 Go back along the line setting the attribute bytes.
@ $0D8E label=CLS_3
  $0D8E Loop back until finished.
N $0D90 The size of the lower part of the display can now be fixed.
  $0D90 It will be two lines in size.
N $0D94 It now remains for the following 'house keeping' tasks to be performed.
@ $0D94 label=CL_CHAN
  $0D94 Open channel 'K'.
  $0D99 Fetch the address of the current channel and make the output address #R$09F4 and the input address #R$10A8.
@ $0D9C nowarn
@ $0DA0 label=CL_CHAN_A
@ $0DA4 nowarn
  $0DA7 First the output address then the input address.
@ $0DAA keep
  $0DAA As the lower part of the display is being handled the 'lower print line' will be line 23.
  $0DAD Return via #R$0DD9.
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
D $0DFE The number of lines of the display that are to be scrolled has to be held on entry to the main subroutine in the #REGb register.
  $0DFE The entry point after 'scroll?'
N $0E00 The main entry point - from above and when scrolling for INPUT...AT.
@ $0E00 label=CL_SCROLL
  $0E00 Find the starting address of the line.
  $0E03 There are eight pixel lines to a complete line.
N $0E05 Now enter the main scrolling loop. The #REGb register holds the number of the top line to be scrolled, the #REGhl register pair the starting address in the display area of this line and the #REGc register the pixel line counter.
@ $0E05 label=CL_SCR_1
  $0E05 Save both counters.
  $0E06 Save the starting address.
  $0E07 Jump forward unless dealing at the present moment with a 'third' of the display.
N $0E0D The pixel lines of the top lines of the 'thirds' of the display have to be moved across the 2K boundaries. (Each 'third' is 2K.)
  $0E0D The result of this manipulation is to leave #REGhl unchanged and #REGde pointing to the required destination.
@ $0E13 keep
  $0E13 There are +20 characters.
  $0E16 Decrease the counter as one line is being dealt with.
  $0E17 Now move the thirty two bytes.
N $0E19 The pixel lines within the 'thirds' can now be scrolled. The #REGa register holds, on the first pass, +01 to +07, +09 to +0F, or +11 to +17.
@ $0E19 label=CL_SCR_3
  $0E19 Again #REGde is made to point to the required destination, this time only thirty two locations away.
  $0E1F Save the line number in #REGb.
  $0E20 Now find how many characters there are remaining in the 'third'.
  $0E25 Pass the 'character total' to the #REGc register.
  $0E26 Fetch the line number.
  $0E27 #REGbc holds the 'character total' and a pixel line from each of the characters is 'scrolled'.
  $0E2B Now prepare to increment the address to jump across a 'third' boundary.
  $0E2D Increase #REGhl by +0700.
  $0E2E Jump back if there are any 'thirds' left to consider.
N $0E32 Now find if the loop has been used eight times - once for each pixel line.
  $0E32 Fetch the original address.
  $0E33 Address the next pixel line.
  $0E34 Fetch the counters.
  $0E35 Decrease the pixel line counter and jump back unless eight lines have been moved.
N $0E38 Next the attribute bytes are scrolled. Note that the #REGb register still holds the number of lines to be scrolled and the #REGc register holds zero.
  $0E38 The required address in the attribute area and the number of characters in '#REGb' lines are found.
  $0E3B The displacement for all the attribute bytes is thirty two locations away.
  $0E40 The attribute bytes are 'scrolled'.
N $0E42 It remains now to clear the bottom line of the display.
  $0E42 The #REGb register is loaded with +01 and #R$0E44 is entered.
@ $0E44 label=CL_LINE
c $0E44 THE 'CLEAR LINES' SUBROUTINE
D $0E44 This subroutine will clear the bottom '#REGb' lines of the display.
  $0E44 The line number is saved for the duration of the subroutine.
  $0E45 The starting address for the line is formed in #REGhl.
  $0E48 Again there are eight pixel lines to be considered.
N $0E4A Now enter a loop to clear all the pixel lines.
@ $0E4A label=CL_LINE_1
  $0E4A Save the line number and the pixel line counter.
  $0E4B Save the address.
  $0E4C Save the line number in #REGa.
@ $0E4D label=CL_LINE_2
  $0E4D Find how many characters are involved in '#REGb mod 8' lines. Pass the result to the #REGc register. (#REGc will hold +00 i.e. 256 dec. for a 'third'.)
  $0E53 Fetch the line number.
  $0E54 Make the #REGbc register pair hold one less than the number of characters.
  $0E57 Make #REGde point to the first character.
  $0E59 Clear the pixel-byte of the first character.
  $0E5B Make #REGde point to the second character and then clear the pixel-bytes of all the other characters.
@ $0E5E keep
  $0E5E For each 'third' of the display #REGhl has to be increased by +0701.
  $0E62 Now decrease the line number.
  $0E63 Discard any extra lines and pass the 'third' count to #REGb.
  $0E66 Jump back if there are still 'thirds' to be dealt with.
N $0E68 Now find if the loop has been used eight times.
  $0E68 Update the address for each pixel line.
  $0E6A Fetch the counters.
  $0E6B Decrease the pixel line counter and jump back unless finished.
N $0E6E Next the attribute bytes are set as required. The value in ATTR-P will be used when handling the main part of the display and the value in BORDCR when handling the lower part.
  $0E6E The address of the first attribute byte and the number of bytes are found.
  $0E71 #REGhl will point to the first attribute byte and #REGde the second.
  $0E74 Fetch the value in ATTR-P.
  $0E77 Jump forward if handling the main part of the screen.
  $0E7D Otherwise use BORDCR instead.
@ $0E80 label=CL_LINE_3
  $0E80 Set the attribute byte.
  $0E81 One byte has been done.
  $0E82 Now copy the value to all the attribute bytes.
  $0E84 Restore the line number.
  $0E85 Set the column number to the lefthand column and return.
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
D $0F2C The editor is called on two occasions:
D $0F2C #LIST { From the #R$12A2(main execution routine) so that the user can enter a BASIC line into the system. } { From the #R$2089(INPUT command routine). } LIST#
D $0F2C First the 'error stack pointer' is saved and an alternative address provided.
  $0F2C The current value is saved on the machine stack.
@ $0F30 nowarn
@ $0F30 label=ED_AGAIN
  $0F30 This is #R$107F.
  $0F33 Any event that leads to the error handling routine being used will come back to #R$107F.
N $0F38 A loop is now entered to handle each keystroke.
@ $0F38 label=ED_LOOP
  $0F38 Return once a key has been pressed.
  $0F3B Save the code temporarily.
  $0F3C Fetch the duration of the keyboard click.
@ $0F41 keep
  $0F41 And the pitch.
  $0F44 Now make the 'pip'.
  $0F47 Restore the code.
@ $0F48 nowarn
  $0F48 Pre-load the machine stack with the address of #R$0F38.
N $0F4C Now analyse the code obtained.
  $0F4C Accept all character codes, graphic codes and tokens.
  $0F50 Also accept ','.
  $0F54 Jump forward if the code represents an editing key.
N $0F58 The control keys - INK to TAB - are now considered.
@ $0F58 keep
  $0F58 INK and PAPER will require two locations.
  $0F5B Copy the code to #REGd.
  $0F5C Jump forward with INK and PAPER
N $0F60 AT and TAB would be handled as follows:
  $0F60 Three locations required.
  $0F61 Jump forward unless dealing with 'INPUT LINE...'.
  $0F68 Get the second code and put it in #REGe.
N $0F6C The other bytes for the control characters are now fetched.
@ $0F6C label=ED_CONTR
  $0F6C Get another code.
  $0F6F Save the previous codes.
  $0F70 Fetch K-CUR.
  $0F73 Signal 'K mode'.
  $0F77 Make two or three spaces.
  $0F7A Restore the previous codes.
  $0F7B Point to the first location.
  $0F7C Enter first code.
  $0F7D Then enter the second code which will be overwritten if there are only two codes - i.e. with INK and PAPER.
  $0F7F Jump forward.
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
D $0FA9 When in 'editing mode' pressing the EDIT key will bring down the 'current BASIC line'. However in 'INPUT mode' the action of the EDIT key is to clear the current reply and allow a fresh one.
  $0FA9 Fetch the current line number.
  $0FAC But jump forward if in 'INPUT mode'.
  $0FB3 Find the address of the start of the current line and hence its number.
  $0FB9 If the line number returned is zero then simply clear the editing area.
  $0FBE Save the address of the line.
  $0FBF Move on to collect the length of the line.
@ $0FC3 keep
  $0FC3 Add +0A to the length and test that there is sufficient room for a copy of the line.
  $0FCC Now clear the editing area.
  $0FCF Fetch the current channel address and exchange it for the address of the line.
  $0FD3 Save it temporarily.
  $0FD4 Open channel 'R' so that the line will be copied to the editing area.
  $0FD9 Fetch the address of the line.
  $0FDA Go to before the line.
  $0FDB Decrement the current line number so as to avoid printing the cursor.
  $0FDE Print the BASIC line.
  $0FE1 Increment the current line number. Note: the decrementing of the line number does not always stop the cursor from being printed.
  $0FE4 Fetch the start of the line in the editing area and step past the line number and the length to find the address for K-CUR.
  $0FEE Fetch the former channel address and set the appropriate flags before returning to #R$0F38.
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
D $10A8 This important subroutine returns the code of the last key to have been pressed, but note that CAPS LOCK, the changing of the mode and the colour control parameters are handled within the subroutine.
  $10A8 Copy the edit-line or the INPUT-line to the screen if the mode has changed.
  $10AF Return with both carry and zero flags reset if no new key has been pressed.
  $10B5 Otherwise fetch the code and signal that it has been taken.
  $10BC Save the code temporarily.
  $10BD Clear the lower part of the display if necessary, e.g. after 'scroll?'.
  $10C4 Fetch the code.
  $10C5,4,c2,2 Accept all characters and token codes.
  $10C9 Jump forward with most of the control character codes.
  $10CD Jump forward with the 'mode' codes and the CAPS LOCK code.
N $10D1 Now deal with the FLASH, BRIGHT and INVERSE codes.
  $10D1 Save the code.
  $10D2 Keep only bit 0.
  $10D4 #REGc holds +00 (=OFF) or +01 (=ON).
  $10D5 Fetch the code.
  $10D6 Rotate it once (losing bit 0).
  $10D7 Increase it by +12 giving +12 for FLASH, +13 for BRIGHT, and +14 for INVERSE.
N $10DB The CAPS LOCK code and the mode codes are dealt with 'locally'.
@ $10DB label=KEY_M_CL
  $10DB Jump forward with 'mode' codes.
  $10DD This is FLAGS2.
  $10E0 Flip bit 3 of FLAGS2. This is the CAPS LOCK flag.
  $10E4 Jump forward.
@ $10E6 label=KEY_MODE
  $10E6 Check the lower limit.
  $10E9 Reduce the range.
  $10EB This is MODE.
  $10EE Has it been changed?
  $10EF Enter the new 'mode' code.
  $10F0 Jump if it has changed; otherwise make it 'L mode'.
@ $10F4 label=KEY_FLAG
  $10F4 Signal 'the mode might have changed'.
  $10F8 Reset the carry flag and return.
N $10FA The control key codes (apart from FLASH, BRIGHT and INVERSE) are manipulated.
@ $10FA label=KEY_CONTR
  $10FA Save the code.
  $10FB Make the #REGc register hold the parameter (+00 to +07).
  $10FE #REGa now holds the INK code.
  $1100 But if the code was an 'unshifted' code then make #REGa hold the PAPER code.
N $1105 The parameter is saved in K-DATA and the channel address changed from #R$10A8 to #R$110D.
@ $1105 label=KEY_DATA
  $1105 Save the parameter.
@ $1108 nowarn
  $1108 This is #R$110D.
  $110B Jump forward.
N $110D Note: on the first pass entering at #R$10A8 the #REGa register is returned holding a 'control code' and then on the next pass, entering at #R$110D, it is the parameter that is returned.
@ $110D label=KEY_NEXT
  $110D Fetch the parameter.
@ $1110 nowarn
  $1110 This is #R$10A8.
N $1113 Now set the input address in the first channel area.
@ $1113 label=KEY_CHAN
  $1113 Fetch the channel address.
  $1118 Now set the input address.
N $111B Finally exit with the required code in the #REGa register.
@ $111B label=KEY_DONE_2
  $111B Show a code has been found and return.
@ $111D label=ED_COPY
c $111D THE 'LOWER SCREEN COPYING' SUBROUTINE
D $111D This subroutine is called whenever the line in the editing area or the INPUT area is to be printed in the lower part of the screen.
  $111D Use the permanent colours.
  $1120 Signal that the 'mode is to be considered unchanged' and the 'lower screen does not need clearing'.
  $1128 Save the current value of S-POSNL.
  $112C Keep the current value of ERR-SP.
@ $1130 nowarn
  $1130 This is #R$1167.
  $1133 Push this address on to the machine stack to make #R$1167 the entry point following an error.
  $1138 Push the value of ECHO-E on to the stack.
  $113C Make #REGhl point to the start of the space and #REGde the end.
  $1141 Now print the line.
  $1144 Exchange the pointers and print the cursor.
  $1148 Next fetch the current value of S-POSNL and exchange it with ECHO-E.
  $114C Pass ECHO-E to #REGde.
  $114D Again fetch the permanent colours.
N $1150 The remainder of any line that has been started is now completed with spaces printed with the 'permanent' PAPER colour.
@ $1150 label=ED_BLANK
  $1150 Fetch the current line number and subtract the old line number.
  $1154 Jump forward if no 'blanking' of lines required.
  $1156 Jump forward if not on the same line.
  $1158 Fetch the old column number and subtract the new column number.
  $115C Jump if no spaces required.
@ $115E label=ED_SPACES
  $115E,c2 A 'space'.
  $1160 Save the old values.
  $1161 Print it.
  $1164 Fetch the old values.
  $1165 Back again.
N $1167 New deal with any errors.
@ $1167 label=ED_FULL
  $1167 Give out a 'rasp'.
  $1172 Cancel the error number.
  $1176 Fetch the current value of S-POSNL and jump forward.
N $117C The normal exit upon completion of the copying over of the edit or the INPUT line.
@ $117C label=ED_C_DONE
  $117C The new position value.
  $117D The 'error address'.
N $117E But come here after an error.
@ $117E label=ED_C_END
  $117E The old value of ERR-SP is restored.
  $1182 Fetch the old value of S-POSNL.
  $1183 Save the new position values.
  $1184 Set the system variables.
  $1187 The old value of S-POSNL goes into ECHO-E.
  $118B X-PTR is cleared in a suitable manner and the return made.
@ $1190 label=SET_HL
c $1190 THE 'SET-HL' AND 'SET-DE' SUBROUTINES
@ $1195 label=SET_DE
@ $11A7 label=REMOVE_FP
c $11A7 THE 'REMOVE-FP' SUBROUTINE
@ $11AA keep
@ $11B7 label=NEW
c $11B7 THE 'NEW' COMMAND ROUTINE
  $11B7 Disable the maskable interrupt.
  $11B8 The NEW flag.
  $11BA The existing value of RAMTOP is preserved.
  $11BE Load the alternate registers with the following system variables (P-RAMT, RASP, PIP, UDG). All of which will also be preserved.
N $11CB The main entry point.
@ $11CB label=START_NEW
  $11CB Save the flag for later.
  $11CC Make the border white in colour.
  $11D0 Set the I register to hold the value of +3F.
  $11D4,6 Wait 24 T states.
N $11DA Now the memory is checked.
@ $11DA label=RAM_CHECK
  $11DA Transfer the value in #REGde (#R$0000=+FFFF, #R$11B7=RAMTOP).
@ $11DC label=RAM_FILL
  $11DC Enter the value of +02 into every location above +3FFF.
@ $11E2 label=RAM_READ
  $11E2 Prepare for true subtraction.
  $11E3 The carry flag will become reset when the top is reached.
  $11E6 Update the pointer.
  $11E7 Jump when at top.
  $11E9 +02 goes to +01.
  $11EA But if zero then RAM is faulty. Use current #REGhl as top.
  $11EC +01 goes to +00.
  $11ED Step to the next test unless it fails.
@ $11EF label=RAM_DONE
  $11EF #REGhl points to the last actual location in working order.
N $11F0 Next restore the 'preserved' system variables. (Meaningless when coming from #R$0000.)
  $11F0 Restore P-RAMT, RASP, PIP and UDG.
  $11FD Test the #R$0000/#R$11B7 flag.
  $11FE Jump forward if coming from the #R$11B7 command routine.
N $1200 Overwrite the system variables when coming from #R$0000 and initialise the user-defined graphics area.
  $1200 Top of physical RAM.
@ $1203 nowarn
  $1203 Last byte of 'U' in character set.
@ $1206 keep
  $1206 There are this number of bytes in twenty one letters.
  $1209 Switch the pointers.
  $120A Now copy the character forms of the letter 'A' to 'U'.
  $120C Switch the pointers back.
  $120D Point to the first byte.
  $120E Now set UDG.
  $1211 Down one location.
@ $1212 keep
  $1212 Set the system variables RASP and PIP.
N $1219 The remainder of the routine is common to both the #R$0000 and the #R$11B7 operations.
@ $1219 label=RAM_SET
  $1219 Set RAMTOP.
@ $121C ssub=LD HL,$3D00-$100
  $121C Initialise the system variable CHARS.
N $1222 Next the machine stack is set up.
  $1222 The top location is made to hold +3E.
  $1227 The next location is left holding zero.
  $1228 These two locations represent the 'last entry'.
  $1229 Step down two locations to find the correct value for ERR-SP.
N $122E The initialisation routine continues with:
  $122E Interrupt mode 1 is used.
  $1230 #REGiy holds +ERR-NR always.
  $1234 The maskable interrupt can now be enabled.  The real-time clock will be updated and the keyboard scanned every 1/50th of a second.
  $1235 The base address of the channel information area.
  $123B The initial channel data is moved from the table (#R$15AF) to the channel information area.
@ $123E keep
  $1244 The system variable DATADD is made to point to the last location of the channel data.
  $1249 And PROG and VARS to the the location after that.
  $1250 The end-marker of the variables area.
  $1252 Move on one location to find the value for E-LINE.
  $1256 Make the edit-line be a single 'carriage return' character.
  $1259 Now enter an end marker.
  $125B Move on one location to find the value for WORKSP, STKBOT and STKEND.
  $1265 Initialise the colour system variables to FLASH 0, BRIGHT 0, PAPER 7, INK 0.
@ $1270 keep
  $1270 Initialise the system variables REPDEL and REPPER.
  $1276 Make KSTATE-0 hold +FF.
  $1279 Make KSTATE-4 hold +FF.
  $127C Next move the initial stream data from its table to the streams area.
@ $1282 keep
  $1287 Signal 'printer in use' and clear the printer buffer.
  $128E Set the size of the lower part of the display and clear the whole display.
  $1295 Now print the message '#CHR169 1982 Sinclair Research Ltd' on the bottom line.
@ $1296 ssub=LD DE,$1539-1
  $129C Signal 'the lower part will required to be cleared'.
  $12A0 Jump forward into the main execution loop.
@ $12A2 label=MAIN_EXEC
c $12A2 THE 'MAIN EXECUTION' LOOP
D $12A2 The main loop controls the 'editing mode', the execution of direct commands and the production of reports.
  $12A2 The lower part of the screen is to be two lines in size.
  $12A6 Produce an automatic listing.
@ $12A9 label=MAIN_1
  $12A9 All the areas from E-LINE onwards are given their minimum configurations.
@ $12AC label=MAIN_2
  $12AC Channel 'K' is opened before calling the #R$0F2C.
  $12B1 The #R$0F2C is called to allow the user to build up a BASIC line.
  $12B4 The current line is scanned for correct syntax.
  $12B7 Jump forward if the syntax is correct.
  $12BD Jump forward if other than channel 'K' is being used.
  $12C3 Point to the start of the line with the error.
  $12C6 Remove the floating-point forms from this line.
  $12C9 Reset ERR-NR and jump back to #R$12AC leaving the listing unchanged.
N $12CF The 'edit-line' has passed syntax and the three types of line that are possible have to be distinguished from each other.
@ $12CF label=MAIN_3
  $12CF Point to the start of the line.
  $12D2 Set CH-ADD to the start also.
  $12D5 Fetch any line number into #REGbc.
  $12D8 Is the line number a valid one?
  $12DA Jump if it is so, and add the new line to the existing program.
  $12DD Fetch the first character of the line and see if the line is 'carriage return only'.
  $12E0 If it is then jump back.
N $12E2 The 'edit-line' must start with a direct BASIC command so this line becomes the first line to be interpreted.
  $12E2 Clear the whole display unless the flag says it is unnecessary.
  $12E9 Clear the lower part anyway.
  $12EC Set the appropriate value for the scroll counter.
  $12F4 Signal 'line execution'.
  $12F8 Ensure ERR-NR is correct.
  $12FC Deal with the first statement in the line.
  $1300 Now the line is interpreted. Note: The address #R$1303 goes on to the machine stack and is addressed by ERR-SP.
N $1303 After the line has been interpreted and all the actions consequential to it have been completed a return is made to #R$1303, so that a report can be made.
@ $1303 label=MAIN_4
  $1303 The maskable interrupt must be enabled.
  $1304 Signal 'ready for a new key'.
  $1308 Empty the printer buffer if it has been used.
  $130F Fetch the error number and increment it.
@ $1313 label=MAIN_G
  $1313 Save the new value.
@ $1314 keep
  $1314 The system variables FLAGX, X-PTR-hi & DEFADD are all set to zero.
@ $1320 keep
  $1320 Ensure that stream +00 points to channel 'K'.
  $1326 Clear all the work areas and the calculator stack.
  $1329 Signal 'editing mode'.
  $132D Clear the lower screen.
  $1330 Signal 'the lower screen will require clearing'.
  $1334 Fetch the report value.
  $1335 Make a copy in #REGb.
  $1336 Jump forward with report numbers '0 to 9'.
  $133A Add the ASCII letter offset value.
@ $133C label=MAIN_5
  $133C,6,3,c2,1 Print the report code and follow it with a 'space'.
  $1342 Fetch the report value (used to identify the required report message).
  $1343 Print the message.
  $1349 Follow it by a 'comma' and a 'space'.
@ $134A ssub=LD DE,$1537-1
  $1350 Now fetch the current line number and print it as well.
  $1357,3,c2,1 Follow it by a ':'.
  $135A Fetch the current statement number into the #REGbc register pair and print it.
  $1362 Clear the editing area.
  $1365 Fetch the error number again.
  $1368 Increment it as usual.
  $1369 If the program was completed successfully there cannot be any 'CONTinuing' so jump.
  $136B If the program halted with 'STOP statement' or 'BREAK into program' CONTinuing will be from the next statement; otherwise SUBPPC is unchanged.
@ $1373 label=MAIN_6
@ $1376 keep
@ $1376 label=MAIN_7
  $1376 The system variables OLDPPC & OSPCC have now to be made to hold the CONTinuing line and statement numbers.
  $137C The values used will be those in PPC & SUBPPC unless NSPPC indicates that the 'break' occurred before a 'jump' (i.e. after a GO TO statement etc.).
@ $1384 label=MAIN_8
@ $1386 label=MAIN_9
  $1386 NSPPC is reset to indicate 'no jump'.
  $138A 'K mode' is selected.
  $138E And finally the jump back is made but no program listing will appear until requested.
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
D $155D This subroutine allows for a new BASIC line to be added to the existing BASIC program in the program area. If a line has both an old and a new version then the old one is 'reclaimed'. A new line that consists of only a line number does not go into the program area.
  $155D Make the new line number the 'current line'.
  $1561 Fetch CH-ADD and save the address in #REGde.
@ $1565 nowarn
  $1565 Push the address of #R$1555 on to the machine stack. ERR-SP will now point to #R$1555.
  $1569 Fetch WORKSP.
  $156C Find the length of the line from after the line number to the 'carriage return' character inclusively.
  $156F Save the length.
  $1570 Move the line number to the #REGhl register pair.
  $1572 Is there an existing line with this number?
  $1575 Jump if there was not.
  $1577 Find the length of the 'old' line and reclaim it.
@ $157D label=MAIN_ADD1
  $157D Fetch the length of the 'new' line and jump forward if it is only a 'line number and a carriage return'.
  $1583 Save the length.
  $1584 Four extra locations will be needed, i.e. two for the number and two for the length.
  $1588 Make #REGhl point to the location before the 'destination'.
  $1589 Save the current value of PROG to avoid corruption when adding a first line.
  $158E Space for the new line is created.
  $1591 The old value of PROG is fetched and restored.
  $1595 A copy of the line length (without parameters) is taken.
  $1597 Make #REGde point to the end location of the new area and #REGhl to the 'carriage return' character of the new line in the editing area.
  $159D Now copy over the line.
  $159F Fetch the line's number.
  $15A2 Destination into #REGhl and number into #REGde.
  $15A3 Fetch the new line's length.
  $15A4 The high length byte.
  $15A6 The low length byte.
  $15A8 The low line number byte.
  $15AA The high line number byte.
@ $15AB label=MAIN_ADD2
  $15AB Drop the address of #R$1555.
  $15AC Jump back and this time do produce an automatic listing.
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
D $1736 This command allows the user to OPEN streams. A channel code must be supplied and it must be 'K', 'k', 'S', 's', 'P', or 'p'.
D $1736 Note that no attempt is made to give streams +00 to +03 their initial data.
  $1736 Use the calculator to exchange the stream number and the channel code.
B $1737,1 #R$343C
B $1738,1 #R$369B
  $1739 Fetch the data for the stream.
  $173C Jump forward if both bytes of the data are zero, i.e. the stream was in a closed state.
  $1740 Save #REGhl.
  $1741 Fetch CHANS - the base address of the channel information and find the code of the channel associated with the stream being OPENed.
  $1749 Return #REGhl.
  $174A,12,c2,2,c2,2,c2,2 The code fetched from the channel information area must be 'K', 'S' or 'P'; give an error if it is not.
@ $1756 label=OPEN_1
  $1756 Collect the appropriate data in #REGde.
  $1759 Enter the data into the two bytes in the stream information area.
  $175C Finally return.
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
D $1795 The routines in this part of the 16K program are used to produce listings of the current BASIC program. Each line has to have its line number evaluated, its tokens expanded and the appropriate cursors positioned.
D $1795 The entry point #R$1795 is used by both #R$12A2 and #R$1059 to produce a single page of the listing.
  $1795 The stack pointer is saved allowing the machine stack to be reset when the listing is finished (see #R$0C55).
  $1799 Signal 'automatic listing in the main screen'.
  $179D Clear this part of the screen.
  $17A0 Switch to the editing area.
  $17A4 Now clear the the lower part of the screen as well.
  $17AA Then switch back.
  $17AE Signal 'screen is clear'.
  $17B2 Now fetch the the 'current' line number and the 'automatic' line number.
  $17B9 If the 'current' number is less than the 'automatic' number then jump forward to update the 'automatic' number.
N $17BF The 'automatic' number has now to be altered to give a listing with the 'current' line appearing near the bottom of the screen.
  $17BF Save the 'automatic' number.
  $17C0 Find the address of the start of the 'current' line and produce an address roughly a 'screen before it' (negated).
@ $17C3 keep
  $17C9 Save the 'result' on the machine stack whilst the 'automatic' line address is also found (in #REGhl).
  $17CD The 'result' goes to the #REGbc register pair.
N $17CE A loop is now entered.  The 'automatic' line number is increased on each pass until it is likely that the 'current' line will show on a listing.
@ $17CE label=AUTO_L_1
  $17CE Save the 'result'.
  $17CF Find the address of the start of the line after the present 'automatic' line (in #REGde).
  $17D2 Restore the 'result'.
  $17D3 Perform the computation and jump forward if finished.
  $17D6 Move the next line's address to the #REGhl register pair and collect its line number.
  $17DB Now S-TOP can be updated and the test repeated with the new line.
N $17E1 Now the 'automatic' listing can be made.
@ $17E1 label=AUTO_L_2
  $17E1 When E-PPC is less than S-TOP.
@ $17E4 label=AUTO_L_3
  $17E4 Fetch the top line's number and hence its address.
  $17EA If the line cannot be found use #REGde instead.
@ $17ED label=AUTO_L_4
  $17ED The listing is produced.
  $17F0 The return will be to here unless scrolling was needed to show the current line.
@ $17F5 label=LLIST
c $17F5 THE 'LLIST' ENTRY POINT
@ $17F9 label=LIST
c $17F9 THE 'LIST' ENTRY POINT
D $17F9 The 'main screen' channel will need to be opened.
  $17F9 Use stream +02.
@ $17FB label=LIST_1
  $17FB Signal 'an ordinary listing in the main part of the screen'.
  $17FF Open the channel unless checking syntax.
  $1805 With the present character in the #REGa register see if the stream is to be changed.
  $1809 Jump forward if unchanged.
  $180B,3,1,c2 Is the present character a ';'?
  $180E Jump if it is.
  $1810,c2 Is it a ','?
  $1812 Jump if it is not.
@ $1814 label=LIST_2
  $1814 A numeric expression must follow, e.g. LIST #5,20.
  $1818 Jump forward with it.
@ $181A label=LIST_3
  $181A Otherwise use zero and also jump forward.
N $181F Come here if the stream was unaltered.
@ $181F label=LIST_4
  $181F Fetch any line or use zero if none supplied.
@ $1822 label=LIST_5
  $1822 If checking the syntax of the edit-line move on to the next statement.
  $1825 Line number to #REGbc.
  $1828 High byte to #REGa.
  $1829 Limit the high byte to the correct range and pass the whole line number to #REGhl.
  $182D Set E-PPC and find the address of the start of this line or the first line after it if the actual line does not exist.
@ $1833 label=LIST_ALL
  $1833 Flag 'before the current line'.
N $1835 Now the controlling loop for printing a series of lines is entered.
@ $1835 label=LIST_ALL_1
  $1835 Print the whole of a BASIC line.
  $1838 This will be a 'carriage return'.
  $1839 Jump back unless dealing with an automatic listing.
  $183F Also jump back if there is still part of the main screen that can be used.
  $1847 A return can be made at this point if the screen is full and the current line has been printed (#REGe=+00).
  $1849 However if the current line is missing from the listing then S-TOP has to be updated and a further line printed (using scrolling).
@ $1855 label=OUT_LINE
c $1855 THE 'PRINT A WHOLE BASIC LINE' SUBROUTINE
D $1855 The #REGhl register pair points to the start of the line - the location holding the high byte of the line number.
D $1855 Before the line number is printed it is tested to determine whether it comes before the 'current' line, is the 'current' line, or comes after.
  $1855 Fetch the 'current' line number and compare it.
  $185C Pre-load the #REGd register with the current line cursor.
  $185E Jump forward if printing the 'current' line.
@ $1860 keep
  $1860 Load the #REGd register with zero (it is not the cursor) and set #REGe to hold +01 if the line is before the 'current' line and +00 if after. (The carry flag comes from #R$1980.)
@ $1865 label=OUT_LINE1
  $1865 Save the line marker.
  $1868,5 Fetch the high byte of the line number and make a full return if the listing has been finished.
  $186E The line number can now be printed - with leading spaces.
  $1871 Move the pointer on to address the first command code in the line.
  $1874 Signal 'leading space allowed'.
  $1878 Fetch the cursor code and jump forward unless the cursor is to be printed.
  $187C So print the cursor now.
@ $187D label=OUT_LINE2
  $187D Signal 'no leading space now'.
@ $1881 label=OUT_LINE3
  $1881 Save the registers.
  $1882 Move the pointer to #REGde.
  $1883 Signal 'not in quotes'.
  $1887 This is FLAGS.
  $188A Signal 'print in K-mode'.
  $188C Jump forward unless in INPUT mode.
  $1892 Signal 'print in L-mode'.
N $1894 Now enter a loop to print all the codes in the rest of the BASIC line - jumping over floating-point forms as necessary.
@ $1894 label=OUT_LINE4
  $1894 Fetch the syntax error pointer and jump forward unless it is time to print the error marker.
  $189C,5,c2,3 Print the error marker now. It is a flashing '?'.
@ $18A1 label=OUT_LINE5
  $18A1 Consider whether to print the cursor.
  $18A4 Move the pointer to #REGhl now.
  $18A5 Fetch each character in turn.
  $18A6 If the character is a 'number marker' then the hidden floating-point form is not to be printed.
  $18A9 Update the pointer for the next pass.
  $18AA Is the character a 'carriage return'?
  $18AC Jump if it is.
  $18AE Switch the pointer to #REGde.
  $18AF Print the character.
  $18B2 Go around the loop for at least one further pass.
N $18B4 The line has now been printed.
@ $18B4 label=OUT_LINE6
  $18B4 Restore the #REGde register pair and return.
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
D $1925 All of the character/token codes in a BASIC line are printed by repeatedly calling this subroutine.
D $1925 The entry point #R$192A is used when printing line numbers which may require leading spaces.
  $1925 The #REGa register will hold +20 for a space or +FF for no-space.
  $1926 Test the value and return if there is not to be a space.
  $1928 Jump forward to print a space.
@ $192A label=OUT_SP_NO
  $192A Clear the #REGa register.
N $192B The #REGhl register pair holds the line number and the #REGbc register the value for 'repeated subtraction' (-1000, -100 or -10).
@ $192B label=OUT_SP_1
  $192B The 'trial subtraction'.
  $192C Count each 'trial'.
  $192D Jump back until exhausted.
  $192F Restore last 'subtraction' and discount it.
  $1932 If no 'subtractions' were possible jump back to see if a space is to be printed.
  $1934 Otherwise print the digit.
N $1937 This entry point is used for all characters, tokens and control characters.
@ $1937 label=OUT_CHAR
  $1937 Return carry reset if handling a digit code.
  $193A Jump forward to print the digit.
  $193C Also print the control characters and 'space'.
  $1940 Signal 'print in K-mode'.
  $1944 Jump forward if dealing with the token 'THEN'.
  $1948,4,c2,2 Jump forward unless dealing with ':'.
  $194C Jump forward to print the ':' if in 'INPUT mode'.
  $1952 Jump forward if the ':' is 'not in quotes', i.e. an inter-statement marker.
  $1958 The ':' is inside quotes and can now be printed.
@ $195A label=OUT_CH_1
  $195A,4,c2,2 Accept for printing all characters except '"'.
  $195E Save the character code whilst changing the 'quote mode'.
  $195F Fetch FLAGS2 and flip bit 2.
  $1964 Enter the amended value and restore the character code.
@ $1968 label=OUT_CH_2
  $1968 Signal 'the next character is to be printed in L-mode'.
@ $196C label=OUT_CH_3
  $196C The present character is printed before returning.
E $1925 Note: it is the consequence of the tests on the present character that determines whether the next character is to be printed in 'K' or 'L' mode.
E $1925 Also note how the program does not cater for ':' in REM statements.
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
D $1B28 Each statement is considered in turn until the end of the line is reached.
  $1B28 Advance CH-ADD along the line.
@ $1B29 label=STMT_L_1
  $1B29 The work space is cleared.
  $1B2C Increase SUBPPC on each passage around the loop.
  $1B2F But only '127' statements are allowed in a single line.
  $1B32 Fetch a character.
  $1B33 Clear the #REGb register for later.
  $1B35 Is the character a 'carriage return'?
  $1B37 Jump if it is.
  $1B39,4,c2,2 Go around the loop again if it is a ':'.
N $1B3D A statement has been identified so, first, its initial command is considered.
@ $1B3D nowarn
  $1B3D Pre-load the machine stack with the return address #R$1B76.
  $1B41 Save the command temporarily in the #REGc register whilst CH-ADD is advanced again.
  $1B44 Reduce the command's code by +CE, giving the range +00 to +31 for the fifty commands.
  $1B46 Give the appropriate error if not a command code.
  $1B49 Move the command code to the #REGbc register pair (#REGb holds +00).
  $1B4A The base address of the #R$1A48(syntax offset table).
  $1B4D The required offset is passed to the #REGc register and used to compute the base address for the command's entries in the #R$1A7A(parameter table).
  $1B50 Jump forward into the scanning loop with this address.
N $1B52 Each of the command class routines applicable to the present command is executed in turn. Any required separators are also considered.
@ $1B52 label=SCAN_LOOP
  $1B52 The temporary pointer to the entries in the #R$1A7A(parameter table).
@ $1B55 label=GET_PARAM
  $1B55 Fetch each entry in turn.
  $1B56 Update the pointer to the entries for the next pass.
@ $1B5A nowarn
  $1B5A Pre-load the machine stack with the return address #R$1B52.
  $1B5E Copy the entry to the #REGc register for later.
  $1B5F Jump forward if the entry is a 'separator'.
  $1B63 The base address of the #R$1C01(command class table).
  $1B66 Clear the #REGb register and index into the table.
  $1B69 Fetch the offset and compute the starting address of the required command class routine.
  $1B6B Push the address on to the machine stack.
  $1B6C Before making an indirect jump to the command class routine pass the command code to the #REGa register and set the #REGb register to +FF.
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
D $1CDE This subroutine leads to a following numeric expression being evaluated but zero being used instead if there is no expression.
  $1CDE Jump forward if at the end of a line.
  $1CE2,4,c2,2 But jump to #R$1C82 unless at the end of a statement.
N $1CE6 The calculator is now used to add the value zero to the calculator stack.
@ $1CE6 label=USE_ZERO
  $1CE6 Do not perform the operation if syntax is being checked.
  $1CEA Use the calculator.
B $1CEB,1 #R$341B(stk_zero)
B $1CEC,1 #R$369B
  $1CED Return with zero added to the stack.
@ $1CEE label=STOP
c $1CEE THE 'STOP' COMMAND ROUTINE
B $1CEF,1
@ $1CF0 label=IF_CMD
c $1CF0 THE 'IF' COMMAND ROUTINE
D $1CF0 On entry the value of the expression between the IF and the THEN is the 'last value' on the calculator stack. If this is logically true then the next statement is considered; otherwise the line is considered to have been finished.
  $1CF0 Drop the return address - #R$1B76.
  $1CF1 Jump forward if checking syntax.
N $1CF6 Now use the calculator to 'delete' the last value on the calculator stack but leave the #REGde register pair addressing the first byte of the value.
  $1CF6 Use the calculator.
B $1CF7,1 #R$33A1
B $1CF8,1 #R$369B
  $1CF9 Make #REGhl point to the first byte and call #R$34E9.
  $1CFD If the value was 'FALSE' jump to the next line.
@ $1D00 label=IF_1
  $1D00 But if 'TRUE' jump to the next statement (after the THEN).
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
D $1DAB The 'variable in assignment' has already been determined (see #R$1C6C), and it remains to change the VALUE as required.
  $1DAB Jump to give the error report if the variable was not found.
  $1DB2 The address of the variable is fetched and the name tested further.
N $1DB9 Next the variable's VALUE (v) and STEP (s) are manipulated by the calculator.
  $1DB9 Step past the name.
  $1DBA Make the variable a temporary 'memory area'.
  $1DBD -
B $1DBE,1 #R$340F(get_mem_0): v
B $1DBF,1 #R$340F(get_mem_2): v, s
B $1DC0,1 #R$3014: v+s
B $1DC1,1 #R$342D(st_mem_0): v+s (v is replaced by v+s in mem-0)
B $1DC2,1 #R$33A1: -
B $1DC3,1 #R$369B: -
N $1DC4 The result of adding the VALUE and the STEP is now tested against the LIMIT by calling #R$1DDA.
  $1DC4 Test the new VALUE against the LIMIT.
  $1DC7 Return now if the FOR-NEXT loop has been completed.
N $1DC8 Otherwise collect the 'looping' line number and statement.
  $1DC8 Find the address of the low byte of the looping line number.
@ $1DCB keep
  $1DCF Now fetch this line number.
  $1DD3 Followed by the statement number.
  $1DD4 Exchange the numbers before jumping forward to treat them as the destination line of a GO TO command.
N $1DD8 Report 1 - NEXT without FOR
@ $1DD8 label=REPORT_1
M $1DD8,2 Call the error handling routine.
B $1DD9,1 #R$368F
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
D $1F60 During syntax checking a DEF FN statement is checked to ensure that it has the correct form. Space is also made available for the result of evaluating the function.
D $1F60 But in 'run-time' a DEF FN statement is passed by.
  $1F60 Jump forward if checking syntax.
  $1F65 Otherwise pass by the 'DEF FN' statement.
N $1F6A First consider the variable of the function.
@ $1F6A label=DEF_FN_1
  $1F6A Signal 'a numeric variable'.
  $1F6E Check that the present code is a letter.
  $1F71 Jump forward if not.
  $1F73 Fetch the next character.
  $1F74,4,c2,2 Jump forward unless it is a '$'.
  $1F78 Change bit 6 as it is a string variable.
  $1F7C Fetch the next character.
@ $1F7D label=DEF_FN_2
  $1F7D,4,c2,2 A '(' must follow the variable's name.
  $1F81 Fetch the next character.
  $1F82,4,c2,2 Jump forward if it is a ')' as there are no parameters of the function.
N $1F86 A loop is now entered to deal with each parameter in turn.
@ $1F86 label=DEF_FN_3
  $1F86 The present code must be a letter.
@ $1F89 label=DEF_FN_4
  $1F8C Save the pointer in #REGde.
  $1F8D Fetch the next character.
  $1F8E,4,c2,2 Jump forward unless it is a '$'.
  $1F92 Otherwise save the new pointer in #REGde instead.
  $1F93 Fetch the next character.
@ $1F94 label=DEF_FN_5
  $1F94 Move the pointer to the last character of the name to the #REGhl register pair.
@ $1F95 keep
  $1F95 Now make six locations after that last character and enter a 'number marker' into the first of the new locations.
  $1F9F,7,c2,5 If the present character is a ',' then jump back as there should be a further parameter; otherwise jump out of the loop.
N $1FA6 Next the definition of the function is considered.
@ $1FA6 label=DEF_FN_6
  $1FA6,4,c2,2 Check that the ')' does exist.
  $1FAA The next character is fetched.
  $1FAB,4,c2,2 It must be an '='.
  $1FAF Fetch the next character.
  $1FB0 Save the nature - numeric or string - of the variable.
  $1FB4 Now consider the definition as an expression.
  $1FB7 Fetch the nature of the variable and check that it is of the same type as found for the definition.
@ $1FBD label=DEF_FN_7
  $1FBD Give an error report if it is required.
  $1FC0 Exit via #R$1BEE (thereby moving on to consider the next statement in the line).
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
D $1FFC This subroutine is called from the #R$1FCD, #R$1FC9 and #R$2089 command routines.
D $1FFC The various types of print item are identified and printed.
  $1FFC The first character is fetched.
  $1FFD Jump forward unless it is an 'AT'.
N $2001 Now deal with an 'AT'.
  $2001 The two parameters are transferred to the calculator stack.
  $2004 Return now if checking syntax.
  $2007 The parameters are compressed into the #REGbc register pair.
  $200A The #REGa register is loaded with the AT control character before the jump is taken.
N $200E Next look for a 'TAB'.
@ $200E label=PR_ITEM_2
  $200E Jump forward unless it is a 'TAB'.
N $2012 Now deal with a 'TAB'.
  $2012 Get the next character.
  $2013 Transfer one parameter to the calculator stack.
  $2016 Return now if checking syntax.
  $2019 The value is compressed into the #REGbc register pair.
  $201C The #REGa register is loaded with the TAB control character.
N $201E The 'AT' and the 'TAB' print items are printed by making three calls to #R$0010.
@ $201E label=PR_AT_TAB
  $201E Print the control character.
  $201F Follow it with the first value.
  $2021 Finally print the second value, then return.
N $2024 Next consider embedded colour items.
@ $2024 label=PR_ITEM_3
  $2024 Return with carry reset if colour items were found. Continue if none were found.
  $2028 Next consider if the stream is to be changed.
  $202B Continue unless it was altered.
N $202C The print item must now be an expression, either numeric or string.
  $202C Evaluate the expression but return now if checking syntax.
  $2032 Test for the nature of the expression.
  $2036 If it is a string then fetch the necessary parameters; but if it is numeric then exit via #R$2DE3.
N $203C A loop is now set up to deal with each character in turn of the string.
@ $203C label=PR_STRING
  $203C Return now if there are no characters remaining in the string; otherwise decrease the counter.
  $2040 Fetch the code and increment the pointer.
  $2042 The code is printed and a jump taken to consider any further characters.
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
D $21E1 This set of routines can be readily divided into two parts:
D $21E1 #LIST { i. The embedded colour item' handler. } { ii. The 'colour system variable' handler. } LIST#
D $21E1 i. Embedded colour items are handled by calling #R$0010 as required.
D $21E1 A loop is entered to handle each item in turn. The entry point is at #R$21E2.
  $21E1 Consider the next character in the BASIC statement.
@ $21E2 label=CO_TEMP_2
  $21E2 Jump forward to see if the present code represents an embedded 'temporary' colour item. Return carry set if not a colour item.
  $21E6 Fetch the present character.
  $21E7,8,c2,2,c2,2 Jump back if it is either a ',' or a ';'; otherwise there has been an error.
  $21EF Exit via 'report C'.
@ $21F2 label=CO_TEMP_3
  $21F2 Return with the carry flag set if the code is not in the range +D9 to +DE (INK to OVER).
  $21F9 The colour item code is preserved whilst CH-ADD is advanced to address the parameter that follows it.
N $21FC The colour item code and the parameter are now 'printed' by calling #R$0010 on two occasions.
@ $21FC label=CO_TEMP_4
  $21FC The token range (+D9 to +DE) is reduced to the control character range (+10 to +15).
  $21FE The control character code is preserved whilst the parameter is moved to the calculator stack.
  $2203 A return is made at this point if syntax is being checked.
  $2207 The control character code is preserved whilst the parameter is moved to the #REGd register.
  $220D The control character is sent out.
  $220E Then the parameter is fetched and sent out before returning.
N $2211 ii. The colour system variables - ATTR-T, MASK-T and P-FLAG - are altered as required. On entry the control character code is in the #REGa register and the parameter is in the #REGd register.
@ $2211 label=CO_TEMP_5
N $2211 Note that all changes are to the 'temporary' system variables.
  $2211 Reduce the range and jump forward with INK and PAPER.
  $2217 Reduce the range once again and jump forward with FLASH and BRIGHT.
N $221D The colour control code will now be +01 for INVERSE and +02 for OVER and the system variable P-FLAG is altered accordingly.
  $221D Prepare to jump with OVER.
  $221F Fetch the parameter.
  $2220 Prepare the mask for OVER.
  $2222 Now jump.
  $2224 Bit 2 of the #REGa register is to be reset for INVERSE 0 and set for INVERSE 1; the mask is to have bit 2 set.
@ $2228 label=CO_TEMP_6
  $2228 Save the #REGa register whilst the range is tested.
  $2229 The correct range for INVERSE and OVER is only '0-1'.
  $222E Restore the #REGa register.
  $222F It is P-FLAG that is to be changed.
  $2232 Exit via #R$226C and alter P-FLAG using '#REGb' as a mask, i.e. bit 0 for OVER and bit 2 for INVERSE.
N $2234 PAPER and INK are dealt with by the following routine. On entry the carry flag is set for INK.
@ $2234 label=CO_TEMP_7
  $2234 Fetch the parameter.
  $2235 Prepare the mask for INK.
  $2237 Jump forward with INK.
  $2239 Multiply the parameter for PAPER by eight.
  $223C Prepare the mask for PAPER.
@ $223E label=CO_TEMP_8
  $223E Save the parameter in the #REGc register whilst the range of the parameter is tested.
  $223F Fetch the original value.
  $2240 Only allow PAPER/INK a range of '0' to '9'.
N $2244 Report K - Invalid colour.
@ $2244 label=REPORT_K
M $2244,2 Call the error handling routine.
B $2245,1
N $2246 Continue to handle PAPER and INK.
@ $2246 label=CO_TEMP_9
  $2246 Prepare to alter ATTR-T, MASK-T and P-FLAG.
  $2249 Jump forward with PAPER/INK '0' to '7'.
  $224D Fetch the current value of ATTR-T and use it unchanged, by jumping forward, with PAPER/INK '8'.
  $2250 But for PAPER/INK '9' the PAPER and INK colours have to be black and white.
  $2254 Jump for black INK/PAPER, but continue for white INK/PAPER.
@ $2257 label=CO_TEMP_A
  $2257 Move the value to the #REGc register.
N $2258 The mask (#REGb) and the value (#REGc) are now used to change ATTR-T.
@ $2258 label=CO_TEMP_B
  $2258 Move the value.
  $2259 Now change ATTR-T as needed.
N $225C Next MASK-T is considered.
  $225C The bits of MASK-T are set only when using PAPER/INK '8' or '9'.
  $2260 Now change MASK-T as needed.
N $2263 Next P-FLAG is considered.
  $2263 The appropriate mask is built up in the #REGb register in order to change bits 4 and 6 as necessary.
  $2268 The bits of P-FLAG are set only when using PAPER/INK '9'. Continue into #R$226C to manipulate P-FLAG.
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
D $24B7 This subroutine is called by #R$2382 to draw an approximation to a straight line from the point X0, Y0 held in COORDS to the point X0+X, Y0+Y, where the increments X and Y are on the top of the calculator stack. The subroutine was originally intended for the ZX80 and ZX81 8K ROM, and it is described in a BASIC program on page 121 of the ZX81 manual.
D $24B7 The method is to intersperse as many horizontal or vertical steps as are needed among a basic set of diagonal steps, using an algorithm that spaces the horizontal or vertical steps as evenly as possible.
  $24B7 ABS Y to #REGb; ABS X to #REGc; SGN Y to #REGd; SGN X to #REGe.
  $24BA Jump if ABS X is greater than or equal to ABS Y, so that the smaller goes to #REGl, and the larger (later) goes to #REGh.
  $24BF Save diagonal step (+/-1, +/-1) in #REGde.
  $24C0 Insert a vertical step (+/-1, 0) into #REGde (#REGd holds SGN Y).
  $24C2 Now jump to set #REGh.
@ $24C4 label=DL_X_GE_Y
  $24C4 Return if ABS X and ABS Y are both zero.
  $24C6 The smaller (ABS Y here) goes to #REGl.
  $24C7 ABS X to #REGb here, for #REGh.
  $24C8 Save the diagonal step here too.
  $24C9 Horizontal step (0, +/-1) to #REGde here.
@ $24CB label=DL_LARGER
  $24CB Larger of ABS X, ABS Y to #REGh now.
N $24CC The algorithm starts here. The larger of ABS X and ABS Y, say #REGh, is put into #REGa and reduced to INT (#REGh/2). The #REGh-#REGl horizontal or vertical steps and #REGl diagonal steps are taken (where #REGl is the smaller of ABS X and ABS Y) in this way: #REGl is added to #REGa; if #REGa now equals or exceeds #REGh, it is reduced by #REGh and a diagonal step is taken; otherwise a horizontal or vertical step is taken. This is repeated #REGh times (#REGb also holds #REGh). Note that meanwhile the exchange registers #REGh' and #REGl' are used to hold COORDS.
  $24CC #REGb to #REGa as well as to #REGh.
  $24CD #REGa starts at INT (#REGh/2).
@ $24CE label=D_L_LOOP
  $24CE #REGl is added to #REGa.
  $24CF If 256 or more, jump - diagonal step.
  $24D1 If #REGa is less than #REGh, jump for horizontal or vertical step.
@ $24D4 label=D_L_DIAG
  $24D4 Reduce #REGa by #REGh.
  $24D5 Restore it to #REGc.
  $24D6 Now use the exchange resisters.
  $24D7 Diagonal step to #REGbc'.
  $24D8 Save it too.
  $24D9 Jump to take the step.
@ $24DB label=D_L_HR_VT
  $24DB Save #REGa (unreduced) in #REGc.
  $24DC Step to stack briefly.
  $24DD Get exchange registers.
  $24DE Step to #REGbc' now.
@ $24DF label=D_L_STEP
  $24DF Now take the step: first, COORDS to #REGhl' as the start point.
  $24E2 Y-step from #REGb' to #REGa.
  $24E3 Add in #REGh'.
  $24E4 Result to #REGb'    .
  $24E5 Now the X-step; it will be tested for range (Y will be tested in #R$22DC).
  $24E7 Add #REGl' to #REGc' in #REGa, jump on carry for further test.
  $24EA Zero after no carry denotes X-position -1, out of range.
@ $24EC label=D_L_PLOT
  $24EC Restore true value to #REGa.
  $24ED Value to #REGc' for plotting.
  $24EE Plot the step.
  $24F1 Restore main registers.
  $24F2 #REGc back to #REGa to continue algorithm.
  $24F3 Loop back for #REGb steps (i.e. #REGh steps).
  $24F5 Clear machine stack.
  $24F6 Finished.
@ $24F7 label=D_L_RANGE
  $24F7 Zero after carry denotes X-position 255, in range.
N $24F9 Report B - Integer out of range.
@ $24F9 label=REPORT_B_3
M $24F9,2 Call the error handling routine.
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
c $2535 THE 'SCANNING SCREEN$' SUBROUTINE
D $2535 This subroutine is used to find the character that appears at line x, column y of the screen. It only searches the character set 'pointed to' by CHARS.
D $2535 Note: this is normally the characters +20 (space) to +7F (#CHR(169)) although the user can alter CHARS to match for other characters, including user-defined graphics.
@ $2535 label=S_SCRN_S
  $2535 x to #REGc, y to #REGb; 0<=x<=23 decimal; 0<=y<=31 decimal.
@ $253B keep
  $2538 CHARS plus 256 decimal gives #REGhl pointing to the character set.
  $253F x is copied to #REGa.
  $2540 The number 32*(x mod 8)+y is formed in #REGa and copied to #REGe. This is the low byte of the required screen address.
  $2547 x is copied to #REGa again.
  $2548 Now the number 64+8*INT (x/8) is inserted into #REGd. #REGde now holds the screen address.
  $254D #REGb counts the 96 characters.
@ $254F label=S_SCRN_LP
  $254F Save the count.
  $2550 And the screen pointer.
  $2551 And the character set pointer.
  $2552 Get first row of screen character.
  $2553 Match with row from character set.
  $2554 Jump if direct match found.
  $2556 Now test for match with inverse character (get +00 in #REGa from +FF).
  $2557 Jump if neither match found.
  $2559 Restore +FF to #REGa.
@ $255A label=S_SC_MTCH
  $255A Inverse status (+00 or +FF) to #REGc.
  $255B #REGb counts through the other 7 rows.
@ $255D label=S_SC_ROWS
  $255D Move #REGde to next row (add 256 dec.).
  $255E Move #REGhl to next row (i.e. next byte).
  $255F Get the screen row.
  $2560 Match with row from the ROM.
  $2561 Include the inverse status.
  $2562 Jump if row fails to match.
  $2564 Jump back till all rows done.
  $2566 Discard character set pointer.
  $2567 And screen pointer.
  $2568 Final count to #REGbc.
  $2569 Last character code in set plus one.
  $256B #REGa now holds required code.
@ $256C keep
  $256C One space is now needed in the work space.
  $256F Make the space.
  $2570 Put the character into it.
  $2571 Jump to stack the character.
@ $2573 label=S_SCR_NXT
  $2573 Restore character set pointer.
@ $2574 keep
  $2574 Move it on 8 bytes, to the next character in the set.
  $2578 Restore the screen pointer.
  $2579 And the counter.
  $257A Loop back for the 96 characters.
  $257C Stack the empty string (length zero).
@ $257D label=S_SCR_STO
  $257D Jump to stack the matching character, or the null string if no match is found.
E $2535 Note: this exit, via #R$2AB2, is a mistake as it leads to 'double storing' of the string result (see #R$25DB). The instruction line should be 'RET'.
@ $2580 label=S_ATTR_S
c $2580 THE 'SCANNING ATTRIBUTES' SUBROUTINE
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
D $26C9 When a variable name has been identified a call is made to #R$28B2 which looks through those variables that already exist in the variables area (or in the program area at DEF FN statements for a user-defined function FN). If an appropriate numeric value is found then it is copied to the calculator stack using #R$33B4. However a string or string array entry has to have the appropriate parameters passed to the calculator stack by #R$2996 (or in the case of a user-defined function, by #R$2951 as called from #R$28B2).
  $26C9 Look in the existing variables for the matching entry.
  $26CC An error is reported if there is no existing entry.
  $26CF Stack the parameters of the string entry/return numeric element base address.
  $26D2 Fetch FLAGS.
  $26D5 Test bits 6 and 7 together.
  $26D7 Jump if one or both bits are reset.
  $26D9 A numeric value is to be stacked.
  $26DA Move the number.
@ $26DD label=S_CONT_1
  $26DD Jump forward.
N $26DF The character is tested against the code for '-', thus identifying the 'unary minus' operation.
N $26DF Before the actual test the #REGb register is set to hold the priority +09 and the #REGc register the operation code +DB that are required for this operation.
@ $26DF keep
@ $26DF label=S_NEGATE
  $26DF Priority +09, operation code +DB.
  $26E2,c2 Is it a '-'?
  $26E4 Jump forward if it is 'unary minus'.
N $26E6 Next the character is tested against the code for 'VAL$', with priority 16 decimal and operation code 18 hex.
@ $26E6 keep
  $26E6 Priority 16 dec, operation code +18 hex.
  $26E9 Is it 'VAL$'?
  $26EB Jump forward if it is 'VAL$'.
N $26ED The present character must now represent one of the functions CODE to NOT, with codes +AF to +C3.
  $26ED The range of the functions is changed from +AF to +C3 to range +00 to +14 hex.
  $26EF Report an error if out of range.
N $26F2 The function 'NOT' is identified and dealt with separately from the others.
@ $26F2 keep
  $26F2 Priority +04, operation code +F0.
  $26F5 Is it the function 'NOT'?
  $26F7 Jump if it is so.
  $26F9 Check the range again.
N $26FC The remaining functions have priority 16 decimal. The operation codes for these functions are now calculated. Functions that operate on strings need bit 6 reset and functions that give string results need bit 7 reset in their operation codes.
  $26FC Priority 16 decimal.
  $26FE The function range is now +DC to +EF.
  $2700 Transfer the operation code.
  $2701 Separate CODE, VAL and LEN which operate on strings to give numerical results.
@ $2707 label=S_NO_TO_S
  $2707 Separate STR$ and CHR$ which operate on numbers to give string results.
  $270B Mark the operation codes. The other operation codes have bits 6 and 7 both set.
N $270D The priority code and the operation code for the function being considered are now pushed on to the machine stack. A hierarchy of operations is thereby built up.
@ $270D label=S_PUSH_PO
  $270D Stack the priority and operation codes before moving on to consider the next part of the expression.
N $2712 The scanning of the line now continues. The present argument may be followed by a '(', a binary operator or, if the end of the expression has been reached, then e.g. a carriage return character or a colon, a separator or a 'THEN'.
@ $2712 label=S_CONT_2
  $2712 Fetch the present character.
@ $2713 label=S_CONT_3
  $2713,4,c2,2 Jump forward if it is not a '(', which indicates a parenthesised expression.
N $2717 If the 'last value' is numeric then the parenthesised expression is a true sub-expression and must be evaluated by itself. However if the 'last value' is a string then the parenthesised expression represents an element of an array or a slice of a string. A call to #R$2A52 modifies the parameters of the string as required.
  $2717 Jump forward if dealing with a numeric parenthesised expression.
  $271D Modify the parameters of the 'last value'.
  $2720 Move on to consider the next character.
N $2723 If the present character is indeed a binary operator it will be given an operation code in the range +C3 to +CF hex, and the appropriate priority code.
@ $2723 label=S_OPERTR
  $2723 Original code to #REGbc to index into the #R$2795(table of operators).
  $2726 The pointer to the table.
  $2729 Index into the table.
  $272C Jump forward if no operation found.
  $272E Get required code from the table.
@ $272F nowarn
  $272F The pointer to the priority table (26ED+C3 gives #R$27B0 as the first address).
  $2732 Index into the table.
  $2733 Fetch the appropriate priority.
N $2734 The main loop of this subroutine is now entered. At this stage there are:
N $2734 #LIST { i. A 'last value' on the calculator stack. } { ii. The starting priority marker on the machine stack below a hierarchy, of unknown size, of function and binary operation codes. This hierarchy may be null. } { iii. The #REGbc register pair holding the 'present' operation and priority, which if the end of an expression has been reached will be priority zero. } LIST#
N $2734 Initially the 'last' operation and priority are taken off the machine stack and compared against the 'present' operation and priority.
@ $2734 label=S_LOOP
  $2734 he 'last' priority then an exit is made from the loop as the 'present' priority is considered to bind tighter than the 'last' priority.
  $2735 inding, then the operation specified as the 'last' operation is performed. The 'present' operation and priority go back on the machine stack to be carried round the loop again. In this manner the hierarchy of functions and binary operations that have been queued are dealt with in the correct order.
  $2734 Get the 'last' operation and priority.
  $2735 The priority goes to the #REGa register.
  $2736 Compare 'last' against 'present'.
  $2737 Exit to wait for the argument.
  $2739 Are both priorities zero?
  $273A Exit via #R$0018 thereby making 'last value' the required result.
N $273D Before the 'last' operation is performed, the 'USR' function is separated into 'USR number' and 'USR string' according as bit 6 of FLAGS was set or reset when the argument of the function was stacked as the 'last value'.
  $273D Stack the 'present' values.
  $273E This is FLAGS.
  $2741 The 'last' operation is compared with the code for USR, which will give 'USR number' unless modified; jump if not 'USR'.
  $2746 Test bit 6 of FLAGS.
  $2748 Jump if it is set ('USR number').
  $274A Modify the 'last' operation code: 'offset' 19, +80 for string input and numerical result ('USR string').
@ $274C label=S_STK_LST
  $274C Stack the 'last' values briefly.
  $274D Do not perform the actual operation if syntax is being checked.
  $2752 The 'last' operation code.
  $2753 Strip off bits 6 and 7 to convert the operation code to a calculator offset.
  $2756 Now use the calculator.
B $2757,1 #R$33A2: (perform the actual operation)
B $2758,1 #R$369B
  $2759 Jump forward.
N $275B An important part of syntax checking involves the testing of the operation to ensure that the nature of the 'last value' is of the correct type for the operation under consideration.
@ $275B label=S_SYNTEST
  $275B Get the 'last' operation code.
  $275C This tests the nature of the 'last value' against the requirement of the operation. They are to be the same for correct syntax.
@ $2761 label=S_RPORT_C_2
  $2761 Jump if syntax fails.
N $2764 Before jumping back to go round the loop again the nature of the 'last value' must be recorded in FLAGS.
@ $2764 label=S_RUNTEST
  $2764 Get the 'last' operation code.
  $2765 This is FLAGS.
  $2768 Assume result to be numeric.
  $276A Jump forward if the nature of 'last value' is numeric.
  $276E It is a string.
@ $2770 label=S_LOOPEND
  $2770 Get the 'present' values into #REGbc.
  $2771 Jump back.
N $2773 Whenever the 'present' operation binds tighter, the 'last' and the 'present' values go back on the machine stack. However if the 'present' operation requires a string as its operand then the operation code is modified to indicate this requirement.
@ $2773 label=S_TIGHTER
  $2773 The 'last' values go on the stack.
  $2774 Get the 'present' operation code.
  $2775 Do not modify the operation code if dealing with a numeric operand.
  $277B Clear bits 6 and 7.
  $277D Increase the code by +08 hex.
  $277F Return the code to the #REGc register.
  $2780 Is the operation 'AND'?
  $2782 Jump if it is not so.
  $2784 'AND' requires a numeric operand.
  $2786 Jump forward.
@ $2788 label=S_NOT_AND
  $2788 The operations -, *, /, #power and OR are not possible between strings.
  $278A Is the operation a '+'?
  $278C Jump if it is so.
  $278E The other operations yield a numeric result.
@ $2790 label=S_NEXT
  $2790 The 'present' values go on the machine stack.
  $2791 Consider the next character.
  $2792 Go around the loop again.
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
D $27BD This subroutine evaluates a user defined function which occurs in a BASIC line. The subroutine can be considered in four stages:
D $27BD #LIST { i. The syntax of the FN statement is checked during syntax checking. } { ii. During line execution, a search is made of the program area for a DEF FN statement, and the names of the functions are compared, until a match is found - or an error is reported. } { iii. The arguments of the FN are evaluated by calls to #R$24FB. } { iv. The function itself is evaluated by calling #R$24FB, which in turn calls #R$28B2 and so #R$2951. } LIST#
  $27BD Unless syntax is being checked, a jump is made to #R$27F7.
  $27C2 Get the first character of the name.
  $27C3 If it is not alphabetic, then report the error.
  $27C9 Get the next character.
  $27CA,c2 Is it a '$'?
  $27CC Save the zero flag on the stack.
  $27CD Jump if it was not a '$'.
  $27CF But get the next character if it was.
@ $27D0 label=SF_BRKT_1
  $27D0,4,c2,2 If the character is not a '(', then report the error.
  $27D4 Get the next character.
  $27D5,c2 Is it a ')'?
  $27D7 Jump if it is; there are no arguments.
@ $27D9 label=SF_ARGMTS
  $27D9 Within the loop, call #R$24FB to check the syntax of each argument and to insert floating-point numbers.
  $27DC,5,1,c2,2 Get the character which follows the argument; if it is not a ',' then jump - no more arguments.
  $27E1 Get the first character in the next argument.
  $27E2 Loop back to consider this argument.
@ $27E4 label=SF_BRKT_2
  $27E4,c2 Is the current character a ')'?
@ $27E6 label=SF_RPRT_C
  $27E6 Report the error if it is not.
@ $27E9 label=SF_FLAG_6
  $27E9 Point to the next character in the BASIC line.
  $27EA This is FLAGS; assume a string-valued function and reset bit 6 of FLAGS.
  $27EF Restore the zero flag, jump if the FN is indeed string-valued.
  $27F2 Otherwise, set bit 6 of FLAGS.
@ $27F4 label=SF_SYN_EN
  $27F4 Jump back to continue scanning the line.
N $27F7 ii. During line execution, a search must first be made for a DEF FN statement.
@ $27F7 label=SF_RUN
  $27F7 Get the first character of the name.
  $27F8 Reset bit 5 for upper case.
  $27FA Copy the name to #REGb.
  $27FB Get the next character.
  $27FC,c2 Subtract 24 hex, the code for '$'.
  $27FE Copy the result to #REGc (zero for a string, non-zero for a numerical function).
  $27FF Jump if non-zero: numerical function.
  $2801 Get the next character, the '('.
@ $2802 label=SF_ARGMT1
  $2802 Get 1st character of 1st argument.
  $2803 Save the pointer to it on the stack.
  $2804 Point to the start of the program.
  $2807 Go back one location.
@ $2808 keep
@ $2808 label=SF_FND_DF
  $2808 The search will be for 'DEF FN'.
  $280B Save the name and 'string status'.
  $280C Search the program now.
  $280F Restore the name and status.
  $2810 Jump if a DEF FN statement found.
N $2812 REPORT P - FN without DEF.
@ $2812 label=REPORT_P
M $2812,2 Call the error handling routine.
B $2813,1
N $2814 When a DEF FN statement is found, the name and status of the two functions are compared; if they do not match, the search is resumed.
@ $2814 label=SF_CP_DEF
  $2814 Save the pointer to the DEF FN character in case the search has to be resumed.
  $2815 Get the name of the DEF FN function.
  $2818 Reset bit 5 for upper case.
  $281A Does it match the FN name?
  $281B Jump if it does not match.
  $281D Get the next character in the DEF FN.
  $2820,c2 Subtract 24 hex, the code for '$'.
  $2822 Compare the status with that of FN.
  $2823 Jump if complete match now found.
@ $2825 label=SF_NOT_FD
  $2825 Restore the pointer to the 'DEF FN'.
  $2826 Step back one location.
@ $2827 keep
  $2827 Use the search routine to find the end of the DEF FN statement, preparing for the next search; save the name and status meanwhile.
  $282F Jump back for a further search.
N $2831 iii. The correct DEF FN statement has now been found. The arguments of the FN statement will be evaluated by repeated calls of #R$24FB, and their 5 byte values (or parameters, for strings) will be inserted into the DEF FN statement in the spaces made there at syntax checking. #REGhl will be used to point along the DEF FN statement (calling #R$28AB as needed) while CH-ADD points along the FN statement (calling #R$0020 as needed).
@ $2831 label=SF_VALUES
  $2831 If #REGhl is now pointing to a '$', move on to the '('.
  $2835 Discard the pointer to 'DEF FN'.
  $2836 Get the pointer to the first argument of FN, and copy it to CH-ADD.
  $283B Move past the '(' now.
  $283E Save this pointer on the stack.
  $283F,c2 Is it pointing to a ')'?
  $2841 If so, jump: FN has no arguments.
@ $2843 label=SF_ARG_LP
  $2843 Point to the next code.
  $2844 Put the code into #REGa.
  $2845 Is it the 'number marker' code, 0E hex?
  $2847 Set bit 6 of #REGd for a numerical argument.
  $2849 Jump on zero: numerical argument.
  $284B Now ensure that #REGhl is pointing to the '$' character (not e.g. to a control code).
  $284F #REGhl now points to the 'number marker'.
  $2850 Bit 6 of #REGd is reset: string argument.
@ $2852 label=SF_ARG_VL
  $2852 Point to the 1st of the 5 bytes in DEF FN.
  $2853 Save this pointer on the stack.
  $2854 Save the 'string status' of the argument.
  $2855 Now evaluate the argument.
  $2858 Get the no./string flag into #REGa.
  $2859 Test bit 6 of it against the result of #R$24FB.
  $285E Give report Q if they did not match.
  $2860 Get the pointer to the first of the 5 spaces in DEF FN into #REGde.
  $2862 Point #REGhl at STKEND.
@ $2865 keep
  $2865 #REGbc will count 5 bytes to be moved.
  $2868 First, decrease STKEND by 5, so deleting the 'last value' from the stack.
  $286D Copy the 5 bytes into the spaces in DEF FN.
  $286F Point #REGhl at the next code.
  $2870 Ensure that #REGhl points to the character after the 5 bytes.
  $2874,c2 Is it a ')'?
  $2876 Jump if it is: no more arguments in the DEF FN statement.
  $2878 It is a ',': save the pointer to it.
  $2879 Get the character after the last argument that was evaluated from FN.
  $287A,4,c2,2 If it is not a ',' jump: mismatched arguments of FN and DEF FN.
  $287E Point CH-ADD to the next argument of FN.
  $287F Point #REGhl to the ',' in DEF FN again.
  $2880 Move #REGhl on to the next argument in DEF FN.
  $2883 Jump back to consider this argument.
@ $2885 label=SF_R_BR_2
  $2885 Save the pointer to the ')' in DEF FN.
  $2886 Get the character after the last argument in FN.
  $2887,c2 Is it a ')'?
  $2889 If so, jump to evaluate the function; but if not, give report Q.
N $288B REPORT Q - Parameter error.
@ $288B label=REPORT_Q
M $288B,2 Call the error handling routine.
B $288C,1
N $288D iv. Finally, the function itself is evaluated by calling #R$24FB, after first setting DEFADD to hold the address of the arguments as they occur in the DEF FN statement.  This ensures that #R$28B2, when called by #R$24FB, will first search these arguments for the required values, before making a search of the variables area.
@ $288D label=SF_VALUE
  $288D Restore pointer to ')' in DEF FN.
  $288E Get this pointer into #REGhl.
  $288F Insert it into CH-ADD.
  $2892 Get the old value of DEFADD.
  $2895 Stack it, and get the start address of the arguments area of DEF FN into DEFADD.
  $2899 Save address of ')' in FN.
  $289A Move CH-ADD on past ')' and '=' to the start of the expression for the function in DEF FN.
  $289C Now evaluate the function.
  $289F Restore the address of ')' in FN.
  $28A0 Store it in CH-ADD.
  $28A3 Restore original value of DEFADD.
  $28A4 Put it back into DEFADD.
  $28A7 Get the next character in the BASIC line.
  $28A8 Jump back to continue scanning.
@ $28AB label=FN_SKPOVR
c $28AB THE 'FUNCTION SKIPOVER' SUBROUTINE
@ $28B2 label=LOOK_VARS
c $28B2 THE 'LOOK-VARS' SUBROUTINE
D $28B2 This subroutine is called whenever a search of the variables area or of the arguments of a DEF FN statement is required. The subroutine is entered with the system variable CH-ADD pointing to the first letter of the name of the variable whose location is being sought. The name will be in the program area or the work space. The subroutine initially builds up a discriminator byte, in the #REGc register, that is based on the first letter of the variable's name. Bits 5 and 6 of this byte indicate the type of the variable that is being handled.
D $28B2 The #REGb register is used as a bit register to hold flags.
  $28B2 Presume a numeric variable.
  $28B6 Get the first character into #REGa.
  $28B7 Is it alphabetic?
  $28BA Give an error report if it is not so.
  $28BD Save the pointer to the first letter.
  $28BE Transfer bits 0 to 4 of the letter to the #REGc register; bits 5 and 7 are always reset.
  $28C1 Get the second character into #REGa.
  $28C2 Save this pointer also.
  $28C3,c2 Is the second character a '('?
  $28C5 Separate arrays of numbers.
  $28C7 Now set bit 6.
  $28C9,c2 Is the second character a '$'?
  $28CB Separate all the strings.
  $28CD Now set bit 5.
  $28CF If the variable's name has only one character then jump forward.
N $28D4 Now find the end character of a name that has more than one character.
@ $28D4 label=V_CHAR
  $28D4 Is the character alphanumeric?
  $28D7 Jump out of the loop when the end of the name is found.
  $28D9 Mark the discriminator byte.
  $28DB Get the next character.
  $28DC Go back to test it.
N $28DE Simple strings and arrays of strings require that bit 6 of FLAGS is reset.
@ $28DE label=V_STR_VAR
  $28DE Step CH-ADD past the '$'.
  $28DF Reset bit 6 to indicate a string.
N $28E3 If DEFADD-hi is non-zero, indicating that a 'function' (a 'FN') is being evaluated, and if in 'run-time', a search will be made of the arguments in the DEF FN statement.
@ $28E3 label=V_TEST_FN
  $28E3 Is DEFADD-hi zero?
  $28E7 If so, jump forward.
  $28E9 In 'run-time'?
  $28EC If so, jump forward to search the DEF FN statement.
N $28EF Otherwise (or if the variable was not found in the DEF FN statement) a search of variables area will be made, unless syntax is being checked.
@ $28EF label=V_RUN_SYN
  $28EF Copy the discriminator byte to the #REGb register.
  $28F0 Jump forward if in 'run-time'.
  $28F5 Move the discriminator to #REGa.
  $28F6 Drop the character code part.
  $28F8 Indicate syntax by setting bit 7.
  $28FA Restore the discriminator.
  $28FB Jump forward to continue.
N $28FD A BASIC line is being executed so make a search of the variables area.
@ $28FD label=V_RUN
  $28FD Pick up the VARS pointer.
N $2900 Now enter a loop to consider the names of the existing variables.
@ $2900 label=V_EACH
  $2900 The first letter of each existing variable.
  $2901 Match on bits 0 to 6.
  $2903 Jump when the '80-byte' is reached.
  $2905 The actual comparison.
  $2906 Jump forward if the first characters do not match.
  $2908 Rotate #REGa leftwards and then double it to test bits 5 and 6.
  $290A Strings and array variables.
  $290D Simple numeric and FOR-NEXT variables.
N $290F Long names are required to be matched fully.
  $290F Take a copy of the pointer to the second character.
  $2911 Save the first letter pointer.
@ $2912 label=V_MATCHES
  $2912 Consider the next character.
@ $2913 label=V_SPACES
  $2913 Fetch each character in turn.
  $2914 Point to the next character.
  $2915,c2 Is the character a 'space'?
  $2917 Ignore the spaces.
  $2919 Set bit 5 so as to match lower and upper case letters.
  $291B Make the comparison.
  $291C Back for another character if it does match.
  $291E Will it match with bit 7 set?
  $2920 Try it.
  $2921 Jump forward if the 'last characters' do not match.
  $2923 Check that the end of the name has been reached before jumping forward.
N $2929 In all cases where the names fail to match the #REGhl register pair has to be made to point to the next variable in the variables area.
@ $2929 label=V_GET_PTR
  $2929 Fetch the pointer.
@ $292A label=V_NEXT
  $292A Save #REGb and #REGc briefly.
  $292B #REGde is made to point to the next variable.
  $292E Switch the two pointers.
  $292F Get #REGb and #REGc back.
  $2930 Go around the loop again.
N $2932 Come here if no entry was found with the correct name.
@ $2932 label=V_80_BYTE
  $2932 Signal 'variable not found'.
N $2934 Come here if checking syntax.
@ $2934 label=V_SYNTAX
  $2934 Drop the pointer to the second character.
  $2935 Fetch the present character.
  $2936,c2 Is it a '('?
  $2938 Jump forward if so.
  $293A Indicate not dealing with an array and jump forward.
N $293E Come here when an entry with the correct name was found.
@ $293E label=V_FOUND_1
  $293E Drop the saved variable pointer.
@ $293F label=V_FOUND_2
  $293F Drop the second character pointer.
  $2940 Drop the first letter pointer.
  $2941 Save the 'last' letter pointer.
  $2942 Fetch the current character.
N $2943 If the matching variable name has more than a single letter then the other characters must be passed over.
N $2943 Note: This appears to have been done already at #R$28D4.
@ $2943 label=V_PASS
  $2943 Is it alphanumeric?
  $2946 Jump when the end of the name has been found.
  $2948 Fetch the next character.
  $2949 Go back and test it.
N $294B The exit-parameters are now set.
@ $294B label=V_END
  $294B #REGhl holds the pointer to the letter of a short name or the 'last' character of a long name.
  $294C Rotate the whole register.
  $294E Specify the state of bit 6.
  $2950 Finished.
E $28B2 The exit-parameters for the subroutine can be summarised as follows.
E $28B2 The system variable CH-ADD points to the first location after the name of the variable as it occurs in the BASIC line.
E $28B2 When 'variable not found':
E $28B2 #LIST { The carry flag is set. } { The zero flag is set only when the search was for an array variable. } { The #REGhl register pair points to the first letter of the name of the variable as it occurs in the BASIC line. } LIST#
E $28B2 When 'variable found':
E $28B2 #LIST { The carry flag is reset. } { The zero flag is set for both simple string variables and all array variables. } { The #REGhl register pair points to the letter of a 'short' name, or the last character of a 'long' name, of the existing entry that was found in the variables area. } LIST#
E $28B2 In all cases bits 5 and 6 of the #REGc register indicate the type of variable being handled. Bit 7 is the complement of the SYNTAX/RUN flag. But only when the subroutine is used in 'runtime' will bits 0 to 4 hold the code of the variable's letter.
E $28B2 In syntax time the return is always made with the carry flag reset. The zero flag is set for arrays and reset for all other variables, except that a simple string name incorrectly followed by a '$' sets the zero flag and, in the case of SAVE "name" DATA a$(), passes syntax as well.
@ $2951 label=STK_F_ARG
c $2951 THE 'STACK FUNCTION ARGUMENT' SUBROUTINE
D $2951 This subroutine is called by #R$28B2 when DEFADD-hi is non-zero, to make a search of the arguments area of a DEF FN statement, before searching in the variables area. If the variable is found in the DEF FN statement, then the parameters of a string variable are stacked and a signal is given that there is no need to call #R$2996. But it is left to #R$24FB to stack the value of a numerical variable at #R$26DA in the usual way.
  $2951 Point to the first character in the arguments area and put it into #REGa.
  $2955,c2 Is it a ')'?
  $2957 Jump to search the variables area.
@ $295A label=SFA_LOOP
  $295A Get the next argument in the loop.
  $295B Set bits 5 and 6, assuming a simple numeric variable; copy it to #REGb.
  $295E Point to the next code.
  $295F Put it into the #REGa register.
  $2960 Is it the 'number marker' code 0E hex?
  $2962 Jump if so: numeric variable.
  $2964 Ensure that #REGhl points to the character, not to a space or control code.
  $2968 #REGhl now points to the 'number marker'.
  $2969 Reset bit 5 of #REGb: string variable.
@ $296B label=SFA_CP_VR
  $296B Get the variable name into #REGa.
  $296C Is it the one we are looking for?
  $296D Jump if it matches.
  $296F Now pass over the 5 bytes of the floating-point number or string parameters to get to the next argument.
  $2974 Pass on to the next character.
  $2977,c2 Is it a ')'?
  $2979 If so, jump to search the variables area.
  $297C Point to the next argument.
  $297F Jump back to consider it.
N $2981 A match has been found. The parameters of a string variable are stacked, avoiding the need to call #R$2996.
@ $2981 label=SFA_MATCH
  $2981 Test for a numeric variable.
  $2983 Jump if the variable is numeric; #R$24FB will stack it.
  $2985 Point to the first of the 5 bytes to be stacked.
  $2986 Point #REGde to STKEND.
  $298A Stack the 5 bytes.
  $298D Point #REGhl to the new position of STKEND, and reset the system variable.
@ $2991 label=SFA_END
  $2991 Discard the #R$28B2 pointers (second and first character pointers).
  $2993 Return from the search with both the carry and zero flags reset - signalling that a call #R$2996 is not required.
  $2995 Finished.
@ $2996 label=STK_VAR
c $2996 THE 'STK-VAR' SUBROUTINE
D $2996 This subroutine is used either to find the parameters that define an existing string entry in the variables area, or to return in the #REGhl register pair the base address of a particular element or an array of numbers. When called from #R$2C02 the subroutine only checks the syntax of the BASIC statement.
D $2996 Note that the parameters that define a string may be altered by calling #R$2A52 if this should be specified.
D $2996 Initially the #REGa and the #REGb registers are cleared and bit 7 of the #REGc register is tested to determine whether syntax is being checked.
  $2996 Clear the array flag.
  $2997 Clear the #REGb register for later.
  $2998 Jump forward if syntax is being checked.
N $299C Next, simple strings are separated from array variables.
  $299C Jump forward if dealing with an array variable.
N $29A0 The parameters for a simple string are readily found.
  $29A0 Signal 'a simple string'.
@ $29A1 label=SV_SIMPLE
  $29A1 Move along the entry.
  $29A2 Pick up the low length counter.
  $29A3 Advance the pointer.
  $29A4 Pick up the high length pointer.
  $29A5 Advance the pointer.
  $29A6 Transfer the pointer to the actual string.
  $29A7 Pass these parameters to the calculator stack.
  $29AA Fetch the present character and jump forward to see if a 'slice' is required.
N $29AE The base address of an element in an array is now found. Initially the 'number of dimensions' is collected.
@ $29AE label=SV_ARRAYS
  $29AE Step past the length bytes.
  $29B1 Collect the 'number of dimensions'.
  $29B2 Jump forward if handling an array of numbers.
N $29B6 If an array of strings has its 'number of dimensions' equal to '1' then such an array can be handled as a simple string.
  $29B6 Decrease the 'number of dimensions' and jump if the number is now zero.
N $29B9 Next a check is made to ensure that in the BASIC line the variable is followed by a subscript.
  $29B9 Save the pointer in #REGde.
  $29BA Get the present character.
  $29BB,c2 Is it a '('?
  $29BD Report the error if it is not so.
  $29BF Restore the pointer.
N $29C0 For both numeric arrays and arrays of strings the variable pointer is transferred to the #REGde register pair before the subscript is evaluated.
@ $29C0 label=SV_PTR
  $29C0 Pass the pointer to #REGde.
  $29C1 Jump forward.
N $29C3 The following loop is used to find the parameters of a specified element within an array. The loop is entered at the mid-point - #R$29E7 - where the element count is set to zero.
N $29C3 The loop is accessed '#REGb' times, this being, for a numeric array, equal to the number of dimensions that are being used, but for an array of strings '#REGb' is one less than the number of dimensions in use as the last subscript is used to specify a 'slice' of the string.
@ $29C3 label=SV_COMMA
  $29C3 Save the counter.
  $29C4 Get the present character.
  $29C5 Restore the counter.
  $29C6,c2 Is the present character a ','?
  $29C8 Jump forward to consider another subscript.
  $29CA If a line is being executed then there is an error.
  $29CE Jump forward if dealing with an array of strings.
  $29D2,c2 Is the present character a ')'?
  $29D4 Report an error if not so.
  $29D6 Advance CH-ADD.
  $29D7 Return as the syntax is correct.
N $29D8 For an array of strings the present subscript may represent a 'slice', or the subscript for a 'slice' may yet be present in the BASIC line.
@ $29D8 label=SV_CLOSE
  $29D8,c2 Is the present character a ')'?
  $29DA Jump forward and check whether there is another subscript.
  $29DC Is the present character a 'TO'?
  $29DE It must not be otherwise.
@ $29E0 label=SV_CH_ADD
  $29E0 Get the present character.
  $29E1 Point to the preceding character and set CH-ADD.
  $29E5 Evaluate the 'slice'.
N $29E7 Enter the loop here.
@ $29E7 keep
@ $29E7 label=SV_COUNT
  $29E7 Set the counter to zero.
@ $29EA label=SV_LOOP
  $29EA Save the counter briefly.
  $29EB Advance CH-ADD.
  $29EC Restore the counter.
  $29ED Fetch the discriminator byte.
  $29EE Jump unless checking the syntax for an array of strings.
  $29F2 Get the present character.
  $29F3,c2 Is it a ')'?
  $29F5 Jump forward as finished counting elements.
  $29F7 Is to 'TO'?
  $29F9 Jump back if dealing with a 'slice'.
@ $29FB label=SV_MULT
  $29FB Save the dimension-number counter and the discriminator byte.
  $29FC Save the element-counter.
  $29FD Get a dimension-size into #REGde.
  $2A00 The counter moves to #REGhl and the variable pointer is stacked.
  $2A01 The counter moves to #REGde and the dimension-size to #REGhl.
  $2A02 Evaluate the next subscript.
  $2A05 Give an error if out of range.
  $2A07 The result of the evaluation is decremented as the counter is to count the elements occurring before the specified element.
  $2A08 Multiply the counter by the dimension-size.
  $2A0B Add the result of #R$2ACC to the present counter.
  $2A0C Fetch the variable pointer.
  $2A0D Fetch the dimension-number and the discriminator byte.
  $2A0E Keep going round the loop until '#REGb' equals zero.
N $2A10 The SYNTAX/RUN flag is checked before arrays of strings are separated from arrays of numbers.
  $2A10 Report an error if checking syntax at this point.
@ $2A12 label=SV_RPT_C
  $2A14 Save the counter.
  $2A15 Jump forward if handling an array of strings.
N $2A19 When dealing with an array of numbers the present character must be a ')'.
  $2A19 Transfer the variable pointer to the #REGbc register pair.
  $2A1B Fetch the present character.
  $2A1C,c2 Is it a ')'?
  $2A1E Jump past the error report unless it is needed.
N $2A20 Report 3 - Subscript out of range.
@ $2A20 label=REPORT_3
M $2A20,2 Call the error handling routine.
B $2A21,1
N $2A22 The address of the location before the actual floating-point form can now be calculated.
@ $2A22 label=SV_NUMBER
  $2A22 Advance CH-ADD.
  $2A23 Fetch the counter.
@ $2A24 keep
  $2A24 There are 5 bytes to each element in an array of numbers.
  $2A27 Compute the total number of bytes before the required element.
  $2A2A Make #REGhl point to the location before the required element.
  $2A2B Return with this address.
N $2A2C When dealing with an array of strings the length of an element is given by the last 'dimension-size'. The appropriate parameters are calculated and then passed to the calculator stack.
@ $2A2C label=SV_ELEM
  $2A2C Fetch the last dimension-size.
  $2A2F The variable pointer goes on the stack and the counter to #REGhl.
  $2A30 Multiply 'counter' by 'dimension-size'.
  $2A33 Fetch the variable pointer.
  $2A34 This gives #REGhl pointing to the location before the string.
  $2A35 So point to the actual 'start'.
  $2A36 Transfer the last dimension-size to #REGbc to form the 'length'.
  $2A38 Move the 'start' to #REGde.
  $2A39 Pass these parameters to the calculator stack. Note: The first parameter is zero indicating a string from an 'array of strings' and hence the existing entry is not to be reclaimed.
N $2A3C There are three possible forms of the last subscript:
N $2A3C #LIST { A$(2,4 TO 8) } { A$(2)(4 TO 8) } { A$(2) } LIST#
N $2A3C The last of these is the default form and indicates that the whole string is required.
  $2A3C Get the present character.
  $2A3D,c2 Is it a ')'?
  $2A3F Jump if it is so.
  $2A41,c2 Is it a ','?
  $2A43 Report the error if not so.
@ $2A45 label=SV_SLICE
  $2A45 Use #R$2A52 to modify the set of parameters.
@ $2A48 label=SV_DIM
  $2A48 Fetch the next character.
@ $2A49 label=SV_SLICE2
  $2A49,c2 Is It a '('?
  $2A4B Jump back if there is a 'slice' to be considered.
N $2A4D When finished considering the last subscript a return can be made.
  $2A4D Signal - string result.
  $2A51 Return with the parameters of the required string forming a 'last value' on the calculator stack.
@ $2A52 label=SLICING
c $2A52 THE 'SLICING' SUBROUTINE
D $2A52 The present string can be sliced using this subroutine. The subroutine is entered with the parameters of the string being present on the top of the calculator stack and in the registers #REGa, #REGb, #REGc, #REGd and #REGe. Initially the SYNTAX/RUN flag is tested and the parameters of the string are fetched only if a line is being executed.
  $2A52 Check the flag.
  $2A55 Take the parameters off the stack in 'run-time'.
N $2A58 The possibility of the 'slice' being '()' has to be considered.
  $2A58 Get the next character.
  $2A59,c2 Is it a ')'?
  $2A5B Jump forward if it is so.
N $2A5D Before proceeding the registers are manipulated as follows:
  $2A5D The 'start' goes on the machine stack.
  $2A5E The #REGa register is cleared and saved.
  $2A60 The 'length' is saved briefly.
@ $2A61 keep
  $2A61 Presume that the 'slice' is to begin with the first character.
  $2A64 Get the first character.
  $2A65 Pass the 'length' to #REGhl.
N $2A66 The first parameter of the 'slice' is now evaluated.
  $2A66 Is the present character a 'TO'?
  $2A68 The first parameter, by default, will be '1' if the jump is taken.
  $2A6A At this stage #REGa is zero.
  $2A6B #REGbc is made to hold the first parameter. #REGa will hold +FF if there has been an 'out of range' error.
  $2A6E Save the value anyway.
  $2A6F Transfer the first parameter to #REGde.
  $2A71 Save the 'length' briefly.
  $2A72 Get the present character.
  $2A73 Restore the 'length'.
  $2A74 Is the present character a 'TO'?
  $2A76,4,2,c2 Jump forward to consider the second parameter if it is so; otherwise show that there is a closing bracket.
@ $2A7A label=SL_RPT_C
N $2A7D At this point a 'slice' of a single character has been identified. e.g. A$(4).
  $2A7D The last character of the 'slice' is also the first character.
  $2A7F Jump forward.
N $2A81 The second parameter of a 'slice' is now evaluated.
@ $2A81 label=SL_SECOND
  $2A81 Save the 'length' briefly.
  $2A82 Get the next character.
  $2A83 Restore the 'length'.
  $2A84,c2 Is the present character a ')'?
  $2A86 Jump if there is not a second parameter.
  $2A88 If the first parameter was in range #REGa will hold zero, otherwise +FF.
  $2A89 Make #REGbc hold the second parameter.
  $2A8C Save the 'error register'.
  $2A8D Get the present character.
  $2A8E Pass the result obtained from #R$2ACD to the #REGhl register pair.
  $2A90,4,c2,2 Check that there is a closing bracket now.
N $2A94 The 'new' parameters are now defined.
@ $2A94 label=SL_DEFINE
  $2A94 Fetch the 'error register'.
  $2A95 The second parameter goes on the stack and the 'start' goes to #REGhl.
  $2A96 The first parameter is added to the 'start'.
  $2A97 Go back a location to get it correct.
  $2A98 The 'new start' goes on the stack and the second parameter goes to #REGhl.
  $2A99 Subtract the first parameters from the second to find the length of the 'slice'.
@ $2A9C keep
  $2A9C Initialise the 'new length'.
  $2A9F A negative 'slice' is a 'null string' rather than an error condition.
  $2AA1 Allow for the inclusive byte.
  $2AA2 Only now test the 'error register'.
  $2AA3 Jump if either parameter was out of range for the string.
  $2AA6 Transfer the 'new length' to #REGbc.
@ $2AA8 label=SL_OVER
  $2AA8 Get the 'new start'.
  $2AA9 Ensure that a string is still indicated.
@ $2AAD label=SL_STORE
  $2AAD Return at this point if checking syntax; otherwise continue into #R$2AB1.
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
D $2AFF This is the actual assignment routine for the LET, READ and INPUT commands.
D $2AFF When the destination variable is a 'newly declared variable' then DEST will point to the first letter of the variable's name as it occurs in the BASIC line. Bit 1 of FLAGX will be set.
D $2AFF However if the destination variable 'exists already' then bit 1 of FLAGX will be reset and DEST will point for a numeric variable to the location before the five bytes of the 'old number', and for a string variable to the first location of the 'old string'. The use of DEST in this manner applies to simple variables and to elements of arrays.
D $2AFF Bit 0 of FLAGX is set if the destination variable is a 'complete' simple string variable. (Signalling - delete the old copy.) Initially the current value of DEST is collected and bit 1 of FLAGS tested.
  $2AFF Fetch the present address in DEST.
  $2B02 Jump if handling a variable that 'exists already'.
N $2B08 #REGa 'newly declared variable' is being used. So first the length of its name is found.
@ $2B08 keep
  $2B08 Presume dealing with a numeric variable - 5 bytes.
N $2B0B Enter a loop to deal with the characters of a long name. Any spaces or colour codes in the name are ignored.
@ $2B0B label=L_EACH_CH
  $2B0B Add '1' to the counter for each character of a name.
@ $2B0C label=L_NO_SP
  $2B0C Move along the variable's name.
  $2B0D Fetch the 'present code'.
  $2B0E,4,c2,2 Jump back if it is a 'space'; thereby Ignoring spaces.
  $2B12 Jump forward if the code is +21 to +FF.
  $2B14 Accept, as a final code, those in the range +00 to +0F.
  $2B18 Also accept the range +16 to +1F.
  $2B1C Step past the control code after any of INK to OVER.
  $2B1D Jump back as these control codes are treated as spaces.
N $2B1F Separate 'numeric' and 'string' names.
  $2B1F Is the code alphanumeric?
  $2B22 If It is so then accept it as a character of a 'long' name.
  $2B24,c2 Is the present code a '$'?
  $2B26 Jump forward as handling a 'newly declared' simple string.
N $2B29 The 'newly declared numeric variable' presently being handled will require '#REGbc' spaces in the variables area for its name and its value. The room is made available and the name of the variable is copied over with the characters being 'marked' as required.
@ $2B29 label=L_SPACES
  $2B29 Copy the 'length' to #REGa.
  $2B2A Make #REGhl point to the '80-byte' at the end of the variables area.
  $2B2E Now open up the variables area. Note: In effect '#REGbc' spaces are made before the displaced '80-byte'.
  $2B31 Point to the first 'new' byte.
  $2B32 Make #REGde point to the second 'new' byte.
  $2B34 Save this pointer.
  $2B35 Fetch the pointer to the start of the name.
  $2B38 Make #REGde point to the first 'new' byte.
  $2B39 Make #REGb hold the 'number of extra letters' that are found in a 'long name'.
  $2B3C Jump forward if dealing with a variable with a 'short name'.
N $2B3E The 'extra' codes of a long name are passed to the variables area.
@ $2B3E label=L_CHAR
  $2B3E Point to each 'extra' code.
  $2B3F Fetch the code.
  $2B40 Accept codes from +21 to +FF; ignore codes +00 to +20.
  $2B44 Set bit 5, as for lower case letters.
  $2B46 Transfer the codes in turn to the 2nd 'new' byte onwards.
  $2B48 Go round the loop for all the 'extra' codes.
N $2B4A The last code of a 'long' name has to be ORed with +80.
  $2B4A Mark the code as required and overwrite the last code.
N $2B4D The first letter of the name of the variable being handled is now considered.
  $2B4D Prepare to mark the letter of a 'long' name.
@ $2B4F label=L_SINGLE
  $2B4F Fetch the pointer to the letter.
  $2B52 #REGa holds +00 for a 'short' name and +C0 for a 'long' name.
  $2B53 Set bit 5, as for lower case letters.
  $2B55 Drop the pointer now.
N $2B56 The subroutine #R$2BEA is now called to enter the 'letter' into its appropriate location.
  $2B56 Enter the letter and return with #REGhl pointing to 'new 80-byte'.
N $2B59 The 'last value' can now be transferred to the variables area. Note that at this point #REGhl always points to the location after the five locations allotted to the number.
@ $2B59 label=L_NUMERIC
N $2B59 A 'RST 28' instruction is used to call the calculator and the 'last value' is deleted. However this value is not overwritten.
  $2B59 Save the 'destination' pointer.
  $2B5A Use the calculator to move STKEND back five bytes.
B $2B5B,1 #R$33A1
B $2B5C,1 #R$369B
  $2B5D Restore the pointer.
@ $2B5E keep
  $2B5E Give the number a 'length' of five bytes.
  $2B61 Make #REGhl point to the first of the five locations and jump forward to make the actual transfer.
N $2B66 Come here if considering a variable that 'exists already'. First bit 6 of FLAGS is tested so as to separate numeric variables from string or array of string variables.
@ $2B66 label=L_EXISTS
  $2B66 Jump forward if handling any kind of string variable.
N $2B6C For numeric variables the 'new' number overwrites the 'old' number. So first #REGhl has to be made to point to the location after the five bytes of the existing entry. At present #REGhl points to the location before the five bytes.
@ $2B6C keep
  $2B6C The five bytes of a number + 1.
  $2B6F #REGhl now points 'after'.
  $2B70 Jump back to make the actual transfer.
N $2B72 The parameters of the string variable are fetched and complete simple strings separated from 'sliced' strings and array strings.
@ $2B72 label=L_DELETE
  $2B72 Fetch the 'start'. Note: This line is redundant.
  $2B75 Fetch the 'length'.
  $2B79 Jump if dealing with a complete simple string; the old string will need to be 'deleted' in this case only.
N $2B7F When dealing with a 'slice' of an existing simple string, a 'slice' of a string from an array of strings or a complete string from an array of strings there are two distinct stages involved. The first is to build up the 'new' string in the work space, lengthening or shortening it as required. The second stage is then to copy the 'new' string to its allotted room in the variables area.
N $2B7F However do nothing if the string has no 'length'.
  $2B7F Return if the string is a null string.
N $2B82 Then make the required number of spaces available in the work space.
  $2B82 Save the 'start' (DEST).
  $2B83 Make the necessary amount of room in the work space.
  $2B84 Save the pointer to the first location.
  $2B85 Save the 'length' for use later on.
  $2B86 Make #REGde point to the last location.
  $2B88 Make #REGhl point 'one past' the new locations.
  $2B89,c2 Enter a 'space' character.
  $2B8B Copy this character into all the new locations. Finish with #REGhl pointing to the first new location.
N $2B8D The parameters of the string being handled are now fetched from the calculator stack.
  $2B8D Save the pointer briefly.
  $2B8E Fetch the 'new' parameters.
  $2B91 Restore the pointer.
N $2B92 Note: At this point the required amount of room has been made available in the work space for the 'variable in assignment'. e.g. For statement - LET A$(4 to 8)="abcdefg" - five locations have been made.
N $2B92 The parameters fetched above as a 'last value' represent the string that is to be copied into the new locations with Procrustean lengthening or shortening as required.
N $2B92 The length of the 'new' string is compared to the length of the room made available for it.
  $2B92 'Length' of new area to #REGhl. 'Pointer' to new area to stack.
  $2B93 Compare the two 'lengths' and jump forward if the 'new' string will fit into the room, i.e. no shortening required.
  $2B99 However modify the 'new' length if it is too long.
@ $2B9B label=L_LENGTH
  $2B9B 'Length' of new area to stack. 'Pointer' to new area to #REGhl.
N $2B9C As long as the new string is not a 'null string' it is copied into the work space. Procrustean lengthening is achieved automatically if the 'new' string is shorter than the room available for it.
  $2B9C 'Start' of new string to #REGhl. 'Pointer' to new area to #REGde.
  $2B9D Jump forward if the 'new' string is a 'null' string.
  $2BA1 Otherwise move the 'new' string to the work space.
N $2BA3 The values that have been saved on the machine stack are restored.
@ $2BA3 label=L_IN_W_S
  $2BA3 'Length' of new area.
  $2BA4 'Pointer' to new area.
  $2BA5 The start - the pointer to the 'variable in assignment' which was originally in DEST. #R$2BA6 is now used to pass the 'new' string to the variables area.
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
D $2C02 This routine establishes new arrays in the variables area. The routine starts by searching the existing variables area to determine whether there is an existing array with the same name. If such an array is found then it is 'reclaimed' before the new array is established.
D $2C02 A new array will have all its elements set to zero if it is a numeric array, or to 'spaces' if it is an array of strings.
  $2C02 Search the variables area.
@ $2C05 label=D_RPORT_C
  $2C05 Give report C as there has been an error.
  $2C08 Jump forward if in 'run time'.
  $2C0D Test the syntax for string arrays as if they were numeric.
  $2C0F Check the syntax of the parenthesised expression.
  $2C12 Move on to consider the next statement as the syntax was satisfactory.
N $2C15 An 'existing array' is reclaimed.
@ $2C15 label=D_RUN
  $2C15 Jump forward if there is no 'existing array'.
  $2C17 Save the discriminator byte.
  $2C18 Find the start of the next variable.
  $2C1B Reclaim the 'existing array'.
  $2C1E Restore the discriminator byte.
N $2C1F The initial parameters of the new array are found.
@ $2C1F label=D_LETTER
  $2C1F Set bit 7 in the discriminator byte.
  $2C21 Make the dimension counter zero.
  $2C23 Save the counter and the discriminator byte.
@ $2C24 keep
  $2C24 The #REGhl register pair is to hold the size of the elements in the array: '1' for a string array, '5' for a numeric array.
@ $2C2D label=D_SIZE
  $2C2D Element size to #REGde.
N $2C2E The following loop is accessed for each dimension that is specified in the parenthesised expression of the DIM statement. The total number of bytes required for the elements of the array is built up in the #REGde register pair.
@ $2C2E label=D_NO_LOOP
  $2C2E Advance CH-ADD on each pass..
  $2C2F Set a 'limit value'.
  $2C31 Evaluate a parameter.
  $2C34 Give an error if 'out of range'.
  $2C37 Fetch the dimension counter and the discriminator byte.
  $2C38 Save the parameter on each pass through the loop.
  $2C39 Increase the dimension counter on each pass also.
  $2C3A Restack the dimension counter and the discriminator byte.
  $2C3B The parameter is moved to the #REGhl register pair.
  $2C3D The byte total is built up in #REGhl and then transferred to #REGde.
  $2C41,5,1,c2,2 Get the present character and go around the loop again if there is another dimension.
N $2C46 At this point the #REGde register pair indicates the number of bytes required for the elements of the new array and the size of each dimension is stacked, on the machine stack.
N $2C46 Now check that there is indeed a closing bracket to the parenthesised expression.
  $2C46,c2 Is it a ')'?
  $2C48 Jump back if not so.
  $2C4A Advance CH-ADD past it.
N $2C4B Allowance is now made for the dimension sizes.
  $2C4B Fetch the dimension counter and the discriminator byte.
  $2C4C Pass the discriminator byte to the #REGa register for later.
  $2C4D Move the counter to #REGl.
  $2C4E Clear the #REGh register.
  $2C50 Increase the dimension counter by two and double the result and form the correct overall length for the variable by adding the element byte total.
  $2C54 Give the report 'Out of memory' if required.
  $2C57 Save the element byte total.
  $2C58 Save the dimension counter and the discriminator byte.
  $2C59 Save the overall length also.
  $2C5A Move the overall length to #REGbc.
N $2C5C The required amount of room is made available for the new array at the end of the variables area.
  $2C5C Make the #REGhl register pair point to the '80-byte'.
  $2C60 The room is made available.
  $2C63 #REGhl is made to point to the first new location.
N $2C64 The parameters are now entered.
  $2C64 The letter, suitably marked, is entered first.
  $2C65 The overall length is fetched and decreased by '3'.
  $2C69 Advance #REGhl.
  $2C6A Enter the low length.
  $2C6B Advance #REGhl.
  $2C6C Enter the high length.
  $2C6D Fetch the dimension counter.
  $2C6E Move it to the #REGa register.
  $2C6F Advance #REGhl.
  $2C70 Enter the dimension count.
N $2C71 The elements of the new array are now 'cleared'.
  $2C71 #REGhl is made to point to the last location of the array and #REGde to the location before that one.
  $2C74,8,6,c2 Enter a zero into the last location but overwrite it with 'space' if dealing with an array of strings.
@ $2C7C label=DIM_CLEAR
  $2C7C Fetch the element byte total.
  $2C7D Clear the array + one extra location.
N $2C7F The 'dimension sizes' are now entered.
@ $2C7F label=DIM_SIZES
  $2C7F Get a dimension size.
  $2C80 Enter the high byte.
  $2C81 Back one.
  $2C82 Enter the low byte.
  $2C83 Back one.
  $2C84 Decrease the dimension counter.
  $2C85 Repeat the operation until all the dimensions have been considered; then return.
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
D $2D2B This subroutine gives the floating-point form for the absolute binary value currently held in the #REGbc register pair.
D $2D2B The form used in this and hence in the two previous subroutines as well is the one reserved in the Spectrum for small integers n, where -65535<=n<=65535. The first and fifth bytes are zero; the third and fourth bytes are the less significant and more significant bytes of the 16 bit integer n in two's complement form (if n is negative, these two bytes hold 65536+n); and the second byte is a sign byte, 00 for '+' and FF for '-'.
  $2D2B Re-initialise #REGiy to ERR-NR.
  $2D2F Clear the #REGa register.
  $2D30 And the #REGe register, to indicate '+'.
  $2D31 Copy the less significant byte to #REGd.
  $2D32 And the more significant byte to #REGc.
  $2D33 Clear the #REGb register.
  $2D34 Now stack the number.
  $2D37 Use the calculator to make #REGhl point to STKEND-5.
B $2D38,1 #R$369B
  $2D39 Clear the carry flag.
  $2D3A Finished.
@ $2D3B label=INT_TO_FP
c $2D3B THE 'INTEGER TO FLOATING-POINT' SUBROUTINE
D $2D3B This subroutine returns a 'last value' on the calculator stack that is the result of converting an integer in a BASIC line, i.e. the integer part of the decimal number or the line number, to its floating-point form.
D $2D3B Repeated calls to #R$0074 fetch each digit of the integer in turn. An exit is made when a code that does not represent a digit has been fetched.
  $2D3B Save the first digit - in #REGa.
  $2D3C Use the calculator.
B $2D3D,1 #R$341B(stk_zero): (the 'last value' is now zero)
B $2D3E,1 #R$369B
  $2D3F Restore the first digit.
N $2D40 Now a loop is set up. As long as the code represents a digit then the floating-point form is found and stacked under the 'last value' (V, initially zero). V is then multiplied by decimal 10 and added to the 'digit' to form a new 'last value' which is carried back to the start of the loop.
@ $2D40 label=NXT_DGT_2
  $2D40 If the code represents a digit (D) then stack the floating-point form; otherwise return.
  $2D44 Use the calculator.
B $2D45,1 #R$343C: D, V
B $2D46,1 #R$341B(stk_ten): D, V, 10
B $2D47,1 #R$30CA: D, 10*V
B $2D48,1 #R$3014: D+10*V
B $2D49,1 #R$369B: D+10*V (this is 'V' for the next pass through the loop)
  $2D4A The next code goes into #REGa.
  $2D4D Loop back with this code.
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
D $2DA2 This subroutine is used to compress the floating-point 'last value' on the calculator stack into the #REGbc register pair. If the result is too large, i.e. greater than 65536 decimal, then the subroutine returns with the carry flag set. If the 'last value' is negative then the zero flag is reset. The low byte of the result is also copied to the #REGa register.
  $2DA2 Use the calculator to make #REGhl point to STKEND-5.
B $2DA3,1 #R$369B
  $2DA4 Collect the exponent byte of the 'last value'; jump if it is zero, indicating a 'small integer'.
  $2DA8 Now use the calculator to round the 'last value' (V) to the nearest integer, which also changes it to 'small integer' form on the calculator stack if that is possible, i.e. if -65535.5<=V<65535.5.
B $2DA9,1 #R$341B(stk_half): V, 0.5
B $2DAA,1 #R$3014: V+0.5
B $2DAB,1 #R$36AF: INT (V+0.5)
B $2DAC,1 #R$369B
@ $2DAD label=FP_DELETE
  $2DAD Use the calculator to delete the integer from the stack; #REGde still points to it in memory (at STKEND).
B $2DAE,1 #R$33A1
B $2DAF,1 #R$369B
  $2DB0 Save both stack pointers.
  $2DB2 #REGhl now points to the number.
  $2DB3 Copy the first byte to #REGb.
  $2DB4 Copy bytes 2, 3 and 4 to #REGc, #REGe and #REGd.
  $2DB7 Clear the #REGa register.
  $2DB8 This sets the carry unless #REGb is zero.
  $2DB9 This sets the zero flag if the number is positive (NZ denotes negative).
  $2DBB Copy the high byte to #REGb.
  $2DBC And the low byte to #REGc.
  $2DBD Copy the low byte to #REGa too.
  $2DBE Restore the stack pointers.
  $2DC0 Finished.
@ $2DC1 label=LOG_2_A
c $2DC1 THE 'LOG(2#powerA)' SUBROUTINE
D $2DC1 This subroutine calculates the approximate number of digits before the decimal in x, the number to be printed, or, if there are no digits before the decimal, then the approximate number of leading zeros after the decimal. It is entered with the #REGa register containing e', the true exponent of x, or e'-2, and calculates z=log to the base 10 of (2#power#REGa). It then sets #REGa equal to ABS INT (z+0.5), as required, using #R$2DD5 for this purpose.
  $2DC1 The integer #REGa is stacked, either as 00 00 #REGa 00 00 (for positive #REGa) or as 00 FF #REGa FF 00 (for negative #REGa).
  $2DC4 These bytes are first loaded into #REGa, #REGe, #REGd, #REGc, #REGb and then #R$2AB6 is called to put the number on the calculator stack.
  $2DCB The calculator is used
B $2DCC,6,1,5 #R$33C6: log 2 to the base 10 is now stacked
B $2DD2,1 #R$30CA: #REGa*log 2 i.e. log (2#power#REGa)
B $2DD3,1 #R$36AF: INT log (2#power#REGa)
B $2DD4,1 #R$369B
E $2DC1 The subroutine continues into #R$2DD5 to complete the calculation.
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
D $3014 The first of three major arithmetical subroutines, this subroutine carries out the floating-point addition of two numbers, each with a 4-byte mantissa and a 1-byte exponent. In these three subroutines, the two numbers at the top of the calculator stack are added/multiplied/divided to give one number at the top of the calculator stack, a 'last value'.
D $3014 #REGhl points to the second number from the top, the augend/multiplier/dividend. #REGde points to the number at the top of the calculator stack, the addend/multiplicand/divisor. Afterwards #REGhl points to the resultant 'last value' whose address can also be considered to be STKEND-5.
D $3014 But the addition subroutine first tests whether the 2 numbers to be added are 'small integers'. If they are, it adds them quite simply in #REGhl and #REGbc, and puts the result directly on the stack. No twos complementing is needed before or after the addition, since such numbers are held on the stack in twos complement form, ready for addition.
  $3014 Test whether the first bytes of both numbers are zero.
  $3016 If not, jump for full addition.
  $3018 Save the pointer to the second number.
  $3019 Point to the second byte of the first number and save that pointer too.
  $301B Point to the less significant byte.
  $301C Fetch it in #REGe.
  $301D Point to the more significant byte.
  $301E Fetch it in #REGd.
  $301F Move on to the second byte of the second number.
  $3022 Fetch it in #REGa (this is the sign byte).
  $3023 Point to the less significant byte.
  $3024 Fetch it in #REGc.
  $3025 Point to the more significant byte.
  $3026 Fetch it in #REGb.
  $3027 Fetch the pointer to the sign byte of the first number; put it in #REGde, and the number in #REGhl.
  $3029 Perform the addition: result in #REGhl.
  $302A Result to #REGde, sign byte to #REGhl.
  $302B Add the sign bytes and the carry into #REGa; this will detect any overflow.
  $302D A non-zero #REGa now indicates overflow.
  $302F Jump to reset the pointers and to do full addition.
  $3031 Define the correct sign byte for the result.
  $3032 Store it on the stack.
  $3033 Point to the next location.
  $3034 Store the low byte of the result.
  $3035 Point to the next location.
  $3036 Store the high byte of the result.
  $3037 Move the pointer back to address the first byte of the result.
  $303A Restore STKEND to #REGde.
  $303B Finished.
N $303C Note that the number -65536 decimal can arise here in the form 00 FF 00 00 00 as the result of the addition of two smaller negative integers, e.g. -65000 and -536. It is simply stacked in this form. This is a mistake. The Spectrum system cannot handle this number.
@ $303C label=ADDN_OFLW
N $303C Most functions treat it as zero, and it is printed as -1E-38, obtained by treating is as 'minus zero' in an illegitimate format.
N $303C One possible remedy would be to test for this number at about byte #R$3032 and, if it is present, to make the second byte 80 hex and the first byte 91 hex, so producing the full five-byte floating-point form of the number, i.e. 91 80 00 00 00, which causes no problems. See also the #R$3225(remarks in 'truncate').
  $303C Restore the pointer to the first number.
  $303D Restore the pointer to the second number.
@ $303E label=FULL_ADDN
  $303E Re-stack both numbers in full five-byte floating-point form.
N $3041 The full addition subroutine first calls #R$2F9B for each number, then gets the two numbers from the calculator stack and puts the one with the smaller exponent into the addend position. It then calls #R$2FDD to shift the addend up to 32 decimal places right to line it up for addition. The actual addition is done in a few bytes, a single shift is made for carry (overflow to the left) if needed, the result is twos complemented if negative, and any arithmetic overflow is reported; otherwise the subroutine jumps to #R$3155 to normalise the result and return it to the stack with the correct sign bit inserted into the second byte.
  $3041 Exchange the registers.
  $3042 Save the next literal address.
  $3043 Exchange the registers.
  $3044 Save pointer to the addend.
  $3045 Save pointer to the augend.
  $3046 Prepare the augend.
  $3049 Save its exponent in #REGb.
  $304A Exchange the pointers.
  $304B Prepare the addend.
  $304E Save its exponent in #REGc.
  $304F If the first exponent is smaller, keep the first number in the addend position; otherwise change the exponents and the pointers back again.
@ $3055 label=SHIFT_LEN
  $3055 Save the larger exponent in #REGa.
  $3056 The difference between the exponents is the length of the shift right.
  $3057 Get the two numbers from the stack.
  $305A Shift the addend right.
  $305D Restore the larger exponent.
  $305E #REGhl is to point to the result.
  $305F Store the exponent of the result.
  $3060 Save the pointer again.
  $3061 M4 to #REGh and M5 to #REGl (see #R$2FBA).
  $3063 Add the two right bytes.
  $3064 N2 to #REGh' and N3 to #REGl' (see #R$2FBA).
  $3066 Add left bytes with carry.
  $3068 Result back in #REGd'#REGe'.
  $3069 Add #REGh', #REGl' and the carry; the resulting mechanisms will ensure that a single shift right is called if the sum of 2 positive numbers has overflowed left, or the sum of 2 negative numbers has not overflowed left.
  $306F The result is now in #REGd#REGe#REGd'#REGe'.
  $3070 Get the pointer to the exponent.
  $3071 The test for shift (#REGh', #REGl' were +00 for positive numbers and +FF for negative numbers).
  $3074 #REGa counts a single shift right.
  $3076 The shift is called.
  $3079 Add 1 to the exponent; this may lead to arithmetic overflow.
@ $307C label=TEST_NEG
  $307C Test for negative result: get sign bit of #REGl' into #REGa (this now correctly indicates the sign of the result).
  $3081 Store it in the second byte position of the result on the calculator stack.
  $3084 If it is zero, then do not twos complement the result.
  $3086 Get the first byte.
  $3087 Negate it.
  $3089 Complement the carry for continued negation, and store byte.
  $308B Get the next byte.
  $308C Ones complement it.
  $308D Add in the carry for negation.
  $308F Store the byte.
  $3090 Proceed to get next byte into the #REGa register.
  $3092 Ones complement it.
  $3093 Add in the carry for negation.
  $3095 Store the byte.
  $3096 Get the last byte.
  $3097 Ones complement it.
  $3098 Add in the carry for negation.
  $309A Done if no carry.
  $309C Else, get .5 into mantissa and add 1 to the exponent; this will be needed when two negative numbers add to give an exact power of 2, and it may lead to arithmetic overflow.
@ $309F label=ADD_REP_6
  $309F Give the error if required.
@ $30A3 label=END_COMPL
  $30A3 Store the last byte.
@ $30A5 label=GO_NC_MLT
  $30A5 Clear the carry flag.
  $30A6 Exit via #R$3155.
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
D $30CA This subroutine first tests whether the two numbers to be multiplied are 'small integers'. If they are, it uses #R$2D7F to get them from the stack, #R$30A9 to multiply them and #R$2D8E to return the result to the stack. Any overflow of this 'short multiplication' (i.e. if the result is not itself a 'small integer') causes a jump to multiplication in full five byte floating-point form (see below).
  $30CA Test whether the first bytes of both numbers are zero.
  $30CC If not, jump for 'long' multiplication.
  $30CE Save the pointers to the second number.
  $30CF And to the first number.
  $30D0 And to the second number yet again.
  $30D1 Fetch sign in #REGc, number in #REGde.
  $30D4 Number to #REGhl now.
  $30D5 Number to stack, second pointer to #REGhl.
  $30D6 Save first sign in #REGb.
  $30D7 Fetch second sign in #REGc, number in #REGde.
  $30DA Form sign of result in #REGa: like signs give plus (00), unlike give minus (FF).
  $30DC Store sign of result in #REGc.
  $30DD Restore the first number to #REGhl.
  $30DE Perform the actual multiplication.
  $30E1 Store the result in #REGde.
  $30E2 Restore the pointer to the first number.
  $30E3 Jump on overflow to 'full' multiplication.
  $30E5 These 5 bytes ensure that 00 FF 00 00 00 is replaced by zero; that they should not be needed if this number were excluded from the system is noted at #R$303C.
@ $30EA label=MULT_RSLT
  $30EA Now store the result on the stack.
  $30ED Restore STKEND to #REGde.
  $30EE Finished.
@ $30EF label=MULT_OFLW
  $30EF Restore the pointer to the second number.
@ $30F0 label=MULT_LONG
  $30F0 Re-stack both numbers in full five byte floating-point form.
N $30F3 The full multiplication subroutine prepares the first number for multiplication by calling #R$30C0, returning if it is zero; otherwise the second number is prepared by again calling #R$30C0, and if it is zero the subroutine goes to set the result to zero. Next it fetches the two numbers from the calculator stack and multiplies their mantissas in the usual way, rotating the first number (treated as the multiplier) right and adding in the second number (the multiplicand) to the result whenever the multiplier bit is set. The exponents are then added together and checks are made for overflow and for underflow (giving the result zero). Finally, the result is normalised and returned to the calculator stack with the correct sign bit in the second byte.
  $30F3 #REGa is set to zero so that the sign of the first number will go into #REGa.
  $30F4 Prepare the first number, and return if zero. (Result already zero.)
  $30F8 Exchange the registers.
  $30F9 Save the next literal address.
  $30FA Exchange the registers.
  $30FB Save the pointer to the multiplicand.
  $30FC Exchange the pointers.
  $30FD Prepare the 2nd number.
  $3100 Exchange the pointers again.
  $3101 Jump forward if 2nd number is zero.
  $3103 Save the pointer to the result.
  $3104 Get the two numbers from the stack.
  $3107 M5 to #REGa (see #R$2FBA).
  $3108 Prepare for a subtraction.
  $3109 Initialise #REGhl to zero for the result.
  $310B Exchange the registers.
  $310C Save M1 and N1 (see #R$2FBA).
  $310D Also initialise #REGhl' for the result.
  $310F Exchange the registers.
  $3110 #REGb counts thirty three shifts.
  $3112 Jump forward into the loop.
N $3114 Now enter the multiplier loop.
@ $3114 label=MLT_LOOP
  $3114 Jump forward to #R$311B if no carry, i.e. the multiplier bit was reset.
  $3116 Else, add the multiplicand in #REGd'#REGe'#REGde (see #R$2FBA) into the result being built up in #REGh'#REGl'#REGhl.
@ $311B label=NO_ADD
  $311B Whether multiplicand was added or not, shift result right in #REGh'#REGl'#REGhl; the shift is done by rotating each byte with carry, so that any bit that drops into the carry is picked up by the next byte, and the shift continued into #REGb'#REGc'#REGc#REGa.
@ $3125 label=STRT_MLT
  $3125 Shift right the multiplier in #REGb'#REGc'#REGc#REGa (see #R$2FBA and above).
  $3128 A final bit dropping into the carry will trigger another add of the multiplicand to the result.
  $312E Loop 33 times to get all the bits.
  $3130 Move the result from #REGh'#REGl'#REGhl to #REGd'#REGe'#REGde.
N $3134 Now add the exponents together.
  $3134 Restore the exponents - M1 and N1.
  $3135 Restore the pointer to the exponent byte.
  $3136 Get the sum of the two exponent bytes in #REGa, and the correct carry.
  $3138 If the sum equals zero then clear the carry; else leave it unchanged.
@ $313B label=MAKE_EXPT
  $313B Prepare to increase the exponent by +80.
N $313D The rest of the subroutine is common to both #R$30CA and #R$31AF.
@ $313D label=DIVN_EXPT
  $313D These few bytes very cleverly make the correct exponent byte. Rotating left then right gets the exponent byte (true exponent plus +80) into #REGa.
  $3140 If the sign flag is reset, no report of arithmetic overflow needed.
  $3143 Report the overflow if carry reset.
  $3145 Clear the carry now.
@ $3146 label=OFLW1_CLR
  $3146 The exponent byte is now complete; but if #REGa is zero a further check for overflow is needed.
  $314B If there is no carry set and the result is already in normal form (bit 7 of #REGd' set) then there is overflow to report; but if bit 7 of #REGd' is reset, the result in just in range, i.e. just under 2**127.
@ $3151 label=OFLW2_CLR
  $3151 Store the exponent byte, at last.
  $3152 Pass the fifth result byte to #REGa for the normalisation sequence, i.e. the overflow from #REGl into #REGb'.
N $3155 The remainder of the subroutine deals with normalisation and is common to all the arithmetic routines.
@ $3155 label=TEST_NORM
  $3155 If no carry then normalise now.
  $3157 Else, deal with underflow (zero result) or near underflow (result 2**-128): return exponent to #REGa, test if #REGa is zero (case 2**-128) and if so produce 2**-128 if number is normal; otherwise produce zero. The exponent must then be set to zero (for zero) or 1 (for 2**-128).
@ $3159 label=NEAR_ZERO
@ $315D label=ZERO_RSLT
@ $315E label=SKIP_ZERO
  $3164 Restore the exponent byte.
  $3165 Jump if case 2**-128.
  $3167 Otherwise, put zero into second byte of result on the calculator stack.
  $316A Jump forward to transfer the result.
N $316C The actual normalisation operation.
@ $316C label=NORMALISE
  $316C Normalise the result by up to 32 shifts left of #REGd'#REGe'#REGde (with #REGa adjoined) until bit 7 of #REGd' is set. #REGa holds zero after addition so no precision is gained or lost; #REGa holds the fifth byte from #REGb' after multiplication or division; but as only about 32 bits can be correct, no precision is lost. Note that #REGa is rotated circularly, with branch at carry...eventually a random process.
@ $316E label=SHIFT_ONE
  $317F The exponent is decremented on each shift.
  $3180 If the exponent becomes zero, then number from 2**-129 are rounded up to 2**-128.
  $3182 Loop back, up to 32 times.
  $3184 If bit 7 never became 1 then the whole result is to be zero.
N $3186 Finish the normalisation by considering the 'carry'.
@ $3186 label=NORML_NOW
  $3186 After normalisation add back any final carry that went into #REGa. Jump forward if the carry does not ripple right back.
  $318E If it should ripple right back then set mantissa to 0.5 and increment the exponent. This action may lead to arithmetic overflow (final case).
N $3195 The final part of the subroutine involves passing the result to the bytes reserved for it on the calculator stack and resetting the pointers.
@ $3195 label=OFLOW_CLR
  $3195 Save the result pointer.
  $3196 Point to the sign byte in the result.
  $3197 The result is moved from #REGd'#REGe'#REGde to #REGbc#REGde, and then to #REGa#REGc#REGde.
  $319C The sign bit is retrieved from its temporary store and transferred to its correct position of bit 7 of the first byte of the mantissa.
  $31A0 The first byte is stored.
  $31A1 Next.
  $31A2 The second byte is stored.
  $31A3 Next.
  $31A4 The third byte is stored.
  $31A5 Next.
  $31A6 The fourth byte is stored.
  $31A7 Restore the pointer to the result.
  $31A8 Restore the pointer to second number.
  $31A9 Exchange the register.
  $31AA Restore the next literal address.
  $31AB Exchange the registers.
  $31AC Finished.
N $31AD Report 6 - Arithmetic overflow.
@ $31AD label=REPORT_6
M $31AD,2 Call the error handling routine.
B $31AE,1
@ $31AF label=division
c $31AF THE 'DIVISION' OPERATION
D $31AF This subroutine first prepares the divisor by calling #R$30C0, reporting arithmetic overflow if it is zero; then it prepares the dividend again calling #R$30C0, returning if it is zero. Next it fetches the two numbers from the calculator stack and divides their mantissa by means of the usual restoring division, trial subtracting the divisor from the dividend and restoring if there is carry, otherwise adding 1 to the quotient. The maximum precision is obtained for a 4-byte division, and after subtracting the exponents the subroutine exits by joining the later part of #R$30CA.
  $31AF Use full floating-point forms.
  $31B2 Exchange the pointers.
  $31B3 #REGa is set to 0, so that the sign of the first number will go into #REGa.
  $31B4 Prepare the divisor and give the report for arithmetic overflow if it is zero.
  $31B9 Exchange the pointers.
  $31BA Prepare the dividend and return if it is zero (result already zero).
  $31BE Exchange the pointers.
  $31BF Save the next literal address.
  $31C0 Exchange the registers.
  $31C1 Save pointer to divisor.
  $31C2 Save pointer to dividend.
  $31C3 Get the two numbers from the stack.
  $31C6 Exchange the registers.
  $31C7 Save M1 and N1 (the exponent bytes) on the machine stack.
  $31C8 Copy the four bytes of the dividend from registers #REGb'#REGc'#REGc#REGb (i.e. M2, M3, M4 and M5; see #R$2FBA) to the registers #REGh'#REGl'#REGhl.
  $31CD Clear #REGa and reset the carry flag.
  $31CE #REGb will count upwards from -33 to -1 (+DF to +FF), looping on minus and will jump again on zero for extra precision.
  $31D0 Jump forward into the division loop for the first trial subtraction.
N $31D2 Now enter the division loop.
@ $31D2 label=DIV_LOOP
  $31D2 Shift the result left into #REGb'#REGc'#REGc#REGa, shifting out the bits already there, picking up 1 from the carry whenever it is set, and rotating left each byte with carry to achieve the 32-bit shift.
@ $31DB label=DIV_34TH
  $31DB Move what remains of the dividend left in #REGh'#REGl'#REGhl before the next trial subtraction; if a bit drops into the carry, force no restore and a bit for the quotient, thus retrieving the lost bit and allowing a full 32-bit divisor.
@ $31E2 label=DIV_START
  $31E2 Trial subtract divisor in #REGd'#REGe'#REGde from rest of dividend in #REGh'#REGl'#REGhl; there is no initial carry (see previous step).
  $31E8 Jump forward if there is no carry.
  $31EA Otherwise restore, i.e. add back the divisor. Then clear the carry so that there will be no bit for the quotient (the divisor 'did not go').
  $31F0 Jump forward to the counter.
@ $31F2 label=SUBN_ONLY
  $31F2 Just subtract with no restore and go on to set the carry flag because the lost bit of the dividend is to be retrieved and used for the quotient.
@ $31F9 label=NO_RSTORE
  $31F9 One for the quotient in #REGb'#REGc'#REGc#REGa.
@ $31FA label=COUNT_ONE
  $31FA Step the loop count up by one.
  $31FB Loop 32 times for all bits.
  $31FE Save any 33rd bit for extra precision (the present carry).
  $31FF Trial subtract yet again for any 34th bit; the PUSH AF above saves this bit too.
N $3201 Note: this jump is made to the wrong place. No 34th bit will ever be obtained without first shifting the dividend. Hence important results like 1/10 and 1/1000 are not rounded up as they should be. Rounding up never occurs when it depends on the 34th bit. The jump should have been to #R$31DB above, i.e. byte 3200 hex in the ROM should read DA hex (128 decimal) instead of E1 hex (225 decimal).
  $3201 Now move the four bytes that form the mantissa of the result from #REGb'#REGc'#REGc#REGa to #REGd'#REGe'#REGde.
  $3206 Then put the 34th and 33rd bits into #REGb' to be picked up on normalisation.
  $320D Restore the exponent bytes M1 and N1.
  $320E Restore the pointer to the result.
  $320F Get the difference between the two exponent bytes into #REGa and set the carry flag if required.
  $3211 Exit via #R$313D.
@ $3214 label=truncate
c $3214 THE 'INTEGER TRUNCATION TOWARDS ZERO' SUBROUTINE
D $3214 This subroutine (say I(x)) returns the result of integer truncation of x, the 'last value', towards zero. Thus I(2.4) is 2 and I(-2.4) is -2. The subroutine returns at once if x is in the form of a 'short integer'. It returns zero if the exponent byte of x is less than 81 hex (ABS x is less than 1). If I(x) is a 'short integer' the subroutine returns it in that form. It returns x if the exponent byte is A0 hex or greater (x has no significant non-integral part). Otherwise the correct number of bytes of x are set to zero and, if needed, one more byte is split with a mask.
  $3214 Get the exponent byte of x into #REGa.
  $3215 If #REGa is zero, return since x is already a small integer.
  $3217 Compare e, the exponent, to 81 hex.
  $3219 Jump if e is greater than 80 hex.
  $321B Else, set the exponent to zero; enter 32 decimal (20 hex) into #REGa and jump forward to #R$3272 to make all the bits of x be zero.
@ $3221 label=T_GR_ZERO
  $3221 Compare e to 91 hex, 145 decimal.
  $3223 Jump if e not 91 hex.
N $3225 The next 26 bytes seem designed to test whether x is in fact -65536 decimal, i.e. 91 80 00 00 00, and if it is, to set it to 00 FF 00 00 00. This is a mistake. As #R$303C(already stated), the Spectrum system cannot handle this number. The result here is simply to make INT (-65536) return the value -1. This is a pity, since the number would have been perfectly all right if left alone. The remedy would seem to be simply to omit the 28 bytes from 3223 above to 323E inclusive from the program.
  $3225 #REGhl is pointed at the fourth byte of x, where the 17 bits of the integer part of x end after the first bit.
  $3228 The first bit is obtained in #REGa, using 80 hex as a mask.
  $322B That bit and the previous 8 bits are tested together for zero.
  $322D #REGhl is pointed at the second byte of x.
  $322E If already non-zero, the test can end.
  $3230 Otherwise, the test for -65536 is now completed: 91 80 00 00 00 will leave the zero flag set now.
@ $3233 label=T_FIRST
  $3233 #REGhl is pointed at the first byte of x.
  $3234 If zero reset, the jump is made.
  $3236 The first byte is set to zero.
  $3237 #REGhl points to the second byte.
  $3238 The second byte is set to FF.
  $323A #REGhl again points to the first byte.
  $323B The last 24 bits are to be zero.
  $323D The jump to #R$3272 completes the number 00 FF 00 00 00.
N $323F If the exponent byte of x is between 81 and 90 hex (129 and 144 decimal) inclusive, I(x) is a 'small integer', and will be compressed into one or two bytes. But first a test is made to see whether x is, after all, large.
@ $323F label=T_SMALL
  $323F Jump with exponent byte 92 or more (it would be better to jump with 91 too).
  $3241 Save STKEND in #REGde.
  $3242 Range 129<=#REGa<=144 becomes 126>=#REGa>=111.
  $3243 Range is now 15>=#REGa>=0.
  $3245 Point #REGhl at second byte.
  $3246 Second byte to #REGd.
  $3247 Point #REGhl at third byte.
  $3248 Third byte to #REGe.
  $3249 Point #REGhl at first byte again.
  $324B Assume a positive number.
  $324D Now test for negative (bit 7 set).
  $324F Jump if positive after all.
  $3251 Change the sign.
@ $3252 label=T_NUMERIC
  $3252 Insert true numeric bit, 1, in #REGd.
  $3254 Now test whether #REGa>=8 (one byte only) or two bytes needed.
  $3257 Leave #REGa unchanged.
  $3258 Jump if two bytes needed.
  $325A Put the one byte into #REGe.
  $325B And set #REGd to zero.
  $325D Now 1<=#REGa<=7 to count the shifts needed.
@ $325E label=T_TEST
  $325E Jump if no shift needed.
  $3260 #REGb will count the shifts.
@ $3261 label=T_SHIFT
  $3261 Shift #REGd and #REGe right #REGb times to produce the correct number.
  $3265 Loop until #REGb is zero.
@ $3267 label=T_STORE
  $3267 Store the result on the stack.
  $326A Restore STKEND to #REGde.
  $326B Finished.
N $326C Large values of x remain to be considered.
@ $326C label=T_EXPNENT
  $326C Get the exponent byte of x into #REGa.
@ $326D label=X_LARGE
  $326D Subtract 160 decimal, A0 hex, from e.
  $326F Return on plus - x has no significant non-integral part. (If the true exponent were reduced to zero, the 'binary point' would come at or after the end of the four bytes of the mantissa.)
  $3270 Else, negate the remainder; this gives the number of bits to become zero (the number of bits after the 'binary point').
N $3272 Now the bits of the mantissa can be cleared.
@ $3272 label=NIL_BYTES
  $3272 Save the current value of #REGde (STKEND).
  $3273 Make #REGhl point one past the fifth byte.
  $3274 #REGhl now points to the fifth byte of x.
  $3275 Get the number of bits to be set to zero in #REGb and divide it by 8 to give the number of whole bytes implied.
  $327C Jump forward if the result is zero.
@ $327E label=BYTE_ZERO
  $327E Else, set the bytes to zero; #REGb counts them.
@ $3283 label=BITS_ZERO
  $3283 Get #REGa (mod 8); this is the number of bits still to be set to zero.
  $3285 Jump to the end if nothing more to do.
  $3287 #REGb will count the bits now.
  $3288 Prepare the mask.
@ $328A label=LESS_MASK
  $328A With each loop a zero enters the mask from the right and thereby a mask of the correct length is produced.
  $328E The unwanted bits of (#REGhl) are lost as the masking is performed.
@ $3290 label=IX_END
  $3290 Return the pointer to #REGhl.
  $3291 Return STKEND to #REGde.
  $3292 Finished.
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
D $335B This subroutine is used to perform floating-point calculations. These can be considered to be of three types:
D $335B #LIST { Binary operations, e.g. #R$3014, where two numbers in floating-point form are added together to give one 'last value'. } { Unary operations, e.g. #R$37B5, where the 'last value' is changed to give the appropriate function result as a new 'last value'. } { Manipulatory operations, e.g. #R$342D, where the 'last value' is copied to the first five bytes of the calculator's memory area. } LIST#
D $335B The operations to be performed are specified as a series of data-bytes, the literals, that follow an RST 28 instruction that calls this subroutine. The last literal in the list is always '38' which leads to an end to the whole operation.
D $335B In the case of a single operation needing to be performed, the operation offset can be passed to the calculator in the #REGb register, and operation '3B', the #R$33A2(single calculation operation), performed.
D $335B It is also possible to call this subroutine recursively, i.e. from within itself, and in such a case it is possible to use the system variable BREG as a counter that controls how many operations are performed before returning.
D $335B The first part of this subroutine is complicated but essentially it performs the two tasks of setting the registers to hold their required values, and to produce an offset, and possibly a parameter, from the literal that is currently being considered.
D $335B The offset is used to index into the calculator's #R$32D7(table of addresses) to find the required subroutine address.
D $335B The parameter is used when the multi-purpose subroutines are called.
D $335B Note: a floating-point number may in reality be a set of string parameters.
  $335B Presume a unary operation and therefore set #REGhl to point to the start of the 'last value' on the calculator stack and #REGde one past this floating-point number (STKEND).
@ $335E label=GEN_ENT_1
  $335E Either transfer a single operation offset to BREG temporarily, or, when using the subroutine recursively, pass the parameter to BREG to be used as a counter.
@ $3362 label=GEN_ENT_2
  $3362 The return address of the subroutine is stored in #REGhl'. This saves the pointer to the first literal. Entering the calculator here is done whenever BREG is in use as a counter and is not to be disturbed.
@ $3365 label=RE_ENTRY
  $3365 A loop is now entered to handle each literal in the list that follows the calling instruction; so first, always set to STKEND.
  $3369 Go to the alternate register set and fetch the literal for this loop.
  $336B Make #REGhl' point to the next literal.
@ $336C label=SCAN_ENT
  $336C This pointer is saved briefly on the machine stack. #R$336C is used by #R$33A2 to find the subroutine that is required.
  $336D Test the #REGa register.
  $336E Separate the simple literals from the multi-purpose literals. Jump with literals 00 to 3D.
  $3371 Save the literal in #REGd.
  $3372 Continue only with bits 5 and 6.
  $3374 Four right shifts make them now bits 1 and 2.
  $3378 The offsets required are 3E to 41, and #REGl will now hold double the required offset.
  $337B Now produce the parameter by taking bits 0, 1, 2, 3 and 4 of the literal; keep the parameter in #REGa.
  $337E Jump forward to find the address of the required subroutine.
@ $3380 label=FIRST_3D
  $3380 Jump forward if performing a unary operation.
  $3384 All of the subroutines that perform binary operations require that #REGhl points to the first operand and #REGde points to the second operand (the 'last value') as they appear on the calculator stack.
@ $338C label=DOUBLE_A
  $338C As each entry in the table of addresses takes up two bytes the offset produced is doubled.
@ $338E label=ENT_TABLE
  $338E The base address of the #R$32D7(table).
  $3391 The address of the required table entry is formed in #REGhl, and the required subroutine address is loaded into the #REGde register pair.
@ $3397 nowarn
  $3397 The address of #R$3365 is put on the machine stack underneath the subroutine address.
  $339C Return to the main set of registers.
  $339D The current value of BREG is transferred to the #REGb register thereby returning the single operation offset (see #R$353B).
@ $33A1 label=delete
  $33A1 An indirect jump to the required subroutine.
E $335B The #R$33A1 subroutine contains only the single RET instruction above. The literal '02' results in this subroutine being considered as a binary operation that is to be entered with a first number addressed by the #REGhl register pair and a second number addressed by the #REGde register pair, and the result produced again addressed by the #REGhl register pair.
E $335B The single RET instruction thereby leads to the first number being considered as the resulting 'last value' and the second number considered as being deleted. Of course the number has not been deleted from the memory but remains inactive and will probably soon be overwritten.
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
D $3449 This important subroutine generates the series of Chebyshev polynomials which are used to approximate to SIN, ATN, LN and EXP and hence to derive the other arithmetic functions which depend on these (COS, TAN, ASN, ACS, ** and SQR).
D $3449 #HTML[The polynomials are generated, for n=1, 2, etc. by the recurrence relation T<sub>n+1</sub>(z)=2zT<sub>n</sub>(z)-T<sub>n-1</sub>(z), where T<sub>n</sub>(z) is the nth Chebyshev polynomial in z.]
D $3449 #HTML[The series in fact generates T<sub>0</sub>, 2T<sub>1</sub>, 2T<sub>2</sub>, ..., 2T<sub>n-1</sub>, where n is 6 for SIN, 8 for EXP, and 12 decimal for LN and ATN.]
D $3449 #HTML[The coefficients of the powers of z in these polynomials may be found in the Handbook of Mathematical Functions by M. Abramowitz and I. A. Stegun (Dover 1965), page 795.]
D $3449 In simple terms this subroutine is called with the 'last value' on the calculator stack, say Z, being a number that bears a simple relationship to the argument, say X, when the task is to evaluate, for instance, SIN X. The calling subroutine also supplies the list of constants that are to be required (six constants for SIN). The #R$3449(series generator) then manipulates its data and returns to the calling routine a 'last value' that bears a simple relationship to the requested function, for instance, SIN X.
D $3449 This subroutine can be considered to have four major parts.
D $3449 i. The setting of the loop counter. The calling subroutine passes its parameters in the #REGa register for use as a counter. The calculator is entered at #R$335E so that the counter can be set.
  $3449 Move the parameter to #REGb.
  $344A In effect a RST 28 instruction but sets the counter.
N $344D ii. The handling of the 'last value', Z. The loop of the generator requires 2*Z to be placed in mem-0, zero to be placed in mem-2 and the 'last value' to be zero.
B $344D,1 #R$33C0: Z, Z
B $344E,1 #R$3014: 2*Z
B $344F,1 #R$342D: 2*Z (mem-0 holds 2*Z)
B $3450,1 #R$33A1: -
B $3451,1 #R$341B(stk_zero): 0
B $3452,1 #R$342D(st_mem_2): 0 (mem-2 holds 0)
@ $3453 label=G_LOOP
N $3453 iii. The main loop.
N $3453 The series is generated by looping, using BREG as a counter; the constants in the calling subroutine are stacked in turn by calling #R$33C6; the calculator is re-entered at #R$3362 so as not to disturb the value of BREG; and the series is built up in the form:
N $3453 B(R)=2*Z*B(R-1)-B(R-2)+A(R), for R=1, 2, ..., N, where A(1), A(2)...A(N) are the constants supplied by the calling subroutine (SIN, ATN, LN and EXP) and B(0)=0=B(-1).
N $3453 The (R+1)th loop starts with B(R) on the stack and with 2*Z, B(R-2) and B(R-1) in mem-0, mem-1 and mem-2 respectively.
B $3453,1 #R$33C0: B(R), B(R)
B $3454,1 #R$340F(get_mem_0): B(R), B(R), 2*Z
B $3455,1 #R$30CA: B(R), 2*B(R)*Z
B $3456,1 #R$340F(get_mem_2): B(R),2*B(R)*Z, B(R-1)
B $3457,1 #R$342D(st_mem_1): mem-1 holds B(R-1)
B $3458,1 #R$300F: B(R), 2*B(R)*Z-B(R-1)
B $3459,1 #R$369B
N $345A The next constant is placed on the calculator stack.
  $345A B(R), 2*B(R)*Z-B(R-1), A(R+1)
N $345D The calculator is re-entered without disturbing BREG.
B $3460,1 #R$3014: B(R), 2*B(R)*Z-B(R-1)+A(R+1)
B $3461,1 #R$343C: 2*B(R)*Z-B(R-1)+A(R+1), B(R)
B $3462,1 #R$342D(st_mem_2): mem-2 holds B(R)
B $3463,1 #R$33A1: 2*B(R)*Z-B(R-1)+A(R+1)=B(R+1)
B $3464,2,1 #R$367A to #R$3453: B(R+1)
N $3466 iv. The subtraction of B(N-2). The loop above leaves B(N) on the stack and the required result is given by B(N)-B(N-2).
B $3466,1 #R$340F(get_mem_1): B(N), B(N-2)
B $3467,1 #R$300F: B(N)-B(N-2)
B $3468,1 #R$369B
  $3469 Finished.
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
D $353B This subroutine is used to perform the twelve possible comparison operations (offsets 09 to 0E and 11 to 16: 'no-l-eql', 'no-gr-eq', 'nos-neql', 'no-grtr', 'no-less', 'nos-eql', 'str-l-eql', 'str-gr-eq', 'strs-neql', 'str-grtr', 'str-less' and 'strs-eql'). The single operation offset is present in the #REGb register at the start of the subroutine.
  $353B The single offset goes to the #REGa register.
  $353C The range is now 01-06 and 09-0E.
  $353E This range is changed to 00-02, 04-06, 08-0A and 0C-0E.
@ $3543 label=EX_OR_NOT
  $3543 Then reduced to 00-07 with carry set for 'greater than or equal to' and 'less than'; the operations with carry set are then treated as their complementary operation once their values have been exchanged.
@ $354E label=NU_OR_STR
  $354E The numerical comparisons are now separated from the string comparisons by testing bit 2.
  $3552 The numerical operations now have the range 00-01 with carry set for 'equal' and 'not equal'.
  $3553 Save the offset.
  $3554 The numbers are subtracted for the final tests.
@ $3559 label=STRINGS
  $3559 The string comparisons now have the range 02-03 with carry set for 'equal' and 'not equal'.
  $355A Save the offset.
  $355B The lengths and starting addresses of the strings are fetched from the calculator stack.
  $3563,1 The length of the second string.
@ $3564 label=BYTE_COMP
  $3568,2 Jump unless the second string is null.
@ $356B label=SECND_LOW
  $356B,1 Here the second string is either null or less than the first.
  $356F The carry is complemented to give the correct test results.
@ $3572 label=BOTH_NULL
  $3572,3 Here the carry is used as it stands.
@ $3575 label=SEC_PLUS
  $3576 The first string is now null, the second not.
  $3578 Neither string is null, so their next bytes are compared.
  $357A Jump if the first byte is less.
  $357C Jump if the second byte is less.
  $357E,7 The bytes are equal; so the lengths are decremented and a jump is made to #R$3564 to compare the next bytes of the reduced strings.
@ $3585 label=FRST_LESS
  $3587 The carry is cleared here for the correct test results.
@ $3588 label=STR_TEST
  $3588 For the string tests, a zero is put on to the calculator stack.
B $358A,1 #R$341B(stk_zero)
B $358B,1 #R$369B
@ $358C label=END_TESTS
  $358C These three tests, called as needed, give the correct results for all twelve comparisons. The initial carry is set for 'not equal' and 'equal', and the final carry is set for 'greater than', 'less than' and 'equal'.
  $359B Finished.
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
D $37DA This subroutine handles the function TAN X. It simply returns SIN X/COS X, with arithmetic overflow if COS X=0.
  $37DA X
B $37DB,1 #R$33C0: X, X
B $37DC,1 #R$37B5: X, SIN X
B $37DD,1 #R$343C: SIN X, X
B $37DE,1 #R$37AA: SIN X, COS X
B $37DF,1 #R$31AF: SIN X/COS X=TAN X (report arithmetic overflow if needed)
B $37E0,1 #R$369B: TAN X
  $37E1 Finished: 'last value'=TAN X.
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
D $3843 This subroutine handles the function ACS X and returns a real number from 0 to #pi inclusive which is equal to the value in radians of the angle whose cosine is X.
D $3843 This subroutine uses the relation ACS X=#pi/2-ASN X.
  $3843 X
B $3844,1 #R$3833: ASN X
B $3845,1 #R$341B(stk_pi_2): ASN X, #pi/2
B $3846,1 #R$300F: ASN X-#pi/2
B $3847,1 #R$346E: #pi/2-ASN X=ACS X
B $3848,1 #R$369B
  $3849 Finished: 'last value'=ACS X.
@ $384A label=sqr
c $384A THE 'SQUARE ROOT' FUNCTION
D $384A  This subroutine handles the function SQR X and returns the positive square root of the real number X if X is positive, and zero if X is zero. A negative value of X gives rise to report A - invalid argument (via #R$3851).
D $384A This subroutine treats the square root operation as being X**0.5 and therefore stacks the value 0.5 and proceeds directly into #R$3851.
  $384A X
B $384B,1 #R$33C0: X, X
B $384C,1 #R$3501: X, (1/0)
B $384D,2,1 #R$368F to #R$386C: X
N $384F The jump is made if X=0; otherwise continue with:
B $384F,1 #R$341B(stk_half): X, 0.5
B $3850,1 #R$369B
E $384A Continue into #R$3851 to find the result of X**0.5.
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
