; Copyright Interceptor Software UK 1985, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction
; e.g. Print_HighScore_Loop.

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
  $5B00,$04 #REGix=#R$4000.
  $5B04,$03 #REGde=#N$1B00.
  $5B07,$02 #REGa=#N$5B.
  $5B09,$03 Call #R$5B21.
N $5B0C Load the second block: graphics data.
  $5B0C,$04 #REGix=#R$607C.
  $5B10,$03 #REGde=#N$59D4.
  $5B13,$02 #REGa=#N$E1.
  $5B15,$03 Call #R$5B21.
N $5B18 Load the third block: game data.
  $5B18,$04 #REGix=#R$BA50.
  $5B1C,$03 #REGde=#N$4572.
  $5B1F,$02 #REGa=#N$21.
N $5B21 Tape loading routine.
@ $5B21 label=TapeLoading
  $5B21,$01 Set the carry flag to indicate "loading".
  $5B22,$01 This resets the zero flag. (#REGd cannot hold +#N$FF.)
  $5B23,$01 The #REGa register holds +#N$00 for a header and +#N$FF for a block
. of data. The carry flag is reset for verifying and set for loading.
  $5B24,$01 Restore #REGd to its original value.
  $5B25,$01 Disable interrupts.
  $5B26,$04 Set the border to #INK$0F.
  $5B2A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0556.html#0562">LD_BYTES##N$0562</a>.)
  $5B2D,$01 Stash #REGaf on the stack.
  $5B2E,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C48.html">BORDCR</a>.)
  $5B31,$02,b$01 Keep only bits 3-5.
  $5B33,$06 Rotate #REGa right (with carry).
  $5B39,$02 Set border to the colour held by #REGa.
  $5B3B,$02 #REGa=#N$7F.
  $5B3D,$02 Make an initial read of port '#N$FE'.
  $5B3F,$01 Rotate the byte obtained.
  $5B40,$01 Enable interrupts.
  $5B41,$03 #HTML(Jump to <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0000.html">START</a> if the carry flag is not set.)
  $5B44,$01 Restore #REGaf from the stack.
  $5B45,$01 Return if the carry flag is set.
  $5B46,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C53.html">PROG</a>.)
  $5B49,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C4B.html">VARS</a>.)
  $5B4C,$02 Write #N$80 to *#REGhl.
  $5B4E,$01 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0008.html">ERROR_1</a>.)

u $5B4F

b $607C Graphics: Boat
@ $607C label=Graphics_Boat
D $607C #SIM(start=$5B46,stop=$5B4E) #PUSHS #UDGTABLE
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

b $A958 Graphics: Cavern
@ $A958 label=Graphics_Cavern
D $A958 #PUSHS #UDGTABLE
. { =h Dunno }
. { #SIM(start=$BB3B,stop=$BB41,ix=#PC)#SCR$02{$00,$00,$200,$100}(cavern) }
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
  $BA60,$04 Jump back to #R$BA5D until a new key is pressed.
  $BA64,$02 Reset the "new key has been pressed" flag in #REGa.
  $BA66,$03 #HTML(Write it back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3B.html">FLAGS</a>.)
N $BA69 Fetch the keypress.
  $BA69,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C08.html">LAST_K</a>.)
  $BA6C,$01 Return.

c $BA6D Clear Screen
@ $BA6D label=ClearScreen
  $BA6D,$03 Call #R$BA96.
  $BA70,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D6B.html">CLS</a>.)
  $BA73,$01 Return.

c $BA74 Clear Lines
@ $BA74 label=ClearLines
  $BA74,$03 Call #R$BA96.
  $BA77,$07 #HTML(Clear the number of lines held by *#R$BD70 from the bottom of the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $BA7E,$01 Return.

c $BA7F Set Default Screen Position
@ $BA7F label=SetDefaultScreenPosition
  $BA7F,$03 Call #R$BA96.
  $BA82,$03 #REGbc=#N($0321,$04,$04).
  $BA85,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $BA88,$01 Return.

c $BA89 Set Screen Position
@ $BA89 label=SetScreenPosition
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

c $BAA4 Print String
@ $BAA4 label=PrintString
R $BAA4 HL Pointer to string to be printed
  $BAA4,$03 Call #R$BA96.
@ $BAA7 label=PrintString_Loop
  $BAA7,$01 Load a character from the string pointer into #REGa.
  $BAA8,$01 Move the string pointer to the next character.
  $BAA9,$03 Return if the string termination character (#N$FF) has been
. reached.
  $BAAC,$03 Call #R$BAC3.
  $BAAF,$02 Jump to #R$BAA7.
N $BAB1 Shortcut print routine which auto-scrolls after it's done.
@ $BAB1 label=PrintStringAndScroll
  $BAB1,$03 Call #R$BAA4.
N $BAB4 Force a newline to be "printed".
  $BAB4,$02 Load a "newline" character into #REGa (#N$0D).
  $BAB6,$03 Call #R$BAC3.
  $BAB9,$01 Return.

c $BABA Scroll Screen
@ $BABA label=ScrollScreen
D $BABA Scrolls the screen up and then resets the print position.
  $BABA,$01 Switch to the shadow registers.
N $BABB Scroll the screen up.
  $BABB,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0DFE.html">CL_SC_ALL</a>.)
N $BABE Reset the print position.
  $BABE,$03 Call #R$BA7F.
  $BAC1,$01 Switch back to the normal registers.
  $BAC2,$01 Return.

c $BAC3 Print Character
@ $BAC3 label=PrintCharacter
R $BAC3 A The character to print
  $BAC3,$01 Stash the character to print on the stack.
  $BAC4,$07 #HTML(Jump to #R$BADE if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html#5C89">S_POSN</a> is not equal to #N$03.)
  $BACB,$02 Load the character to print into #REGa but keep a copy on the
. stack.
  $BACD,$04 Jump to #R$BAD6 if this isn't a newline character (#N$0D).
N $BAD1 This is a newline, so scroll the screen up to action it.
  $BAD1,$03 Call #R$BABA.
  $BAD4,$01 Clear the character off the stack (as there's nothing to print for
. a newline, just the screen scroll).
  $BAD5,$01 Return.
N $BAD6 Check the column position.
@ $BAD6 label=CheckColumnPosition
  $BAD6,$08 #HTML(Call #R$BABA if *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a> is equal to #N$01.)
N $BADE Actions printing #REGa to the screen.
@ $BADE label=PrintCharacterDirect
  $BADE,$01 Restore the character to print from the stack.
  $BADF,$01 #HTML(Print to the screen using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">PRINT_A_1</a>.)
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
  $BAF8,$01 #HTML(Write the result back to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR-T</a>.)
  $BAF9,$03 Set a byte counter in #REGbc of #N($0200,$04,$04).
@ $BAFC label=Print_LocationGraphic_Loop
  $BAFC,$01 Stash the byte counter on the stack.
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
  $BB25,$01 Restore the byte counter from the stack.
  $BB26,$01 Decrease the byte counter by one.
  $BB27,$04 Jump back to #R$BAFC until the byte counter is zero.
  $BB2B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0D4D.html">TEMPS</a>.)
  $BB2E,$01 Return.

c $BB2F Colour Location Image
@ $BB2F label=Colour_LocationImage
R $BB2F IX Pointer to the room attribute data
  $BB2F,$03 #REGde=#N$5800 (attribute buffer location).
  $BB32,$03 #REGhl=#REGix (using the stack).
  $BB35,$05 Copy #N($0200,$04,$04) of attribute data from #REGhl to #REGde
. (into the attribute buffer).
  $BB3A,$01 Return.

c $BB3B Print Location Image
@ $BB3B label=Print_LocationImage
  $BB3B,$03 Call #R$BAE1.
  $BB3E,$03 Call #R$BB2F.
  $BB41,$01 Return.

c $BB42 Clear Location Image
@ $BB42 label=ClearLocationImage
D $BB42 Copies a given attribute byte to the #N$0200 bytes where the location
. image attribute bytes are (so clears the area).
R $BB42 A Attribute byte value
  $BB42,$03 Set a counter in #REGbc of #N$0200 bytes.
  $BB45,$03 Load #N$5800 (the beginning of the attribute buffer) into #REGhl.
  $BB48,$01 Copy the attribute byte into the #REGe register.
@ $BB49 label=ClearLocationImage_Loop
  $BB49,$01 Write the byte to the attribute buffer.
  $BB4A,$01 Increment the attribute buffer pointer by one.
  $BB4B,$01 Decrease the location image byte counter by one.
  $BB4C,$04 Jump back to #R$BB49 until the whole location image has been
. covered.
  $BB50,$01 Return.

c $BB51 Pause Loop
@ $BB51 label=Pause_Loop
D $BB51 Pauses a given number of HALT loops.
R $BB51 B Number of HALT commands to use
  $BB51,$01 Halt operation (suspend CPU until the next interrupt).
  $BB52,$02 Decrease counter by one and loop back to #R$BB51 until counter is zero.
  $BB54,$01 Return.

c $BB55 Fetch Frames
@ $BB55 label=FetchFrames
R $BB55 O:A #HTML(The first byte of the <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a> variable.)
  $BB55,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $BB58,$01 Return.

c $BB59 Save Game
@ $BB59 label=SaveGame
  $BB59,$03 #REGa=*#R$BD32.
  $BB5C,$03 Jump to #R$BB78 if #REGa is zero.
  $BB5F,$01 #REGb=#REGa.
  $BB60,$04 #REGix=*#R$BD22.
  $BB64,$03 #REGde=#R$BC99.
  $BB67,$02 Jump to #R$BB6E.

  $BB69,$04 Increment #REGix by two.
  $BB6D,$01 Increment #REGde by one.
  $BB6E,$03 #REGl=*#REGix+#N$00.
  $BB71,$03 #REGh=*#REGix+#N$01.
  $BB74,$02 Write *#REGhl to *#REGde.
  $BB76,$02 Decrease counter by one and loop back to #R$BB69 until counter is zero.
N $BB78 Print "#STR$BE78,$08($b==$FF)".
  $BB78,$03 #REGhl=#R$BE78.
  $BB7B,$03 Call #R$BAB1.
  $BB7E,$03 Call #R$BA5D.
  $BB81,$04 #REGix=#R$BBF0.
  $BB85,$03 #REGde=#N($0144,$04,$04).
  $BB88,$02 Set #REGa to #N$FF which indicates this is a data block.
  $BB8A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/04C2.html">SA_BYTES</a>.)
N $BB8D Print "#STR$BE9A,$08($b==$FF)".
  $BB8D,$03 #REGhl=#R$BE9A.
  $BB90,$03 Call #R$BAB1.
  $BB93,$01 Return.

c $BB94 Load From Tape
@ $BB94 label=LoadTape
N $BB94 Print "#STR$BE57,$08($b==$FF)".
  $BB94,$03 #REGhl=#R$BE57.
  $BB97,$03 Call #R$BAB1.
  $BB9A,$04 Load the starting address into #REGix at #R$BBF0.
  $BB9E,$03 Set the block length in #REGde to #N$0144 bytes.
  $BBA1,$02 Set #REGa to #N$FF which indicates this is a data block.
  $BBA3,$01 Set the carry flag to indicate this is loading.
  $BBA4,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0556.html">LD_BYTES</a>.)
  $BBA7,$02 Jump to #R$BBB0 if the carry flag is not set.
N $BBA9 Print "#STR$BE6C,$08($b==$FF)".
  $BBA9,$03 #REGhl=#R$BE6C.
  $BBAC,$03 Call #R$BAB1.
  $BBAF,$01 Return.
@ $BBB0 label=LoadTape_Success
  $BBB0,$03 #REGa=*#R$BD32.
  $BBB3,$02 Return if #REGa is zero.
  $BBB5,$01 #REGb=#REGa.
  $BBB6,$04 #REGix=*#R$BD22.
  $BBBA,$03 #REGde=#R$BC99.
  $BBBD,$02 Jump to #R$BBC4.
@ $BBBF label=LoadTape_WriteLoop
  $BBBF,$04 Increment #REGix by two.
  $BBC3,$01 Increment #REGde by one.
@ $BBC4 label=LoadTape_Write
  $BBC4,$03 #REGl=*#REGix+#N$00.
  $BBC7,$03 #REGh=*#REGix+#N$01.
  $BBCA,$01 #REGa=*#REGde.
  $BBCB,$01 Write #REGa to *#REGhl.
  $BBCC,$02 Decrease counter by one and loop back to #R$BBBF until counter is zero.
  $BBCE,$02 #REGe=#N$00.
  $BBD0,$03 Call #R$C21E.
  $BBD3,$01 Return.

c $BBD4 Print Input Prompt
@ $BBD4 label=PrintInputPrompt
  $BBD4,$03 #REGhl=#N$5080 (screen buffer location).
  $BBD7,$03 Set the increment in #REGde for the next screen line.
  $BBDA,$02 #REGb=#N$08.
  $BBDC,$01 #REGa=#N$00.
  $BBDD,$01 Set the bits from *#REGhl.
  $BBDE,$01 Move down one line.
  $BBDF,$02 Decrease counter by one and loop back to #R$BBDD until counter is zero.
  $BBE1,$03 Jump to #R$BBE9 if #REGa is zero.
N $BBE4 Force a newline to be "printed".
  $BBE4,$02 #REGa=#N$0D.
  $BBE6,$03 Call #R$BAC3.
@ $BBE9 label=PrintPrompt
N $BBE9 Print "#STR$BD85,$08($b==$FF)".
  $BBE9,$03 #REGhl=#R$BD85.
  $BBEC,$03 Call #R$BAA4.
  $BBEF,$01 Return.

g $BBF0 Table: Object Locations
@ $BBF0 label=Table_ObjectLocations
B $BBF0

b $BC54

g $BC66 Flags: Event States
@ $BC66 label=Flag_EventState
D $BC66 #TABLE(default,centre,centre)
. { =h Bit | =h Relating To }
. { #N$00 | Crab }
. { #N$01 | Tentacle }
. { #N$02 | Rum }
. { #N$03 | Lion }
. { #N$04 | Crocodile }
. { #N$05 | Cannibals }
. { #N$06 | Match }
. { #N$07 | Wave }
. TABLE#
B $BC66,$01

b $BC67
  $BC68
  $BC69
  $BC6A
  $BC6B
  $BC6C
  $BC6D
  $BC6E
  $BC6F
  $BC70
  $BC78
  $BC98
  $BC99

g $BCCB Room Number
@ $BCCB label=RoomNumber
B $BCCB,$01

g $BCCC
W $BCCC,$02
L $BCCC,$02,$09

g $BCDE

g $BD0C

g $BD0E Pointer: Events Jump Table
@ $BD0E label=Pointer_Events_Jump
W $BD0E,$02

g $BD10 Pointer: Room Map Table
@ $BD10 label=Pointer_RoomMap
W $BD10,$02

g $BD12 Pointer: Object Description Table
@ $BD12 label=Pointer_ObjectDescriptions
W $BD12,$02

g $BD14
W $BD14,$02

g $BD16
W $BD16,$02

g $BD18 Pointer: Room Description Table
@ $BD18 label=Pointer_RoomDescriptions
W $BD18,$02

g $BD1A
W $BD1A,$02

g $BD1C
W $BD1C,$02

g $BD1E
W $BD1E,$02

g $BD20 Pointer: Jump Table
@ $BD20 label=Pointer_ JumpTable
W $BD20,$02

g $BD22
W $BD22,$02

g $BD24 Pointer: Scenic Events Jump Table
@ $BD24 label=Pointer_ScenicEvents_Jump
W $BD24,$02

g $BD26
W $BD26,$02

g $BD28 Number Of Objects?
@ $BD28 label=NumberObjects
W $BD28,$02

g $BD2A
W $BD2A,$02

g $BD2C
W $BD2C,$02

g $BD2E
W $BD2E,$02

g $BD30 Number Of Scenic Events?
@ $BD30 label=NumberScenicEvents
W $BD30,$02

g $BD32
W $BD32,$02

g $BD34 Command Buffer
@ $BD34 label=CommandBuffer
B $BD34,$32

  $BD65

g $BD66

g $BD67

g $BD70 Line Number
@ $BD70 label=LineNumber
B $BD70,$01

g $BD71

  $BD75

g $BD7D Temporary Storage Table Pointer
@ $BD7D label=TempStore_TablePointer
W $BD7D,$02

g $BD7F Temporary Storage Table Index
@ $BD7F label=TempStore_TableIndex
W $BD7F,$02

g $BD81

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

g $BFE2 Table: Directions
@ $BFE2 label=Table_Directions
W $BFE2,$02 "#STR$BDFF,$08($b==$FF)".
W $BFE4,$02 "#STR$BE05,$08($b==$FF)".
W $BFE6,$02 "#STR$BE0B,$08($b==$FF)".
W $BFE8,$02 "#STR$BE10,$08($b==$FF)".
W $BFEA,$02 "#STR$BE15,$08($b==$FF)".
W $BFEC,$02 "#STR$BE18,$08($b==$FF)".

c $BFEE Responses
@ $BFEE label=Response_PleaseRephraseThat
N $BFEE Print "#STR$BEEA,$08($b==$FF)".
@ $BFF5 label=Response_PleaseBeMoreSpecific
N $BFF5 Print "#STR$BED1,$08($b==$FF)".
@ $BFFC label=Response_YouCant
N $BFFC Print "#STR$BF00,$08($b==$FF)".
@ $C003 label=Response_OK
N $C003 Print "#STR$BF0B,$08($b==$FF)".

c $C00A Handler: User Input
@ $C00A label=Handler_UserInput
N $C00A Reset the screen position to defaults.
  $C00A,$03 Call #R$BA7F.
  $C00D,$03 #REGhl=#R$BD34.
  $C010,$02 Store the ASCII code for "SPACE" ("#CHR$20") into #REGa.
  $C012,$02 Set a counter in #REGb for the size of the command buffer (#N$32
. bytes).
@ $C014 label=EmptyCommandBuffer_Loop
  $C014,$01 Write #REGa to *#REGhl.
  $C015,$01 Increment #REGhl by one.
  $C016,$02 Decrease the command buffer counter by one and loop back to #R$C014
. until the whole buffer is cleared.
  $C018,$03 Call #R$BBD4.
  $C01B,$03 #REGhl=#R$BD34.
@ $C01E label=Handler_UserInput_Loop
  $C01E,$03 Call #R$BA5D.
  $C021,$04 Jump to #R$C041 if #REGa is equal to #N$0C.
  $C025,$04 Jump to #R$C058 if "ENTER" was pressed.
  $C029,$04 Jump to #R$C01E if #REGa is less than #N$20.
  $C02D,$01 Exchange the #REGde and #REGhl registers.
  $C02E,$03 #REGhl=#R$BD65.
  $C031,$03 #REGhl-=#REGde (with carry).
  $C034,$01 Exchange the #REGde and #REGhl registers.
  $C035,$02 Jump to #R$C01E if #REGa is equal to #REGa.
  $C037,$01 Write #REGa to *#REGhl.
  $C038,$03 Call #R$BA96.
  $C03B,$03 Call #R$BAC3.
  $C03E,$01 Increment #REGhl by one.
  $C03F,$02 Jump to #R$C01E.
  $C041,$01 Exchange the #REGde and #REGhl registers.
  $C042,$03 #REGhl=#R$BD34.
  $C045,$03 #REGhl-=#REGde (with carry).
  $C048,$01 Exchange the #REGde and #REGhl registers.
  $C049,$02 Jump to #R$C01E if #REGhl is equal to #REGa.
  $C04B,$01 Stash #REGhl on the stack.
N $C04C Print "#STR$BD88,$08($b==$FF)".
  $C04C,$03 #REGhl=#R$BD88.
  $C04F,$03 Call #R$BAA4.
  $C052,$01 Restore #REGhl from the stack.
  $C053,$01 Decrease #REGhl by one.
  $C054,$02 Write #N$20 to *#REGhl.
  $C056,$02 Jump to #R$C01E.

c $C058 Parser
@ $C058 label=Parser
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
  $C0C1,$04 Jump to #R$C0C9 if *#REGde is not equal to *#REGhl.
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
  $C0E9,$04 Jump to #R$C10D if *#REGde is not equal to *#REGhl.
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
  $C127,$04 #REGc=#N$0A-#REGc.
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
  $C13F,$04 Jump to #R$C13D if #REGa is equal to #N$20.
  $C143,$04 Jump to #R$C13D if #REGa is equal to #N$2C.
  $C147,$02 Jump to #R$C12E.

  $C149,$01 Stash #REGhl on the stack.
N $C14A Print "#STR$BDA5,$08($b==$FF)".
  $C14A,$03 #REGhl=#R$BDA5.
  $C14D,$03 Call #R$BAB1.
  $C150,$01 Restore #REGhl from the stack.
M $C151,$05 #HTML(Print a double quote character: "<code>#CHR$22</code>".)
  $C151,$02 #REGa=#N$22.
  $C153,$03 Call #R$BAC3.
  $C156,$01 #REGa=*#REGhl.
  $C157,$04 Jump to #R$C161 if #REGa is less than #N$21.
  $C15B,$01 Increment #REGhl by one.
  $C15C,$03 Call #R$BAC3.
  $C15F,$02 Jump to #R$C156.
M $C161,$05 #HTML(Print a double quote character: "<code>#CHR$22</code>".)
  $C161,$02 #REGa=#N$22.
  $C163,$03 Call #R$BAC3.
N $C166 Print "#STR$BF29,$08($b==$FF)".
  $C166,$03 #REGhl=#R$BF29.
  $C169,$03 Call #R$BAB1.
  $C16C,$02 Jump to #R$C17A.

  $C16E,$06 Return if *#R$BD66 is not equal to #N$FF.
N $C174 Print "#STR$BD91,$08($b==$FF)".
  $C174,$03 #REGhl=#R$BD91.
  $C177,$03 Call #R$BAB1.
  $C17A,$03 Jump to #R$C00A.

c $C17D
  $C17D,$03 #REGa=*#R$BC66.
  $C180,$03 Jump to #R$C1AF if #REGa is zero.
  $C183,$01 #REGc=#REGa.
  $C184,$02 #REGb=#N$08.
  $C186,$02 Shift #REGc right.
  $C188,$02 Jump to #R$C1AD if ?? is greater than or equal to #REGa.
  $C18A,$03 #REGde=#N($0000,$04,$04).
  $C18D,$03 #REGhl=#R$BC67.
  $C190,$04 #REGe=#N$08-#REGb.
  $C194,$01 #REGhl+=#REGde.
  $C195,$01 Decrease *#REGhl by one.
  $C196,$02 Jump to #R$C1AD if *#REGhl is not equal to #REGa.
  $C198,$04 #REGix=*#R$BD0E.
  $C19C,$02 Shift #REGe left (with carry).
  $C19E,$02 #REGix+=#REGde.
  $C1A0,$03 #REGl=*#REGix+#N$00.
  $C1A3,$03 #REGh=*#REGix+#N$01.
  $C1A6,$01 Stash #REGbc on the stack.
  $C1A7,$03 #REGde=#R$C1AC.
  $C1AA,$01 Stash #REGde on the stack.
  $C1AB,$01 Jump to *#REGhl.
  $C1AC,$01 Restore #REGbc from the stack.
  $C1AD,$02 Decrease counter by one and loop back to #R$C186 until counter is zero.
  $C1AF,$01 No operation.
  $C1B0,$03 #REGhl=#R$BC78.
  $C1B3,$03 #REGa=*#R$BD30.
  $C1B6,$01 Set the bits from #REGa.
  $C1B7,$02 Jump to #R$C1EF if *#REGhl is equal to #REGa.
  $C1B9,$01 #REGb=#REGa.
  $C1BA,$02 Jump to #R$C1BD.
  $C1BC,$01 Increment #REGhl by one.
  $C1BD,$04 Jump to #R$C1ED if *#REGhl is zero.
  $C1C1,$06 Jump to #R$C1ED if *#R$BCCB is equal to *#REGhl.
  $C1C7,$02 Stash #REGhl and #REGbc on the stack.
  $C1C9,$05 #REGe=*#R$BD30-#REGb.
  $C1CE,$04 #REGix=#R$BCCC.
  $C1D2,$03 Call #R$C1F0.
  $C1D5,$03 Call #R$BB55.
  $C1D8,$01 #REGb=#REGa.
  $C1D9,$02 #REGa=#N$FF.
  $C1DB,$03 #REGl=*#REGix+#N$00.
  $C1DE,$03 #REGh=*#REGix+#N$01.
  $C1E1,$02 Jump to #R$C1E4.
  $C1E3,$01 Increment #REGhl by one.
  $C1E4,$03 Jump to #R$C1DB if #REGa is equal to *#REGhl.
  $C1E7,$02 Decrease counter by one and loop back to #R$C1E3 until counter is zero.
  $C1E9,$01 #REGa=*#REGhl.
  $C1EA,$02 Restore #REGbc and #REGhl from the stack.
  $C1EC,$01 Write #REGa to *#REGhl.
  $C1ED,$02 Decrease counter by one and loop back to #R$C1BC until counter is zero.
  $C1EF,$01 Return.

c $C1F0 Get Table Entry
@ $C1F0 label=GetTableEntry
D $C1F0 Retrieves an address from a table using a given index.
R $C1F0 E Index of item
R $C1F0 IX Base table address
R $C1F0 O:HL Address of relevant table entry
  $C1F0,$06 Multiply the given index by #N$02 and store the result in #REGde.
  $C1F6,$02 Add #REGde to the base table address.
  $C1F8,$06 Fetch the relevant table address and store it in #REGhl.
  $C1FE,$01 Return.

c $C1FF Print Objects
@ $C1FF label=PrintObjects
R $C1FF A #N$01 for inventory items, or room number for room objects
  $C1FF,$03 #REGhl=#R$BBF0.
  $C202,$04 #REGbc=*#R$BD28.
@ $C206 label=FindObject_Loop
  $C206,$02 Search for matching objects.
  $C208,$01 Return if no objects were found.
  $C209,$01 Stash the current place in #R$BBF0 on the stack.
  $C20A,$03 Call #R$C456.
  $C20D,$02 Jump to #R$C216 if the object is invalid.
  $C20F,$02 Temporarily stash the object type and object counter on the stack.
  $C211,$03 Call #R$BAB1.
  $C214,$02 Restore the object counter and object type from the stack.
@ $C216 label=FindObject_Next
  $C216,$01 Temporarily hold the object type in #REGe.
  $C217,$01 Restore the current place in #R$BBF0 from the stack.
  $C218,$02 Test if all objects have been checked...
  $C21A,$01 Restore the object type to #REGa.
  $C21B,$02 Jump to #R$C206 until all objects in the table have been checked.
  $C21D,$01 Return.

c $C21E
  $C21E,$03 #REGa=*#R$BD2E.
  $C221,$01 Set the bits from #REGa.
  $C222,$02 Jump to #R$C26A if ?? is equal to #REGa.
  $C224,$03 #REGa=*#R$BCCB.
  $C227,$03 #REGhl=*#R$BD14.
  $C22A,$04 #REGbc=*#R$BD2E.
  $C22E,$02 CPIR.
  $C230,$02 Jump to #R$C26A if ?? is not equal to #REGa.
  $C232,$03 #REGa=*#R$BD2E.
  $C235,$01 Increment #REGc by one.
  $C236,$01 #REGa-=#REGc.
  $C237,$01 #REGc=#REGa.
  $C238,$01 #REGa=#N$00.
  $C239,$01 Set the bits from #REGe.
  $C23A,$02 Jump to #R$C258 if #REGc is not equal to #REGe.
  $C23C,$03 #REGhl=#R$BC5C.
  $C23F,$01 #REGa=#REGc.
  $C240,$04 Jump to #R$C249 if #REGa is less than #N$08.
  $C244,$02 #REGa-=#N$08.
  $C246,$01 Increment #REGhl by one.
  $C247,$02 Jump to #R$C240.
  $C249,$01 #REGb=#REGa.
  $C24A,$01 Increment #REGb by one.
  $C24B,$02 #REGd=#N$00.
  $C24D,$02 Rotate #REGd left.
  $C24F,$02 Decrease counter by one and loop back to #R$C24D until counter is zero.
  $C251,$01 #REGa=*#REGhl.
  $C252,$01 Merge the bits from #REGd.
  $C253,$02 Jump to #R$C26A if #REGb is not equal to #REGd.
  $C255,$01 #REGa=*#REGhl.
  $C256,$01 Set the bits from #REGd.
  $C257,$01 Write #REGa to *#REGhl.
  $C258,$01 Stash #REGbc on the stack.
  $C259,$03 Call #R$BA6D.
  $C25C,$01 Restore #REGbc from the stack.
  $C25D,$04 #REGix=*#R$BD16.
  $C261,$01 #REGe=#REGc.
  $C262,$03 Call #R$C1F0.
  $C265,$03 #REGde=#R$C26A.
  $C268,$01 Stash #REGde on the stack.
  $C269,$01 Jump to *#REGhl.

c $C26A Handler: Display Room Exits
@ $C26A label=Handler_RoomExits
D $C26A Handles displaying the exits available for the current room.
  $C26A,$03 Call #R$BA6D.
  $C26D,$05 Set up the printing position.
  $C272,$03 Call #R$C302 which loads #REGhl with the room data pointer.
  $C275,$02 Store this in #REGde for later.
N $C277 Count the number of exits in the room data.
  $C277,$02 Set an "exits" counter in #REGb of #N$06.
  $C279,$02 Initialise #REGc to #N$00 to count the number of valid exits.
  $C27B,$01 Set #REGa to #N$00 which is used just for the comparison.
@ $C27C label=RoomExitsCount_Loop
  $C27C,$01 Does this room have an exit?
  $C27D,$02 Jump to #R$C280 if this room doesn't have an exit for this
. position.
  $C27F,$01 Increment the valid exits count by one.
@ $C280 label=RoomExitsCount_Skip
  $C280,$01 Move to the next byte of room data.
  $C281,$02 Decrease the exits counter by one and loop back to #R$C27C until
. all the exits have been checked.
N $C283 Process the exits count result.
  $C283,$03 Jump to #R$C2EE if no exits were found.
  $C286,$05 Jump to #R$C2AD if more than #N$01 exit was found.
N $C28B Only one exit was found:
N $C28B Print "#STR$BDEC,$08($b==$FF)".
  $C28B,$03 #REGhl=#R$BDEC.
  $C28E,$03 Call #R$BAA4.
  $C291,$02 Retrieve the room data pointer and load it into #REGhl.
  $C293,$04 Set a pointer in #REGix to #R$BFE2.
  $C297,$01 Set #REGa to #N$00 which is used just for the comparison.
  $C298,$02 Jump to #R$C29F.
N $C29A Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $C29A label=RoomCheckForExit_Loop
  $C29A,$01 Move to the next byte of room data.
  $C29B,$04 Increment the direction name table pointer by two.
@ $C29F label=RoomCheckForExit
  $C29F,$03 Jump to #R$C29A if the current exit isn't a valid exit.
  $C2A2,$06 Get the direction name from the direction name table.
  $C2A8,$03 Call #R$BAA4 to print the direction name.
  $C2AB,$02 Jump to #R$C2E8.
N $C2AD More than one exit was found:
N $C2AD Print "#STR$BDD9,$08($b==$FF)".
@ $C2AD label=RoomMultipleExits
  $C2AD,$03 #REGhl=#R$BDD9.
  $C2B0,$03 Call #R$BAB1.
  $C2B3,$02 Retrieve the room data pointer and load it into #REGhl.
  $C2B5,$04 Set a pointer in #REGix to #R$BFE2.
  $C2B9,$01 Set #REGa to #N$00 which is used just for the comparison.
  $C2BA,$02 Jump to #R$C2C2.
N $C2BC So as not to corrupt the pointer to the room data (as #REGhl is also
. used when printing), it's temporarily held in #REGde.
@ $C2BC label=RoomExits_Initialise
  $C2BC,$01 Switch back the #REGde and #REGhl registers.
N $C2BD Move both the pointers to the next item of data (increment by two for
. the direction name table pointer as it contains addresses).
@ $C2BD label=RoomCheckForExits_Loop
  $C2BD,$01 Move to the next byte of room data.
  $C2BE,$04 Increment the direction name table pointer by two.
@ $C2C2 label=RoomCheckForExits
  $C2C2,$03 Jump to #R$C2BD if the current exit isn't a valid exit.
  $C2C5,$01 Temporarily store the room data pointer in #REGde.
  $C2C6,$06 Get the direction name from the direction name table.
  $C2CC,$03 Call #R$BAA4 to print the direction name.
  $C2CF,$01 Decrease the valid exits count by one.
  $C2D0,$05 Jump to #R$C2E8 if there are no more exits to process.
  $C2D5,$02 Jump to #R$C2DF if there is only one exit left to process.
N $C2D7 #HTML(Print a comma character: "<code>#CHR$2C</code>".)
  $C2D7,$02 #REGa=#N$2C.
  $C2D9,$03 Call #R$BAC3.
  $C2DC,$01 Reset #REGa back to #N$00 for the comparison.
  $C2DD,$02 Jump back to #R$C2BC to continue processing.
@ $C2DF label=RoomExits_PrintAmpersand
N $C2DF Print "#STR$BDD5,$08($b==$FF)".
  $C2DF,$03 #REGhl=#R$BDD5.
  $C2E2,$03 Call #R$BAA4.
  $C2E5,$01 Reset #REGa back to #N$00 for the comparison.
  $C2E6,$02 Jump to #R$C2BC to continue processing.
N $C2E8 Print "#STR$BF29,$08($b==$FF)".
@ $C2E8 label=RoomExits_PrintFullStop
  $C2E8,$03 #REGhl=#R$BF29.
  $C2EB,$03 Call #R$BAB1.
N $C2EE Are there any objects here?
@ $C2EE label=RoomExits_YouCanSee
  $C2EE,$03 #REGa=*#R$BCCB.
  $C2F1,$03 Call #R$C439.
  $C2F4,$01 Return if no objects were found at this location.
N $C2F5 Print "#STR$BDC6,$08($b==$FF)".
  $C2F5,$03 #REGhl=#R$BDC6.
  $C2F8,$03 Call #R$BAB1.
N $C2FB Print the objects at this location.
  $C2FB,$03 #REGa=*#R$BCCB.
  $C2FE,$03 Call #R$C1FF.
  $C301,$01 Return.

c $C302 Get Room Pointer
@ $C302 label=GetRoomPointer
R $C302 O:HL Pointer to the room data
M $C302,$06 Load the *#R$BCCB into #REGde.
  $C302,$04 #REGe=*#R$BCCB.
  $C306,$02 #REGd=#N$00.
  $C308,$02 Copy it into #REGhl.
  $C30A,$05 Mulitply by #N$06.
  $C30F,$05 Add the result to the base address *#R$BD10, stored in #REGhl.
  $C314,$01 Return.

c $C315 Print Room Description
@ $C315 label=Print_RoomDescription
R $C315 A Line number to begin printing
  $C315,$03 Write #REGa to *#R$BD70.
  $C318,$03 Call #R$BA89.
  $C31B,$03 #REGa=*#R$BCCB.
  $C31E,$04 #REGix=*#R$BD18.
  $C322,$01 Copy the room number into #REGe.
  $C323,$03 Call #R$C1F0.
  $C326,$03 Call #R$BAB1.
  $C329,$01 Return.

c $C32A
  $C32A,$01 Increment #REGbc by one.
  $C32B,$03 #REGa=*#R$BD2A.
  $C32E,$01 #REGa-=#REGc.
  $C32F,$01 #REGe=#REGa.
  $C330,$01 Stash #REGde on the stack.
  $C331,$04 #REGix=*#R$BD1A.
  $C335,$03 Call #R$C1F0.
  $C338,$01 Restore #REGde from the stack.
  $C339,$02 Jump to #R$C33C.
  $C33B,$01 Increment #REGhl by one.
  $C33C,$05 Jump to #R$C347 if *#REGhl is equal to #N$FF.
  $C341,$03 Call #R$C35F.
  $C344,$02 Jump to #R$C33B if #REGa is not equal to #N$FF.
  $C346,$01 Return.
N $C347 Print "#STR$BE1D,$08($b==$FF)".
  $C347,$03 #REGhl=#R$BE1D.
  $C34A,$03 Call #R$BAA4.
  $C34D,$04 #REGix=*#R$BD1C.
  $C351,$03 Call #R$C1F0.
  $C354,$03 Call #R$BAA4.
N $C357 Print "#STR$BE2A,$08($b==$FF)".
  $C357,$03 #REGhl=#R$BE2A.
  $C35A,$03 Call #R$BAB1.
  $C35D,$01 Set the carry flag.
  $C35E,$01 Return.

c $C35F
  $C35F,$02 Stash #REGhl and #REGde on the stack.
  $C361,$01 #REGe=#REGa.
  $C362,$02 #REGd=#N$00.
  $C364,$02 Test bit 7 of #REGe.
  $C366,$02 Jump to #R$C36D if ?? is not equal to #N$00.
  $C368,$03 #REGhl=#R$BBF0.
  $C36B,$02 Jump to #R$C372.
  $C36D,$02 Reset bit 7 of #REGe.
  $C36F,$03 #REGhl=#R$BC78.
  $C372,$01 #REGhl+=#REGde.
  $C373,$06 Jump to #R$C37C if *#R$BCCB is equal to *#REGhl.
  $C379,$03 Compare #N$01 with *#REGhl.
  $C37C,$02 Restore #REGde and #REGhl from the stack.
  $C37E,$01 Return.

c $C37F
  $C37F,$01 Exchange the #REGde and #REGhl registers.
  $C380,$02 Jump to #R$C383.
  $C382,$01 Increment #REGde by one.
  $C383,$03 #REGhl=#R$BD67.
  $C386,$02 Jump to #R$C38A.
  $C388,$01 Increment #REGhl by one.
  $C389,$01 Increment #REGde by one.
  $C38A,$01 #REGa=*#REGde.
  $C38B,$03 Jump to #R$C388 if #REGa is equal to *#REGhl.
  $C38E,$04 Jump to #R$C396 if #REGa is not equal to #N$FE.
  $C392,$03 Compare *#REGhl with #N$FF.
  $C395,$01 Return.

  $C396,$04 Jump to #R$C3A0 if #REGa is not equal to #N$FD.
  $C39A,$05 Jump to #R$C382 if *#REGhl is not equal to #N$FF.
  $C39F,$01 Return.

  $C3A0,$01 Increment #REGde by one.
  $C3A1,$01 #REGa=*#REGde.
  $C3A2,$04 Jump to #R$C3AC if #REGa is equal to #N$FE.
  $C3A6,$04 Jump to #R$C3A0 if #REGa is not equal to #N$FD.
  $C3AA,$02 Jump to #R$C382.
  $C3AC,$01 Set the bits from #REGa.
  $C3AD,$01 Return.

c $C3AE
  $C3AE,$03 #REGhl=#R$BD66.
  $C3B1,$02 #REGb=#N$0A.
  $C3B3,$02 #REGe=#N$00.
  $C3B5,$01 #REGa=*#REGhl.
  $C3B6,$04 Jump to #R$C3CD if #REGa is equal to #N$FF.
  $C3BA,$02 Stash #REGhl and #REGbc on the stack.
  $C3BC,$03 #REGhl=*#R$BD1E.
  $C3BF,$04 #REGbc=*#R$BD2A.
  $C3C3,$02 CPIR.
  $C3C5,$02 Restore #REGbc and #REGhl from the stack.
  $C3C7,$02 Jump to #R$C3CA if #REGa is not equal to #N$FF.
  $C3C9,$01 Increment #REGe by one.
  $C3CA,$01 Increment #REGhl by one.
  $C3CB,$02 Decrease counter by one and loop back to #R$C3B5 until counter is zero.
  $C3CD,$01 #REGa=#N$00.
  $C3CE,$01 Set the bits from #REGe.
  $C3CF,$01 Return.

c $C3D0
  $C3D0,$01 #REGe=#REGa.
  $C3D1,$02 #REGd=#N$00.
  $C3D3,$02 Test bit 7 of #REGa.
  $C3D5,$02 Jump to #R$C3DC if ?? is not equal to #N$00.
  $C3D7,$03 #REGhl=#R$BBF0.
  $C3DA,$02 Jump to #R$C3E1.
  $C3DC,$03 #REGhl=#R$BC78.
  $C3DF,$02 Reset bit 7 of #REGe.
  $C3E1,$01 #REGhl+=#REGde.
  $C3E2,$01 #REGa=*#REGhl.
  $C3E3,$01 Return.

c $C3E4
  $C3E4,$03 Call #R$C3D0.
  $C3E7,$02 Compare #REGa with #N$01.
  $C3E9,$01 Return.

c $C3EA
  $C3EA,$01 #REGb=#REGa.
  $C3EB,$02 #REGc=#N$00.
  $C3ED,$03 Call #R$C412.
  $C3F0,$01 Return.

c $C3F1
  $C3F1,$01 #REGb=#REGa.
  $C3F2,$04 #REGc=*#R$BCCB.
  $C3F6,$03 Call #R$C412.
  $C3F9,$01 Return.

c $C3FA
  $C3FA,$01 #REGb=#REGa.
  $C3FB,$02 #REGc=#N$FF.
  $C3FD,$03 Call #R$C412.
  $C400,$01 Return.
  $C401,$02 Jump to #R$C404.
  $C403,$01 Increment #REGhl by one.
  $C404,$05 Jump to #R$C410 if *#REGhl is equal to #N$FF.
  $C409,$03 Call #R$C35F.
  $C40C,$02 Jump to #R$C403 if the zero flag is not set.
  $C40E,$01 #REGa=*#REGhl.
  $C40F,$01 Return.
  $C410,$01 Set flags.
  $C411,$01 Return.

c $C412
  $C412,$02 Test bit 7 of #REGb.
  $C414,$02 Jump to #R$C41D if #REGa is equal to #REGa.
  $C416,$02 Reset bit 7 of #REGb.
  $C418,$03 #REGhl=#R$BC78.
  $C41B,$02 Jump to #R$C420.
  $C41D,$03 #REGhl=#R$BBF0.
  $C420,$02 #REGd=#N$00.
  $C422,$01 #REGe=#REGb.
  $C423,$01 #REGhl+=#REGde.
  $C424,$01 Write #REGc to *#REGhl.
  $C425,$01 Return.

c $C426
  $C426,$01 #REGa=#REGb.
  $C427,$03 Call #R$C3D0.
  $C42A,$02 Stash #REGbc and #REGaf on the stack.
  $C42C,$02 #REGc=#N$00.
  $C42E,$03 Call #R$C412.
  $C431,$02 Restore #REGaf and #REGbc from the stack.
  $C433,$01 #REGb=#REGc.
  $C434,$01 #REGc=#REGa.
  $C435,$03 Call #R$C412.
  $C438,$01 Return.

c $C439 Check Room Objects
@ $C439 label=CheckRoomObjects
R $C439 A Room number
R $C439 O:A #N$00 or #N$01 if objects are found or not
  $C439,$03 #REGhl=#R$BBF0.
  $C43C,$04 #REGbc=*#R$BD28.
@ $C440 label=CheckRoomObjects_Loop
  $C440,$02 Search for the room number in the table.
  $C442,$01 Return if no objects are found.
  $C443,$01 Stash the object location table pointer on the stack.
  $C444,$03 Call #R$C456.
  $C447,$01 Restore the object location table pointer from the stack.
  $C448,$02 Jump to #R$C454 if there are no objects found here.
  $C44A,$01 Temporarily store #REGa in #REGe.
  $C44B,$02 Are there more objects to check?
  $C44D,$01 Restore the #REGa register.
  $C44E,$02 Jump to #R$C440 if there are more objects to check.
N $C450 Set the "successful" output.
  $C450,$02 Set #REGa to #N$01 to indicate that objects were found.
  $C452,$01 Set flags.
  $C453,$01 Return.
N $C454 Set the "failure" output.
@ $C454 label=NoRoomObjectsFound
  $C454,$01 Set #REGa to #N$00 to indicate that no objects were found.
  $C455,$01 Return.

c $C456 Validate Object
@ $C456 label=ValidateObject
R $C456 BC Object counter
R $C456 O:F Z is unset if the object is valid, unset when invalid 
  $C456,$02 Stash #REGaf and #REGbc on the stack.
  $C458,$01 Adjust the object counter.
  $C459,$03 #REGa=*#R$BD28.
  $C45C,$02 Calculate the index and store the result in #REGe.
  $C45E,$04 #REGix=*#R$BD12.
  $C462,$03 Call #R$C1F0.
  $C465,$01 Restore the object counter from the stack.
  $C466,$04 Jump to #R$C46D if the object is invalid.
  $C46A,$01 Restore the object type from the stack.
  $C46B,$01 Clear the Z flag.
  $C46C,$01 Return.
@ $C46D label=InvalidObject
  $C46D,$01 Restore #REGaf from the stack.
  $C46E,$01 Set the Z flag.
  $C46F,$01 Return.

c $C470
  $C470,$03 #REGa=*#R$BD67.
  $C473,$03 Return if #REGa is equal to #N$FF.
  $C476,$03 Call #R$BFEE.
  $C479,$01 Set the carry flag.
  $C47A,$01 Return.

c $C47B
  $C47B,$03 #REGa=*#R$BD67.
  $C47E,$04 Jump to #R$C487 if #REGa is not equal to #N$FF.
  $C482,$03 Call #R$BFF5.
  $C485,$01 Set the carry flag.
  $C486,$01 Return.
  $C487,$03 Call #R$C3AE.
  $C48A,$01 Return if #REGa is not equal to #N$FF.
  $C48B,$03 Call #R$BFEE.
  $C48E,$01 Set the carry flag.
  $C48F,$01 Return.
  $C490,$03 #REGa=*#R$BD67.
  $C493,$03 Return if #REGa is equal to #N$FF.
  $C496,$03 Call #R$C3AE.
  $C499,$01 Return if #REGa is not equal to #N$FF.
  $C49A,$03 Call #R$BFEE.
  $C49D,$01 Set the carry flag.
  $C49E,$01 Return.

c $C49F
  $C49F,$03 Call #R$C47B.
  $C4A2,$01 Return if #REGa is less than #N$FF.
  $C4A3,$04 Jump to #R$C4AC if #REGa is not equal to #N$01.
  $C4A7,$03 Call #R$BFF5.
  $C4AA,$01 Set the carry flag.
  $C4AB,$01 Return.
  $C4AC,$04 Jump to #R$C4B2 if #REGa is greater than or equal to #N$03.
  $C4B0,$01 Set flags.
  $C4B1,$01 Return.
  $C4B2,$03 Call #R$BFEE.
  $C4B5,$01 Set the carry flag.
  $C4B6,$01 Return.

c $C4B7
  $C4B7,$03 #REGa=*#R$BD67.
  $C4BA,$04 Jump to #R$C4C3 if #REGa is not equal to #N$FF.
  $C4BE,$03 Call #R$BFF5.
  $C4C1,$01 Set the carry flag.
  $C4C2,$01 Return.
  $C4C3,$03 Call #R$C3AE.
  $C4C6,$01 Return.

c $C4C7
  $C4C7,$03 #REGhl=#R$BD66.
  $C4CA,$02 #REGb=#N$0A.
  $C4CC,$04 Return if *#REGhl is equal to #N$FF.
  $C4D0,$02 Stash #REGhl and #REGbc on the stack.
  $C4D2,$03 #REGhl=*#R$BD1E.
  $C4D5,$04 #REGbc=*#R$BD2A.
  $C4D9,$02 CPIR.
  $C4DB,$02 Jump to #R$C4E5 if #REGa is not equal to #N$FF.
  $C4DD,$03 Call #R$C32A.
  $C4E0,$02 Jump to #R$C4E5 if #REGa is greater than or equal to #N$FF.
  $C4E2,$02 Restore #REGbc and #REGhl from the stack.
  $C4E4,$01 Return.

  $C4E5,$02 Restore #REGbc and #REGhl from the stack.
  $C4E7,$01 Increment #REGhl by one.
  $C4E8,$02 Decrease counter by one and loop back to #R$C4CC until counter is zero.
  $C4EA,$01 Return.

c $C4EB Handler: Scenic Events
@ $C4EB label=Handler_ScenicEvents
  $C4EB,$03 #REGhl=#R$BC78.
  $C4EE,$04 #REGbc=*#R$BD30.
@ $C4F2 label=Handler_ScenicEvents_Loop
  $C4F2,$03 #REGa=*#R$BCCB.
  $C4F5,$02 Search for matching room.
  $C4F7,$02 Jump to #R$C51F if no event was found.
N $C4F9 An event was found to be processed!
  $C4F9,$03 Write the table position to *#R$BD7D.
  $C4FC,$04 Write the counter to *#R$BD7F.
N $C500 Calculate the event index and get the event handler.
  $C500,$01 Adjust the counter for the sum.
  $C501,$03 #REGhl=*#R$BD30.
  $C504,$03 Calculate the index.
  $C507,$01 Move the index into #REGde (as #R$C1F0 uses #REGe).
  $C508,$04 #REGix=*#R$BD24.
  $C50C,$03 Call #R$C1F0.
  $C50F,$04 Push #R$C514 onto the stack (as the return address).
  $C513,$01 Jump to the event handler held by #REGhl.
N $C514 This is the return point after the handler has finished executing.
@ $C514 label=ScenicEvents_PostProcessing
  $C514,$03 Restore *#R$BD7D to #REGhl.
  $C517,$04 Restore *#R$BD7F to #REGbc.
  $C51B,$01 Reset #REGa to #N$00.
  $C51C,$03 Jump to #R$C4F2 if there are any further events to process.
@ $C51F label=ScenicEvents_Return
  $C51F,$01 Return.

c $C520
  $C520,$01 #REGc=#REGa.
  $C521,$04 #REGb=*#R$BD30.
  $C525,$03 #REGa=*#R$BCCB.
  $C528,$03 #REGhl=#R$BC78.
  $C52B,$02 Jump to #R$C52E.
  $C52D,$01 Increment #REGhl by one.
  $C52E,$03 Jump to #R$C532 if #REGa is not equal to *#REGhl.
  $C531,$01 Write #REGc to *#REGhl.
  $C532,$02 Decrease counter by one and loop back to #R$C52D until counter is zero.
  $C534,$01 #REGa=#REGc.
  $C535,$03 Write #REGa to *#R$BCCB.
  $C538,$03 #REGa=*#R$BC6F.
  $C53B,$03 Jump to #R$C555 if #REGa is equal to #REGa.
  $C53E,$02 #REGb=#N$08.
  $C540,$03 #REGhl=#R$BC70.
  $C543,$01 #REGc=#REGa.
  $C544,$02 Jump to #R$C547.
  $C546,$01 Increment #REGhl by one.
  $C547,$02 Shift #REGc right.
  $C549,$02 Jump to #R$C553 if #REGhl is greater than or equal to #REGa.
  $C54B,$01 #REGa=*#REGhl.
  $C54C,$02 Stash #REGhl and #REGbc on the stack.
  $C54E,$03 Call #R$C3F1.
  $C551,$02 Restore #REGbc and #REGhl from the stack.
  $C553,$02 Decrease counter by one and loop back to #R$C546 until counter is zero.
  $C555,$01 Return.

c $C556
  $C556,$03 #REGhl=*#R$BD26.
  $C559,$04 #REGbc=*#R$BD2C.
  $C55D,$03 #REGa=*#R$BD66.
  $C560,$02 CPIR.
  $C562,$02 Jump to #R$C56B if ?? is equal to #N$00.
N $C564 Print "#STR$BD91,$08($b==$FF)".
  $C564,$03 #REGhl=#R$BD91.
  $C567,$03 Call #R$BAB1.
  $C56A,$01 Return.

  $C56B,$03 #REGa=*#R$BD2C.
  $C56E,$01 #REGa-=#REGc.
  $C56F,$01 Decrease #REGa by one.
  $C570,$01 #REGe=#REGa.
  $C571,$04 #REGix=*#R$BD20.
  $C575,$03 Call #R$C1F0.
  $C578,$01 Jump to *#REGhl.

c $C579 Pause, Print String And Scroll
@ $C579 label=PausePrintStringAndScroll
D $C579 For dramatic effect! Used when an event occurs.
  $C579,$02 #REGb=#N$19.
  $C57B,$03 Call #R$BB51.
  $C57E,$03 Call #R$BAB1.
  $C581,$01 Return.

c $C582 Generate Random Number
@ $C582 label=GenerateRandomNumber
R $C582 A Maximum value of generated number
  $C582,$01 Stash #REGbc on the stack.
  $C583,$01 Store the maximum number in #REGc.
  $C584,$03 Call #R$BB55.
  $C587,$01 Use the frames number as a loop counter in #REGb.
  $C588,$01 Restore the maximum number value back to #REGa.
@ $C589 label=GenerateRandomNumber_Loop
  $C589,$01 Decrease the maximum number value by one.
  $C58A,$02 Jump to #R$C58D if the maximum number value is not equal to zero.
  $C58C,$01 Restore the maximum number value back to #REGa.
@ $C58D label=GenerateRandomNumber_Next
  $C58D,$02 Decrease the loop counter by one and loop back to #R$C589 until the
. loop counter is zero.
  $C58F,$01 Decrease the maximum number value by one.
  $C590,$01 Restore #REGbc from the stack.
  $C591,$01 Return.

c $C592 Game Start Alias
@ $C592 label=GameStart_Alias
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

g $D34E Table: Object Descriptions?
@ $D34E label=Table_ObjectDescriptions_1
W $D34E,$02 Object: #N((#PC-$D34E)/$02).
L $D34E,$02,$4F

g $D3EC Table: Room Descriptions
@ $D3EC label=Table_RoomDescriptions
W $D3EC,$02 N/A.
W $D3EE,$02 N/A.
W $D3F0,$02 Room #R(#PEEK(#PC+$01)*$100+#PEEK(#PC))(#N((#PC-$D3EC)/$02)).
L $D3F0,$02,$6B

g $D4C6 Table: Object Descriptions?
@ $D4C6 label=Table_ObjectDescriptions_2
W $D4C6,$02 Object #R(#PEEK(#PC+$01)*$100+#PEEK(#PC))(#N((#PC-$D4C6)/$02)).
L $D4C6,$02,$30

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

g $E86E
  $E86E
  $E871
  $E875
  $E877
  $E87A
  $E87E
  $E881
  $E883
  $E885
  $E888
  $E88B
  $E88E
  $E890
  $E892
  $E895
  $E898
  $E89A
  $E89C
  $E89E
  $E8A0
  $E8A3
  $E8A6
  $E8AB
  $E8AF
  $E8B2
  $E8BC
  $E8BF
  $E8C1
  $E8C4
  $E8C6
  $E8C8
  $E8CA
  $E8D2
  $E8D4
  $E8D6
  $E8D8
  $E8DC
  $E8DF
  $E8E2
  $E8E4
  $E8E9
  $E8ED
  $E8F2
  $E8F5
  $E8F7
  $E8FE
  $E900
  $E902

g $E90D

g $E933
B $E933,$03
B $E936,$01 Terminator.
L $E933,$04,$05
B $E947,$05
B $E94C,$01 Terminator.
L $E947,$06,$02
B $E953,$07
B $E95A,$01 Terminator.
B $E95B,$01
B $E95C,$01 Terminator.

g $E95D

g $E96A
@ $E96A label=gfgdfg
W $E96A,$02 #N((#PC-$E96A)/$02).
L $E96A,$02,$30

g $E9CA
W $E9CA,$02

g $E9CC
  $E9D3
  $E9D7
  $E9DB
  $E9E1
  $E9E5
  $E9F1
  $EA0D
  $EA70
  $EA9E
  $EAA2
  $EAA6
  $EAAC
  $EAB2
  $EAB5
  $EAB8
  $EABA
  $EABC
  $EABE
  $EAC0
  $EAC5
  $EAC7
  $EACB
  $EACD
  $EACF
  $EAD8
  $EADD
  $EAE6
  $EAEC
  $EAF5
  $EAFE
  $EB07

g $EB10 Table: Room Map
@ $EB10 label=Table_RoomMap
N $EB10 Room #N((#PC-$EB10)/$06): #ROOM((#PC-$EB10)/$06).
B $EB10,$01 #IF(#PEEK(#PC)>$00)(North to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB11,$01 #IF(#PEEK(#PC)>$00)(South to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB12,$01 #IF(#PEEK(#PC)>$00)(East to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB13,$01 #IF(#PEEK(#PC)>$00)(West to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB14,$01 #IF(#PEEK(#PC)>$00)(Up to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
B $EB15,$01 #IF(#PEEK(#PC)>$00)(Down to room: #R($EB10+#PEEK(#PC)*$06)(#N(#PEEK(#PC))),N/A).
L $EB10,$06,$6D

w $ED9E

c $EDC4 Game Loop
@ $EDC4 label=GameLoop

c $EDD7 Game Over
@ $EDD7 label=GameOver
N $EDD7 Print "#STR$BE31,$08($b==$FF)".
  $EDD7,$03 #REGhl=#R$BE31.
  $EDDA,$03 Call #R$BAB1.
@ $EDDD label=GameOverInput
N $EDDD Print "#STR$BE3F,$08($b==$FF)".
  $EDDD,$03 #REGhl=#R$BE3F.
  $EDE0,$03 Call #R$BAB1.
@ $EDE3 label=GameOverInput_Loop
  $EDE3,$03 Call #R$BA5D.
  $EDE6,$05 #HTML(Reset back to BASIC if the keypress is "<code>#CHR$4E</code>".)
  $EDEB,$05 #HTML(Jump to #R$BA50 if the keypress is "<code>#CHR$59</code>".)
  $EDF0,$02 Jump to #R$EDE3.

c $EDF2 Game Complete
@ $EDF2 label=GameComplete
N $EDF8 Print "#STR$D526,$08($b==$FF)".

c $EE00 Events: Crab
@ $EE00 label=Event_Crab
  $EE00,$03 #REGhl=#R$BC66.
  $EE03,$02 Clear bit 0 (which relates to the crab).
  $EE05,$02 #REGa=#N$29.
  $EE07,$03 Call #R$C35F.
  $EE0A,$01 Return if ?? is not equal to #N$29.
N $EE0B Print "#STR$D5B0,$08($b==$FF)".
  $EE0B,$03 #REGhl=#R$D5B0.
  $EE0E,$03 Jump to #R$EE9B.

c $EE11 Events: Tentacle
@ $EE11 label=Event_Tentacle
  $EE11,$03 #REGhl=#R$BC66.
  $EE14,$02 Reset bit 1 of *#REGhl.
  $EE16,$02 #REGa=#N$2B.
  $EE18,$03 Call #R$C35F.
  $EE1B,$01 Return if ?? is not equal to #N$2B.
N $EE1C Print "#STR$D5F6,$08($b==$FF)".
  $EE1C,$03 #REGhl=#R$D5F6.
  $EE1F,$03 Jump to #R$EE9B.

c $EE22 Events: Rum
@ $EE22 label=Event_Rum
  $EE22,$03 #REGhl=#R$BC66.
  $EE25,$02 Reset bit 2 of *#REGhl.
  $EE27,$03 #REGa=*#R$BCCB.
  $EE2A,$03 #REGbc=#N($0007,$04,$04).
  $EE2D,$03 #REGhl=#R$EE39.
  $EE30,$02 CPIR.
  $EE32,$01 Return if ?? is not equal to #N$2B.
N $EE33 Print "#STR$D629,$08($b==$FF)".
  $EE33,$03 #REGhl=#R$D629.
  $EE36,$03 Jump to #R$EE9B.
B $EE39,$07

c $EE40 Events: Lion
@ $EE40 label=Event_Lion
  $EE40,$03 #REGhl=#R$BC66.
  $EE43,$02 Reset bit 3 of *#REGhl.
  $EE45,$02 #REGa=#N$2A.
  $EE47,$03 Call #R$C35F.
  $EE4A,$01 Return if #REGh is not equal to #N$2A.
N $EE4B Print "#STR$D66E,$08($b==$FF)".
  $EE4B,$03 #REGhl=#R$D66E.
  $EE4E,$03 Jump to #R$EE9B.

c $EE51 Events: Crocodile
@ $EE51 label=Event_Crocodile
  $EE51,$03 #REGhl=#R$BC66.
  $EE54,$02 Reset bit 4 of *#REGhl.
  $EE56,$03 #REGhl=#R$E8C1.
  $EE59,$03 Call #R$C401.
  $EE5C,$01 Return if #REGh is not equal to #N$2A.
N $EE5D Print "#STR$D6A0,$08($b==$FF)".
  $EE5D,$03 #REGhl=#R$D6A0.
  $EE60,$03 Jump to #R$EE9B.

c $EE63 Events: Cannibals
@ $EE63 label=Event_Cannibals
  $EE63,$03 #REGhl=#R$BC66.
  $EE66,$02 Reset bit 5 of *#REGhl.
  $EE68,$02 #REGa=#N$18.
  $EE6A,$03 Call #R$C35F.
  $EE6D,$01 Return if #REGh is not equal to #N$18.
  $EE6E,$03 #REGhl=#R$D931.
  $EE71,$03 Jump to #R$EE9B.

c $EE74 Events: Match
@ $EE74 label=Event_Match
  $EE74,$03 #REGhl=#R$BC66.
  $EE77,$02 Reset bit 6 of *#REGhl.
  $EE79,$02 #REGa=#N$03.
  $EE7B,$03 Call #R$C3E4.
  $EE7E,$02 Jump to #R$EE8A if #REGh is not equal to #N$03.
  $EE80,$03 #REGhl=#R$BC98.
  $EE83,$01 Decrease *#REGhl by one.
N $EE84 Print "#STR$DB91,$08($b==$FF)".
  $EE84,$03 #REGhl=#R$DB91.
  $EE87,$03 Call #R$BAB1.
  $EE8A,$02 #REGa=#N$03.
  $EE8C,$03 Call #R$C3EA.
  $EE8F,$01 Return.

c $EE90 Events: Wave
@ $EE90 label=Event_Wave
  $EE90,$03 #REGhl=#R$BC66.
  $EE93,$02 Reset bit 7 of *#REGhl.
N $EE95 Print "#STR$E567,$08($b==$FF)".
  $EE95,$03 #REGhl=#R$E567.
  $EE98,$03 Jump to #R$EE9B.

c $EE9B Events: Game Over
@ $EE9B label=Events_GameOver
N $EE9B Force a newline to be "printed".
  $EE9B,$02 #REGa=#N$0D.
  $EE9D,$03 Call #R$BAC3.
  $EEA0,$03 Call #R$BAB1.
N $EEA3 Tidy up the stack.
  $EEA3,$03 Restore #REGhl, #REGhl and #REGhl from the stack.
  $EEA6,$03 Jump to #R$EDD7.

c $EEA9 Events: Seagull
@ $EEA9 label=Event_Seagull
N $EEA9 Print "#STR$D6EA,$08($b==$FF)".
  $EEA9,$03 #REGhl=#R$D6EA.
  $EEAC,$03 Call #R$BAB1.
N $EEAF Print "#STR$D716,$08($b==$FF)".
  $EEAF,$03 #REGhl=#R$D716.
  $EEB2,$03 Call #R$C579.
  $EEB5,$02 #REGa=#N$80.
  $EEB7,$03 Call #R$C3EA.
  $EEBA,$01 Return.

c $EEBB Events: Rat
@ $EEBB label=Event_Rat
N $EEBB Print "#STR$D73C,$08($b==$FF)".
  $EEBB,$03 #REGhl=#R$D73C.
  $EEBE,$03 Call #R$BAB1.
N $EEC1 Print "#STR$D76E,$08($b==$FF)".
  $EEC1,$03 #REGhl=#R$D76E.
  $EEC4,$03 Call #R$C579.
  $EEC7,$02 #REGa=#N$81.
  $EEC9,$03 Call #R$C3EA.
  $EECC,$01 Return.

c $EECD Events: Deer
@ $EECD label=Event_Deer
N $EECD Print "#STR$D797,$08($b==$FF)".
  $EECD,$03 #REGhl=#R$D797.
  $EED0,$03 Call #R$BAB1.
N $EED3 Print "#STR$D7AA,$08($b==$FF)".
  $EED3,$03 #REGhl=#R$D7AA.
  $EED6,$03 Call #R$C579.
  $EED9,$02 #REGa=#N$82.
  $EEDB,$03 Call #R$C3EA.
  $EEDE,$01 Return.

c $EEDF Events: Pirate
@ $EEDF label=Event_Pirate
N $EEDF Print "#STR$D7C5,$08($b==$FF)".
  $EEDF,$03 #REGhl=#R$D7C5.
  $EEE2,$03 Call #R$BAB1.
  $EEE5,$02 #REGa=#N$0F.
  $EEE7,$03 Call #R$C582.
  $EEEA,$02 Jump to #R$EEF5 if the random generator returns a non-zero response.
  $EEEC,$04 Push #R$EDD7 onto the *#REGsp.
N $EEF0 Print "#STR$D7F6,$08($b==$FF)".
  $EEF0,$03 #REGhl=#R$D7F6.
  $EEF3,$02 Jump to #R$EEF8.
@ $EEF5 label=Event_Pirate_Safe
N $EEF5 Print "#STR$D7DE,$08($b==$FF)".
  $EEF5,$03 #REGhl=#R$D7DE.
@ $EEF8 label=Event_Pirate_PrintAndReturn
  $EEF8,$03 Call #R$C579.
  $EEFB,$01 Return.

c $EEFC Events: Water Snake
@ $EEFC label=Event_WaterSnake
N $EEFC Print "#STR$D821,$08($b==$FF)".
  $EEFC,$03 #REGhl=#R$D821.
  $EEFF,$03 Call #R$BAB1.
  $EF02,$02 #REGa=#N$04.
  $EF04,$03 Call #R$C582.
  $EF07,$02 Jump to #R$EF1F if the random generator returns a non-zero response..
N $EF09 Print "#STR$D84C,$08($b==$FF)".
  $EF09,$03 #REGhl=#R$D84C.
  $EF0C,$03 Call #R$C579.
  $EF0F,$02 #REGa=#N$14.
  $EF11,$03 Call #R$C582.
  $EF14,$02 Jump to #R$EF24 if the random generator returns a non-zero response.
  $EF16,$04 Push #R$EDD7 onto the *#REGsp.
N $EF1A Print "#STR$D86A,$08($b==$FF)".
  $EF1A,$03 #REGhl=#R$D86A.
  $EF1D,$02 Jump to #R$EF2E.
@ $EF1F label=Event_WaterSnake_Safe_1
N $EF1F Print "#STR$D8AA,$08($b==$FF)".
  $EF1F,$03 #REGhl=#R$D8AA.
  $EF22,$02 Jump to #R$EF27.
@ $EF24 label=Event_WaterSnake_Safe_2
N $EF24 Print "#STR$D88C,$08($b==$FF)".
  $EF24,$03 #REGhl=#R$D88C.
@ $EF27 label=WaterSnake_Safe_Continue
  $EF27,$01 Stash #REGhl on the stack.
  $EF28,$02 #REGa=#N$86.
  $EF2A,$03 Call #R$C3EA.
  $EF2D,$01 Restore #REGhl from the stack.
@ $EF2E label=WaterSnake_PrintAndReturn
  $EF2E,$03 Call #R$C579.
  $EF31,$01 Return.

c $EF32 Events: Spider
@ $EF32 label=Event_Spider
N $EF32 Print "#STR$D8D8,$08($b==$FF)".
  $EF32,$03 #REGhl=#R$D8D8.
  $EF35,$03 Call #R$BAB1.
  $EF38,$02 #REGa=#N$0A.
  $EF3A,$03 Call #R$C582.
  $EF3D,$02 Jump to #R$EF48 if the random generator returns a non-zero response.
  $EF3F,$03 #REGhl=#R$EDD7.
  $EF42,$01 Exchange the *#REGsp with the #REGhl register.
N $EF43 Print "#STR$D922,$08($b==$FF)".
  $EF43,$03 #REGhl=#R$D922.
  $EF46,$02 Jump to #R$EF50.
@ $EF48 label=Event_Spider_Safe
  $EF48,$02 #REGa=#N$87.
  $EF4A,$03 Call #R$C3EA.
N $EF4D Print "#STR$D8FA,$08($b==$FF)".
  $EF4D,$03 #REGhl=#R$D8FA.
@ $EF50 label=Event_Spider_PrintAndReturn
  $EF50,$03 Call #R$C579.
  $EF53,$01 Return.

c $EF54
  $EF54,$03 #REGhl=#R$BC6F.
  $EF57,$02 Test bit 0 of *#REGhl.
  $EF59,$02 Jump to #R$EF7B if ?? is equal to #N$00.
  $EF5B,$03 #REGhl=#R$BC67.
  $EF5E,$02 Write #N$06 to *#REGhl.
  $EF60,$04 Jump to #R$EF7B if #REGa is not equal to #N$2C.
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
  $EF83,$07 Jump to #R$EFA7 if *#R$BCCB is not equal to #N$30.
  $EF8A,$02 #REGa=#N$29.
  $EF8C,$03 Call #R$C35F.
  $EF8F,$02 Jump to #R$EFA7 if #REGa is not equal to #N$29.
  $EF91,$03 #REGhl=#R$BC6F.
  $EF94,$02 Set bit 0 of *#REGhl.
  $EF96,$07 Write #N$00 to #LIST { *#R$EC27 } { *#R$EC2A } LIST#
  $EF9D,$03 #REGhl=#R$BC66.
  $EFA0,$02 Set bit 0 of *#REGhl.
  $EFA2,$05 Write #N$06 to *#R$BC67.
  $EFA7,$02 #REGa=#N$2B.
  $EFA9,$03 Call #R$C35F.
  $EFAC,$02 Jump to #R$EFB8 if #REGa is not equal to #N$2B.
  $EFAE,$03 #REGhl=#R$BC66.
  $EFB1,$02 Set bit 1 of *#REGhl.
  $EFB3,$05 Write #N$05 to *#R$BC68.
  $EFB8,$02 #REGa=#N$2A.
  $EFBA,$03 Call #R$C35F.
  $EFBD,$02 Jump to #R$EFC9 if #REGa is not equal to #N$2A.
  $EFBF,$03 #REGhl=#R$BC66.
  $EFC2,$02 Set bit 3 of *#REGhl.
  $EFC4,$05 Write #N$07 to *#R$BC6A.
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
N $F027 Print "#STR$E5CF,$08($b==$FF)".
  $F027,$03 #REGhl=#R$E5CF.
  $F02A,$03 Call #R$BAB1.
  $F02D,$01 Restore #REGhl from the stack.
  $F02E,$03 #REGhl=#R$EDD7.
  $F031,$01 Exchange the *#REGsp with the #REGhl register.
N $F032 Print "#STR$E5ED,$08($b==$FF)".
  $F032,$03 #REGhl=#R$E5ED.
  $F035,$03 Call #R$C579.
  $F038,$01 Return.

  $F039,$01 Return.

c $F03A
  $F03A,$03 Call #R$BAB1.
  $F03D,$01 Return.

  $F03E,$03 Call #R$C579.
  $F041,$01 Return.

N $F042 Print "#STR$D9F3,$08($b==$FF)".
  $F042,$03 #REGhl=#R$D9F3.
  $F045,$02 Jump to #R$F03A.

N $F047 Print "#STR$DA0D,$08($b==$FF)".
  $F047,$03 #REGhl=#R$DA0D.
  $F04A,$02 Jump to #R$F03A.

N $F04C Print "#STR$BFC4,$08($b==$FF)".
  $F04C,$03 #REGhl=#R$BFC4.
  $F04F,$02 Jump to #R$F03A.

N $F051 Print "#STR$DA59,$08($b==$FF)".
  $F051,$03 #REGhl=#R$DA59.
  $F054,$02 Jump to #R$F03A.

N $F056 Print "#STR$DA67,$08($b==$FF)".
  $F056,$03 #REGhl=#R$DA67.
  $F059,$02 Jump to #R$F03A.

N $F05B Print "#STR$BF62,$08($b==$FF)".
  $F05B,$03 #REGhl=#R$BF62.
  $F05E,$02 Jump to #R$F03A.

N $F060 Print "#STR$BF82,$08($b==$FF)".
  $F060,$03 #REGhl=#R$BF82.
  $F063,$02 Jump to #R$F03A.

N $F065 Print "#STR$BF98,$08($b==$FF)".
  $F065,$03 #REGhl=#R$BF98.
  $F068,$02 Jump to #R$F03A.

N $F06A Print "#STR$BF0B,$08($b==$FF)".
  $F06A,$03 #REGhl=#R$BF0B.
  $F06D,$02 Jump to #R$F03A.

N $F06F Print "#STR$BF00,$08($b==$FF)".
  $F06F,$03 #REGhl=#R$BF00.
  $F072,$02 Jump to #R$F03A.

N $F074 Print "#STR$BEEA,$08($b==$FF)".
  $F074,$03 #REGhl=#R$BEEA.
  $F077,$02 Jump to #R$F03A.

N $F079 Print "#STR$DEFB,$08($b==$FF)".
  $F079,$03 #REGhl=#R$DEFB.
  $F07C,$02 Jump to #R$F03A.

N $F07E Print "#STR$E067,$08($b==$FF)".
  $F07E,$03 #REGhl=#R$E067.
  $F081,$02 Jump to #R$F03A.

N $F083 Print "#STR$E224,$08($b==$FF)".
  $F083,$03 #REGhl=#R$E224.
  $F086,$02 Jump to #R$F03A.

N $F088 Print "#STR$E2C9,$08($b==$FF)".
  $F088,$03 #REGhl=#R$E2C9.
  $F08B,$02 Jump to #R$F03A.

N $F08D Print "#STR$E2DC,$08($b==$FF)".
  $F08D,$03 #REGhl=#R$E2DC.
  $F090,$02 Jump to #R$F03A.

N $F092 Print "#STR$E4BC,$08($b==$FF)".
  $F092,$03 #REGhl=#R$E4BC.
  $F095,$02 Jump to #R$F03A.

N $F097 Print "#STR$E5B4,$08($b==$FF)".
  $F097,$03 #REGhl=#R$E5B4.
  $F09A,$02 Jump to #R$F03A.

  $F09C,$03 Call #R$C470.
  $F09F,$01 Return if ?? is less than #N$00.
  $F0A0,$02 #REGa=#N$18.
  $F0A2,$03 Call #R$C35F.
  $F0A5,$02 Jump to #R$F0C2 if ?? is not equal to #N$18.
  $F0A7,$03 #REGhl=#R$BC54.
  $F0AA,$02 Test bit 1 of *#REGhl.
  $F0AC,$02 Jump to #R$F0BC if ?? is not equal to #N$18.
  $F0AE,$02 Set bit 1 of *#REGhl.
N $F0B0 Print "#STR$D974,$08($b==$FF)".
  $F0B0,$03 #REGhl=#R$D974.
  $F0B3,$03 Call #R$BAB1.
N $F0B6 Print "#STR$D993,$08($b==$FF)".
  $F0B6,$03 #REGhl=#R$D993.
  $F0B9,$03 Call #R$C579.
N $F0BC Print "#STR$D9B4,$08($b==$FF)".
  $F0BC,$03 #REGhl=#R$D9B4.
  $F0BF,$03 Jump to #R$F03E.
  $F0C2,$02 #REGa=#N$39.
  $F0C4,$03 Call #R$C35F.
  $F0C7,$02 Jump to #R$F0CF if ?? is not equal to #N$39.
N $F0C9 Print "#STR$D9CA,$08($b==$FF)".
  $F0C9,$03 #REGhl=#R$D9CA.
  $F0CC,$03 Jump to #R$F03A.
  $F0CF,$02 #REGa=#N$13.
  $F0D1,$03 Call #R$C35F.
  $F0D4,$02 Jump to #R$F0DC if ?? is not equal to #N$13.
N $F0D6 Print "#STR$D9DF,$08($b==$FF)".
  $F0D6,$03 #REGhl=#R$D9DF.
  $F0D9,$03 Jump to #R$F03A.
  $F0DC,$02 #REGa=#N$14.
  $F0DE,$03 Call #R$C35F.
  $F0E1,$03 Jump to #R$F042 if ?? is equal to #N$14.
  $F0E4,$02 #REGa=#N$2B.
  $F0E6,$03 Call #R$C35F.
  $F0E9,$03 Jump to #R$F042 if ?? is equal to #N$2B.
  $F0EC,$02 #REGa=#N$2A.
  $F0EE,$03 Call #R$C35F.
  $F0F1,$02 Jump to #R$F0F9 if ?? is not equal to #N$2A.
N $F0F3 Print "#STR$DA27,$08($b==$FF)".
  $F0F3,$03 #REGhl=#R$DA27.
  $F0F6,$03 Jump to #R$F03A.
  $F0F9,$02 #REGa=#N$27.
  $F0FB,$03 Call #R$C35F.
  $F0FE,$02 Jump to #R$F106 if ?? is not equal to #N$27.
N $F100 Print "#STR$DA33,$08($b==$FF)".
  $F100,$03 #REGhl=#R$DA33.
  $F103,$03 Jump to #R$F03A.
  $F106,$07 Jump to #R$F113 if *#R$BCCB is not equal to #N$02.
N $F10D Print "#STR$DA41,$08($b==$FF)".
  $F10D,$03 #REGhl=#R$DA41.
  $F110,$03 Jump to #R$F03A.
  $F113,$02 #REGa=#N$32.
  $F115,$03 Call #R$C35F.
  $F118,$03 Jump to #R$F042 if #REGa is equal to #N$32.
  $F11B,$03 #REGhl=#R$E8E9.
  $F11E,$03 Call #R$C401.
  $F121,$02 Jump to #R$F12B if #REGa is not equal to #N$32.
  $F123,$02 #REGa=#N$04.
  $F125,$03 Call #R$C35F.
  $F128,$03 Jump to #R$F042 if #REGa is equal to #N$04.
  $F12B,$03 Jump to #R$F047.
  $F12E,$03 Call #R$C470.
  $F131,$01 Return if #REGa is less than #N$04.
  $F132,$07 Jump to #R$F04C if *#R$BC98 is zero.
  $F139,$03 Call #R$BA6D.
  $F13C,$03 Call #R$BA89.
N $F13F Print "#STR$BF4F,$08($b==$FF)".
  $F13F,$03 #REGhl=#R$BF4F.
  $F142,$03 Call #R$BAB1.
  $F145,$02 #REGa=#N$01.
  $F147,$03 Call #R$C1FF.
  $F14A,$01 Return.
  $F14B,$03 Call #R$C470.
  $F14E,$01 Return if #REGa is less than #REGa.
  $F14F,$02 #REGe=#N$01.
  $F151,$03 Call #R$C21E.
  $F154,$01 Return.

c $F155

N $F8B2 Print "#STR$E0B4,$08($b==$FF)".
  $F8B2,$03 #REGhl=#R$E0B4.
  $F8B5,$03 Jump to #R$F03A.

  $F8B8,$03 #REGhl=#R$EA9E.
  $F8BB,$03 Call #R$C37F.
  $F8BE,$02 Jump to #R$F90A if ?? is not equal to #N$00.
  $F8C0,$02 #REGa=#N$0F.
  $F8C2,$03 Call #R$C3E4.
  $F8C5,$03 Jump to #R$F07E if ?? is not equal to #N$0F.
  $F8C8,$03 #REGhl=#R$E8B2.
  $F8CB,$03 Call #R$C401.
  $F8CE,$01 #REGb=#REGa.
  $F8CF,$02 Test bit 7 of #REGa.
  $F8D1,$02 Jump to #R$F8D9 if ?? is not equal to #N$0F.
N $F8D3 Print "#STR$E138,$08($b==$FF)".
  $F8D3,$03 #REGhl=#R$E138.
  $F8D6,$03 Jump to #R$F03A.

c $F8D9 Action: Shooting
@ $F8D9 label=Action_Shooting
  $F8D9,$01 Stash #REGbc on the stack.
N $F8DA Print "#STR$E0EB,$08($b==$FF)".
  $F8DA,$03 #REGhl=#R$E0EB.
  $F8DD,$03 Call #R$BAB1.
  $F8E0,$02 #REGa=#N$05.
  $F8E2,$03 Call #R$C582.
  $F8E5,$01 Restore #REGbc from the stack.
  $F8E6,$02 Jump to #R$F8EE if the random generator returns a non-zero response.
N $F8E8 Print "#STR$E122,$08($b==$FF)".
  $F8E8,$03 #REGhl=#R$E122.
  $F8EB,$03 Jump to #R$F03E.
@ $F8EE label=Action_Shooting_Success
  $F8EE,$01 #REGa=#REGb.
  $F8EF,$02 #REGa-=#N$03.
  $F8F1,$02 Reset bit 7 of #REGa.
  $F8F3,$01 #REGe=#REGa.
  $F8F4,$02 #REGd=#N$00.
  $F8F6,$03 #REGhl=#R$F904.
  $F8F9,$01 #REGhl+=#REGde.
  $F8FA,$01 #REGc=*#REGhl.
  $F8FB,$03 Call #R$C426.
N $F8FE Print "#STR$E0FF,$08($b==$FF)".
  $F8FE,$03 #REGhl=#R$E0FF.
  $F901,$03 Jump to #R$F03E.
B $F904,$06

c $F90A
  $F90A,$03 #REGhl=#R$EAA2.
  $F90D,$03 Call #R$C37F.
  $F910,$02 Jump to #R$F918 if ?? is not equal to #N$00.
N $F912 Print "#STR$E14B,$08($b==$FF)".
  $F912,$03 #REGhl=#R$E14B.
  $F915,$03 Jump to #R$F03A.
  $F918,$03 Jump to #R$F06F.
  $F91B,$03 Call #R$C47B.
  $F91E,$01 Return if ?? is less than #N$00.
  $F91F,$02 #REGa=#N$0F.
  $F921,$03 Call #R$C3E4.
  $F924,$02 Jump to #R$F92C if ?? is equal to #N$0F.
N $F926 Print "#STR$E15E,$08($b==$FF)".
  $F926,$03 #REGhl=#R$E15E.
  $F929,$03 Jump to #R$F03A.
  $F92C,$03 #REGhl=#R$EAA6.
  $F92F,$03 Call #R$C37F.
  $F932,$03 Jump to #R$F8C8 if ?? is equal to #N$0F.
  $F935,$03 #REGhl=#R$EAAC.
  $F938,$03 Call #R$C37F.
  $F93B,$02 Jump to #R$F943 if ?? is not equal to #N$0F.
N $F93D Print "#STR$E14B,$08($b==$FF)".
  $F93D,$03 #REGhl=#R$E14B.
  $F940,$03 Jump to #R$F03A.
  $F943,$03 Jump to #R$F097.
  $F946,$03 Call #R$C47B.
  $F949,$01 Return if ?? is less than #N$0F.
  $F94A,$03 #REGhl=#R$EAB2.
  $F94D,$03 Call #R$C37F.
  $F950,$02 Jump to #R$F960 if ?? is not equal to #N$0F.
  $F952,$08 Jump to #R$F06F if *#R$BCCB is not equal to #N$04.
  $F95A,$02 #REGa=#N$03.
  $F95C,$03 Call #R$EF54.
  $F95F,$01 Return.
  $F960,$03 #REGhl=#R$EAB5.
  $F963,$03 Call #R$C37F.
  $F966,$02 Jump to #R$F976 if #REGa is not equal to #N$03.
  $F968,$08 Jump to #R$F06F if *#R$BCCB is not equal to #N$03.
  $F970,$02 #REGa=#N$04.
  $F972,$03 Call #R$EF54.
  $F975,$01 Return.
  $F976,$03 #REGhl=#R$EABC.
  $F979,$03 Call #R$C37F.
  $F97C,$02 Jump to #R$F984 if #REGa is not equal to #N$04.
N $F97E Print "#STR$BED1,$08($b==$FF)".
  $F97E,$03 #REGhl=#R$BED1.
  $F981,$03 Jump to #R$F03A.
  $F984,$03 #REGhl=#R$EA0D.
  $F987,$03 Call #R$C37F.
  $F98A,$03 Jump to #R$F48D if #REGa is equal to #N$04.
  $F98D,$03 #REGhl=#R$EA1D.
  $F990,$03 Call #R$C37F.
  $F993,$03 Jump to #R$F4B4 if #REGa is equal to #N$04.
  $F996,$03 Jump to #R$F06F.
  $F999,$03 Call #R$C47B.
  $F99C,$01 Return if #REGa is less than #N$04.
  $F99D,$03 #REGhl=#R$E9CC.
  $F9A0,$03 Call #R$C37F.
  $F9A3,$02 Jump to #R$F9C1 if #REGa is not equal to #N$04.
  $F9A5,$03 #REGhl=#R$E895.
  $F9A8,$03 Call #R$C401.
  $F9AB,$01 #REGb=#REGa.
  $F9AC,$01 Stash #REGbc on the stack.
  $F9AD,$03 Call #R$C3E4.
  $F9B0,$02 Jump to #R$F9B6 if #REGa is not equal to #N$04.
  $F9B2,$03 #REGhl=#R$BC98.
  $F9B5,$01 Decrease *#REGhl by one.
  $F9B6,$01 Restore #REGbc from the stack.
  $F9B7,$01 #REGa=#REGb.
  $F9B8,$03 Call #R$C3EA.
N $F9BB Print "#STR$E175,$08($b==$FF)".
  $F9BB,$03 #REGhl=#R$E175.
  $F9BE,$03 Jump to #R$F03A.
  $F9C1,$03 #REGhl=#R$E9D7.
  $F9C4,$03 Call #R$C37F.
  $F9C7,$02 Jump to #R$F9D3 if *#REGhl is not equal to #N$04.
  $F9C9,$03 #REGhl=#R$EDD7.
  $F9CC,$01 Exchange the *#REGsp with the #REGhl register.
  $F9CD,$03 #REGhl=#R$E19B.
  $F9D0,$03 Jump to #R$F03A.
  $F9D3,$03 #REGhl=#R$E9E5.
  $F9D6,$03 Call #R$C37F.
  $F9D9,$02 Jump to #R$F9E1 if *#REGhl is not equal to #N$04.
  $F9DB,$03 #REGhl=#R$E208.
  $F9DE,$03 Jump to #R$F03A.
  $F9E1,$03 Jump to #R$F083.
  $F9E4,$03 Call #R$C47B.
  $F9E7,$01 Return if *#REGhl is less than #N$04.
  $F9E8,$03 #REGhl=#R$EAB8.
  $F9EB,$03 Call #R$C37F.
  $F9EE,$02 Jump to #R$FA14 if *#REGhl is not equal to #N$04.
  $F9F0,$03 #REGhl=#R$E87A.
  $F9F3,$03 Call #R$C401.
  $F9F6,$01 #REGb=#REGa.
  $F9F7,$02 #REGc=#N$0D.
  $F9F9,$01 Stash #REGbc on the stack.
  $F9FA,$03 Call #R$C3E4.
  $F9FD,$01 Restore #REGbc from the stack.
  $F9FE,$03 Jump to #R$F07E if *#REGhl is not equal to #N$0D.
  $FA01,$03 Call #R$C426.
  $FA04,$03 #REGhl=#R$BC66.
  $FA07,$02 Set bit 2 of *#REGhl.
  $FA09,$05 Write #N$06 to *#R$BC69.
N $FA0E Print "#STR$E238,$08($b==$FF)".
  $FA0E,$03 #REGhl=#R$E238.
  $FA11,$03 Jump to #R$F03A.
  $FA14,$03 #REGhl=#R$EABA.
  $FA17,$03 Call #R$C37F.
  $FA1A,$02 Jump to #R$FA39 if *#REGhl is not equal to #N$06.
  $FA1C,$03 #REGa=*#R$BCCB.
  $FA1F,$03 #REGhl=#R$FA35.
  $FA22,$03 #REGbc=#N($0004,$04,$04).
  $FA25,$02 CPIR.
  $FA27,$02 Jump to #R$FA2F if *#REGhl is equal to #N$06.
N $FA29 Print "#STR$E28E,$08($b==$FF)".
  $FA29,$03 #REGhl=#R$E28E.
  $FA2C,$03 Jump to #R$F03A.

N $FA2F Print "#STR$E2AC,$08($b==$FF)".
  $FA2F,$03 #REGhl=#R$E2AC.
  $FA32,$03 Jump to #R$F03A.
  $FA35,$01 Increment #REGd by one.
  $FA36,$03 #REGde=#N$6412.
  $FA39,$03 Jump to #R$F06F.
  $FA3C,$03 Call #R$C47B.
  $FA3F,$01 Return if #REGd is less than #N$06.
  $FA40,$03 #REGhl=#R$EABE.
  $FA43,$03 Call #R$C37F.
  $FA46,$02 Jump to #R$FA85 if #REGd is not equal to #N$06.
  $FA48,$03 #REGa=*#R$BCCB.
  $FA4B,$04 Jump to #R$FA53 if #REGa is equal to #N$61.
  $FA4F,$04 Jump to #R$FA85 if #REGa is not equal to #N$62.
  $FA53,$03 #REGhl=#R$E8CA.
  $FA56,$03 Call #R$C401.
  $FA59,$04 Jump to #R$FA63 if #REGa is not equal to #N$2E.
N $FA5D Print "#STR$E2F1,$08($b==$FF)".
  $FA5D,$03 #REGhl=#R$E2F1.
  $FA60,$03 Jump to #R$F03A.

  $FA63,$04 Jump to #R$FA6C if #REGa is equal to #N$2D.
  $FA67,$05 Jump to #R$F088 if #REGa is not equal to #N$30.
  $FA6C,$03 #REGbc=#N$2D2C.
  $FA6F,$03 Call #R$C426.
  $FA72,$03 #REGbc=#N$302F.
  $FA75,$03 Call #R$C426.
  $FA78,$05 Write #N$62 to *#R$ED57.
  $FA7D,$05 Write #N$61 to *#R$ED5C.
  $FA82,$03 Jump to #R$F06A.
  $FA85,$03 #REGhl=#R$EAC0.
  $FA88,$03 Call #R$C37F.
  $FA8B,$02 Jump to #R$FAA5 if #REGa is not equal to #N$61.
  $FA8D,$07 Jump to #R$FAA5 if *#R$BCCB is not equal to #N$6A.
  $FA94,$02 #REGa=#N$31.
  $FA96,$03 Call #R$C35F.
  $FA99,$03 Jump to #R$F088 if #REGa is equal to #N$31.
  $FA9C,$03 Call #R$F06F.
N $FA9F Print "#STR$E305,$08($b==$FF)".
  $FA9F,$03 #REGhl=#R$E305.
  $FAA2,$03 Jump to #R$F03A.
  $FAA5,$03 Jump to #R$F06F.
  $FAA8,$03 Call #R$C47B.
  $FAAB,$01 Return if #REGa is less than #N$31.
  $FAAC,$03 #REGhl=#R$EABE.
  $FAAF,$03 Call #R$C37F.
  $FAB2,$02 Jump to #R$FAE5 if #REGa is not equal to #N$31.
  $FAB4,$03 #REGa=*#R$BCCB.
  $FAB7,$04 Jump to #R$FABF if #REGa is equal to #N$61.
  $FABB,$04 Jump to #R$FAE5 if #REGa is not equal to #N$62.
  $FABF,$03 #REGhl=#R$E8CA.
  $FAC2,$03 Call #R$C401.
  $FAC5,$05 Jump to #R$F08D if #REGa is equal to #N$2D.
  $FACA,$05 Jump to #R$F08D if #REGa is equal to #N$30.
  $FACF,$03 #REGbc=#N$2C2D.
  $FAD2,$03 Call #R$C426.
  $FAD5,$03 #REGbc=#N$2F30.
  $FAD8,$03 Call #R$C426.
  $FADB,$07 Write #N$00 to: #LIST { *#R$ED57 } { *#R$ED5C } LIST#
  $FAE2,$03 Jump to #R$F06A.
  $FAE5,$03 #REGhl=#R$EAC0.
  $FAE8,$03 Call #R$C37F.
  $FAEB,$02 Jump to #R$FB05 if #REGa is not equal to #N$30.
  $FAED,$07 Jump to #R$FB05 if *#R$BCCB is not equal to #N$6A.
  $FAF4,$02 #REGa=#N$32.
  $FAF6,$03 Call #R$C35F.
  $FAF9,$03 Jump to #R$F08D if #REGa is equal to #N$32.
  $FAFC,$03 Call #R$F06F.
N $FAFF Print "#STR$E305,$08($b==$FF)".
  $FAFF,$03 #REGhl=#R$E305.
  $FB02,$03 Jump to #R$F03A.
  $FB05,$03 #REGhl=#R$EAC5.
  $FB08,$03 Call #R$C37F.
  $FB0B,$02 Jump to #R$FB13 if #REGa is not equal to #N$32.
N $FB0D Print "#STR$E31A,$08($b==$FF)".
  $FB0D,$03 #REGhl=#R$E31A.
  $FB10,$03 Jump to #R$F03A.
  $FB13,$03 Jump to #R$F06F.
  $FB16,$03 Call #R$C3AE.
  $FB19,$03 Jump to #R$F074 if #REGa is not equal to #N$32.
  $FB1C,$03 #REGhl=#R$EAC7.
  $FB1F,$03 Call #R$C37F.
  $FB22,$02 Jump to #R$FB6E if #REGa is not equal to #N$32.
  $FB24,$02 #REGa=#N$39.
  $FB26,$03 Call #R$C35F.
  $FB29,$03 Jump to #R$F06A if #REGa is not equal to #N$39.
  $FB2C,$02 #REGa=#N$29.
  $FB2E,$03 Call #R$C35F.
  $FB31,$02 Jump to #R$FB43 if #REGa is equal to #N$29.
  $FB33,$03 #REGhl=#R$EDD7.
  $FB36,$01 Exchange the *#REGsp with the #REGhl register.
N $FB37 Print "#STR$E333,$08($b==$FF)".
  $FB37,$03 #REGhl=#R$E333.
  $FB3A,$03 Call #R$BAB1.
N $FB3D Print "#STR$E36A,$08($b==$FF)".
  $FB3D,$03 #REGhl=#R$E36A.
  $FB40,$03 Jump to #R$F03E.

  $FB43,$03 #REGhl=#R$BC6F.
  $FB46,$02 Reset bit 0 of *#REGhl.
  $FB48,$02 #REGa=#N$29.
  $FB4A,$03 Call #R$C3EA.
  $FB4D,$03 #REGbc=#N($393A,$04,$04).
  $FB50,$03 Call #R$C426.
  $FB53,$05 Write #N$2F to *#R$EC27.
  $FB58,$05 Write #N$30 to *#R$EC2A.
  $FB5D,$05 Write #N$31 to *#R$EC30.
N $FB62 Print "#STR$E333,$08($b==$FF)".
  $FB62,$03 #REGhl=#R$E333.
  $FB65,$03 Call #R$BAB1.
N $FB68 Print "#STR$E384,$08($b==$FF)".
  $FB68,$03 #REGhl=#R$E384.
  $FB6B,$03 Jump to #R$F03E.
  $FB6E,$03 Jump to #R$F074.
  $FB71,$03 Call #R$C49F.
  $FB74,$01 Return if #REGa is less than #N$31.
  $FB75,$03 #REGhl=#R$EA70.
  $FB78,$03 Call #R$C37F.
  $FB7B,$02 Jump to #R$FB80 if #REGa is not equal to #N$31.
  $FB7D,$03 Jump to #R$F81B.
  $FB80,$03 Jump to #R$F06F.
  $FB83,$03 Call #R$C47B.
  $FB86,$01 Return if #REGa is less than #N$31.
  $FB87,$03 #REGhl=#R$BC54.
  $FB8A,$02 Test bit 2 of *#REGhl.
  $FB8C,$02 Jump to #R$FB96 if #REGa is not equal to #N$31.
  $FB8E,$02 Set bit 2 of *#REGhl.
N $FB90 Print "#STR$E3A3,$08($b==$FF)".
  $FB90,$03 #REGhl=#R$E3A3.
  $FB93,$03 Jump to #R$F03A.
  $FB96,$02 Test bit 3 of *#REGhl.
  $FB98,$02 Jump to #R$FBA2 if #REGa is not equal to #N$31.
  $FB9A,$02 Set bit 3 of *#REGhl.
N $FB9C Print "#STR$E3B8,$08($b==$FF)".
  $FB9C,$03 #REGhl=#R$E3B8.
  $FB9F,$03 Jump to #R$F03A.
N $FBA2 Print "#STR$E3F7,$08($b==$FF)".
  $FBA2,$03 #REGhl=#R$E3F7.
  $FBA5,$03 Jump to #R$F03A.
  $FBA8,$03 Call #R$C47B.
  $FBAB,$01 Return if #REGa is less than #N$31.
  $FBAC,$05 Jump to #R$F074 if #REGa is greater than #N$02.
  $FBB1,$03 #REGhl=#R$EACB.
  $FBB4,$03 Call #R$C37F.
  $FBB7,$02 Jump to #R$FBD2 if #REGa is not equal to #N$02.
  $FBB9,$02 #REGa=#N$34.
  $FBBB,$03 Call #R$C35F.
  $FBBE,$03 Jump to #R$F065 if #REGa is equal to #N$34.
  $FBC1,$03 #REGbc=#N$3B34.
  $FBC4,$03 Call #R$C426.
  $FBC7,$05 Write #N$60 to *#R$ED4F.
  $FBCC,$03 #REGhl=#R$E40B.
  $FBCF,$03 Jump to #R$F03A.
  $FBD2,$03 Jump to #R$F06F.
  $FBD5,$03 Call #R$C47B.
  $FBD8,$01 Return if #REGa is less than #N$60.
  $FBD9,$05 Jump to #R$F074 if #REGa is greater than #N$02.
  $FBDE,$03 #REGhl=#R$E9F1.
  $FBE1,$03 Call #R$C37F.
  $FBE4,$02 Jump to #R$FC0A if #REGa is not equal to #N$02.
  $FBE6,$02 #REGa=#N$11.
  $FBE8,$03 Call #R$C35F.
  $FBEB,$02 Jump to #R$FBF3 if #REGa is not equal to #N$11.
N $FBED Print "#STR$E44C,$08($b==$FF)".
  $FBED,$03 #REGhl=#R$E44C.
  $FBF0,$03 Jump to #R$F03A.

  $FBF3,$02 #REGa=#N$10.
  $FBF5,$03 Call #R$C3E4.
  $FBF8,$03 Jump to #R$F07E if #REGa is not equal to #N$10.
  $FBFB,$03 #REGbc=#N($1011,$04,$04).
  $FBFE,$03 Call #R$C426.
  $FC01,$03 Call #R$F06A.
N $FC04 Print "#STR$E467,$08($b==$FF)".
  $FC04,$03 #REGhl=#R$E467.
  $FC07,$03 Jump to #R$F03A.
  $FC0A,$03 #REGhl=#R$E9D3.
  $FC0D,$03 Call #R$C37F.
  $FC10,$02 Jump to #R$FC18 if #REGa is not equal to #N$10.
N $FC12 Print "#STR$E486,$08($b==$FF)".
  $FC12,$03 #REGhl=#R$E486.
  $FC15,$03 Jump to #R$F03A.
  $FC18,$03 #REGhl=#R$E9DB.
  $FC1B,$03 Call #R$C37F.
  $FC1E,$03 Jump to #R$F06F if #REGa is equal to #N$10.
  $FC21,$03 Jump to #R$F092.
  $FC24,$03 Call #R$C47B.
  $FC27,$01 Return if #REGa is less than #N$10.
  $FC28,$05 Jump to #R$F074 if #REGa is greater than #N$02.
  $FC2D,$03 #REGhl=#R$E9E1.
  $FC30,$03 Call #R$C37F.
  $FC33,$02 Jump to #R$FC5E if #REGa is not equal to #N$02.
  $FC35,$02 #REGa=#N$03.
  $FC37,$03 Call #R$C35F.
  $FC3A,$03 Jump to #R$F079 if #REGa is equal to #N$03.
  $FC3D,$02 #REGa=#N$02.
  $FC3F,$03 Call #R$C3E4.
  $FC42,$03 Jump to #R$F07E if #REGa is not equal to #N$02.
  $FC45,$03 #REGbc=#N$0203.
  $FC48,$03 Call #R$C426.
  $FC4B,$03 #REGhl=#R$BC66.
  $FC4E,$02 Set bit 6 of *#REGhl.
  $FC50,$05 Write #N$06 to *#R$BC6D.
  $FC55,$03 Call #R$F06A.
  $FC58,$03 #REGhl=#R$E4D1.
  $FC5B,$03 Jump to #R$F03A.
  $FC5E,$03 Jump to #R$F06F.
  $FC61,$03 Call #R$C47B.
  $FC64,$01 Return if #REGa is less than #N$06.
  $FC65,$05 Jump to #R$F074 if #REGa is greater than #N$02.
  $FC6A,$03 #REGhl=#R$EACD.
  $FC6D,$03 Call #R$C37F.
  $FC70,$02 Jump to #R$FC8C if #REGa is not equal to #N$02.
  $FC72,$03 #REGa=*#R$BCCB.
  $FC75,$05 Jump to #R$F079 if #REGa is equal to #N$52.
  $FC7A,$05 Jump to #R$F079 if #REGa is equal to #N$3F.
  $FC7F,$02 #REGb=#N$3F.
  $FC81,$04 Jump to #R$FC87 if #REGa is equal to #N$3E.
  $FC85,$02 #REGb=#N$52.
  $FC87,$01 #REGa=#REGb.
  $FC88,$03 Call #R$EF54.
  $FC8B,$01 Return.

  $FC8C,$03 #REGhl=#R$EACF.
  $FC8F,$03 Call #R$C37F.
  $FC92,$03 Jump to #R$F074 if #REGa is equal to #N$52.
  $FC95,$03 Jump to #R$F06F.
  $FC98,$03 Call #R$C47B.
  $FC9B,$01 Return if #REGa is less than #N$52.
  $FC9C,$03 #REGhl=#R$EAD8.
  $FC9F,$03 Call #R$C37F.
  $FCA2,$02 Jump to #R$FCAA if #REGa is not equal to #N$52.
N $FCA4 Print "#STR$E305,$08($b==$FF)".
  $FCA4,$03 #REGhl=#R$E305.
  $FCA7,$03 Jump to #R$F03A.
  $FCAA,$03 #REGhl=#R$EADD.
  $FCAD,$03 Call #R$C37F.
  $FCB0,$02 Jump to #R$FCCA if #REGa is not equal to #N$52.
  $FCB2,$02 #REGa=#N$4A.
  $FCB4,$03 Call #R$C35F.
  $FCB7,$03 Jump to #R$F079 if #REGa is equal to #N$4A.
  $FCBA,$02 #REGa=#N$4A.
  $FCBC,$03 Call #R$C3F1.
  $FCBF,$02 #REGa=#N$3B.
  $FCC1,$03 Call #R$C3F1.
N $FCC4 Print "#STR$E508,$08($b==$FF)".
  $FCC4,$03 #REGhl=#R$E508.
  $FCC7,$03 Jump to #R$F03A.
  $FCCA,$03 Jump to #R$F074.
  $FCCD,$03 Call #R$C47B.
  $FCD0,$01 Return if #REGa is less than #N$3B.
  $FCD1,$03 #REGhl=#R$EAE6.
  $FCD4,$03 Call #R$C37F.
  $FCD7,$02 Jump to #R$FCFF if #REGa is not equal to #N$3B.
  $FCD9,$08 Jump to #R$F06F if *#R$BCCB is equal to #N$6A.
  $FCE1,$02 #REGa=#N$2E.
  $FCE3,$03 Call #R$C35F.
  $FCE6,$03 Jump to #R$F079 if #REGa is not equal to #N$2E.
  $FCE9,$02 #REGa=#N$1F.
  $FCEB,$03 Call #R$C3E4.
  $FCEE,$02 Jump to #R$FCF6 if #REGa is equal to #N$1F.
N $FCF0 Print "#STR$E604,$08($b==$FF)".
  $FCF0,$03 #REGhl=#R$E604.
  $FCF3,$03 Jump to #R$F03A.
  $FCF6,$03 #REGbc=#N($2E2D,$04,$04).
  $FCF9,$03 Call #R$C426.
  $FCFC,$03 Jump to #R$F06A.
  $FCFF,$03 Jump to #R$F06F.
  $FD02,$03 Call #R$C4B7.
  $FD05,$01 Return if #REGa is less than #N$1F.
  $FD06,$05 Jump to #R$F074 if #REGa is greater than #N$02.
  $FD0B,$03 #REGa=*#R$BCCB.
  $FD0E,$03 #REGhl=#R$FD1E.
  $FD11,$03 #REGbc=#N($0003,$04,$04).
  $FD14,$02 CPIR.
  $FD16,$02 Jump to #R$FD21 if #REGa is equal to #N$02.
N $FD18 Print "#STR$DC37,$08($b==$FF)".
  $FD18,$03 #REGhl=#R$DC37.
  $FD1B,$03 Jump to #R$F03A.
  $FD1E,$01 #REGl=#REGe.
  $FD1F,$01 Increment #REGb by one.
  $FD20,$01 Write #REGa to *#REGbc.
  $FD21,$04 Jump to #R$FD29 if #REGa is not equal to #N$02.
  $FD25,$03 Call #R$EF54.
  $FD28,$01 Return.

  $FD29,$03 #REGhl=#R$EAEC.
  $FD2C,$03 Call #R$C37F.
  $FD2F,$02 Jump to #R$FD3F if #REGa is not equal to #N$02.
  $FD31,$08 Jump to #R$F079 if *#R$BCCB is not equal to #N$04.
  $FD39,$02 #REGa=#N$6B.
  $FD3B,$03 Call #R$EF54.
  $FD3E,$01 Return.
  $FD3F,$03 #REGhl=#R$EAF5.
  $FD42,$03 Call #R$C37F.
  $FD45,$02 Jump to #R$FD54 if #REGa is not equal to #N$6B.
  $FD47,$07 Jump to #R$FD67 if *#R$BCCB is not equal to #N$6B.
  $FD4E,$02 #REGa=#N$04.
  $FD50,$03 Call #R$EF54.
  $FD53,$01 Return.

  $FD54,$03 #REGhl=#R$EAFE.
  $FD57,$03 Call #R$C37F.
  $FD5A,$02 Jump to #R$FD67 if #REGa is equal to #N$04.
  $FD5C,$03 #REGhl=#R$EB07.
  $FD5F,$03 Call #R$C37F.
  $FD62,$02 Jump to #R$FD67 if #REGa is equal to #N$04.
  $FD64,$03 Jump to #R$F074.
  $FD67,$02 #REGa=#N$02.
  $FD69,$03 Call #R$EF54.
  $FD6C,$01 Return.
  $FD6D,$03 Call #R$C47B.
  $FD70,$01 Return if #REGa is less than #N$02.
  $FD71,$05 Jump to #R$F074 if #REGa is equal to #N$02.
N $FD76 Print "#STR$DB5F,$08($b==$FF)".
  $FD76,$03 #REGhl=#R$DB5F.
  $FD79,$03 Jump to #R$F03A.
N $FD7C Print "#STR$E5A4,$08($b==$FF)".
  $FD7C,$03 #REGhl=#R$E5A4.
  $FD7F,$03 Jump to #R$F03A.

c $FD82 Game Start
@ $FD82 label=GameStart
  $FD82,$0B Copy #N$0144 bytes from #R$FDB5 to #R$BBF0.
  $FD8D,$04 #REGix=#R$ED9E.
  $FD91,$04 #REGb=*#R$BD32.
  $FD95,$01 #REGa=#N$00.
@ $FD96 label=GameStart_Loop
  $FD96,$03 #REGl=*#REGix+#N$00.
  $FD99,$03 #REGh=*#REGix+#N$01.
  $FD9C,$01 Write #REGa to *#REGhl.
  $FD9D,$04 Increment #REGix by two.
  $FDA1,$02 Decrease counter by one and loop back to #R$FD96 until counter is zero.
  $FDA3,$05 Write #N$2F to *#R$EC27.
  $FDA8,$05 Write #N$30 to *#R$EC2A.
  $FDAD,$02 #REGa=#N$03.
  $FDAF,$03 Call #R$EF54.
  $FDB2,$03 Jump to #R$EDC4.

g $FDB5 Default Game State
@ $FDB5 label=DefaultGameState
B $FDB5,$0144

u $FEF9
B $FEF9,$01

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
N $FF24 Displays the graphic for the cavern.
@ $FF24 label=DisplayGraphic_Cavern
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

g $FF3A Jump Table:
@ $FF3A label=JumpTable_
W $FF3A,$02 #N((#PC-$FF3A)/$02).
L $FF3A,$02,$26

g $FF86 Jump Table: Events
@ $FF86 label=JumpTable_Events
@ $FF96 label=JumpTable_ScenicEvents
W $FF86,$02 #N((#PC-$FF86)/$02).
L $FF86,$02,$11

g $FFA8 Table: Location Graphics
@ $FFA8 label=Table_LocationGraphics
W $FFA8,$02 Location Slot: #N((#PC-$FFA8)/$02).
L $FFA8,$02,$0D

u $FFC2
