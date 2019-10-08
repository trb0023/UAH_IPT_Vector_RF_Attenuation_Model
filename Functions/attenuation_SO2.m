function alpha = attenuation_SO2(frequency, pressure, temperature)
%ATTENUATION_SO2  Atmospheric attenuation coefficient from SO2
%   Calculate the atmospheric attenuation coefficent of the Venus
%   atmosphere from SO2 as a function of the frequency, pressure, and 
%   temperature.
%
%   Output units are dB/km.
%   Input units are GHz, kPa, and K.

    P_atm = 101.325;
    q_so2 = 1.5e-4;
    
    k_so2 = 4.3e6 * P_atm.^-1.28 .* q_so2;
    
    alpha = k_so2 .* frequency.^2 .* pressure.^1.28 .* temperature.^-2.91;
end