function pressure = pressure_model(altitude)
%PRESSURE_MODEL  Gives pressure as a function of altitude for Venus.
%   Use the grabbed empirical model to calculate the pressure vs altitude
%   via interpolation.
%
%   Output units are mBar.
%   Input units are km.
%
%   Also the output from these could use a little tweaking, since the
%   derivatives aren't as smooth as they should be

data = load('pres_vs_alt.mat');

pressure = 10^interp1(data.pres_vs_alt(:,1), data.pres_vs_alt(:,2), altitude, 'pchip', 'extrap');
end

