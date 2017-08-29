function mle_q = find_qt_of_image(Mr, QTs)
if (nargin<2)
  QTs = [50 60 70 80 90 95];
end
min_sse = Inf;
for Q = QTs
  sse = sse_goodness_of_fit(Mr,Q);
  if (sse < min_sse)
    min_sse = sse;
    mle_q = [Q];
  elseif (sse == min_sse)
    mle_q = [mle_q Q];
  end
end

function sse = sse_goodness_of_fit(Mr,Q)
% Calculate SSE (Sum of Squares due to Error) according to the formua in:
% @see https://es.mathworks.com/help/curvefit/evaluating-goodness-of-fit.html
% @see https://stackoverflow.com/questions/29027878/sum-of-squared-differences
% @see https://en.wikipedia.org/wiki/Residual_sum_of_squares
% Get the observed histogram
h = get_histogram(Mr,Q);
p = h/sum(h);
% Get the estimate histogram
global F;
if (isempty(F))
  F = get_fitting_params();
end
x = 1:9; N = F(Q,1); q = F(Q,2); s = F(Q,3);
f = N*log10(1+1./(s+x.^q));
f = f/(sum(f));
sse = sum( (p(:)-f(:)).^2 );
