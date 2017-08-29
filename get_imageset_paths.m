function paths = get_imageset_paths(pattern)
% Obtain image set in the pattern (e.g. '/Volumes/autor/storage/datasets/quantization/*_O.png')
files = dir(pattern);
paths = cell(0,1);
for f=files'
  paths{end+1} = strcat(f.folder,'/',f.name);
end

