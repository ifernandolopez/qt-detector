function C = jpeg_coefficients(B, q)

% 1. Level on to -128..127 range
B = int32(B)-128;

% 2. Multiply by the DCT transform matrix
global A;
if (isempty(A))
   A = dctmtx(8);
end
C = A*double(B)*A';

% 3. Quantize and round
C = int32(C./getqt(q));
 