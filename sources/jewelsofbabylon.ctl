; Copyright Interceptor Software UK 1985, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#FACT #LINK:Facts)
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Jewels of Babylon Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $5B00 Tape Loader
@ $5B00 label=TapeLoader
N $5B00 Load the first block: screen data.
N $5B0C Load the second block: graphics data.
N $5B18 Load the third block: game data.
N $5B21 Tape loading routine.
@ $5B21 label=TapeLoading

u $5B50

b $607C Graphics: Boat
@ $607C label=Graphics_Boat
D $607C #PUSHS #UDGTABLE
. { =h On Your Boat }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(boat) }
. UDGTABLE# #POPS
  $607C

b $6CA4 Graphics: Sand Dunes
@ $6CA4 label=Graphics_SandDunes
D $6CA4 #PUSHS #UDGTABLE
. { =h Sand Dunes }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(sand-dunes) }
. UDGTABLE# #POPS
  $6CA4

b $7731 Graphics: Bridge
@ $7731 label=Graphics_Bridge
D $7731 #PUSHS #UDGTABLE
. { =h Bridge }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(bridge) }
. UDGTABLE# #POPS
  $7731

b $8171 Graphics: Cave
@ $8171 label=Graphics_Cave
D $8171 #PUSHS #UDGTABLE
. { =h Cave }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(cave) }
. UDGTABLE# #POPS
  $8171

b $8BC3 Graphics: Door
@ $8BC3 label=Graphics_Door
D $8BC3 #PUSHS #UDGTABLE
. { =h Door }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(door) }
. UDGTABLE# #POPS
  $8BC3

b $966A Graphics: Huts
@ $966A label=Graphics_Huts
D $966A #PUSHS #UDGTABLE
. { =h Huts }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(huts) }
. UDGTABLE# #POPS
  $966A

b $A042 Graphics: Cliffs
@ $A042 label=Graphics_Cliffs
D $A042 #PUSHS #UDGTABLE
. { =h Cliffs }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(cliffs) }
. UDGTABLE# #POPS
  $A042

b $A958 Graphics: Test
@ $A958 label=Graphics_Test
D $A958 #PUSHS #UDGTABLE
. { =h Dunno }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(test) }
. UDGTABLE# #POPS
  $A958

b $B2A7 Graphics: Treasure
@ $B2A7 label=Graphics_Treasure
D $B2A7 #PUSHS #UDGTABLE
. { =h Treasure }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(treasure) }
. UDGTABLE# #POPS
  $B2A7

c $BA50 Game Entry Point
@ $BA50 label=GameEntryPoint
  $BA50,$05 #HTML(Set CAPS LOCK on, using bit 3 of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6A.html">FLAGS2</a>).
  $BA55,$05 Write #N$18 to *#R$BD70.
  $BA5A,$03 Jump to #R$C592.

c $BA5D Get User Input
@ $BA5D label=GetUserInput
  $BA5D,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $BA60,$04 Jump to #R$BA5D until bit 5 of #REGa is set.
  $BA64,$02 Reset bit 5 of #REGa.
  $BA66,$03 #HTML(Write #REGa back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
  $BA69,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C08.html">LAST_K</a>.)
  $BA6C,$01 Return.

c $BA6D
  $BA6D,$03 Call #R$BA96.
  $BA70,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D6B.html">CLS</a>.)
  $BA73,$01 Return.

c $BA74
  $BA74,$03 Call #R$BA96.
  $BA77,$07 #HTML(Clear the number of lines held by *#R$BD70 from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $BA7E,$01 Return.

c $BA7F
  $BA7F,$03 Call #R$BA96.
  $BA82,$03 #REGbc=#N($0321,$04,$04).
  $BA85,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $BA88,$01 Return.

c $BA89
  $BA89,$03 Call #R$BA96.
  $BA8C,$04 #REGb=*#R$BD70.
  $BA90,$02 #REGc=#N$21.
  $BA92,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $BA95,$01 Return.

c $BA96 Switch To Upper Screen
@ $BA96 label=SwitchScreenUpper
  $BA96,$04 Stash #REGhl, #REGde, #REGbc and #REGaf on the stack.
  $BA9A,$05 #HTML(Switch to upper screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a>.)
  $BA9F,$04 Restore #REGaf, #REGbc, #REGde and #REGhl from the stack.
  $BAA3,$01 Return.

c $BAA4
  $BAA4,$03 Call #R$BA96.
  $BAA7,$01 #REGa=*#REGhl.
  $BAA8,$01 Increment #REGhl by one.
  $BAA9,$03 Return if #REGa is equal to #N$FF.
  $BAAC,$03 Call #R$BAC3.
  $BAAF,$02 Jump to #R$BAA7.
  $BAB1,$03 Call #R$BAA4.
  $BAB4,$02 #REGa=#N$0D.
  $BAB6,$03 Call #R$BAC3.
  $BAB9,$01 Return.

c $BABA
  $BABA,$01 Switch to the shadow registers.
  $BABB,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0DFE.html">CL_SC_ALL</a>.)
  $BABE,$03 Call #R$BA7F.
  $BAC1,$01 Switch back to the normal registers.
  $BAC2,$01 Return.

c $BAC3
  $BAC3,$01 Stash #REGaf on the stack.
  $BAC4,$07 #HTML(Jump to #R$BADE if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html#5C89">S_POSN</a> is not equal to #N$03.)
  $BACB,$01 Restore #REGaf from the stack.
  $BACC,$01 Stash #REGaf on the stack.
  $BACD,$04 Jump to #R$BAD6 if #REGa is not equal to #N$0D.
  $BAD1,$03 Call #R$BABA.
  $BAD4,$01 Restore #REGaf from the stack.
  $BAD5,$01 Return.

  $BAD6,$08 #HTML(Call #R$BABA if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a> is equal to #N$01.)
  $BADE,$01 Restore #REGaf from the stack.
  $BADF,$01 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">PRINT_A_1</a>.)
  $BAE0,$01 Return.

c $BAE1 Print Location Graphic
@ $BAE1 label=Print_LocationGraphic
  $BAE1,$03 Call #R$BA96.
  $BAE4,$03 #REGbc=#N($1821,$04,$04).
  $BAE7,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $BAEA Reset graphic display area.
  $BAEA,$03 #HTML(Point #REGhl at <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR-T</a> which holds the current attribute value.)
  $BAED,$01 Fetch the attribute byte.
  $BAEE,$02,b$01 Keep only the PAPER bits 3-5.
  $BAF0,$03 Move the PAPER bits into the INK bits.
  $BAF3,$01 Store the result in #REGb.
  $BAF4,$01 Fetch the attribute byte again.
  $BAF5,$02,b$01 Keep everything except the INK bits.
  $BAF7,$01 Combine the two values.
  $BAF8,$01 Write #REGa to *#REGhl.
  $BAF9,$03 #REGbc=#N($0200,$04,$04).
  $BAFC,$01 Stash #REGbc on the stack.
  $BAFD,$03 #REGhl=#R$BD75.
  $BB00,$02 #REGb=#N$08.
  $BB02,$03 #REGc=*#REGix+#N$00.
  $BB05,$02 Increment #REGix by one.
  $BB07,$02 Jump to #R$BB0A.
  $BB09,$01 Increment #REGhl by one.
  $BB0A,$02 Shift #REGc right.
  $BB0C,$02 Jump to #R$BB15 if #REGhl is greater than or equal to #REGb.
  $BB0E,$03 #REGa=*#REGix+#N$00.
  $BB11,$02 Increment #REGix by one.
  $BB13,$02 Jump to #R$BB16.
  $BB15,$01 #REGa=#N$00.
  $BB16,$01 Write #REGa to *#REGhl.
  $BB17,$02 Decrease counter by one and loop back to #R$BB09 until counter is zero.
  $BB19,$03 #REGde=#R$BD75.
  $BB1C,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0B03.html">PO_FETCH</a>.)
  $BB1F,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0B24.html#0B7F">PR_ALL</a>.)
  $BB22,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0ADC.html">PO_STORE</a>.)
  $BB25,$01 Restore #REGbc from the stack.
  $BB26,$01 Decrease #REGbc by one.
  $BB27,$04 Jump to #R$BAFC until #REGbc is zero.
  $BB2B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D4D.html">TEMPS</a>.)
  $BB2E,$01 Return.

c $BB2F Colour Location Image
@ $BB2F label=Colour_LocationImage
  $BB2F,$03 #REGde=#N$5800 (screen buffer location).
  $BB32,$02 Stash #REGix on the stack.
  $BB34,$01 Restore #REGhl from the stack.
  $BB35,$03 #REGbc=#N($0200,$04,$04).
  $BB38,$02 LDIR.
  $BB3A,$01 Return.

c $BB3B Print Location Image
@ $BB3B label=Print_LocationImage
  $BB3B,$03 Call #R$BAE1.
  $BB3E,$03 Call #R$BB2F.
  $BB41,$01 Return.

c $BB42
  $BB42,$03 #REGbc=#N($0200,$04,$04).
  $BB45,$03 #REGhl=#N$5800 (screen buffer location).
  $BB48,$01 #REGe=#REGa.
  $BB49,$01 Write #REGe to *#REGhl.
  $BB4A,$01 Increment #REGhl by one.
  $BB4B,$01 Decrease #REGbc by one.
  $BB4C,$01 #REGa=#REGb.
  $BB4D,$01 Set the bits from #REGc.
  $BB4E,$02 Jump to #R$BB49 if #REGbc is not equal to #REGc.
  $BB50,$01 Return.

c $BB51
  $BB51,$01 Halt operation (suspend CPU until the next interrupt).
  $BB52,$02 Decrease counter by one and loop back to #R$BB51 until counter is zero.
  $BB54,$01 Return.

c $BB55
  $BB55,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $BB58,$01 Return.

b $BBF0
  $BC54
  $BC66
  $BC67
  $BC68
  $BC6A
  $BC6B
  $BC6C
  $BC6E
  $BC6F
  $BCCB
  $BD0C
  $BD18
  $BD32

g $BD34 Command Buffer
B $BD34

g $BD66

B $BD70,$02,$01
  $BD75
  $BD7F
  $BD81

t $BD85 Messaging: > 
  $BD85,$02 "#STR$BD85,$08($b==$FF)".
B $BD87,$01 Terminator.

t $BD88 Messaging: <BS> <BS>
  $BD88,$03 "#STR$BD88,$08($b==$FF)".
B $BD8B,$01 Terminator.

t $BD8C Messaging: The 
  $BD8C,$04 "#STR$BD8C,$08($b==$FF)".
B $BD90,$01 Terminator.

t $BD91 Messaging: I Don't Understand
  $BD91,$13 "#STR$BD91,$08($b==$FF)".
B $BDA4,$01 Terminator.

t $BDA5 Messaging: I Don't Know The Word
  $BDA5,$17 "#STR$BDA5,$08($b==$FF)".
B $BDBC,$01 Terminator.

t $BDBD Messaging: Nothing
  $BDBD,$08 "#STR$BDBD,$08($b==$FF)".
B $BDC5,$01 Terminator.

t $BDC6 Messaging: You Can See
  $BDC6,$0E "#STR$BDC6,$08($b==$FF)".
B $BDD4,$01 Terminator.

t $BDD5 Messaging: Ampersand 
  $BDD5,$03 "#STR$BDD5,$08($b==$FF)".
B $BDD8,$01 Terminator.

t $BDD9 Messaging: There Are Exits
  $BDD9,$12 "#STR$BDD9,$08($b==$FF)".
B $BDEB,$01 Terminator.

t $BDEC Messaging: There Is An Exit 
  $BDEC,$12 "#STR$BDEC,$08($b==$FF)".
B $BDFE,$01 Terminator.

t $BDFF Messaging: North
  $BDFF,$05 "#STR$BDFF,$08($b==$FF)".
B $BE04,$01 Terminator.

t $BE05 Messaging: South
  $BE05,$05 "#STR$BE05,$08($b==$FF)".
B $BE0A,$01 Terminator.

t $BE0B Messaging: East
  $BE0B,$04 "#STR$BE0B,$08($b==$FF)".
B $BE0F,$01 Terminator.

t $BE10 Messaging: West
  $BE10,$04 "#STR$BE10,$08($b==$FF)".
B $BE14,$01 Terminator.

t $BE15 Messaging: Up
  $BE15,$02 "#STR$BE15,$08($b==$FF)".
B $BE17,$01 Terminator.

t $BE18 Messaging: Down
  $BE18,$04 "#STR$BE18,$08($b==$FF)".
B $BE1C,$01 Terminator.

t $BE1D Messaging: I Can't See 
  $BE1D,$0C "#STR$BE1D,$08($b==$FF)".
B $BE29,$01 Terminator.

t $BE2A Messaging:  Here
  $BE2A,$06 "#STR$BE2A,$08($b==$FF)".
B $BE30,$01 Terminator.

t $BE31 Messaging: You Are Dead
  $BE31,$0D "#STR$BE31,$08($b==$FF)".
B $BE3E,$01 Terminator.

t $BE3F Messaging: Want Another Game? Y/N
  $BE3F,$17 "#STR$BE3F,$08($b==$FF)".
B $BE56,$01 Terminator.

t $BE57 Messaging: Loading. Start Tape
  $BE57,$14 "#STR$BE57,$08($b==$FF)".
B $BE6B,$01 Terminator.

t $BE6C Messaging: Tape Error
  $BE6C,$0B "#STR$BE6C,$08($b==$FF)".
B $BE77,$01 Terminator.

t $BE78 Messaging: Saving. Start Tape,Press Any Key
  $BE78,$21 "#STR$BE78,$08($b==$FF)".
B $BE99,$01 Terminator.

t $BE9A Messaging: Stop Tape.Saving Complete
  $BE9A,$1A "#STR$BE9A,$08($b==$FF)".
B $BEB4,$01 Terminator.

t $BEB5 Messaging: Want To Save The Game? Y/N
  $BEB5,$1B "#STR$BEB5,$08($b==$FF)".
B $BED0,$01 Terminator.

t $BED1 Messaging: Please Be More Specific
  $BED1,$18 "#STR$BED1,$08($b==$FF)".
B $BEE9,$01 Terminator.

t $BEEA Messaging: Please Rephrase That
  $BEEA,$15 "#STR$BEEA,$08($b==$FF)".
B $BEFF,$01 Terminator.

t $BF00 Messaging: You Can't
  $BF00,$0A "#STR$BF00,$08($b==$FF)".
B $BF0A,$01 Terminator.

t $BF0B Messaging: O.K
  $BF0B,$04 "#STR$BF0B,$08($b==$FF)".
B $BF0F,$01 Terminator.

t $BF10 Messaging: You're Already Carrying 
  $BF10,$18 "#STR$BF10,$08($b==$FF)".
B $BF28,$01 Terminator.

t $BF29 Messaging: Full Stop
  $BF29,$01 "#STR$BF29,$08($b==$FF)".
B $BF2A,$01 Terminator.

t $BF2B Messaging: It
  $BF2B,$03 "#STR$BF2B,$08($b==$FF)".
B $BF2E,$01 Terminator.

t $BF2F Messaging: Them
  $BF2F,$05 "#STR$BF2F,$08($b==$FF)".
B $BF34,$01 Terminator.

t $BF35 Messaging: You Can't Carry Any More
  $BF35,$19 "#STR$BF35,$08($b==$FF)".
B $BF4E,$01 Terminator.

t $BF4F Messaging: You Are Carrying
  $BF4F,$12 "#STR$BF4F,$08($b==$FF)".
B $BF61,$01 Terminator.

t $BF62 Messaging: You Can't Go In That Direction
  $BF62,$1F "#STR$BF62,$08($b==$FF)".
B $BF81,$01 Terminator.

t $BF82 Messaging: One At A Time, Please!
  $BF82,$15 "#STR$BF82,$08($b==$FF)".
B $BF97,$01 Terminator.

t $BF98 Messaging: I Don't See The Point
  $BF98,$16 "#STR$BF98,$08($b==$FF)".
B $BFAE,$01 Terminator.

t $BFAF Messaging: You're Not Carrying 
  $BFAF,$14 "#STR$BFAF,$08($b==$FF)".
B $BFC3,$01 Terminator.

t $BFC4 Messaging: You're Not Carrying Anything
  $BFC4,$1D "#STR$BFC4,$08($b==$FF)".
B $BFE1,$01 Terminator.

b $BFE2 Messaging: Terminator
  $BFE2,$01 Terminator.

b $BFE3

c $BFEE

c $C00A

  $C025,$04 Jump to #R$C058 if "ENTER" was pressed.

c $C058
  $C058,$01 Write #REGa to *#REGhl.
  $C059,$03 Call #R$BA96.
  $C05C,$03 Call #R$BAC3.
  $C05F,$03 #REGhl=#R$BD66.
  $C062,$02 #REGa=#N$FF.
  $C064,$02 #REGb=#N$0A.
  $C066,$01 Write #REGa to *#REGhl.
  $C067,$01 Increment #REGhl by one.
  $C068,$02 Decrease counter by one and loop back to #R$C066 until counter is zero.
  $C06A,$03 #REGhl=#R$BD34.
  $C06D,$02 #REGc=#N$0A.
  $C06F,$03 #REGde=#R$BD71.
  $C072,$02 #REGb=#N$04.
  $C074,$03 Write ASCII "SPACE" (#N$20) to *#REGde.
  $C077,$01 Increment #REGde by one.
  $C078,$02 Decrease counter by one and loop back to #R$C076 until counter is zero.
  $C07A,$01 #REGa=#N$00.
  $C07B,$01 Set the bits from #REGc.
  $C07C,$03 Jump to #R$C16E if #REGde is equal to #REGc.
  $C07F,$06 Jump to #R$C16E if *#REGhl is equal to #N$0D.
  $C085,$02 #REGb=#N$04.
  $C087,$03 #REGde=#R$BD71.
  $C08A,$01 #REGa=*#REGhl.
  $C08B,$04 Jump to #R$C0B6 if #REGa is equal to #N$0D.
  $C08F,$04 Jump to #R$C0AC if #REGa is equal to #N$20.
  $C093,$04 Jump to #R$C0AC if #REGa is equal to #N$2C.
  $C097,$01 Write #REGa to *#REGde.
  $C098,$01 Increment #REGhl by one.
  $C099,$01 Increment #REGde by one.
  $C09A,$02 Decrease counter by one and loop back to #R$C08A until counter is zero.
  $C09C,$01 #REGa=*#REGhl.
  $C09D,$04 Jump to #R$C0B6 if #REGa is equal to #N$0D.
  $C0A1,$04 Jump to #R$C0AC if #REGa is equal to #N$20.
  $C0A5,$04 Jump to #R$C0AC if #REGa is equal to #N$2C.
  $C0A9,$01 Increment #REGhl by one.
  $C0AA,$02 Jump to #R$C09C.
  $C0AC,$01 Increment #REGhl by one.
  $C0AD,$01 #REGa=*#REGhl.
  $C0AE,$04 Jump to #R$C0AC if #REGa is equal to #N$20.
  $C0B2,$04 Jump to #R$C0AC if #REGa is equal to #N$2C.
  $C0B6,$03 Stash #REGhl, #REGde and #REGbc on the stack.
  $C0B9,$03 #REGhl=#R$BD8C.
  $C0BC,$03 #REGde=#R$BD71.
  $C0BF,$02 #REGb=#N$04.
  $C0C1,$01 #REGa=*#REGde.
  $C0C2,$01 Compare #REGa with *#REGhl.
  $C0C3,$02 Jump to #R$C0C9 if #REGa is not equal to *#REGhl.
  $C0C5,$01 Increment #REGde by one.
  $C0C6,$01 Increment #REGhl by one.
  $C0C7,$02 Decrease counter by one and loop back to #R$C0C1 until counter is zero.
  $C0C9,$03 Restore #REGbc, #REGde and #REGhl from the stack.
  $C0CC,$02 Jump to #R$C06F if #REGhl is equal to *#REGhl.
  $C0CE,$01 Decrease #REGc by one.
  $C0CF,$03 Write #REGhl to *#R$BD7D.
  $C0D2,$04 Write #REGde to *#R$BD7F.
  $C0D6,$04 Write #REGbc to *#R$BD81.
  $C0DA,$03 #REGhl=*#R$BD0C.
  $C0DD,$02 #REGc=#N$00.
  $C0DF,$05 Jump to #R$C11C if *#REGhl is equal to #N$FF.
  $C0E4,$03 #REGde=#R$BD71.
  $C0E7,$02 #REGb=#N$04.
  $C0E9,$01 #REGa=*#REGde.
  $C0EA,$01 Compare #REGa with *#REGhl.
  $C0EB,$02 Jump to #R$C10D if #REGa is not equal to *#REGhl.
  $C0ED,$01 Increment #REGde by one.
  $C0EE,$01 Increment #REGhl by one.
  $C0EF,$02 Decrease counter by one and loop back to #R$C0E9 until counter is zero.
  $C0F1,$03 #REGhl=#R$BD81.
  $C0F4,$02 #REGa=#N$09.
  $C0F6,$01 #REGa-=*#REGhl.
  $C0F7,$02 #REGd=#N$00.
  $C0F9,$01 #REGe=#REGa.
  $C0FA,$04 #REGhl=#R$BD66+#REGde.
  $C0FE,$01 Write #REGc to *#REGhl.
  $C0FF,$03 #REGhl=*#R$BD7D.
  $C102,$04 #REGde=*#R$BD7F.
  $C106,$04 #REGbc=*#R$BD81.
  $C10A,$03 Jump to #R$C06F.

  $C10D,$01 #REGe=#REGb.
  $C10E,$02 #REGd=#N$00.
  $C110,$01 #REGhl+=#REGde.
  $C111,$01 #REGa=*#REGhl.
  $C112,$04 Jump to #R$C119 if #REGa is not equal to #N$2C.
  $C116,$01 Increment #REGhl by one.
  $C117,$02 Jump to #R$C0E4.

  $C119,$01 Increment #REGc by one.
  $C11A,$02 Jump to #R$C0DF.

  $C11C,$03 #REGhl=*#R$BD7D.
  $C11F,$04 #REGde=*#R$BD7F.
  $C123,$04 #REGbc=*#R$BD81.
  $C127,$02 #REGa=#N$0A.
  $C129,$01 #REGa-=#REGc.
  $C12A,$01 #REGc=#REGa.
  $C12B,$03 #REGhl=#R$BD34.
  $C12E,$01 Decrease #REGc by one.
  $C12F,$02 Jump to #R$C149 if #REGc is equal to #N$0A.
  $C131,$01 #REGa=*#REGhl.
  $C132,$04 Jump to #R$C13D if #REGa is equal to #N$20.
  $C136,$04 Jump to #R$C13D if #REGa is equal to #N$2C.
  $C13A,$01 Increment #REGhl by one.
  $C13B,$02 Jump to #R$C131.
  $C13D,$01 Increment #REGhl by one.
  $C13E,$01 #REGa=*#REGhl.
  $C13F,$02 Compare #REGa with #N$20.
  $C141,$02 Jump to #R$C13D if #REGa is equal to #N$20.
  $C143,$02 Compare #REGa with #N$2C.
  $C145,$02 Jump to #R$C13D if #REGa is equal to #N$2C.
  $C147,$02 Jump to #R$C12E.
  $C149,$01 Stash #REGhl on the stack.
  $C14A,$03 #REGhl=#R$BDA5.
  $C14D,$03 Call #R$BAB1.
  $C150,$01 Restore #REGhl from the stack.
  $C151,$02 #REGa=#N$22.
  $C153,$03 Call #R$BAC3.
  $C156,$01 #REGa=*#REGhl.
  $C157,$04 Jump to #R$C161 if #REGa is less than #N$21.
  $C15B,$01 Increment #REGhl by one.
  $C15C,$03 Call #R$BAC3.
  $C15F,$02 Jump to #R$C156.
  $C161,$02 #REGa=#N$22.
  $C163,$03 Call #R$BAC3.
  $C166,$03 #REGhl=#R$BF29.
  $C169,$03 Call #R$BAB1.
  $C16C,$02 Jump to #R$C17A.

  $C16E,$06 Return if *#R$BD66 is not equal to #N$FF.
  $C174,$03 #REGhl=#R$BD91.
  $C177,$03 Call #R$BAB1.
  $C17A,$03 Jump to #R$C00A.

c $C17D

c $C1F0
  $C1F0,$02 #REGd=#N$00.
  $C1F2,$02 Shift #REGe left (with carry).
  $C1F4,$02 Rotate #REGd left.
  $C1F6,$02 #REGix+=#REGde.
  $C1F8,$03 #REGl=*#REGix+#N$00.
  $C1FB,$03 #REGh=*#REGix+#N$01.
  $C1FE,$01 Return.

c $C1FF

c $C315
  $C315,$03 Write #REGa to *#R$BD70.
  $C318,$03 Call #R$BA89.
  $C31B,$03 #REGa=*#R$BCCB.
  $C31E,$04 #REGix=*#R$BD18.
  $C322,$01 #REGe=#REGa.
  $C323,$03 Call #R$C1F0.
  $C326,$03 Call #R$BAB1.
  $C329,$01 Return.

c $C32A

c $C35F

c $C4C7

c $C4EB

c $C520

c $C556

c $C579

c $C582

c $C592
  $C592,$03 Jump to #R$FD82.

t $C595 Messaging: A Ladder Leading Down To A<CR>Small Rowing Boat Alongside.
  $C595,$37 "#STR$C595,$08($b==$FF)".
B $C5CC,$01 Terminator.

t $C5CD Messaging: You Are Alongside Your Ship.<CR>A Ladder Leads Up To The Deck.
  $C5CD,$3B "#STR$C5CD,$08($b==$FF)".
B $C608,$01 Terminator.

t $C609 Messaging: A Match.
  $C609,$08 "#STR$C609,$08($b==$FF)".
B $C611,$01 Terminator.

t $C612 Messaging: A Lighted Match.
  $C612,$10 "#STR$C612,$08($b==$FF)".
B $C622,$01 Terminator.

t $C623 Messaging: A Plank.
  $C623,$08 "#STR$C623,$08($b==$FF)".
B $C62B,$01 Terminator.

t $C62C Messaging: A Plank,Spanning The Pit.
  $C62C,$19 "#STR$C62C,$08($b==$FF)".
B $C645,$01 Terminator.

t $C646 Messaging: A Coconut.
  $C646,$0A "#STR$C646,$08($b==$FF)".
B $C650,$01 Terminator.

t $C651 Messaging: A Rod.
  $C651,$06 "#STR$C651,$08($b==$FF)".
B $C657,$01 Terminator.

t $C658 Messaging: A Small Round Hole To<CR>The Side Of The Door.
  $C658,$2B "#STR$C658,$08($b==$FF)".
B $C683,$01 Terminator.

t $C684 Messaging: A Hole With A Rod Inserted,<CR>To The Side Of The Door.
  $C684,$34 "#STR$C684,$08($b==$FF)".
B $C6B8,$01 Terminator.

t $C6B9 Messaging: A Bottle.
  $C6B9,$09 "#STR$C6B9,$08($b==$FF)".
B $C6C2,$01 Terminator.

t $C6C3 Messaging: A Bottle Of Rum.
  $C6C3,$10 "#STR$C6C3,$08($b==$FF)".
B $C6D3,$01 Terminator.

t $C6D4 Messaging: Some Fruit.
  $C6D4,$0B "#STR$C6D4,$08($b==$FF)".
B $C6DF,$01 Terminator.

t $C6E0 Messaging: A Gun.
  $C6E0,$06 "#STR$C6E0,$08($b==$FF)".
B $C6E6,$01 Terminator.

t $C6E7 Messaging: An Eyepatch.
  $C6E7,$0C "#STR$C6E7,$08($b==$FF)".
B $C6F3,$01 Terminator.

t $C6F4 Messaging: An Eyepatch,<CR>Which You Are Wearing.
  $C6F4,$23 "#STR$C6F4,$08($b==$FF)".
B $C717,$01 Terminator.

t $C718 Messaging: A Keg Of Gunpowder.
  $C718,$13 "#STR$C718,$08($b==$FF)".
B $C72B,$01 Terminator.

t $C72C Messaging: A Crocodile.
  $C72C,$0C "#STR$C72C,$08($b==$FF)".
B $C738,$01 Terminator.

t $C739 Messaging: A Crocodile,With A Keg Of<CR>Gunpowder In Its Mouth.<CR>The Powder Is Spilling Out.
  $C739,$4D "#STR$C739,$08($b==$FF)".
B $C786,$01 Terminator.

t $C787 Messaging: A Shoe.
  $C787,$07 "#STR$C787,$08($b==$FF)".
B $C78E,$01 Terminator.

t $C78F Messaging: A Sextant.
  $C78F,$0A "#STR$C78F,$08($b==$FF)".
B $C799,$01 Terminator.

t $C79A Messaging: A Watch.
  $C79A,$08 "#STR$C79A,$08($b==$FF)".
B $C7A2,$01 Terminator.

t $C7A3 Messaging: You Are Surrounded By Natives.<CR>They Are Licking Their Lips<CR>In A Very Disturbing Manner.<CR>One Brandishes A Spear.
  $C7A3,$6F "#STR$C7A3,$08($b==$FF)".
B $C812,$01 Terminator.

t $C813 Messaging: A Group Of Natives,<CR>Examining A Watch.
  $C813,$26 "#STR$C813,$08($b==$FF)".
B $C839,$01 Terminator.

t $C83A Messaging: A Spear.
  $C83A,$08 "#STR$C83A,$08($b==$FF)".
B $C842,$01 Terminator.

t $C843 Messaging: A Strangely Coloured Fish.
  $C843,$1A "#STR$C843,$08($b==$FF)".
B $C85D,$01 Terminator.

t $C85E Messaging: A Red Herring.
  $C85E,$0E "#STR$C85E,$08($b==$FF)".
B $C86C,$01 Terminator.

t $C86D Messaging: The Jewels Of Babylon.
  $C86D,$16 "#STR$C86D,$08($b==$FF)".
B $C883,$01 Terminator.

t $C884 Messaging: A Crowbar.
  $C884,$0A "#STR$C884,$08($b==$FF)".
B $C88E,$01 Terminator.

t $C88F Messaging: A Key.
  $C88F,$06 "#STR$C88F,$08($b==$FF)".
B $C895,$01 Terminator.

t $C896 Messaging: A Human Skull.
  $C896,$0E "#STR$C896,$08($b==$FF)".
B $C8A4,$01 Terminator.

t $C8A5 Messaging: You Are At The Island.
  $C8A5,$16 "#STR$C8A5,$08($b==$FF)".
B $C8BB,$01 Terminator.

t $C8BC Messaging: A Sleeping Pirate.
  $C8BC,$12 "#STR$C8BC,$08($b==$FF)".
B $C8CE,$01 Terminator.

t $C8CF Messaging: A Dead Pirate.
  $C8CF,$0E "#STR$C8CF,$08($b==$FF)".
B $C8DD,$01 Terminator.

t $C8DE Messaging: A Parrot,Eyeing You<CR>With Suspicion.
  $C8DE,$23 "#STR$C8DE,$08($b==$FF)".
B $C901,$01 Terminator.

t $C902 Messaging: A Dead Parrot.
  $C902,$0E "#STR$C902,$08($b==$FF)".
B $C910,$01 Terminator.

t $C911 Messaging: A Giant Crab.<CR>It Advances Toward You.
  $C911,$25 "#STR$C911,$08($b==$FF)".
B $C936,$01 Terminator.

t $C937 Messaging: A Lion.<CR>It Is About To Pounce On You.
  $C937,$25 "#STR$C937,$08($b==$FF)".
B $C95C,$01 Terminator.

t $C95D Messaging: A Giant Octopus.
  $C95D,$10 "#STR$C95D,$08($b==$FF)".
B $C96D,$01 Terminator.

t $C96E Messaging: A Closed Door.
  $C96E,$0E "#STR$C96E,$08($b==$FF)".
B $C97C,$01 Terminator.

t $C97D Messaging: An Open Door.
  $C97D,$0D "#STR$C97D,$08($b==$FF)".
B $C98A,$01 Terminator.

t $C98B Messaging: The Door Is Open.
  $C98B,$11 "#STR$C98B,$08($b==$FF)".
B $C99C,$01 Terminator.

t $C99D Messaging: The Door Is Closed.
  $C99D,$13 "#STR$C99D,$08($b==$FF)".
B $C9B0,$01 Terminator.

t $C9B1 Messaging: A Smooth,Vertical Slab Of Rock.
  $C9B1,$1F "#STR$C9B1,$08($b==$FF)".
B $C9D0,$01 Terminator.

t $C9D1 Messaging: An Open Trapdoor.
  $C9D1,$11 "#STR$C9D1,$08($b==$FF)".
B $C9E2,$01 Terminator.

t $C9E3 Messaging: The Body Of A Sailor.
  $C9E3,$15 "#STR$C9E3,$08($b==$FF)".
B $C9F8,$01 Terminator.

t $C9F9 Messaging: A Makeshift Bridge.<CR>It Spans The Ravine.
  $C9F9,$28 "#STR$C9F9,$08($b==$FF)".
B $CA21,$01 Terminator.

t $CA22 Messaging: A Makeshift Bridge.
  $CA22,$13 "#STR$CA22,$08($b==$FF)".
B $CA35,$01 Terminator.

t $CA36 Messaging: A Boulder,Teetering On The<CR>Brink Of A Ledge,Far Above.
  $CA36,$36 "#STR$CA36,$08($b==$FF)".
B $CA6C,$01 Terminator.

t $CA6D Messaging: A Boulder.
  $CA6D,$0A "#STR$CA6D,$08($b==$FF)".
B $CA77,$01 Terminator.

t $CA78 Messaging: A Ring,Set Into The Floor.
  $CA78,$1A "#STR$CA78,$08($b==$FF)".
B $CA92,$01 Terminator.

t $CA93 Messaging: A Trail Of Slime,Leading<CR>Into The Cave.
  $CA93,$27 "#STR$CA93,$08($b==$FF)".
B $CABA,$01 Terminator.

t $CABB Messaging: A Very Large Stone.
  $CABB,$13 "#STR$CABB,$08($b==$FF)".
B $CACE,$01 Terminator.

t $CACF Messaging: A Rowing Boat.
  $CACF,$0E "#STR$CACF,$08($b==$FF)".
B $CADD,$01 Terminator.

t $CADE Messaging: A Ship Anchored Offshore,<CR>To The South.
  $CADE,$27 "#STR$CADE,$08($b==$FF)".
B $CB05,$01 Terminator.

t $CB06 Messaging: The Open Sea.<CR>You Are Totally Lost.
  $CB06,$23 "#STR$CB06,$08($b==$FF)".
B $CB29,$01 Terminator.

t $CB2A Messaging: On Board Your Ship,Anchored<CR>To The South Of A Large Island.
  $CB2A,$3B "#STR$CB2A,$08($b==$FF)".
B $CB65,$01 Terminator.

t $CB66 Messaging: In A Rowing Boat.
  $CB66,$11 "#STR$CB66,$08($b==$FF)".
B $CB77,$01 Terminator.

t $CB78 Messaging: The Long Sandy Beach.
  $CB78,$15 "#STR$CB78,$08($b==$FF)".
B $CB8D,$01 Terminator.

t $CB8E Messaging: The Dunes.<CR>Among Towering Mounds Of<CR>Drifting Sand.
  $CB8E,$32 "#STR$CB8E,$08($b==$FF)".
B $CBC0,$01 Terminator.

t $CBC1 Messaging: The Stand Of Palm Trees.<CR>The Large Leaves Gently Sway<CR>In The Warm,Tropical Breeze.
  $CBC1,$52 "#STR$CBC1,$08($b==$FF)".
B $CC13,$01 Terminator.

t $CC14 Messaging: The Hillside Path.
  $CC14,$12 "#STR$CC14,$08($b==$FF)".
B $CC26,$01 Terminator.

t $CC27 Messaging: By A Pool Of Clear,Glistening<CR>Water.
  $CC27,$24 "#STR$CC27,$08($b==$FF)".
B $CC4B,$01 Terminator.

t $CC4C Messaging: The Narrow Gulley.<CR>Cut Into The Rock By Water<CR>From The Pool Above.
  $CC4C,$42 "#STR$CC4C,$08($b==$FF)".
B $CC8E,$01 Terminator.

t $CC8F Messaging: The Hilltop.<CR>The Highest Point Of The Island.
  $CC8F,$2D "#STR$CC8F,$08($b==$FF)".
B $CCBC,$01 Terminator.

t $CCBD Messaging: The Waterfall.<CR>A Mighty Torrent Of Cascading<CR>Water.
  $CCBD,$33 "#STR$CCBD,$08($b==$FF)".
B $CCF0,$01 Terminator.

t $CCF1 Messaging: The Narrow Path.<CR>Behind The Waterfall.
  $CCF1,$26 "#STR$CCF1,$08($b==$FF)".
B $CD17,$01 Terminator.

t $CD18 Messaging: The Thicket.<CR>A Maze Of Paths Lead<CR>Through The Undergrowth.
  $CD18,$3A "#STR$CD18,$08($b==$FF)".
B $CD52,$01 Terminator.

t $CD53 Messaging: The Cannibals' Village.
  $CD53,$17 "#STR$CD53,$08($b==$FF)".
B $CD6A,$01 Terminator.

t $CD6B Messaging: The Woodland Path.
  $CD6B,$12 "#STR$CD6B,$08($b==$FF)".
B $CD7D,$01 Terminator.

t $CD7E Messaging: The Woodland Clearing.<CR>Trees And Undergrowth Have<CR>Been Cut Down.
  $CD7E,$40 "#STR$CD7E,$08($b==$FF)".
B $CDBE,$01 Terminator.

t $CDBF Messaging: The High Ridge.
  $CDBF,$0F "#STR$CDBF,$08($b==$FF)".
B $CDCE,$01 Terminator.

t $CDCF Messaging: The Valley.<CR>A Thin Miasma Of Mist Covers<CR>The Rich Verdant Grass.
  $CDCF,$40 "#STR$CDCF,$08($b==$FF)".
B $CE0F,$01 Terminator.

t $CE10 Messaging: The Fruit Grove.
  $CE10,$10 "#STR$CE10,$08($b==$FF)".
B $CE20,$01 Terminator.

t $CE21 Messaging: The Cliff Path.
  $CE21,$0F "#STR$CE21,$08($b==$FF)".
B $CE30,$01 Terminator.

t $CE31 Messaging: The Clifftop.<CR>Overlooking The Sea.
  $CE31,$22 "#STR$CE31,$08($b==$FF)".
B $CE53,$01 Terminator.

t $CE54 Messaging: The Rocky Path.
  $CE54,$0F "#STR$CE54,$08($b==$FF)".
B $CE63,$01 Terminator.

t $CE64 Messaging: The Bottom Of A Rocky Slope.
  $CE64,$1C "#STR$CE64,$08($b==$FF)".
B $CE80,$01 Terminator.

t $CE81 Messaging: The Canyon.<CR>The Walls Rise Dauntingly<CR>On Both Sides.
  $CE81,$34 "#STR$CE81,$08($b==$FF)".
B $CEB5,$01 Terminator.

t $CEB6 Messaging: The Secluded Beach.
  $CEB6,$13 "#STR$CEB6,$08($b==$FF)".
B $CEC9,$01 Terminator.

t $CECA Messaging: The Rockpool.<CR>A Deep Trough Of Crystal Clear<CR>Water.
  $CECA,$33 "#STR$CECA,$08($b==$FF)".
B $CEFD,$01 Terminator.

t $CEFE Messaging: Wreckers' Cove.
  $CEFE,$0F "#STR$CEFE,$08($b==$FF)".
B $CF0D,$01 Terminator.

t $CF0E Messaging: The Jungle.<CR>There Are Game Paths In All<CR>Directions.
  $CF0E,$33 "#STR$CF0E,$08($b==$FF)".
B $CF41,$01 Terminator.

t $CF42 Messaging: The Grassy Slope.<CR>Near The Jungle.
  $CF42,$22 "#STR$CF42,$08($b==$FF)".
B $CF64,$01 Terminator.

t $CF65 Messaging: The Rocky Beach.
  $CF65,$10 "#STR$CF65,$08($b==$FF)".
B $CF75,$01 Terminator.

t $CF76 Messaging: The Mouth Of A Large Cave.
  $CF76,$1A "#STR$CF76,$08($b==$FF)".
B $CF90,$01 Terminator.

t $CF91 Messaging: The Cave.<CR>A Deep Pool Of Water Lays In<CR>Its Centre.
  $CF91,$32 "#STR$CF91,$08($b==$FF)".
B $CFC3,$01 Terminator.

t $CFC4 Messaging: A Dead End.
  $CFC4,$0B "#STR$CFC4,$08($b==$FF)".
B $CFCF,$01 Terminator.

t $CFD0 Messaging: The Mossy Path.<CR>The Ground Is Waterlogged.
  $CFD0,$2A "#STR$CFD0,$08($b==$FF)".
B $CFFA,$01 Terminator.

t $CFFB Messaging: The Swamp.<CR>Muddy Paths Lead Off In All<CR>Directions.
  $CFFB,$32 "#STR$CFFB,$08($b==$FF)".
B $D02D,$01 Terminator.

t $D02E Messaging: The Ravine.<CR>A River Runs Far Below.
  $D02E,$23 "#STR$D02E,$08($b==$FF)".
B $D051,$01 Terminator.

t $D052 Messaging: The Cliffs.<CR>Overlooking A Natural Harbour.
  $D052,$2A "#STR$D052,$08($b==$FF)".
B $D07C,$01 Terminator.

t $D07D Messaging: The Cliff Bottom.
  $D07D,$11 "#STR$D07D,$08($b==$FF)".
B $D08E,$01 Terminator.

t $D08F Messaging: The Harbour Beach.<CR>At A Cave Entrance.
  $D08F,$26 "#STR$D08F,$08($b==$FF)".
B $D0B5,$01 Terminator.

t $D0B6 Messaging: The Vast Cavern.
  $D0B6,$10 "#STR$D0B6,$08($b==$FF)".
B $D0C6,$01 Terminator.

t $D0C7 Messaging: The Warren Of Passages.
  $D0C7,$17 "#STR$D0C7,$08($b==$FF)".
B $D0DE,$01 Terminator.

t $D0DF Messaging: The Narrow Passage.
  $D0DF,$13 "#STR$D0DF,$08($b==$FF)".
B $D0F2,$01 Terminator.

t $D0F3 Messaging: The Dusty Corridor.
  $D0F3,$13 "#STR$D0F3,$08($b==$FF)".
B $D106,$01 Terminator.

t $D107 Messaging: The Pirate Treasure Chamber.
  $D107,$1C "#STR$D107,$08($b==$FF)".
B $D123,$01 Terminator.

t $D124 Messaging: The Damp Passage.<CR>Water Trickles Down The Walls.
  $D124,$30 "#STR$D124,$08($b==$FF)".
B $D154,$01 Terminator.

t $D155 Messaging: The Wide Pit.
  $D155,$0D "#STR$D155,$08($b==$FF)".
B $D162,$01 Terminator.

t $D163 Messaging: The Pit Bottom.
  $D163,$0F "#STR$D163,$08($b==$FF)".
B $D172,$01 Terminator.

t $D173 Messaging: The Southern Side Of The Pit.
  $D173,$1D "#STR$D173,$08($b==$FF)".
B $D190,$01 Terminator.

t $D191 Messaging: The Mighty Rock Door.
  $D191,$15 "#STR$D191,$08($b==$FF)".
B $D1A6,$01 Terminator.

t $D1A7 Messaging: The Bridge.
  $D1A7,$0B "#STR$D1A7,$08($b==$FF)".
B $D1B2,$01 Terminator.

t $D1B3 Messaging: A Match
  $D1B3,$07 "#STR$D1B3,$08($b==$FF)".
B $D1BA,$01 Terminator.

t $D1BB Messaging: A Plank
  $D1BB,$07 "#STR$D1BB,$08($b==$FF)".
B $D1C2,$01 Terminator.

t $D1C3 Messaging: A Coconut
  $D1C3,$09 "#STR$D1C3,$08($b==$FF)".
B $D1CC,$01 Terminator.

t $D1CD Messaging: A Rod
  $D1CD,$05 "#STR$D1CD,$08($b==$FF)".
B $D1D2,$01 Terminator.

t $D1D3 Messaging: A Bottle
  $D1D3,$08 "#STR$D1D3,$08($b==$FF)".
B $D1DB,$01 Terminator.

t $D1DC Messaging: Any Rum
  $D1DC,$07 "#STR$D1DC,$08($b==$FF)".
B $D1E3,$01 Terminator.

t $D1E4 Messaging: Any Fruit
  $D1E4,$09 "#STR$D1E4,$08($b==$FF)".
B $D1ED,$01 Terminator.

t $D1EE Messaging: A Gun
  $D1EE,$05 "#STR$D1EE,$08($b==$FF)".
B $D1F3,$01 Terminator.

t $D1F4 Messaging: An Eyepatch
  $D1F4,$0B "#STR$D1F4,$08($b==$FF)".
B $D1FF,$01 Terminator.

t $D200 Messaging: Any Gunpowder
  $D200,$0D "#STR$D200,$08($b==$FF)".
B $D20D,$01 Terminator.

t $D20E Messaging: A Keg
  $D20E,$05 "#STR$D20E,$08($b==$FF)".
B $D213,$01 Terminator.

t $D214 Messaging: A Shoe
  $D214,$06 "#STR$D214,$08($b==$FF)".
B $D21A,$01 Terminator.

t $D21B Messaging: A Sextant
  $D21B,$09 "#STR$D21B,$08($b==$FF)".
B $D224,$01 Terminator.

t $D225 Messaging: A Watch
  $D225,$07 "#STR$D225,$08($b==$FF)".
B $D22C,$01 Terminator.

t $D22D Messaging: A Fish
  $D22D,$06 "#STR$D22D,$08($b==$FF)".
B $D233,$01 Terminator.

t $D234 Messaging: Any Jewels
  $D234,$0A "#STR$D234,$08($b==$FF)".
B $D23E,$01 Terminator.

t $D23F Messaging: A Crowbar
  $D23F,$09 "#STR$D23F,$08($b==$FF)".
B $D248,$01 Terminator.

t $D249 Messaging: A Key
  $D249,$05 "#STR$D249,$08($b==$FF)".
B $D24E,$01 Terminator.

t $D24F Messaging: A Skull
  $D24F,$07 "#STR$D24F,$08($b==$FF)".
B $D256,$01 Terminator.

t $D257 Messaging: A Spear
  $D257,$07 "#STR$D257,$08($b==$FF)".
B $D25E,$01 Terminator.

t $D25F Messaging: A Ladder
  $D25F,$08 "#STR$D25F,$08($b==$FF)".
B $D267,$01 Terminator.

t $D268 Messaging: A Boat
  $D268,$06 "#STR$D268,$08($b==$FF)".
B $D26E,$01 Terminator.

t $D26F Messaging: Any Oars
  $D26F,$08 "#STR$D26F,$08($b==$FF)".
B $D277,$01 Terminator.

t $D278 Messaging: Any Cannibals
  $D278,$0D "#STR$D278,$08($b==$FF)".
B $D285,$01 Terminator.

t $D286 Messaging: A Pirate
  $D286,$08 "#STR$D286,$08($b==$FF)".
B $D28E,$01 Terminator.

t $D28F Messaging: A Parrot
  $D28F,$08 "#STR$D28F,$08($b==$FF)".
B $D297,$01 Terminator.

t $D298 Messaging: A Crab
  $D298,$06 "#STR$D298,$08($b==$FF)".
B $D29E,$01 Terminator.

t $D29F Messaging: A Crocodile
  $D29F,$0B "#STR$D29F,$08($b==$FF)".
B $D2AA,$01 Terminator.

t $D2AB Messaging: A Lion
  $D2AB,$06 "#STR$D2AB,$08($b==$FF)".
B $D2B1,$01 Terminator.

t $D2B2 Messaging: A Seagull
  $D2B2,$09 "#STR$D2B2,$08($b==$FF)".
B $D2BB,$01 Terminator.

t $D2BC Messaging: An Octopus
  $D2BC,$0A "#STR$D2BC,$08($b==$FF)".
B $D2C6,$01 Terminator.

t $D2C7 Messaging: A Door
  $D2C7,$06 "#STR$D2C7,$08($b==$FF)".
B $D2CD,$01 Terminator.

t $D2CE Messaging: A Sailor
  $D2CE,$08 "#STR$D2CE,$08($b==$FF)".
B $D2D6,$01 Terminator.

t $D2D7 Messaging: A Snake
  $D2D7,$07 "#STR$D2D7,$08($b==$FF)".
B $D2DE,$01 Terminator.

t $D2DF Messaging: A Spider
  $D2DF,$08 "#STR$D2DF,$08($b==$FF)".
B $D2E7,$01 Terminator.

t $D2E8 Messaging: A Bridge
  $D2E8,$08 "#STR$D2E8,$08($b==$FF)".
B $D2F0,$01 Terminator.

t $D2F1 Messaging: A Boulder
  $D2F1,$09 "#STR$D2F1,$08($b==$FF)".
B $D2FA,$01 Terminator.

t $D2FB Messaging: A Ring
  $D2FB,$06 "#STR$D2FB,$08($b==$FF)".
B $D301,$01 Terminator.

t $D302 Messaging: A Trapdoor
  $D302,$0A "#STR$D302,$08($b==$FF)".
B $D30C,$01 Terminator.

t $D30D Messaging: A Cave
  $D30D,$06 "#STR$D30D,$08($b==$FF)".
B $D313,$01 Terminator.

t $D314 Messaging: A Pit
  $D314,$05 "#STR$D314,$08($b==$FF)".
B $D319,$01 Terminator.

t $D31A Messaging: A Ship
  $D31A,$06 "#STR$D31A,$08($b==$FF)".
B $D320,$01 Terminator.

t $D321 Messaging: A Hole
  $D321,$06 "#STR$D321,$08($b==$FF)".
B $D327,$01 Terminator.

t $D328 Messaging: A Deer
  $D328,$06 "#STR$D328,$08($b==$FF)".
B $D32E,$01 Terminator.

t $D32F Messaging: A Body
  $D32F,$06 "#STR$D32F,$08($b==$FF)".
B $D335,$01 Terminator.

t $D336 Messaging: A Rat
  $D336,$05 "#STR$D336,$08($b==$FF)".
B $D33B,$01 Terminator.

t $D33C Messaging: A Stone
  $D33C,$07 "#STR$D33C,$08($b==$FF)".
B $D343,$01 Terminator.

t $D344 Messaging: Any Water
  $D344,$09 "#STR$D344,$08($b==$FF)".
B $D34D,$01 Terminator.

w $D34E
  $D34E,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D34E,$02,$36
  $D3BC,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D3BC,$02,$06
  $D3D2,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
  $D3E4,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D3E4,$02,$03
  $D3F0,$02 #R(#PEEK(#PC+$01)*$100+#PEEK(#PC)).
L $D3F0,$02,$9B

t $D526 Messaging: Congratulations!!<CR>Your Quest Has Been Successful.<CR>You Weigh Anchor And Then Sail<CR>Off Into The Sunset With The<CR>Fabulous Jewels Of Babylon.
  $D526,$89 "#STR$D526,$08($b==$FF)".
B $D5AF,$01 Terminator.

t $D5B0 Messaging: The Crab Has Reached You.<CR>A Monstrous Claw Darts Out<CR>And Crushes You.
  $D5B0,$45 "#STR$D5B0,$08($b==$FF)".
B $D5F5,$01 Terminator.

t $D5F6 Messaging: A Tentacle Suddenly Encircles<CR>You And Crushes You.
  $D5F6,$32 "#STR$D5F6,$08($b==$FF)".
B $D628,$01 Terminator.

t $D629 Messaging: You Drank Too Much Rum.<CR>You Stumble And Slip<CR>And Fall Over The Edge.
  $D629,$44 "#STR$D629,$08($b==$FF)".
B $D66D,$01 Terminator.

t $D66E Messaging: The Lion Pounces Upon You.<CR>It Mauls You Savagely.
  $D66E,$31 "#STR$D66E,$08($b==$FF)".
B $D69F,$01 Terminator.

t $D6A0 Messaging: The Crocodile Lunges At You.<CR>You Are Caught In The<CR>Vicious,Snapping Jaws.
  $D6A0,$49 "#STR$D6A0,$08($b==$FF)".
B $D6E9,$01 Terminator.

t $D6EA Messaging: <CR>A Seagull Soars In The Breeze<CR>Above You...
  $D6EA,$2B "#STR$D6EA,$08($b==$FF)".
B $D715,$01 Terminator.

t $D716 Messaging: It Wheels Gently,<CR>And Then Flies Off.
  $D716,$25 "#STR$D716,$08($b==$FF)".
B $D73B,$01 Terminator.

t $D73C Messaging: <CR>A Rat Runs Out On To The<CR>Path,In Front Of You...
  $D73C,$31 "#STR$D73C,$08($b==$FF)".
B $D76D,$01 Terminator.

t $D76E Messaging: It Sniffs The Air And Then<CR>Scurries Off.
  $D76E,$28 "#STR$D76E,$08($b==$FF)".
B $D796,$01 Terminator.

t $D797 Messaging: <CR>A Deer Appears...
  $D797,$12 "#STR$D797,$08($b==$FF)".
B $D7A9,$01 Terminator.

t $D7AA Messaging: It Sees You And Runs Away.
  $D7AA,$1A "#STR$D7AA,$08($b==$FF)".
B $D7C4,$01 Terminator.

t $D7C5 Messaging: <CR>A Pirate Attacks You...
  $D7C5,$18 "#STR$D7C5,$08($b==$FF)".
B $D7DD,$01 Terminator.

t $D7DE Messaging: But You Avoid His Blow.
  $D7DE,$17 "#STR$D7DE,$08($b==$FF)".
B $D7F5,$01 Terminator.

t $D7F6 Messaging: After A Fierce Struggle<CR>He Overpowers You.
  $D7F6,$2A "#STR$D7F6,$08($b==$FF)".
B $D820,$01 Terminator.

t $D821 Messaging: <CR>A Long Water Snake<CR>Slithers Toward You...
  $D821,$2A "#STR$D821,$08($b==$FF)".
B $D84B,$01 Terminator.

t $D84C Messaging: It Suddenly Strikes At You...
  $D84C,$1D "#STR$D84C,$08($b==$FF)".
B $D869,$01 Terminator.

t $D86A Messaging: The Venomous Fangs Sink<CR>Into You.
  $D86A,$21 "#STR$D86A,$08($b==$FF)".
B $D88B,$01 Terminator.

t $D88C Messaging: But It Misses And Slips Away.
  $D88C,$1D "#STR$D88C,$08($b==$FF)".
B $D8A9,$01 Terminator.

t $D8AA Messaging: It Regards You For A Moment,<CR>Then Slips Away.
  $D8AA,$2D "#STR$D8AA,$08($b==$FF)".
B $D8D7,$01 Terminator.

t $D8D8 Messaging: <CR>A Poisonous Spider Drops On You.
  $D8D8,$21 "#STR$D8D8,$08($b==$FF)".
B $D8F9,$01 Terminator.

t $D8FA Messaging: It Lingers A Moment,<CR>Then Scuttles Off.
  $D8FA,$27 "#STR$D8FA,$08($b==$FF)".
B $D921,$01 Terminator.

t $D922 Messaging: It Stings You.
  $D922,$0E "#STR$D922,$08($b==$FF)".
B $D930,$01 Terminator.

t $D931 Messaging: The Natives Close In.<CR>You Struggle Bravely But<CR>They Overwhelm You.
  $D931,$42 "#STR$D931,$08($b==$FF)".
B $D973,$01 Terminator.

t $D974 Messaging: You're Really In The Soup Now.
  $D974,$1E "#STR$D974,$08($b==$FF)".
B $D992,$01 Terminator.

t $D993 Messaging: Sorry...<CR>That Was In Poor Taste.
  $D993,$20 "#STR$D993,$08($b==$FF)".
B $D9B3,$01 Terminator.

t $D9B4 Messaging: Try Distracting Them.
  $D9B4,$15 "#STR$D9B4,$08($b==$FF)".
B $D9C9,$01 Terminator.

t $D9CA Messaging: Keep The Noise Down.
  $D9CA,$14 "#STR$D9CA,$08($b==$FF)".
B $D9DE,$01 Terminator.

t $D9DF Messaging: Look At Those Jaws!
  $D9DF,$13 "#STR$D9DF,$08($b==$FF)".
B $D9F2,$01 Terminator.

t $D9F3 Messaging: Work It Out For Yourself.
  $D9F3,$19 "#STR$D9F3,$08($b==$FF)".
B $DA0C,$01 Terminator.

t $DA0D Messaging: You Don't Really Need It.
  $DA0D,$19 "#STR$DA0D,$08($b==$FF)".
B $DA26,$01 Terminator.

t $DA27 Messaging: Nice Pussy!
  $DA27,$0B "#STR$DA27,$08($b==$FF)".
B $DA32,$01 Terminator.

t $DA33 Messaging: Pretty Polly!
  $DA33,$0D "#STR$DA33,$08($b==$FF)".
B $DA40,$01 Terminator.

t $DA41 Messaging: Now You're Really Lost.
  $DA41,$17 "#STR$DA41,$08($b==$FF)".
B $DA58,$01 Terminator.

t $DA59 Messaging: Try Climbing.
  $DA59,$0D "#STR$DA59,$08($b==$FF)".
B $DA66,$01 Terminator.

t $DA67 Messaging: Try Rowing!
  $DA67,$0B "#STR$DA67,$08($b==$FF)".
B $DA72,$01 Terminator.

t $DA73 Messaging: It's Full Of Rum!
  $DA73,$11 "#STR$DA73,$08($b==$FF)".
B $DA84,$01 Terminator.

t $DA85 Messaging: It's A Red Herring!
  $DA85,$13 "#STR$DA85,$08($b==$FF)".
B $DA98,$01 Terminator.

t $DA99 Messaging: It Appears To Work.
  $DA99,$13 "#STR$DA99,$08($b==$FF)".
B $DAAC,$01 Terminator.

t $DAAD Messaging: It Is Quite Well Made<CR>And In Good Condition.
  $DAAD,$2C "#STR$DAAD,$08($b==$FF)".
B $DAD9,$01 Terminator.

t $DADA Messaging: It Has A Circular Cross-Section.
  $DADA,$20 "#STR$DADA,$08($b==$FF)".
B $DAFA,$01 Terminator.

t $DAFB Messaging: It Looks Delicious.
  $DAFB,$13 "#STR$DAFB,$08($b==$FF)".
B $DB0E,$01 Terminator.

t $DB0F Messaging: Be Careful.<CR>It Won't Carry Much Weight.
  $DB0F,$27 "#STR$DB0F,$08($b==$FF)".
B $DB36,$01 Terminator.

t $DB37 Messaging: They Are Very Beautiful<CR>And Very Heavy.
  $DB37,$27 "#STR$DB37,$08($b==$FF)".
B $DB5E,$01 Terminator.

t $DB5F Messaging: That's Not Such A Good Idea.
  $DB5F,$1C "#STR$DB5F,$08($b==$FF)".
B $DB7B,$01 Terminator.

t $DB7C Messaging: The Door Rolls Shut.
  $DB7C,$14 "#STR$DB7C,$08($b==$FF)".
B $DB90,$01 Terminator.

t $DB91 Messaging: <CR>Ouch!!<CR>The Match Has Burned Away,<CR>Scorching Your Fingers.
  $DB91,$3A "#STR$DB91,$08($b==$FF)".
B $DBCB,$01 Terminator.

t $DBCC Messaging: As You Start To Move,<CR>The Parrot Squawks...<CR>The Pirate Wakes<CR>And Quickly Shoots You.
  $DBCC,$54 "#STR$DBCC,$08($b==$FF)".
B $DC20,$01 Terminator.

t $DC21 Messaging: You're In It Already.
  $DC21,$15 "#STR$DC21,$08($b==$FF)".
B $DC36,$01 Terminator.

t $DC37 Messaging: You're Not In The Boat.
  $DC37,$17 "#STR$DC37,$08($b==$FF)".
B $DC4E,$01 Terminator.

t $DC4F Messaging: You Fling The Spear,But The<CR>Lion Easily Avoids It.
  $DC4F,$32 "#STR$DC4F,$08($b==$FF)".
B $DC81,$01 Terminator.

t $DC82 Messaging: The Coconut Bounces Off<CR>The Lion's Head.He Shakes His<CR>Long Mane In Anger.I Think<CR>You've Got His Attention.
  $DC82,$6A "#STR$DC82,$08($b==$FF)".
B $DCEC,$01 Terminator.

t $DCED Messaging: He Sniffs The Fruit But<CR>Otherwise Ignores It.
  $DCED,$2D "#STR$DCED,$08($b==$FF)".
B $DD1A,$01 Terminator.

t $DD1B Messaging: The Lion Takes The Fish In<CR>His Massive Jaws And Then<CR>Disappears Into The Jungle.
  $DD1B,$50 "#STR$DD1B,$08($b==$FF)".
B $DD6B,$01 Terminator.

t $DD6C Messaging: The Parrot Catches The Fruit<CR>In Its Beak And Swallows It.<CR>It Flutters Momentarily,Then<CR>Falls To The Ground,Dead.
  $DD6C,$70 "#STR$DD6C,$08($b==$FF)".
B $DDDC,$01 Terminator.

t $DDDD Messaging: The Cannibal Drops The Spear<CR>And Takes The Watch.<CR>He Examines It Briefly And<CR>Places It To His Ear. The<CR>Other Natives Gather Round Him<CR>And Lose All Interest In You.
  $DDDD,$A3 "#STR$DDDD,$08($b==$FF)".
B $DE80,$01 Terminator.

t $DE81 Messaging: The Spear Pierces The Oily<CR>Skin And The Octopus Sinks<CR>Beneath The Surface In A<CR>Fury Of Froth And Foam.<CR>The Spear Is Lost.
  $DE81,$79 "#STR$DE81,$08($b==$FF)".
B $DEFA,$01 Terminator.

t $DEFB Messaging: You've Done That Already.
  $DEFB,$19 "#STR$DEFB,$08($b==$FF)".
B $DF14,$01 Terminator.

t $DF15 Messaging: The Crocodile Opens Its Huge<CR>Jaws And Catches The Keg.<CR>Its Jaws Close On It And<CR>Start To Crush It.<CR>Gunpowder Spills Out.
  $DF15,$78 "#STR$DF15,$08($b==$FF)".
B $DF8D,$01 Terminator.

t $DF8E Messaging: The Match Ignites The<CR>Spilled Gunpowder.<CR>There Is A Mighty Flash<CR>And A Thunderous Explosion.<CR>The Crocodile Has Disintegrated.
  $DF8E,$7D "#STR$DF8E,$08($b==$FF)".
B $E00B,$01 Terminator.

t $E00C Messaging: The Plank Now Spans The Pit.
  $E00C,$1C "#STR$E00C,$08($b==$FF)".
B $E028,$01 Terminator.

t $E029 Messaging: There Is A Faint Click And<CR>The Rock Door Slowly Rumbles<CR>Open.
  $E029,$3D "#STR$E029,$08($b==$FF)".
B $E066,$01 Terminator.

t $E067 Messaging: You're Not Carrying It.
  $E067,$17 "#STR$E067,$08($b==$FF)".
B $E07E,$01 Terminator.

t $E07F Messaging: You Stab At The Lion<CR>But The Beast Easily Avoids It.
  $E07F,$34 "#STR$E07F,$08($b==$FF)".
B $E0B3,$01 Terminator.

t $E0B4 Messaging: The Cannibals Turn On You.<CR>They Quickly Overwhelm You.
  $E0B4,$36 "#STR$E0B4,$08($b==$FF)".
B $E0EA,$01 Terminator.

t $E0EB Messaging: You Take A Shot....
  $E0EB,$13 "#STR$E0EB,$08($b==$FF)".
B $E0FE,$01 Terminator.

t $E0FF Messaging: Good Shooting!<CR>The Pirate Is Dead.
  $E0FF,$22 "#STR$E0FF,$08($b==$FF)".
B $E121,$01 Terminator.

t $E122 Messaging: Bad Luck.<CR>You Missed.
  $E122,$15 "#STR$E122,$08($b==$FF)".
B $E137,$01 Terminator.

t $E138 Messaging: He's Dead Already.
  $E138,$12 "#STR$E138,$08($b==$FF)".
B $E14A,$01 Terminator.

t $E14B Messaging: It's Already Dead.
  $E14B,$12 "#STR$E14B,$08($b==$FF)".
B $E15D,$01 Terminator.

t $E15E Messaging: You Haven't Got A Gun.
  $E15E,$16 "#STR$E15E,$08($b==$FF)".
B $E174,$01 Terminator.

t $E175 Messaging: You Eat The Fish.<CR>It Was Quite Tasty.
  $E175,$25 "#STR$E175,$08($b==$FF)".
B $E19A,$01 Terminator.

t $E19B Messaging: You Start To Eat The Fruit.<CR>You Suddenly Feel Very Unwell.<CR>Too Late,You Realise That<CR>The Fruit Is Poisonous.
  $E19B,$6C "#STR$E19B,$08($b==$FF)".
B $E207,$01 Terminator.

t $E208 Messaging: No. You Don't Like Coconut.
  $E208,$1B "#STR$E208,$08($b==$FF)".
B $E223,$01 Terminator.

t $E224 Messaging: You Must Be Joking.
  $E224,$13 "#STR$E224,$08($b==$FF)".
B $E237,$01 Terminator.

t $E238 Messaging: You Drink The Golden Liquid.<CR>It Was Delicious..Hic..<CR>You Feel Decidedly Light-Headed.
  $E238,$55 "#STR$E238,$08($b==$FF)".
B $E28D,$01 Terminator.

t $E28E Messaging: You Can't.<CR>That's Salt Water.
  $E28E,$1D "#STR$E28E,$08($b==$FF)".
B $E2AB,$01 Terminator.

t $E2AC Messaging: You Take A Refreshing Drink.
  $E2AC,$1C "#STR$E2AC,$08($b==$FF)".
B $E2C8,$01 Terminator.

t $E2C9 Messaging: It's Already Open.
  $E2C9,$12 "#STR$E2C9,$08($b==$FF)".
B $E2DB,$01 Terminator.

t $E2DC Messaging: It's Already Closed.
  $E2DC,$14 "#STR$E2DC,$08($b==$FF)".
B $E2F0,$01 Terminator.

t $E2F1 Messaging: The Door Is Locked.
  $E2F1,$13 "#STR$E2F1,$08($b==$FF)".
B $E304,$01 Terminator.

t $E305 Messaging: It's Much Too Heavy.
  $E305,$14 "#STR$E305,$08($b==$FF)".
B $E319,$01 Terminator.

t $E31A Messaging: No. I Can't Be Bothered.
  $E31A,$18 "#STR$E31A,$08($b==$FF)".
B $E332,$01 Terminator.

t $E333 Messaging: The Whole Canyon Vibrates.<CR>The Boulder Is Dislodged...
  $E333,$36 "#STR$E333,$08($b==$FF)".
B $E369,$01 Terminator.

t $E36A Messaging: It Falls And Crushes You.
  $E36A,$19 "#STR$E36A,$08($b==$FF)".
B $E383,$01 Terminator.

t $E384 Messaging: It Falls And Crushes The Crab.
  $E384,$1E "#STR$E384,$08($b==$FF)".
B $E3A2,$01 Terminator.

t $E3A3 Messaging: Don't Be Disgusting!
  $E3A3,$14 "#STR$E3A3,$08($b==$FF)".
B $E3B7,$01 Terminator.

t $E3B8 Messaging: I've Warned You Before!<CR>This Deviant Practice<CR>Has Got To Stop.
  $E3B8,$3E "#STR$E3B8,$08($b==$FF)".
B $E3F6,$01 Terminator.

t $E3F7 Messaging: I Didn't Hear That!
  $E3F7,$13 "#STR$E3F7,$08($b==$FF)".
B $E40A,$01 Terminator.

t $E40B Messaging: A Small Section Of Floor<CR>Lifts Up,Revealing It To Be<CR>A Trapdoor.
  $E40B,$40 "#STR$E40B,$08($b==$FF)".
B $E44B,$01 Terminator.

t $E44C Messaging: You're Wearing It Already.
  $E44C,$1A "#STR$E44C,$08($b==$FF)".
B $E466,$01 Terminator.

t $E467 Messaging: I Think You Look Quite Stupid.
  $E467,$1E "#STR$E467,$08($b==$FF)".
B $E485,$01 Terminator.

t $E486 Messaging: No!<CR>I'm Not Letting You Hop Around,<CR>With One Shoe On.
  $E486,$35 "#STR$E486,$08($b==$FF)".
B $E4BB,$01 Terminator.

t $E4BC Messaging: Don't Be Ridiculous.
  $E4BC,$14 "#STR$E4BC,$08($b==$FF)".
B $E4D0,$01 Terminator.

t $E4D1 Messaging: The Match Flares Into Life.<CR>Hurry It Will Go Out Soon.
  $E4D1,$36 "#STR$E4D1,$08($b==$FF)".
B $E507,$01 Terminator.

t $E508 Messaging: Using The Crowbar As A Lever,<CR>You Slowly Move The Stone<CR>And Uncover A Ring Set Into<CR>The Floor.
  $E508,$5E "#STR$E508,$08($b==$FF)".
B $E566,$01 Terminator.

t $E567 Messaging: A Massive Wave Hits The Boat.<CR>It Overturns. You're Drowning.
  $E567,$3C "#STR$E567,$08($b==$FF)".
B $E5A3,$01 Terminator.

t $E5A4 Messaging: You Can't Swim.
  $E5A4,$0F "#STR$E5A4,$08($b==$FF)".
B $E5B3,$01 Terminator.

t $E5B4 Messaging: It Has No Apparent Effect.
  $E5B4,$1A "#STR$E5B4,$08($b==$FF)".
B $E5CE,$01 Terminator.

t $E5CF Messaging: The Bridge Begins To Shake...
  $E5CF,$1D "#STR$E5CF,$08($b==$FF)".
B $E5EC,$01 Terminator.

t $E5ED Messaging: Suddenly,It Collapses.
  $E5ED,$16 "#STR$E5ED,$08($b==$FF)".
B $E603,$01 Terminator.

t $E604 Messaging: You Haven't Got The Key.
  $E604,$18 "#STR$E604,$08($b==$FF)".
B $E61C,$01 Terminator.

t $E61D
  $E61D,$220,$04

b $E83E

b $E86E

  $E8C1

w $E96A

b $E9CA

  $EC27
  $EC2A

w $ED9E

c $EDC4

c $EDD7

c $EF54
  $EF54,$03 #REGhl=#R$BC6F.
  $EF57,$02 Test bit 0 of *#REGhl.
  $EF59,$02 Jump to #R$EF7B if ?? is equal to #N$00.
  $EF5B,$03 #REGhl=#R$BC67.
  $EF5E,$02 Write #N$06 to *#REGhl.
  $EF60,$02 Compare #REGa with #N$2C.
  $EF62,$02 Jump to #R$EF7B if #REGa is not equal to #N$2C.
  $EF64,$03 #REGhl=#R$BC6F.
  $EF67,$02 Reset bit 0 of *#REGhl.
  $EF69,$01 Stash #REGaf on the stack.
  $EF6A,$03 #REGbc=#N$2930.
  $EF6D,$03 Call #R$C412.
  $EF70,$01 Restore #REGaf from the stack.
  $EF71,$05 Write #N$2F to *#R$EC27.
  $EF76,$05 Write #N$30 to *#R$EC2A.
  $EF7B,$03 Call #R$C520.
  $EF7E,$02 #REGe=#N$00.
  $EF80,$03 Call #R$C21E.
  $EF83,$03 #REGa=*#R$BCCB.
  $EF86,$02 Compare #REGa with #N$30.
  $EF88,$02 Jump to #R$EFA7 if #REGa is not equal to #N$30.
  $EF8A,$02 #REGa=#N$29.
  $EF8C,$03 Call #R$C35F.
  $EF8F,$02 Jump to #R$EFA7 if #REGa is not equal to #N$29.
  $EF91,$03 #REGhl=#R$BC6F.
  $EF94,$02 Set bit 0 of *#REGhl.
  $EF96,$01 #REGa=#N$00.
  $EF97,$03 Write #REGa to *#R$EC27.
  $EF9A,$03 Write #REGa to *#R$EC2A.
  $EF9D,$03 #REGhl=#R$BC66.
  $EFA0,$02 Set bit 0 of *#REGhl.
  $EFA2,$05 Write #N$06 to *#R$BC67.
  $EFA7,$02 #REGa=#N$2B.
  $EFA9,$03 Call #R$C35F.
  $EFAC,$02 Jump to #R$EFB8 if #REGa is not equal to #N$2B.
  $EFAE,$03 #REGhl=#R$BC66.
  $EFB1,$02 Set bit 1 of *#REGhl.
  $EFB3,$02 #REGa=#N$05.
  $EFB5,$03 Write #REGa to *#R$BC68.
  $EFB8,$02 #REGa=#N$2A.
  $EFBA,$03 Call #R$C35F.
  $EFBD,$02 Jump to #R$EFC9 if #REGa is not equal to #N$2A.
  $EFBF,$03 #REGhl=#R$BC66.
  $EFC2,$02 Set bit 3 of *#REGhl.
  $EFC4,$02 #REGa=#N$07.
  $EFC6,$03 Write #REGa to *#R$BC6A.
  $EFC9,$03 #REGhl=#R$E8C1.
  $EFCC,$03 Call #R$C401.
  $EFCF,$02 Jump to #R$EFDB if #REGa is not equal to #N$07.
  $EFD1,$03 #REGhl=#R$BC66.
  $EFD4,$02 Set bit 4 of *#REGhl.
  $EFD6,$05 Write #N$0B to *#R$BC6B.
  $EFDB,$02 #REGa=#N$18.
  $EFDD,$03 Call #R$C35F.
  $EFE0,$02 Jump to #R$EFEC if #REGa is not equal to #N$18.
  $EFE2,$03 #REGhl=#R$BC66.
  $EFE5,$02 Set bit 5 of *#REGhl.
  $EFE7,$05 Write #N$09 to *#R$BC6C.
  $EFEC,$07 Jump to #R$EFFF if *#R$BCCB is not equal to #N$03.
  $EFF3,$02 #REGa=#N$1D.
  $EFF5,$03 Call #R$C35F.
  $EFF8,$02 Jump to #R$EFFF if #REGa is not equal to #N$1D.
  $EFFA,$02 Restore #REGhl and #REGhl from the stack.
  $EFFC,$03 Jump to #R$EDF2.
  $EFFF,$07 Jump to #R$F019 if *#R$BCCB is not equal to #N$02.
  $F006,$03 #REGhl=#R$BC54.
  $F009,$02 Test bit 5 of *#REGhl.
  $F00B,$02 Jump to #R$F019 if #REGa is not equal to #N$02.
  $F00D,$02 Set bit 5 of *#REGhl.
  $F00F,$03 #REGhl=#R$BC66.
  $F012,$02 Set bit 7 of *#REGhl.
  $F014,$05 Write #N$05 to *#R$BC6E.
  $F019,$07 Jump to #R$F039 if *#R$BCCB is not equal to #N$6C.
  $F020,$02 #REGa=#N$1D.
  $F022,$03 Call #R$C35F.
  $F025,$02 Jump to #R$F039 if #REGa is not equal to #N$1D.
  $F027,$03 #REGhl=#R$E5CF.
  $F02A,$03 Call #R$BAB1.
  $F02D,$01 Restore #REGhl from the stack.
  $F02E,$03 #REGhl=#R$EDD7.
  $F031,$01 Exchange the *#REGsp with the #REGhl register.
  $F032,$03 #REGhl=#R$E5ED.
  $F035,$03 Call #R$C579.
  $F038,$01 Return.

  $F039,$01 Return.

c $F03A

c $FD82
  $FD82,$03 #REGhl=#R$FDB5.
  $FD85,$03 #REGde=#R$BBF0.
  $FD88,$03 #REGbc=#N($0144,$04,$04).
  $FD8B,$02 LDIR.
  $FD8D,$04 #REGix=#R$ED9E.
  $FD91,$04 #REGb=*#R$BD32.
  $FD95,$01 #REGa=#N$00.
  $FD96,$03 #REGl=*#REGix+#N$00.
  $FD99,$03 #REGh=*#REGix+#N$01.
  $FD9C,$01 Write #REGa to *#REGhl.
  $FD9D,$04 Increment #REGix by two.
  $FDA1,$02 Decrease counter by one and loop back to #R$FD96 until counter is zero.
  $FDA3,$05 Write #N$2F to *#N$EC27.
  $FDA8,$05 Write #N$30 to *#N$EC2A.
  $FDAD,$02 #REGa=#N$03.
  $FDAF,$03 Call #R$EF54.
  $FDB2,$03 Jump to #R$EDC4.

b $FDB5

c $FEFA Handler: Graphics
N $FEFA Displays the graphic for the boat.
@ $FEFA label=DisplayGraphic_Boat
  $FEFA,$04 #REGix=#R$607C.
  $FEFE,$02 Jump to #R$FF2E.
N $FF00 Displays the graphic for the sand dunes.
@ $FF00 label=DisplayGraphic_SandDunes
  $FF00,$04 #REGix=#R$6CA4.
  $FF04,$02 Jump to #R$FF2E.
N $FF06 Displays the graphic for the bridge.
@ $FF06 label=DisplayGraphic_Bridge
  $FF06,$04 #REGix=#R$7731.
  $FF0A,$02 Jump to #R$FF2E.
N $FF0C Displays the graphic for the cave.
@ $FF0C label=DisplayGraphic_Cave
  $FF0C,$04 #REGix=#R$8171.
  $FF10,$02 Jump to #R$FF2E.
N $FF12 Displays the graphic for the door.
@ $FF12 label=DisplayGraphic_Door
  $FF12,$04 #REGix=#R$8BC3.
  $FF16,$02 Jump to #R$FF2E.
N $FF18 Displays the graphic for the huts.
@ $FF18 label=DisplayGraphic_Huts
  $FF18,$04 #REGix=#R$966A.
  $FF1C,$02 Jump to #R$FF2E.
N $FF1E Displays the graphic for the cliffs.
@ $FF1E label=DisplayGraphic_Cliffs
  $FF1E,$04 #REGix=#R$A042.
  $FF22,$02 Jump to #R$FF2E.
N $FF24 Displays the graphic for the ?!?!?.
@ $FF24 label=DisplayGraphic_Test
  $FF24,$04 #REGix=#R$A958.
  $FF28,$02 Jump to #R$FF2E.
N $FF2A Displays the graphic for the treasure chest.
@ $FF2A label=DisplayGraphic_Treasure
  $FF2A,$04 #REGix=#R$B2A7.
N $FF2E All the graphics routines use this same routine.
@ $FF2E label=Handler_Graphics
  $FF2E,$03 Call #R$BB3B.
  $FF31,$02 #REGa=#N$08.
  $FF33,$03 Call #R$C315.
  $FF36,$03 Call #R$BA5D.
  $FF39,$01 Return.

b $FF3A
