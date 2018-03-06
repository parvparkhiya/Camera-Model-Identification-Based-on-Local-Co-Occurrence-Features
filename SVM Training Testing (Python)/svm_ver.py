import random
import numpy as np
import scipy.io as si
import glob
import os


from sklearn import datasets, svm
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.externals import joblib

# iris = datasets.load_iris()
X_mat = si.loadmat('./total/test_final_features.mat')
Y_mat = si.loadmat('./total/test_labels.mat')

X = X_mat['test_final_features']
y = Y_mat['test_labels']

# X = iris.data[:,:2]
# y = iris.target 


# svc_linear = svm.SVC(C=1, class_weight=None, coef0=0.0,
#     decision_function_shape='ovr', degree=3, gamma='auto', kernel='rbf',
#     max_iter=-1, probability=False, random_state=None, shrinking=True,
#     tol=0.001, verbose=False)
filename = './total/1_1_4_model.sav'
svc_linear = joblib.load(filename)

predicted= svc_linear.predict(X)
cnf_matrix = confusion_matrix(y, predicted)
print(cnf_matrix)

from sklearn .metrics import accuracy_score

print(accuracy_score(y,predicted))
