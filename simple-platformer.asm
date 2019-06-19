; NES Game Development Tutorial
;
; Author: Jonathan Moody
; Github: https://github.com/jonmoody

  .inesprg 1    ; Defines the number of 16kb PRG banks
  .ineschr 1    ; Defines the number of 8kb CHR banks
  .inesmap 0    ; Defines the NES mapper
  .inesmir 1    ; Defines VRAM mirroring of banks

  .bank 0
  .org $C000 ;game logic memory allocation 8kb

RESET: ; This is interupt only gets called once at on power on and reset

InfiniteLoop: ;This is an infinite game loop
  JMP InfiniteLoop

NMI: ; This gets called every grame. 60 fps
  RTI

  .bank 1
  .org $FFFA
  .dw NMI ;allocation for the NMI interrupt
  .dw RESET ;allocation for the NMI interrupt
  .dw 0

  .bank 2
  .org $0000 ; this bank will be used for future chr data
