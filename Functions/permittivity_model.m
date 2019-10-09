function [permittivity, refractive_index] = permittivity_model(altitude)
%PERMITTIVITY_MODEL  Gives permittivity as a function of altitude for Venus.
%   Use the grabbed empirical model to calculate the permittivity vs altitude
%   via interpolation.
%
%   Output units are unitless (I think? paper isn't super clear).
%   Input units are km.

psi = 167; %cm^3/kg
density = density_model(altitude)/1000000; %kg/cm^3 (the paper said something about mols so I'm confused)

permittivity = 1 + 3*density*psi + 3*density^2*psi^2;

refractive_index = 1 + (3/2)*density*psi + (3/8)*density^2*psi^2;

end