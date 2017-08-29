function H = get_histogram(M,q)
% M is a cell of blocks
% q is the quantization factor
% Return the count of the first digits in all the blocks
[rows, cols] = size(M);
H = zeros(1,9);
% Iterate blocks
for i=1:rows
  for j=1:cols
    % Compress, quantize and round
    C = jpeg_coefficients(M{i,j},q);
    % Abs the coefficients
    C = abs(C);
    % Get the first digit
    digits = floor( 1+log10(double(C)) );
    d = floor( double(C) ./ (10.^(digits-1)) );
    % Ignore DC coefficient
    d(1,1) = Inf;
    d = reshape(d,[1,64]);
    h = histc(d,1:9);
    H = H + h;
  end
end


