import random
import numpy as np
import scipy.io as si
import glob
import os
import pickle


from sklearn import datasets, svm
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.externals import joblib
#iris = datasets.load_iris()
X_mat = si.loadmat('test_features_2.mat')
X = X_mat['total_features']

#X = iris.data[:,:2]
#y = iris.target 

filename = './total/1_1_3_model.sav'
svm_linear = joblib.load(filename)

predicted = svm_linear.predict(X)

np.savetxt('test_results_5.txt', predicted, delimiter=',')
