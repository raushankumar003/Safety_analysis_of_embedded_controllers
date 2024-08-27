%Defining the necessary matrixes
Ad = [1.1053 0.0000; -0.0209 0.9900];
Bd = [0.0526 0.0105; 0.0393 0.0994];
K = [-4.7393 0.2430; 0.2277 -0.8620];

%The size of the state vector
stateSize = 2;

%The size of the control input vector
controlUnitSize = 2;

%For this to run, install the JSR toolbox of MATLAB.
zeroKill(Ad, Bd, K, stateSize, controlUnitSize);
zeroSkip(Ad, Bd, K, stateSize, controlUnitSize);
holdKill(Ad, Bd, K, stateSize, controlUnitSize);
holdSkip(Ad, Bd, K, stateSize, controlUnitSize);
