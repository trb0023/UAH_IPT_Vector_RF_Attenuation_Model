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
d_h = 1; % Altitude step, in km


i_vals = 0:round(((h_t-altitude)/d_h));

alpha_vals = [];
L_vals = [];

R_v = 6.0518e3; % Radius of Venus in kilometers

theta_a_temp = deg2rad(180-theta_a);
sin_theta_a_temp = sin(theta_a_temp);

parfor i = i_vals
    h = i*d_h + altitude;
    
    B = asin((R_v + altitude)*sin_theta_a_temp/(R_v+h));
    phi = pi - theta_a_temp - B;
    L = (R_v+h)*sin(phi)/sin_theta_a_temp;
    
    L_vals = [L_vals L];
    alpha_vals = [alpha_vals attenuation_total(freq, h)];
end

alpha_total = trapz(L_vals, alpha_vals);
alpha_total = alpha_total * (0.51/0.36); %Approximate correction for defocusing

L_total = L_vals(end);

end