%% Attenuation test

h_vals = linspace(0, 60, 1000);
attenuation_vals = [];

freq = 2.4;

for h = h_vals
    attenuation = attenuation_total(freq, h);
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

%% Local Radius Test

h_vals = linspace(0, 100, 101);
radius_vals = [];
threshold_vals = [];


for h = h_vals
    radius_vals = [radius_vals local_radius_calc(h, 90)/1e6];
    threshold_vals = [threshold_vals (h+6051.8)/1e6];
end

plot(h_vals, radius_vals, "r", h_vals, threshold_vals, "b:");
set(gca, 'YScale', 'log');

