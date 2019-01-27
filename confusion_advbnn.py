import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import itertools

# target_names = ['THERM','THERM-ADV','LID','SAP','RSE','CAS-ADV','VANILLA-1','VANILLA-2']
# cm = np.array([[100.00 ,2.90 , 3.27 , 5.38 , 7.67 , 1.80 , 5.30,11.06],
#  [2.01 , 100 , 1.11 , 1.47 , 1.73, 1.42 , 1.69, 1.9],
# [10.77 , 10.34 , 100 ,  6.68, 11.27, 6.18,28.58, 15.66],
# [20.00 , 6.13 , 4.14 , 100 , 17.98 , 4.70 , 10.72,26.63],
# [ 15.85 , 3.74 , 4.84 , 8.51 , 100 , 2.28 , 10.83,18.11],
# [3.70 , 7.42 , 1.67 , 3.83 , 2.76 , 100 , 11.66, 12.88],
# [ 9.14 , 6.16 ,15.64 ,4.89 , 10.29 , 4.69, 100.00, 12.49],
# [26.51,4.95,7.05,14.75,20.26,4.15,14.59,100.0]])
# cm = cm.transpose(0,1)

target_names = ['VANILLA-2','THERM-ADV','THERM','SAP','LID','RSE','CAS-ADV','VANILLA-1','ADV-TRAIN','ADV-BNN']
cm = np.array([[100,4.95,26.51,14.75,7.05,20.26,4.15,14.59, 15.41, 17.59],
                 [ 1.90, 100.00,2.01  , 1.47, 1.11 ,  1.73, 1.42 , 1.69, 22.01, 8.00],
                 [11.06,2.90 ,100.00 ,  5.38 ,3.27 , 7.67 , 1.80 , 5.30, 10.5, 12.4],
                 [26.63,6.13 ,20.00 , 100 , 4.14,17.98 , 4.70 , 10.72, 12.60, 14.49],
                 [15.66, 10.34, 10.77 , 6.68, 100 , 11.27, 6.18,28.58, 20.42, 33.48],
                 [ 18.11,3.74,15.85  , 8.51,4.84 ,   100 , 2.28 , 10.83, 13.33, 15.50],
                 [12.88,  7.42, 3.70 ,   3.83, 1.67 , 2.76 , 100 , 11.66, 13.58, 12.03],
                 [ 12.49,  6.16,9.14 ,4.89,15.64  , 10.29 , 4.69, 100.00, 18.5, 28.3],
				 [1.45, 3.61 , 0.86, 0.59, 0.64, 0.70, 0.79, 0.71, 100.00, 7.79],
				 [5.87,5.38,4.76,4.14,3.63,4.35,3.63,5.37,21.84,100.00],])

# cm = cm.transpose(7,1,0,3,2,4,5,6)



# target_names = ['SAP','THERM-ADV','THERM','LID','VANILLA-1','VANILLA-2']
# cm = np.array([[100,19.64,80.02	,30.54,	2.12,	8.51],
# 	[4.13,	100,	2.15,	3.14,	1.23,	1.13],
# 	[67.11,	20.02	,100	,52.66,	1.34	,2.17],
# 	[30.1,	20.83,	34.26,	100,	8.92,	3.15],
# 	[22.15,	12.75,	25.16,	48.51,	100,	0.21],
# 	[97.62,	17.1,	88.23,	37.93,	0.36	,100]])

#target_names = ['VANILLA-2','THERM-ADV','THERM','SAP','LID','VANILLA-1',]

#cm = np.array([[100,17.10,88.23 ,97.62, 37.93, 33.42],
#    [1.78,  100,    2.15,  4.13, 3.14,   1.87],
 #   [36.79, 20.02   ,100 ,  67.11 ,52.66, 30.11    ],
 #   [77.10, 19.64,80.02,100    ,30.54, 32.13],
 #   [17.76,  20.83,  34.26, 30.10, 100,    21.49],
 #   [30.56, 12.75,  25.16, 22.15, 48.51,  100,    ]])




cm = cm.T
print(cm)

#if cmap is None:
cmap = plt.get_cmap('tab20b') ###  RdGy cool tab20b tab20c

plt.figure(figsize=(8, 6.5))
#plt.subplot(1,2,1)

plt.imshow(cm, interpolation='nearest', cmap=cmap)
#plt.title('Confusion Matrix')
plt.colorbar()

if target_names is not None:
    tick_marks = np.arange(len(target_names))
    plt.xticks(tick_marks, target_names, rotation=45)
    plt.yticks(tick_marks, target_names)

#if normalize:
#cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]


thresh = cm.max() / 100

for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
    plt.text(j, i, "{:0.2f}".format(cm[i, j]),
                 horizontalalignment="center",
                 color="white" if cm[i, j] > thresh else "black", fontsize= 12)
    # plt.text(j, i, "{:,}".format(cm[i, j]),
    #          horizontalalignment="center",
    #          color="white" if cm[i, j] > thresh else "black")


plt.tight_layout()
#plt.ylabel('Defense methods', fontsize = 16)
#plt.xlabel('Perturbation', fontsize = 16)

#plt.subplot(1,2,2)

# plt.savefig('mtfig')
plt.show()
