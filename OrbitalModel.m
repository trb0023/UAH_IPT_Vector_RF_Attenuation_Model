% ******* Start Config Constants *******

VenusRadius = 6.0518e6; % m Radius of Venus
VenusMu = 3.248577656652328e14; % Venus Gravitational Constant times Mass

% ******* Start Config Variables *******

frequency = 1; %GHz
max_bandwidth_percent = 0.05;
lander_altitude = 0; %km
lander_gain = 1.5; %dB
orbiter_gain = 10; % dB
transmit_power = 100; % Watts
noise_temperature = 27.3; %dB-K
Eb_No = 1.05; % dB
code_rate = 0.5; % idk
misclosses = 3+2.5+2; % dB

maximum_link_angle = 75; %deg

orbiterApoapsis = 500; % km
orbiterPeriapsis = 250; % km

deltaLongitudeAngle = 180; % degrees (Angle from lander position to periapsis position, perpendicular to the path of the orbit)
deltaArgumentOfPeriapsisAngleDeg = 0; % degrees (Angle from lander position to periapsis position, along the path of the orbit.
% 0 Means the periapsis happens as close as possible to the lander, 180 means the apoapsis is above the lander)


orbitPoints = 500; % Number of points in an orbit
orbits = 1; % Number of orbits
totalPoints = orbitPoints*orbits; % Total number of points

% ******* End Config Variables *******

landerAngle = deg2rad(deltaArgumentOfPeriapsisAngleDeg);

Eccentricity = 1 - 2/((orbiterApoapsis*1000 + VenusRadius)/(orbiterPeriapsis*1000 + VenusRadius) + 1);
SemimajorAxis = ((orbiterApoapsis*1000 + VenusRadius)+(orbiterPeriapsis*1000 + VenusRadius))/2;
MeanMotion = sqrt(VenusMu/SemimajorAxis^3);
OrbitalPeriod = 2*pi*sqrt(SemimajorAxis^3/VenusMu);



tRange = linspace(0,OrbitalPeriod,orbitPoints);
MeanAnomalyRange = [];
EccentricAnomalyRange = [];
TrueAnomalyRange = [];
AltitudeRange = [];
ElevationAngleRange = [];

InCommsRange = [];



for time = tRange
    
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
    
    
    landerVec = [1 0 0]* rotz(deltaLongitudeAngle) * roty(rad2deg(landerAngle));
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
polar(deg2rad(deltaLongitudeAngle), VenusRadius + lander_altitude*1000, "ko")
if ~isempty(AltitudeLink)
    p1 = polar(TrueAnomalyLink,AltitudeLink,"ro");
    p1.MarkerSize = 1/2;
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

totalInCommsPoints = length(AltitudeLink)*orbits;

data_rates = [];
total_data = 0;

eval_counts = 0;

for i = 0:totalPoints-1
    i2 = mod(i,orbitPoints)+1;
    
    if(InCommsRange(i2))
        max_data_rate = total_link_calc(frequency, max_bandwidth_percent, lander_altitude, ElevationAngleRange(i2), (AltitudeRange(i2)-VenusRadius)/1000, lander_gain, orbiter_gain, transmit_power, noise_temperature, Eb_No, code_rate, misclosses);
        
        eval_counts = eval_counts + 1;
        done_percent = (eval_counts/totalInCommsPoints)*100;
        disp("Progress: " + done_percent + "%")
    else
        max_data_rate = 0;
    end
    
    total_data = total_data + max_data_rate*dt;
    
    data_rates = [data_rates max_data_rate];
    
    
end

OrbitalPeriod
data_transmitted = total_data %Mbit
data_transmitted_per_orbit = total_data/orbits %Mbit per orbit
average_rate = total_data/(OrbitalPeriod*orbits) %Mbit per second
peak_rate = max(data_rates) %Mbit per second

ax3 = subplot(2,1,2);
plot(fullTRange,data_rates);
title("Data Rate vs Time");
xlabel("Time (s)");
ylabel("Data Rate (Mb/s)");