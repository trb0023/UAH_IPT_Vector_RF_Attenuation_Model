% Use this file to calculate the total attenuation

%frequencies = logspace(-1, 1, 200);
frequency = 1; %GHz
max_bandwidth_percent = 0.05;

altitude = 0; %km
elevation_angle = 0; %degrees
altitudes_of_orbiter = linspace(250, 10000, 10); %km
%altitude_of_orbiter = 250; %km
lander_gain = 1.5; %dB
orbiter_gain = 10; % dB
transmit_power = 100; % Watts
noise_temperature = 27.3; %dB-K

Eb_No = 1.05; % dB
code_rate = 0.5; % idk
misclosses = 3+2.5+2; % dB


R_v = 6.0518e3; % Radius of Venus in kilometers

data_rates = [];

for altitude_of_orbiter = altitudes_of_orbiter
    
    max_data_rate = total_link_calc(frequency, max_bandwidth_percent, altitude, elevation_angle, altitude_of_orbiter, lander_gain, orbiter_gain, transmit_power, noise_temperature, Eb_No, code_rate, misclosses)
    
    data_rates = [data_rates max_data_rate];
end

plot(altitudes_of_orbiter, data_rates)
xlabel("Orbiter Altitude (km)")
ylabel("Maximum Data Rate (Mb/s)")
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')