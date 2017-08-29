clear;
% This test demostrates that the combined method always success detecting
% unquantized images, reporting guess_q==100 as the only solution

% Path to CoMoFoD unquantized imageset
paths = get_imageset_paths('/Volumes/autor/storage/datasets/quantization/*_O.png');

for path_i = [1:length(paths)]
  path = paths{path_i};
  M = get_image_blocks(path);
  % Always guess_q==100 as the unique solution with an unquantified image
  guess_q = find_mle_qt_of_image(M);
  assert(guess_q==100);
end
