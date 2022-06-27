import pandas as pd
import numpy as np

#a = [] 
for i in range(5):
	#for chunk in  
	print('Reading ' + str(i) + '...')
	a = pd.read_csv('Binary_lake_smooth_topography.csv',usecols = [i]) 
	#a.append(chunk.values) 
	print('Saving '+ str(i) +'...') 
	# i+=1          
	np.array(a).astype('double').tofile('BinarySmooth' + str(i) +'.b')

