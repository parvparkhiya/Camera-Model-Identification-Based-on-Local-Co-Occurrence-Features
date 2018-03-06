import random
import numpy as np
import scipy.io as si
import glob
import os
import pickle


from sklearn import datasets, svm
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

#iris = datasets.load_iris()
X_mat = si.loadmat('./total/train_final_features.mat')
Y_mat = si.loadmat('./total/train_labels.mat')

X = X_mat['train_final_features']
y = Y_mat['train_labels']

#X = iris.data[:,:2]
#y = iris.target 

#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=0)

# svc_linear = svm.SVC(C=1, class_weight=None, coef0=0.0,
#     decision_function_shape='ovr', degree=3, gamma='auto', kernel='rbf',
#     max_iter=-1, probability=False, random_state=None, shrinking=True,
#     tol=0.001, verbose=False)
    
svc_linear = svm.SVC(kernel='linear',C=35000,decision_function_shape='ovo')    
#filename = './total/1_5_model.sav'
#svm_linear = joblib.load(filename)

   
svc_linear.fit(X, y)
filename = './total/1_1_4_model.sav'
pickle.dump(svc_linear, open(filename, 'wb'))
