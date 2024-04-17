% PMSM parameters 
PM = 0.03; % Permanent magnet flux linkage
Ld = 2e-4;  % d-axis inductance
Lq = 2e-4;  % q-axis inductance
L0 = 2e-4;  % 0-axis inductance
Rs = 0.013; % Stator resistance
N = 6; % Number of pole pairs
J = 0.2; % Moment of inertia

% Operating and derived limits
Imax = 100;  % Max stator current (peak value)
Tmax = 1.5*N*PM*Imax; % Max lectromagnetic torque
fnom = 100;  % Nominal frequency (Hz)
rpm_nom = 60*fnom/N;      % Nominal rotor speed (rpm)
omegam_nom = 2*pi*fnom/N; % Nominal mechanical rotor speed
Pmax = omegam_nom*Tmax;     % Maximum power