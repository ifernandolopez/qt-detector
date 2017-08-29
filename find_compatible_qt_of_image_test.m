clear;
% This test demostrates that the compatibility test method always produce
% ismember(used_q,guess_q) as one of the solutions
% Never produce false solutions

M = get_image_blocks('/Volumes/autor/storage/datasets/quantization/001_O.png');

compatible_solutions = 0;

[rows, cols] = size(M);
for used_q = 1:100
  Ts = getqt(used_q);
  Mr = cell(rows, cols);
  % Quantize the blocks
  for i=1:rows
    for j=1:cols
      Mr{i,j} = dct_qt_block_cycle(M{i,j},Ts);
    end
  end
  % Guess the q
  guess_q = find_compatible_qt_of_image(Mr);
  % Count the number of compatible solutions
  compatible_solutions = compatible_solutions + length(guess_q);
  % With this method used_q is always one of the compatible solutions
  if (~ismember(used_q,guess_q))
    kk = [used_q guess_q] % Output the false solution (should never happen)
  end
  assert(ismember(used_q,guess_q));
end
