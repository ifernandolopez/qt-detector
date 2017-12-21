function compatible_Q = find_compatible_qt_of_image(Mr)
% Search the compatible_q of an image
[rows, cols] = size(Mr);
compatible_Q = [];
for q = 1:100 
  compatible = true;
  Ts = getqt(q);
  for i=1:rows
    for j=1:cols
      Br = Mr{i,j};
      % Skip saturated Blocks (has_truncated do not detect this problem)
      if (ismember(255,Br) || ismember(0,Br))
        continue;
      end
      [Br2,has_truncated] = dct_qt_block_cycle(Br,Ts,false);
      assert(~has_truncated);  % Unsaturated block never truncate because round_block==false
      % Calculate block residues
      RBr = double(Br)-double(Br2);
      % Test the maximum residue property
      if (norm(RBr)>4)
        compatible = false;
      end
    end
  end
  if (compatible)
    compatible_Q(end+1)= q;
  end
end

