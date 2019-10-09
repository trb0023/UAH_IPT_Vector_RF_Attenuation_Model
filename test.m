h_vals = linspace(0, 60, 1000);
attn_vals = [];

freq = 2.4;

for h = h_vals
    pressure = 0.1*pressure_model(h); % convert from mBar to kPa
    temperature = temp_model(h);
    attn = attenuation_total(freq, pressure, temp_model(h), h);
    attn_vals = [attn_vals attn];
end

plot(h_vals, attn_vals)

total_attenuation = trapz(h_vals, attn_vals) %attenutation for 90° straight up link, not including defocusing