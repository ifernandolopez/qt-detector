clear;
% Calculate the fitting parameters of the Generalized Benford model on the indicated image
% see https://es.mathworks.com/help/curvefit/examples/surface-fitting-with-custom-equations-to-biopharmaceutical-data.html

M = get_image_blocks('/Volumes/autor/storage/datasets/quantization/002_O.png');

% Define fitting model
x = [1:9];
model = fittype('N*log10(1+1/(s+x^q))','independent','x','dependent','P');
opts = fitoptions(model);
opts.Lower = [-Inf, -Inf -1];
opts.Upper = [Inf, Inf 1];
opts.StartPoint = [1 1 0];

% Compute fitting parameters for each Q
F = zeros(0,4);
for Q=[100 90 80 70 60 50]
  H = get_histogram(M,Q);
  P = H/sum(H);
  f = fit(x',P',model,opts);
  c = coeffvalues(f);
  F(end+1,:) = [Q c];
end


