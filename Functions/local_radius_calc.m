function local_radius = local_radius_calc(altitude, angle)
%LOCAL_RADIUS_CALC  Gives the local radius of curvature
%   Calculates the radius of curvature for a RF ray inside Venus'
%   atmosphere
%
%   Output units are km.
%   Input units are km and degrees.

dh = 1;

[~, n_0] = permittivity_model(altitude-dh);
[~, n_1] = permittivity_model(altitude);
[~, n_2] = permittivity_model(altitude+dh);


dn_dh_list = gradient([n_0 n_1 n_2], dh);
dn_dh = dn_dh_list(2); % Find gradient at point

local_radius = -n_1/(dn_dh*sin(deg2rad(angle)));

end