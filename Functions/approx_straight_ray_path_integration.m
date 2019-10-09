function [L_total, alpha_total] = approx_straight_ray_path_integration(altitude, theta_a, freq)
%APPROX_STRAIGHT_RAY_PATH_INTEGRATION  Gives total length and attenuation
%   Calculates total length and attenuation of a ray travelling through
%   Venus' atmosphere. Assumes the ray is straight, and only calculates
%   absorbtion losses, with a simple scaling to account for defocusing
%   losses. Only valid for frequencies near 2GHz and angles far from 90°
%
%   Output units are km and dB.
%   Input units are km, degrees, and GHz.

h_t = 100; % Height of atmosphere, in km

h_vals = altitude:0.25:h_t; % list of height values from the altitude to space, in steps of 250 m

alpha_vals = [];
L_vals = [];

R_v = 6.0518e3; % Radius of Venus in kilometers

for h = h_vals
    
    B = rad2deg(asin((R_v + altitude)*sin(deg2rad(180-theta_a))/(R_v+h)));
    phi = 180 - (180-theta_a) - B;
    L = (R_v+h)*sin(deg2rad(phi))/sin(deg2rad(180-theta_a));
    
    L_vals = [L_vals L];
    alpha_vals = [alpha_vals attenuation_total(freq, h)];
end

alpha_total = trapz(L_vals, alpha_vals);
alpha_total = alpha_total * (0.51/0.36); %Approximate correction for defocusing

L_total = L_vals(end);

end