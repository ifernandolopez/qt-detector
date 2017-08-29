clear;
% This test demostrates that the MLE method always produce
% ismember(used_q,guess_q) as one of the solutions
% Sometimes produce the false solutions (~ismember(used_q,guess_q))
% but fortunatelly false solutions are only in the critical region

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
  guess_q = find_mle_qt_of_image(Mr);
  % Count the number of compatible solutions
  compatible_solutions = compatible_solutions + length(guess_q);
  % Sometimes find false solutions
  if (~ismember(used_q,guess_q))
    kk = [used_q guess_q] % Output the false solution
  end
  % But fortunatelly false solutions are only in the critical region
  assert(ismember(used_q,guess_q) || ismember(used_q,[95:99]));
end
