function density = density_model(altitude)
%DENSITY_MODEL  Gives density as a function of altitude for Venus.
%   Use a model to calculate the density vs altitude
%   via interpolation.
%
%   Output units are kg/m^3.
%   Input units are km.

dh = 1;

dp_dh_list = gradient([pressure_model(altitude - dh) pressure_model(altitude) pressure_model(altitude + dh)], dh);
dp_dh = dp_dh_list(2) * 0.1; % Find gradient at point and convert from mBar/km to Pa/m

h = altitude * 1000; % Altitude in meters

R_v = 6.0518e6; % Radius of Venus in meters
M_v = 4.867e24; % Mass of Venus in kg

G = 6.67408e-11;

density = ((R_v + h)^2)/(G*M_v) * -dp_dh;
end