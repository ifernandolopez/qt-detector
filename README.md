# qt-detector
JPEG image quantization table detector

This source code implements our three proposed residue methods to detect the JPEG quantization table of an image (https://www.sciencedirect.com/science/article/pii/S1568494618301339):
- Compatibility test method
- Maximum Likelihood Estimation (MLE) method
- Combined method

Researchers can use our quantization table detector to find the quantization table as a step prior to the detection of a more complex forgery.

To evaluate the effectiveness of the method we have used the CoMoFoD database of forged images (http://www.vcl.fer.hr/comofod/). The experiments show that, for most of the quantization tables, our method has a success rate of 100%. We have found a critical region, which corresponds to the weakest quantization values, where our method occasionally fails. In particular, it yields false solutions indicating that the image is not quantized, while it is. These results indicate that the remaining challenge to be solved is to find methods that always succeed (without false solutions) in this critical region.
