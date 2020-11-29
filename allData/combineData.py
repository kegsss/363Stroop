# Run to combine all csv files into a single csv file with an index for each trial run

import glob
import os
import pandas as pd
import numpy as np

if os.path.exists("allData.csv"):
	os.remove("allData.csv")

allFilenames=[i for i in glob.glob('*.{}'.format('csv'))]


allData=pd.concat([pd.read_csv(f,header=None).assign(id=i) for f, i in zip(allFilenames,range(1,len(allFilenames)+1))], ignore_index=True)	

allData.to_csv("allData.csv",index=False, header=None)
