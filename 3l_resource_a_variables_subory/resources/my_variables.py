import os
import random
import time

TXT_VAR = "ROBOT FRAMEWORK"

USER = os.getlogin()              
RANDOM_INT = random.randint(0, 10)  
CURRENT_TIME = time.asctime()       
if time.localtime()[3] > 12:
    AFTERNOON = True
else:
    AFTERNOON = False