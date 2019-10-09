function temp = temp_model(altitude)
%TEMP_MODEL  Gives temperature as a function of altitude for Venus.
%   Use the grabbed empirical model to calculate the temperature vs altitude
%   via interpolation.
%
%   Output units are K.
%   Input units are km.
%
%   Also the output from these could use a little tweaking, since the
%   derivatives aren't as smooth as they should be

data = load('temp_vs_alt.mat');

temp = interp1(data.temp_vs_alt(:,1), data.temp_vs_alt(:,2), altitude, 'pchip', 'extrap');
end