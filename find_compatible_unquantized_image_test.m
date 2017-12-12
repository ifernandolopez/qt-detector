clear;
% This test demostrates that the compatibility method with unquantized images
% always find q==100 as one of the compatible solitions

% Path to CoMoFoD unquantized imageset
paths = get_imageset_paths('/Volumes/autor/storage/datasets/quantization/*_O.png');

compatible_solutions = zeros(1,length(paths));

for path_i = 1:length(paths)
  path = paths{path_i};
  M = get_image_blocks(path);
  % Find guess_q==100 as one of the solutions with an unquantified image
  guess_q = find_compatible_qt_of_image(M);
  % Store the number of compatible solutions for each path_i
  compatible_solutions(path_i) = length(guess_q);
  assert(ismember(100,guess_q));
end

mean(compatible_solutions)
std(compatible_solutions)
