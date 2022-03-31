import pandas as pd
import numpy as np

#a = [] 
#i = 0 
#for chunk in  
a = pd.read_csv('Smooth_topographic_realization_50.csv',usecols = [3]) 
	#a.append(chunk.values) 
	# print(i) 
	# i+=1          
np.array(a).astype('double').tofile('MattsFile3.b')
