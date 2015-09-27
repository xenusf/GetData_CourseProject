## Code Book - Averages for HAR Data Observations

[SubjectID]
  Integer ID for test subject (1 through 30)
  
[Activity Name]
  Name of activity oberved
    (6 values: 'LAYING', 'SITTING', 'STANDING', 'WALKING', 'WALKING_DOWNSTAIRS', 'WALKING_UPSTAIRS')

Measurement Column Naming:
    Prefix 't' indicates time domain (acceleration)
    Prefix 'f' indicates frequency domain (using FFT)

    Suffixes 'X','Y','Z' indicate dimensional plane of measurement
      (no XYZ suffix is for 3D summary magnitude)
    pre-suffix std() indicates standard deviation; mean() indicates statistical mean
    
    'Body' vs 'Gravity' for acceleration type
    'Acc' vs 'Gyro' for accelerometer vs gyroscope measurements
    'Jerk' derived from linear acceleration & angular velocity
    'Mag' for magnitude of 3D signals

    