h_vals = linspace(0, 60, 1000);
attenuation_vals = [];

freq = 2.4;

for h = h_vals
    pressure = 0.1*pressure_model(h); % convert from mBar to kPa
    temperature = temp_model(h);
    attenuation = attenuation_total(freq, pressure, temp_model(h), h);
    attenuation_vals = [attenuation_vals attenuation];
end

plot(h_vals, attenuation_vals)

total_attenuation = trapz(h_vals, attenuation_vals) %attenutation for 90° straight up link, not including defocusing or FSPL

