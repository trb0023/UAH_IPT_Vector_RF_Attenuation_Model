function alpha = attenuation_total(frequency, pressure, temperature, height)
%ATTENUATION_TOTAL  Atmospheric attenuation coefficient total
%   Calculate the atmospheric attenuation coefficent of the Venus
%   atmosphere from CO2, N2, SO2, and H2SO4 as a function of the frequency,
%   pressure, temperature, and altitude.
%
%   Output units are dB/km.
%   Input units are GHz, kPa, K, and km.

    alpha_co2_n2 = attenuation_CO2_N2(frequency, pressure, temperature);
    alpha_so2 = attenuation_SO2(frequency, pressure, temperature);
    alpha_h2so4 = attenuation_H2SO4(frequency, pressure, temperature, height);
    
    alpha = alpha_co2_n2 + alpha_so2 + alpha_h2so4;
end