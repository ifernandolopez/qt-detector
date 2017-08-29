clear;
M = get_image_blocks('/Volumes/autor/storage/datasets/quantization/001_O.png');
q = 90;
H = get_histogram(M,q);
P = H/sum(H);




