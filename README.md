# Camera Model Identification Based on Local Co-Occurrence Features

## Abstract

We apply the algorithm proposed by Chen etal
to identify camera models. The algorithm assumes that CFA
pattern used by the device is GBRG. Local co-occurrence
features are computed using multiple interpolation algorithms
(example nearest neighbour, bilinear). A multi-class linear SVM
is trained with these features and employed to classify the given
image to one of the camera classes. Some observations have been
made with respect to validation accuracy of the model and the
results obtained on Kaggle.

