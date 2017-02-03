# motion-tracking
In this project, motion tracking is implemented in videos using a particle filter and a kalman filter. The video initialization can vary, here an .avi is included for demostration. Target lock is also available.

Implemented for the use in e.g. surveillance systems. The project was done just for the sake of a more practical implementation of tracking problems during my free time.

# Instructions

Open the function Project.m and by using Ctrl+Enter you can run each cell in the order presented.

A user-friendly (I hope) interface will enable you to make choices of inputs and settings, using the getuserinput function in the initial cells.

Choices on filter (particle, kalman), verbose level, target lock, particle number, error plotting, resampling method (systematic, multinomial) are available.

The background image is extracted by taking the mean of each pixel intensity during the first 10 frames. I am sure this method can be improved, but I have no time to do it now.

I include the video file "4p0.avi" to demonstrate the use of the filters. Since github has a 25MB upload limit for each file, I split the video in 4 parts that can be extracted to one .avi file. Instruction file is found in the sample video folder.

Performance speed varries depending on the computer's computational abilities.
