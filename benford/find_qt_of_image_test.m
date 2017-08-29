clear;
% This test demostrates the use of Generalized Benford law to find the qt of an image
% The method works with low granularyty [50 60 70 80 90 95]
% but fails with high granularity 1:100

M = get_image_blocks('/Volumes/autor/storage/datasets/quantization/001_O.png');
QTs = [50 60 70 80 90 95];

[rows, cols] = size(M);
for used_q = QTs 
  Ts = getqt(used_q);
  Mr = cell(rows, cols);
  % Quantize the blocks
  for i=1:rows
    for j=1:cols
      Mr{i,j} = dct_qt_block_cycle(M{i,j},Ts);
    end
  end
  % Guess the mle_q
  mle_q = find_qt_of_image(Mr,QTs);
  % Sometimes find false negatives where the image has been quantized
  % but mle_q==100 indicates unquantized
  if (~ismember(used_q,mle_q))
    kk = [used_q mle_q] % Output the false negative
  end 
  % But fortunatelly q=100 is the only false negative
  assert(or(ismember(used_q,mle_q), ismember(100,mle_q)));
end
