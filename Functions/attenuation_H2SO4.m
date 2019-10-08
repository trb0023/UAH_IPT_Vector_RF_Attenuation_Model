function alpha = attenuation_H2SO4(frequency, pressure, temperature, height)
%ATTENUATION_H2SO4  Atmospheric attenuation coefficient from H2SO4
%   Calculate the atmospheric attenuation coefficent of the Venus
%   atmosphere from H2SO4 as a function of the frequency, pressure, 
%   temperature, and altitude.
%
%   Output units are dB/km.
%   Input units are GHz, kPa, K, and km.

    P_atm = 101.325;
    
    q_h2so4 = 10^-6 * (3.7./(1.004.^(abs(height-43.3).^2.7)) + 3.4./(1.05.^(abs(height-46).^3))...
        + 3.3./(1.8.^(abs(height-39).^2.3)) + 2.4./(1.2.^(abs(height-52.6).^2)));
    
    k_h2so4 = 39.471 .* 533.^3 .* P_atm.^-1.24 .* q_h2so4;
    
    alpha = k_h2so4 .* frequency.^1.21 .* pressure.^1.24 .* temperature.^-3;
end