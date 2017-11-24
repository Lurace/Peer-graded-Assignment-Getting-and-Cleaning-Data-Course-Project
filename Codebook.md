CodeBook - complete_set
=======================
This is a tidy version of the Human Activity Recognition Using Smartphones Dataset Version 1.0
For more information view (www.smartlab.ws)

subject (int)
-------------
Identification number of the volunteer who performed the experiment
- 1:30

dataset (chr)
-------------
Dataset partition from which comes the record
- test
- training

activity (chr)
--------------
Each of the 6 activities performed by each subject to obtain the record
- laying
- sitting
- standing
- walking
- walking_downstairs
- walking_upstairs
 
signal (chr)
------------
Signals used to stimate variables of the feature vector
- FrequencyBodyAccelerometer
- FrequencyBodyAccelerometerJerk
- FrequencyBodyAccelerometerJerkMagnitude
- FrequencyBodyAccelerometerMagnitude
- FrequencyBodyGiroscope
- FrequencyBodyGiroscopeJerkMagnitude
- FrequencyBodyGiroscopeMagnitude
- TimeBodyAccelerometer
- TimeBodyAccelerometerJerk
- TimeBodyAccelerometerJerkMagnitude
- TimeBodyGiroscopeJerkMagnitude
- TimeBodyAccelerometerMagnitude
- TimeBodyGiroscope
- TimeBodyGiroscopeJerk
- TimeBodyGiroscopeMagnitude
- TimeGravityAccelerometer
- TimeGravityAccelerometerMagnitude

variable (chr)
--------------
Variable estimated for each signal
- mean
- std
	
axialdirection  (chr)
---------------------
Direction -XYZ of the signal
- X
- Y
- Z
- NA
 
value (num)
-----------
record
