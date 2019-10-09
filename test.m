%% Attenuation test

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

%% Permittivity test

h_vals = linspace(0, 70, 100);
permittivity_vals = [];


for h = h_vals
    permittivity_vals = [permittivity_vals permittivity_model(h)];
end

[ d, ix ] = min( abs( ((permittivity_vals-1)*1000)-5.0 ) );

subplot(1,2,2);
plot((permittivity_vals(1:ix)-1)*1000, h_vals(1:ix))
xlim([5 35])
ylim([0 70])

subplot(1,2,1);
plot((permittivity_vals(ix:end)-1)*1000, h_vals(ix:end))
xlim([0 5])
ylim([0 70])
