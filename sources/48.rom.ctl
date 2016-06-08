;
; SkoolKit control file for the 48K Spectrum ROM.
;
; Annotations taken from 'The Complete Spectrum ROM Disassembly' by Dr Ian
; Logan and Dr Frank O'Hara, published by Melbourne House.
;

@ $0000 start
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
@ $0048 label=KEY_INT
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
  $0271 #CHR8593
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
B $03F9,14,1*6,4,1
@ $0425 label=BE_i_OK
@ $0427 label=BE_OCTAVE
B $0439,2,1
B $043F,4,1
B $044B,16,1*6,3,1
@ $046C label=REPORT_B
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
@ $0616 keep
@ $0621 label=SA_SPACE
  $0627,c2
@ $0629 label=SA_BLANK
@ $0642 label=REPORT_F
B $0643,1
@ $0644 label=SA_NULL
@ $0648 keep
@ $064B label=SA_NAME
@ $0652 label=SA_DATA
@ $0667 keep
@ $0670 label=REPORT_2
B $0671,1
@ $0672 label=SA_V_OLD
@ $0685 label=SA_V_NEW
@ $068F label=SA_V_TYPE
@ $0692 label=SA_DATA_1
@ $06A0 label=SA_SCR
@ $06C3 label=SA_CODE
@ $06E1 label=SA_CODE_1
  $06E5,c2
@ $06F0 label=SA_CODE_2
@ $06F5 label=SA_CODE_3
@ $06F9 label=SA_CODE_4
@ $0710 label=SA_TYPE_3
@ $0716 label=SA_LINE
@ $0723 label=SA_LINE_1
@ $073A label=SA_TYPE_0
@ $075A label=SA_ALL
@ $0762 keep
@ $0767 label=LD_LOOK_H
@ $0769 keep
@ $078A label=LD_TYPE
@ $078E ssub=LD DE,$09C1-1
@ $07A6 label=LD_NAME
@ $07AD label=LD_CH_PR
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
  $177A,7,T1:1*3,1
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
  $1A48,50,1
@ $1A7A label=P_LET
  $1A7A,3,1
@ $1A7D label=P_GO_TO
  $1A7D,4,1,1,2
@ $1A81 label=P_IF
  $1A81,5,1*3,2
@ $1A86 label=P_GO_SUB
  $1A86,4,1,1,2
@ $1A8A label=P_STOP
  $1A8A,3,1,2
@ $1A8D label=P_RETURN
  $1A8D,3,1,2
@ $1A90 label=P_FOR
  $1A90,8,1*6,2
  $1A98,4,1,1,2
@ $1A9C label=P_PRINT
  $1A9C,3,1,2
@ $1A9F label=P_INPUT
  $1A9F,3,1,2
@ $1AA2 label=P_DIM
  $1AA2,3,1,2
@ $1AA5 label=P_REM
  $1AA5,3,1,2
@ $1AA8 label=P_NEW
  $1AA8,3,1,2
@ $1AAB label=P_RUN
  $1AAB,3,1,2
@ $1AAE label=P_LIST
  $1AAE,3,1,2
@ $1AB1 label=P_POKE
  $1AB1,4,1,1,2
@ $1AB5 label=P_RANDOM
  $1AB5,3,1,2
@ $1AB8 label=P_CONT
  $1AB8,3,1,2
@ $1ABB label=P_CLEAR
  $1ABB,3,1,2
@ $1ABE label=P_CLS
  $1ABE,3,1,2
@ $1AC1 label=P_PLOT
  $1AC1,4,1,1,2
@ $1AC5 label=P_PAUSE
  $1AC5,4,1,1,2
@ $1AC9 label=P_READ
  $1AC9,3,1,2
@ $1ACC label=P_DATA
  $1ACC,3,1,2
@ $1ACF label=P_RESTORE
  $1ACF,3,1,2
@ $1AD2 label=P_DRAW
  $1AD2,4,1,1,2
@ $1AD6 label=P_COPY
  $1AD6,3,1,2
@ $1AD9 label=P_LPRINT
  $1AD9,3,1,2
@ $1ADC label=P_LLIST
  $1ADC,3,1,2
@ $1ADF label=P_SAVE
  $1ADF,1
@ $1AE0 label=P_LOAD
  $1AE0,1
@ $1AE1 label=P_VERIFY
  $1AE1,1
@ $1AE2 label=P_MERGE
  $1AE2,2
@ $1AE3 label=P_BEEP
  $1AE3,4,1,1,2
@ $1AE7 label=P_CIRCLE
  $1AE7,4,1,1,2
@ $1AEB label=P_INK
  $1AEB,1
@ $1AEC label=P_PAPER
  $1AEC,1
@ $1AED label=P_FLASH
  $1AED,1
@ $1AEE label=P_BRIGHT
  $1AEE,1
  $1AEF,1
@ $1AF0 label=P_OVER
  $1AF0,1
@ $1AF1 label=P_OUT
  $1AF1,4,1,1,2
@ $1AF5 label=P_BORDER
  $1AF5,4,1,1,2
@ $1AF9 label=P_DEF_FN
  $1AF9,3,1,2
@ $1AFC label=P_OPEN
  $1AFC,6,1*4,2
@ $1B02 label=P_CLOSE
  $1B02,4,1,1,2
@ $1B06 label=P_FORMAT
  $1B06,4,1,1,2
@ $1B0A label=P_MOVE
  $1B0A,6,1*4,2
@ $1B10 label=P_ERASE
  $1B10,4,1,1,2
@ $1B14 label=P_CAT
  $1B14,3,1,2
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
  $1C07 #R$1C82
  $1C08 #R$1C96
  $1C09 #R$1C7A
  $1C0A #R$1CBE
  $1C0B #R$1C8C
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
@ $1D10 label=F_USE_1
B $1D14,2,1
@ $1D16 label=F_REORDER
B $1D17,6,1
@ $1D27 keep
@ $1D34 label=F_L_S
B $1D36,3,1
@ $1D64 label=F_LOOP
@ $1D7C label=F_FOUND
@ $1D84 label=REPORT_I
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
B $1DDB,12,1
@ $1DE2 label=NEXT_1
@ $1DE9 label=NEXT_2
B $1DE9,1
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
@ $2096 label=INPUT_1
@ $20AD label=INPUT_2
@ $20C1 label=IN_ITEM_1
  $20C6,c2
  $20CF,c2
@ $20D8 label=IN_ITEM_2
@ $20ED label=IN_ITEM_3
@ $20FA label=IN_PROMPT
@ $210A keep
@ $211A label=IN_PR_1
@ $211C label=IN_PR_2
  $2124,c2
@ $2129 label=IN_PR_3
@ $213A nowarn
@ $213A label=IN_VAR_1
@ $2148 label=IN_VAR_2
@ $215E label=IN_VAR_3
@ $2161 label=IN_VAR_4
@ $2174 label=IN_VAR_5
@ $219B label=IN_VAR_6
@ $21AF label=IN_NEXT_1
@ $21B2 label=IN_NEXT_2
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
c $2320 THE CIRCLE COMMAND ROUTINE
  $2321,c2
B $232E,3,1
B $2337,2,1
@ $233B label=C_R_GRE_1
B $233C,2,1
B $2341,3,1
@ $2347 label=C_ARC_GE1
B $2349,4,1
B $2353,3,1
B $235B,19,1
@ $2382 label=DRAW
c $2382 THE DRAW COMMAND ROUTINE
  $2383,c2
@ $238D label=DR_3_PRMS
B $2395,11,1
@ $23A3 label=DR_SIN_NZ
B $23A3,18,1
B $23BB,3,1
@ $23C1 label=DR_PRMS
B $23C6,55,1
B $2406,2,1
B $240F,4,1
B $241A,5,1
@ $2420 label=DRW_STEPS
@ $2425 label=ARC_LOOP
B $2426,19,1
@ $2439 label=ARC_START
B $243B,6,1
B $2448,8,1
B $2457,2,1
@ $245F label=ARC_END
B $2460,4,1
B $246B,3,1
B $2475,2,1
@ $2477 label=LINE_DRAW
@ $247D label=CD_PRMS1
c $247D THE 'INITIAL PARAMETERS' SUBROUTINE
B $247E,12,1
@ $2495 label=USE_252
@ $2497 label=DRAW_SAVE
B $249C,25,1
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
@ $25B3 label=S_QUOTE
@ $25B6 keep
@ $25BE label=S_Q_AGAIN
@ $25CB label=S_Q_COPY
  $25CF,c2
  $25D5,c2
@ $25D9 label=S_Q_PRMS
@ $25DB label=S_STRING
@ $25E8 label=S_BRACKET
  $25EC,c2
@ $25F5 label=S_FN
@ $25F8 label=S_RND
B $2605,18,1*9,3,1
@ $2625 label=S_RND_END
@ $2627 label=S_PI
B $262D,2,1
@ $2630 label=S_PI_END
@ $2634 keep
@ $2634 label=S_INKEY
  $2638,c2
@ $2658 keep
@ $2660 label=S_IK_STK
@ $2665 label=S_INK_EN
@ $2668 label=S_SCREEN
@ $2672 label=S_ATTR
@ $267B label=S_POINT
@ $2684 label=S_ALPHNUM
  $2689,c2
@ $268D label=S_DECIMAL
@ $2696 keep
@ $26B5 label=S_STK_DEC
@ $26B6 label=S_SD_SKIP
@ $26C3 label=S_NUMERIC
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
  $2795,27,T1:1*8,2*5,1
b $27B0 THE TABLE OF PRIORITIES
  $27B0,13,1
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
@ $2C9F keep
@ $2CA2 label=BIN_DIGIT
  $2CA3,c2
@ $2CB3 label=BIN_END
@ $2CB8 label=NOT_BIN
  $2CB8,c2
  $2CBF,c2
@ $2CCB label=DECIMAL
@ $2CCF label=DEC_RPT_C
B $2CD3,2,1
@ $2CD5 label=DEC_STO_1
B $2CD6,4,1
@ $2CDA label=NXT_DGT_1
B $2CE1,7,1
@ $2CEB label=E_FORMAT
  $2CEB,c2
  $2CEF,c2
@ $2CF2 label=SIGN_FLAG
  $2CF5,c2
  $2CF9,c2
@ $2CFE label=SIGN_DONE
@ $2CFF label=ST_E_PART
@ $2D18 label=E_FP_JUMP
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
@ $2D55 label=E_SAVE
B $2D5D,2,1
@ $2D60 label=E_LOOP
B $2D66,10,1
@ $2D6D label=E_DIVSN
@ $2D6E label=E_FETCH
@ $2D71 label=E_TST_END
B $2D75,3,1
@ $2D7B label=E_END
B $2D7C,2,1
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
c $2DC1 THE 'LOG(2#CHR(8593)A)' SUBROUTINE
B $2DCC,9,1*2,4,1
@ $2DD5 label=FP_TO_A
c $2DD5 THE 'FLOATING-POINT TO A' SUBROUTINE
@ $2DE1 label=FP_A_END
@ $2DE3 label=PRINT_FP
c $2DE3 THE 'PRINT A FLOATING-POINT NUMBER' SUBROUTINE
B $2DE4,10,1
  $2DEE,c2
@ $2DF2 label=PF_NEGTVE
B $2DF2,2,1
  $2DF4,c2
@ $2DF8 label=PF_POSTVE
B $2DF8,6,1
@ $2E01 label=PF_LOOP
B $2E02,9,1
@ $2E1E label=PF_SAVE
@ $2E24 label=PF_SMALL
B $2E25,2,1
B $2E3A,6,1
@ $2E56 label=PF_LARGE
@ $2E6F label=PF_MEDIUM
@ $2E7B label=PF_BITS
@ $2E8A label=PF_BYTES
@ $2EA1 label=PF_DIGITS
@ $2EA9 label=PF_INSERT
@ $2EB3 label=PF_TEST_2
@ $2EB8 label=PF_ALL_9
@ $2ECB label=PF_MORE
B $2ECC,3,1
@ $2ECF label=PF_FRACTN
@ $2EEC keep
@ $2EEC label=PF_FR_DGT
@ $2EEF label=PF_FR_EXX
@ $2F0C label=PF_ROUND
@ $2F18 label=PF_RND_LP
@ $2F25 label=PF_R_BACK
@ $2F2D label=PF_COUNT
B $2F31,2,1
@ $2F46 label=PF_NOT_E
@ $2F4A label=PF_E_SBRN
@ $2F52 label=PF_OUT_LP
@ $2F59 label=PF_OUT_DT
@ $2F5E label=PF_DC_OUT
  $2F62,c2
@ $2F64 label=PF_DEC_0S
  $2F65,c2
@ $2F6C label=PF_E_FRMT
  $2F73,c2
  $2F7F,c2
@ $2F83 label=PF_E_POS
  $2F83,c2
@ $2F85 label=PF_E_SIGN
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
B $32C5,18,3,4,2,5,4
@ $32C8 label=stk_one
@ $32CC label=stk_half
@ $32CE label=stk_pi_2
@ $32D3 label=stk_ten
@ $32D7 label=CALCADDR
w $32D7 THE TABLE OF ADDRESSES
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
B $36A1,13,1
@ $36AF label=int
c $36AF THE 'INT' FUNCTION
B $36B0,6,1
@ $36B7 label=X_NEG
B $36B7,12,1
@ $36C2 label=EXIT
@ $36C4 label=EXP
c $36C4 THE 'EXPONENTIAL' FUNCTION
B $36C5,52,1*3,4,1*13,2,1,3,1,3,1,4,1,4,1,4,1,4,1
@ $3703 label=REPORT_6_2
B $3704,1
@ $3705 label=N_NEGTV
@ $370C label=RESULT_OK
@ $370E label=RSLT_ZERO
B $370F,3,1
@ $3713 label=ln
c $3713 THE 'NATURAL LOGARITHM' FUNCTION
B $3714,6,1
@ $371A label=REPORT_A_2
B $371B,4,1
@ $371C label=VALID
B $3726,21,1*8,4,1
@ $373D label=GRE_8
B $373D,69,1*3,4,1*19,2,1,2,1,2,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1
@ $3783 label=get_argt
c $3783 THE 'REDUCE ARGUMENT' SUBROUTINE
B $3784,28,1*3,4,1
@ $37A1 label=ZPLUS
B $37A1,8,1
@ $37A8 label=YNEG
@ $37AA label=cos
c $37AA THE 'COSINE' FUNCTION
B $37AB,10,1
@ $37B5 label=sin
c $37B5 THE 'SINE' FUNCTION
B $37B6,35,1*12,2,1,3,1,4,1,4,1,4,1
@ $37B7 label=C_ENT
@ $37DA label=tan
c $37DA THE 'TAN' FUNCTION
B $37DB,6,1
@ $37E2 label=atn
c $37E2 THE 'ARCTAN' FUNCTION
B $37EB,13,1
@ $37F8 label=SMALL
B $37F9,57,1*15,2,1,2,1,2,1,3,1,3,1,2,1,4,1,4,1,4,1,4,1
@ $37FA label=CASES
@ $3833 label=asn
c $3833 THE 'ARCSIN' FUNCTION
B $3834,14,1
@ $3843 label=acs
c $3843 THE 'ARCCOS' FUNCTION
B $3844,5,1
@ $384A label=sqr
c $384A THE 'SQUARE ROOT' FUNCTION
B $384B,6,1
@ $3851 label=to_power
c $3851 THE 'EXPONENTIATION' OPERATION
B $3852,8,1
@ $385D label=XIS0
B $385D,16,1
@ $386A label=ONE
@ $386C label=LAST
s $386E
  $386E,1170,1170:$FF These locations are 'spare'. They all hold +FF.
@ $3D00 label=CHARSET
b $3D00 Character set
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
