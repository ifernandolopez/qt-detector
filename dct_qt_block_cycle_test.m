clear;% Perform the float DCT2 and apply quantization table to a block% Initial block is in the 0-255 rangeB = [154 123 123 123 123 123 123 136;         192 180 136 154 154 154 136 110;         254 198 154 154 180 154 123 123;         239 180 136 180 180 166 123 123;         180 154 136 167 166 149 136 136;         128 136 123 136 154 180 198 154;         123 105 110 149 136 136 180 166;         110 136 123 123 123 136 154 136];Ts = getqt(90);[Br, has_truncated] = dct_qt_block_cycle(B,Ts,true);assert(has_truncated==0);[Br2, has_truncated] = dct_qt_block_cycle(Br,Ts,false);assert(has_truncated==0);