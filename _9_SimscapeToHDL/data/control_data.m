% Control parameters
Ts = 2.5e-6;   % Fundamental sample time
fsw = 2e3;   % Switching frequency (Hz)
fc = fsw*20; % Control loop frequency (Hz)
Tsc = 1/fc;  % Control loop sample time
Gs = 1000; % Equivalent switch conductance