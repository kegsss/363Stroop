from psychopy import visual,core,clock,event
import random as r
import csv
from datetime import datetime

now=datetime.now()
date_time=now.strftime("%Y-%m-%d_%H:%M:%S")
filename="stroop"+date_time+".csv"

keyAssign=["q","z","slash"]
colourOptions=["yellow","red","blue","green"]

probCongruent=0.25

numberTrials=20
RTclock=core.Clock()

win=visual.Window(size=(600,600))

instructionText="Press 'z' when congruent and '/' when incongruent. Press any key to start."

showInstruction=visual.TextStim(win,instructionText,color="black",height=0.1)
showInstruction.draw()
win.flip()
event.waitKeys()

for i in range(numberTrials):
	
	r.shuffle(colourOptions)

	if r.random()<probCongruent:
		writtenColour=colourOptions[0]
		displayColour=colourOptions[0]
		congruent=1
	else:
		writtenColour=colourOptions[0]
		displayColour=colourOptions[1]
		congruent=0
	

	displayText = visual.TextStim(win,writtenColour,color=displayColour,height=0.2)

	displayText.draw()
	win.flip()
	RTclock.reset()
	key=event.waitKeys(keyList=keyAssign)
	rt=RTclock.getTime()
	if (key[0]==keyAssign[0]):
		core.quit()
		
	with open(filename,'a',newline='') as csvfile:
		posnerwrite=csv.writer(csvfile,delimiter=' ')
		posnerwrite.writerow([writtenColour] + [displayColour] + [congruent] + [key[0]] + [rt])

core.wait(1)
core.quit()
