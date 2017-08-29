clear;
% Calculate the fitting parameters of the Generalized Benford model on  all the image set
% see https://es.mathworks.com/help/curvefit/examples/surface-fitting-with-custom-equations-to-biopharmaceutical-data.html

% Define fitting model
x = [1:9];
model = fittype('N*log10(1+1/(s+x^q))','independent','x','dependent','P');
opts = fitoptions(model);
opts.Lower = [-Inf, -Inf -1];
opts.Upper = [Inf, Inf 1];
opts.StartPoint = [1 1 0];

% Compute histogram for each Q
Q = [1:100];
H = zeros(length(Q),length(x));
paths = get_imageset_paths('/Volumes/autor/storage/datasets/quantization/*_O.png');
for path_i = 1:length(paths)
  M = get_image_blocks(paths(path_i,:)); 
  for q_i= 1:length(Q)
    h = get_histogram(M,Q(q_i));
    H(q_i,:) = H(q_i,:) + h;
  end
end

% Compute fitting parameters for each Q
F = zeros(0,4);
for q_i = 1:length(Q)
  h = H(q_i,:);
  P = h/sum(h);
  f = fit(x',P',model,opts);
  c = coeffvalues(f);
  F(end+1,:) = [Q(q_i) c]
end





