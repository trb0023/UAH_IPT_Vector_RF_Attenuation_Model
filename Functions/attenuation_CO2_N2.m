function alpha = attenuation_CO2_N2(frequency, pressure, temperature)
%ATTENUATION_CO2_N2  Atmospheric attenuation coefficient from CO2 & N2
%   Calculate the atmospheric attenuation coefficent of the Venus
%   atmosphere from CO2 and N2 as a function of the frequency, pressure,
%   and temperature.
%
%   Output units are dB/km.
%   Input units are GHz, kPa, and K.

    P_atm = 101.325;
    q_co2 = 0.965;
    q_n2 = 0.035;
    
    q_co2_n2 = q_co2*(1+(q_co2*q_n2/4)) + 0.0054*q_n2;
    k_co2_n2 = 1.15e8 * P_atm^-2 * q_co2_n2;
    
    alpha = k_co2_n2 .* frequency.^2 .* pressure.^2 .* temperature.^-5;
end