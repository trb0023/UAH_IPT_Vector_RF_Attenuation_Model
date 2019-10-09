% Use this file to calculate the total attenuation

frequency = 2.4; %GHz
altitude = 0; %km
elevation_angle = 60; %degrees
altitude_of_orbiter = 1000; %km

R_v = 6.0518e3; % Radius of Venus in kilometers

[path_length, attenuation] = approx_straight_ray_path_integration(altitude, elevation_angle, frequency);

B = rad2deg(asin((R_v + altitude)*sin(deg2rad(180-elevation_angle))/(R_v+altitude_of_orbiter)));
phi = 180 - (180-elevation_angle) - B;
L = (R_v+altitude_of_orbiter)*sin(deg2rad(phi))/sin(deg2rad(180-elevation_angle));

fspl = 20*log10(L) + 20*log10(frequency) + 92.45;

disp("Attenuation from atmospheric absorbtion:");
disp("    " + attenuation + " dB");
disp("Total Attenuation:");
disp("    " + (attenuation+fspl) + " dB");