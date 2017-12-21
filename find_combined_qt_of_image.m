function combined_Q = find_combined_qt_of_image(Mr)
% Search the compatible_q of an image
compatible_q = find_compatible_qt_of_image(Mr);
% And subsequently determine mle_q as the compatible_q with MLE
combined_Q = find_mle_qt_of_image(Mr,compatible_q);

