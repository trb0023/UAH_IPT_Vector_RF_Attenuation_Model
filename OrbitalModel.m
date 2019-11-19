function a = OrbitalModel
addpath("Functions")
format longg
format compact

% ******* Start Config Constants *******

VenusRadius = 6.0518e6; % m Radius of Venus
VenusCircumference = VenusRadius*2*pi;
VenusMu = 3.248577656652328e14; % Venus Gravitational Constant times Mass

% ******* Start Config Variables *******

frequency = 1; %GHz
selected_bandwidth = 8; %MHz
max_bandwidth_percent = 0.05;
max_bandwidth = frequency*max_bandwidth_percent*2*1000 % MHz
lander_altitude = 55; %km  **Balloon people change this to your altitude**
lander_gain = 1.5; %dB
orbiter_gain = 10; % dB
transmit_power = 25; % Watts
noise_temperature = 27.3; %dB-K
Eb_No = 1.05; % dB
code_rate = 0.5; % idk
misclosses = 6; % dB (This is for 6 dB margin for MFR)

maximum_link_angle = 85; %deg

orbiterApoapsis = 500; % km
orbiterPeriapsis = 250; % km

%Assumes a polar orbit for the orbiter with 90 degree inclination (Anything
%thats not polar or equatorial is a lot of math I don't want to do)

LatitudeAngleDeg = 180; % degrees (Angle from lander position to periapsis position, along the path of the orbit.)
% 0 Means the periapsis happens as close as possible to the lander, 180 means the apoapsis is above the lander)
LongitudeAngleDeg = 0; % degrees (Angle from lander position to periapsis position, perpendicular to the path of the orbit)

northSouthV = 0; % (m/s) Velocity of balloon parallel to orbit (set to 0 for lander)
eastWestV = 200 + 1.810512; % (m/s) Velocity of balloon perpendicular to orbit (set to 1.810512 for lander to account for venus rotation speed)

deltaLatitudeAngleDeg = northSouthV/VenusCircumference*360;
deltaLongitudeAngleDeg = eastWestV/VenusCircumference*360;


orbits = 100; % Number of orbits (Lander is 3-10 ish, balloon is 400-500 ish (Balloon will take a LOOONNGGG time to process))
orbitPoints = 500*orbits; % Number of points in an orbit
totalPoints = orbitPoints; % Total number of points

% ******* End Config Variables *******



Eccentricity = 1 - 2/((orbiterApoapsis*1000 + VenusRadius)/(orbiterPeriapsis*1000 + VenusRadius) + 1);
SemimajorAxis = ((orbiterApoapsis*1000 + VenusRadius)+(orbiterPeriapsis*1000 + VenusRadius))/2;
MeanMotion = sqrt(VenusMu/SemimajorAxis^3);
OrbitalPeriod = 2*pi*sqrt(SemimajorAxis^3/VenusMu);



tRange = linspace(0,OrbitalPeriod*orbits,orbitPoints);
dt = OrbitalPeriod*orbits/orbitPoints;
MeanAnomalyRange = [];
EccentricAnomalyRange = [];
TrueAnomalyRange = [];
AltitudeRange = [];
ElevationAngleRange = [];
LatitudeAngleRange = [];
LongitudeAngleRange = [];

InCommsRange = [];


tic
for time = tRange
    
    if(toc>5)
        tic
        disp("Simulating Orbit: "+time/(OrbitalPeriod*orbits)*100+"%");
    end
    
    MeanAnomaly = mod(MeanMotion*time,2*pi);
    MeanAnomalyRange = [MeanAnomalyRange MeanAnomaly];
    
    EccentricAnomaly = MeanAnomaly;
    EccentricAnomaly0 = EccentricAnomaly-1;
    while (EccentricAnomaly-EccentricAnomaly0)/EccentricAnomaly > 1e-4
        EccentricAnomaly0 = EccentricAnomaly;
        EccentricAnomaly = EccentricAnomaly0 - (EccentricAnomaly0 - Eccentricity*sin(EccentricAnomaly0) - MeanAnomaly)/(1 - Eccentricity*cos(EccentricAnomaly0));
    end
    
    EccentricAnomalyRange = [EccentricAnomalyRange EccentricAnomaly];
    
    TrueAnomaly = acos((cos(EccentricAnomaly)-Eccentricity)/(1 - Eccentricity*cos(EccentricAnomaly)));
    if(EccentricAnomaly > pi)
        TrueAnomaly =  2*pi - TrueAnomaly;
    end
    TrueAnomalyRange = [TrueAnomalyRange TrueAnomaly];
    
    Altitude = (SemimajorAxis*(1-Eccentricity*cos(EccentricAnomaly)));
    AltitudeRange = [AltitudeRange Altitude];
    
    
    LatitudeAngleDeg = LatitudeAngleDeg + deltaLatitudeAngleDeg*dt;
    LongitudeAngleDeg = LongitudeAngleDeg + deltaLongitudeAngleDeg*dt;
    
    LatitudeAngleRange = [LatitudeAngleRange LatitudeAngleDeg];
    LongitudeAngleRange = [LongitudeAngleRange LongitudeAngleDeg];
    
    landerAngle = deg2rad(LongitudeAngleDeg);
    
    landerVec = [1 0 0]* rotz(LatitudeAngleDeg) * roty(rad2deg(landerAngle));
    landerPoint = landerVec * (VenusRadius + lander_altitude*1000);
    orbiterPoint = [1 0 0] * rotz(rad2deg(TrueAnomaly)) * (Altitude);
    
    landerToOrbiterVec = orbiterPoint-landerPoint;
    
    commsAngle = atan2(norm(cross(landerVec,landerToOrbiterVec)),dot(landerVec,landerToOrbiterVec));
    ElevationAngleRange = [ElevationAngleRange rad2deg(commsAngle)];
   
    InComms = commsAngle < deg2rad(maximum_link_angle);
    
    InCommsRange = [InCommsRange InComms];
    
end


TrueAnomalyNoLink = [];
AltitudeNoLink = [];

TrueAnomalyLink = [];
AltitudeLink = [];

for i = 1:orbitPoints
    if InCommsRange(i)
        TrueAnomalyLink = [TrueAnomalyLink TrueAnomalyRange(i)];
        AltitudeLink = [AltitudeLink AltitudeRange(i)];
    else
        TrueAnomalyNoLink = [TrueAnomalyNoLink TrueAnomalyRange(i)];
        AltitudeNoLink = [AltitudeNoLink AltitudeRange(i)];
    end
end


subplot(2,1,1);
set(gcf, 'Position',  [0, 20, 800, 620])
hold on
polar(linspace(0,2*pi,1000), linspace(VenusRadius,VenusRadius,1000),"g");
plot((VenusRadius + lander_altitude*1000)*cos(deg2rad(LongitudeAngleRange)).*cos(deg2rad(LatitudeAngleRange)), (VenusRadius + lander_altitude*1000)*sin(deg2rad(LatitudeAngleRange)), "ko")
%polar(deg2rad(LatitudeAngleRange), (VenusRadius + lander_altitude*1000)*sqrt(.^2 + sin(deg2rad(LatitudeAngleRange)).^2), "ko")
if ~isempty(AltitudeLink)
    p1 = polar(TrueAnomalyLink,AltitudeLink,"ro");
    p1.MarkerSize = 1;
end
p2 = polar(TrueAnomalyNoLink,AltitudeNoLink,"bo");
p2.MarkerSize = 1/2;
axis equal
if ~isempty(AltitudeLink)
    legend("Venus", "Lander", "Sat Orbit (Link)", "Sat Orbit (No Link)", 'Location','best');
else
    legend("Venus", "Lander", "Sat Orbit (No Link)", 'Location','best');
end
title("Orbiter Path")


dt = tRange(2)-tRange(1);
fullTRange = linspace(0,OrbitalPeriod*orbits,totalPoints);

totalInCommsPoints = length(AltitudeLink);

data_rates = [];
data_rates_opt = [];
total_data = 0;
total_data_opt = 0;


D = parallel.pool.DataQueue;
afterEach(D, @nUpdateWait);

N = totalInCommsPoints;
p = 1;

tic
for (i = 0:totalPoints-1)
    i2 = mod(i,orbitPoints)+1;
    
    if(InCommsRange(i2))
        max_data_rate = total_link_calc(frequency, selected_bandwidth, lander_altitude, ElevationAngleRange(i2), (AltitudeRange(i2)-VenusRadius)/1000, lander_gain, orbiter_gain, transmit_power, noise_temperature, Eb_No, code_rate, misclosses);
        max_data_rate_opt = total_link_calc_opt(frequency, max_bandwidth, lander_altitude, ElevationAngleRange(i2), (AltitudeRange(i2)-VenusRadius)/1000, lander_gain, orbiter_gain, transmit_power, noise_temperature, Eb_No, code_rate, misclosses);
        
        
        send(D, i);
    else
        max_data_rate = 0;
         max_data_rate_opt = 0;
    end
    
    total_data = total_data + max_data_rate*dt;
    total_data_opt = total_data_opt + max_data_rate_opt*dt;
    
    data_rates = [data_rates max_data_rate];
    data_rates_opt = [data_rates_opt max_data_rate_opt];
end
toc

OrbitalPeriod
disp("     At "+selected_bandwidth+" MHz bandwidth")
disp("Total Data Transmitted: "+total_data+" Mbit ("+total_data/8192+" Gigabytes)")
disp("Total Data per Orbit: "+total_data/orbits+" Mbit ("+total_data/(orbits*8192)+" Gigabytes)")
disp("Average Data Rate: "+total_data/(OrbitalPeriod*orbits)+" Mbit/sec")
disp("Maximum Data Rate: "+max(data_rates)+" Mbit/sec")
disp("     At continously variable maximum bandwidth")
disp("Total Data Transmitted: "+total_data_opt+" Mbit ("+total_data_opt/8192+" Gigabytes)")
disp("Total Data per Orbit: "+total_data_opt/orbits+" Mbit ("+total_data_opt/(orbits*8192)+" Gigabytes)")
disp("Average Data Rate: "+total_data_opt/(OrbitalPeriod*orbits)+" Mbit/sec")
disp("Maximum Data Rate: "+max(data_rates_opt)+" Mbit/sec")
disp("  Percentage of time with link: "+(totalInCommsPoints/totalPoints)*100+"%")

ax3 = subplot(2,1,2);
plot(fullTRange,data_rates, fullTRange,data_rates_opt);
legend("Bandwidth = "+selected_bandwidth+" MHZ", "Optimum Bandwidth")
title("Data Rate vs Time");
xlabel("Time (s)");
ylabel("Data Rate (Mb/s)");

    function nUpdateWait(~)
        disp("Simulating Comms: " + p/N*100 + "%")
        p = p + 1;
    end

end