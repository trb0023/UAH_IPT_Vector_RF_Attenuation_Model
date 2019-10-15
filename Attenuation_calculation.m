% Use this file to calculate the total attenuation

frequencies = logspace(-1, 1, 200);
%frequency = 1; %GHz

altitude = 0; %km
elevation_angle = 60; %degrees
altitude_of_orbiter = 250; %km
lander_gain = 1.5; %dB
orbiter_gain = 10; % dB
transmit_power = 100; % Watts
noise_temperature = 27.3; %dB-K

Eb_No = 1.05; % dB
code_rate = 0.5; % idk
misclosses = 3+2.5+2; % dB


R_v = 6.0518e3; % Radius of Venus in kilometers

data_rates = [];

for frequency = frequencies
    
    max_bandwidth = frequency*0.05*2*1000; % MHz

    [path_length, attenuation] = approx_straight_ray_path_integration(altitude, elevation_angle, frequency);

    B = rad2deg(asin((R_v + altitude)*sin(deg2rad(180-elevation_angle))/(R_v+altitude_of_orbiter)));
    phi = 180 - (180-elevation_angle) - B;
    L = (R_v+altitude_of_orbiter)*sin(deg2rad(phi))/sin(deg2rad(180-elevation_angle));

    fspl = 20*log10(L) + 20*log10(frequency) + 92.45;

    %disp("Attenuation from atmospheric absorbtion:");
    %disp("    " + attenuation + " dB");
    %disp("Attenuation from path loss");
    %disp("    " + fspl + " dB");
    %disp("Total Attenuation:");
    %disp("    " + (attenuation+fspl) + " dB");


    margin = @(bandwidth) link_calc_alt(bandwidth, Eb_No, code_rate, lander_gain, orbiter_gain, transmit_power, misclosses, attenuation, fspl, noise_temperature);

    bandwidth = min(fzero(margin,[1e-20 1e20]), max_bandwidth); % MHz

    [margin , max_data_rate] = link_calc_alt(bandwidth, Eb_No, code_rate, lander_gain, orbiter_gain, transmit_power, misclosses, attenuation, fspl, noise_temperature);
    
    data_rates = [data_rates max_data_rate];
end

plot(frequencies, data_rates)
xlabel("Frequency (GHz)")
ylabel("Maximum Data Rate (Mb/s)")
set(gca, 'XScale', 'log')