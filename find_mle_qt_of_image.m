function mle_Q = find_mle_qt_of_image(Mr,compatible_q)
if (nargin<2)
  compatible_q = [1:100];
end
% Guess the Qs values with MLE of the image
[rows, cols] = size(Mr);
min_d = inf;
mle_Q = [];
for q = compatible_q
  max_RQ2 = 0;
  % sum_d = 0;
  Ts = getqt(q);
  for i=1:rows
    for j=1:cols
      Br = Mr{i,j};
      % Skip saturated Blocks (has_truncated do not detect this problem)
      if (ismember(255,Br) || ismember(0,Br))
        continue;
      end
      [Br2, has_truncated] = dct_qt_block_cycle(Br,Ts);
      % Skip truncated blocks (unsaturated blocks may be truncated)
      if (has_truncated)
        continue;
      end
      RQ2 = max(max(abs(int32(Br)-int32(Br2))));
      if (RQ2>max_RQ2)
        max_RQ2 = RQ2;
      end
      % sum_d = sum_d + sum(sum(abs(int32(Br)-int32(Br2))));
    end
  end
  if (max_RQ2 < min_d)
    min_d = max_RQ2;
    mle_Q = [q];
  elseif (max_RQ2 == min_d)
     mle_Q(end+1)= q;
  end
end

