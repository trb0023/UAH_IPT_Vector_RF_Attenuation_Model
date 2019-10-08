%% Figures
clear,clc

%Givens using "Structure of the Venusian Atmosphere" Paper
Table2 = readtable('Venus_Atmos.xlsx', 'Sheet', 'Phi_Less_Than_35', 'Range','A3:I53');
Table3 = readtable('Venus_Atmos.xlsx', 'Sheet', 'Phi_BW_35_55', 'Range','A3:I53');
Table4 = readtable('Venus_Atmos.xlsx', 'Sheet', 'Phi_BW_50_70', 'Range','A3:I53');
Table5 = readtable('Venus_Atmos.xlsx', 'Sheet', 'Phi_BW_70_80', 'Range','A3:I53');
Table6 = readtable('Venus_Atmos.xlsx', 'Sheet', 'Phi_85', 'Range','A3:I53');
Table7 = readtable('Venus_Atmos.xlsx', 'Sheet', 'Density', 'Range','A2:E27');


%% Table Two Functions - Returns Heqight
P_Bar_Function_Eq_Two = polyfit(Table2.P_Bar,Table2.Var1,5);
P_Bar_Function_Two = @(x) P_Bar_Function_Eq_Two(1).*x.^5+P_Bar_Function_Eq_Two(2).*x.^4+P_Bar_Function_Eq_Two(3).*x.^3+P_Bar_Function_Eq_Two(4).*x.^2+P_Bar_Function_Eq_Two(5).*x+P_Bar_Function_Eq_Two(6);

P_Bar_1_Function_Eq_Two = polyfit(Table2.P_Bar_1,Table2.Var1,5);
P_Bar_1_Function_Two = @(x) P_Bar_1_Function_Eq_Two(1)*x^5+P_Bar_1_Function_Eq_Two(2)*x^4+P_Bar_1_Function_Eq_Two(3)*x^3+P_Bar_1_Function_Eq_Two(4)*x^2+P_Bar_1_Function_Eq_Two(5)*x+P_Bar_1_Function_Eq_Two(6);

P_Bar_2_Function_Eq_Two = polyfit(Table2.P_Bar_2,Table2.Var1,5);
P_Bar_2_Function_Two = @(x) P_Bar_2_Function_Eq_Two(1)*x^5+P_Bar_2_Function_Eq_Two(2)*x^4+P_Bar_2_Function_Eq_Two(3)*x^3+P_Bar_2_Function_Eq_Two(4)*x^2+P_Bar_2_Function_Eq_Two(5)*x+P_Bar_2_Function_Eq_Two(6);

T_K_Function_Eq_Two = polyfit(Table2.T_K,Table2.Var1,5);
T_K_Function_Two = @(x) T_K_Function_Eq_Two(1)*x^5+T_K_Function_Eq_Two(2)*x^4+T_K_Function_Eq_Two(3)*x^3+T_K_Function_Eq_Two(4)*x^2+T_K_Function_Eq_Two(5)*x+T_K_Function_Eq_Two(6);

T_K_1_Function_Eq_Two = polyfit(Table2.T_K_1,Table2.Var1,5);
T_K_1_Function_Two = @(x) T_K_1_Function_Eq_Two(1)*x^5+T_K_1_Function_Eq_Two(2)*x^4+T_K_1_Function_Eq_Two(3)*x^3+T_K_1_Function_Eq_Two(4)*x^2+T_K_1_Function_Eq_Two(5)*x+T_K_1_Function_Eq_Two(6);

T_K_2_Function_Eq_Two = polyfit(Table2.T_K_2,Table2.Var1,5);
T_K_2_Function_Two = @(x) T_K_2_Function_Eq_Two(1)*x^5+T_K_2_Function_Eq_Two(2)*x^4+T_K_2_Function_Eq_Two(3)*x^3+T_K_2_Function_Eq_Two(4)*x^2+T_K_2_Function_Eq_Two(5)*x+T_K_2_Function_Eq_Two(6);

%% Table Three Functions - Returns Height
P_Bar_Function_Eq_Three = polyfit(Table3.P_Bar,Table3.Var1,5);
P_Bar_Function_Three = @(x) P_Bar_Function_Eq_Three(1)*x^5+P_Bar_Function_Eq_Three(2)*x^4+P_Bar_Function_Eq_Three(3)*x^3+P_Bar_Function_Eq_Three(4)*x^2+P_Bar_Function_Eq_Three(5)*x+P_Bar_Function_Eq_Three(6);

P_Bar_1_Function_Eq_Three = polyfit(Table3.P_Bar_1,Table3.Var1,5);
P_Bar_1_Function_Three = @(x) P_Bar_1_Function_Eq_Three(1)*x^5+P_Bar_1_Function_Eq_Three(2)*x^4+P_Bar_1_Function_Eq_Three(3)*x^3+P_Bar_1_Function_Eq_Three(4)*x^2+P_Bar_1_Function_Eq_Three(5)*x+P_Bar_1_Function_Eq_Three(6);

P_Bar_2_Function_Eq_Three = polyfit(Table3.P_Bar_2,Table3.Var1,5);
P_Bar_2_Function_Three = @(x) P_Bar_2_Function_Eq_Three(1)*x^5+P_Bar_2_Function_Eq_Three(2)*x^4+P_Bar_2_Function_Eq_Three(3)*x^3+P_Bar_2_Function_Eq_Three(4)*x^2+P_Bar_2_Function_Eq_Three(5)*x+P_Bar_2_Function_Eq_Three(6);

T_K_Function_Eq_Three = polyfit(Table3.T_K,Table3.Var1,5);
T_K_Function_Three = @(x) T_K_Function_Eq_Three(1)*x^5+T_K_Function_Eq_Three(2)*x^4+T_K_Function_Eq_Three(3)*x^3+T_K_Function_Eq_Three(4)*x^2+T_K_Function_Eq_Three(5)*x+T_K_Function_Eq_Three(6);

T_K_1_Function_Eq_Three = polyfit(Table3.T_K_1,Table3.Var1,5);
T_K_1_Function_Three = @(x) T_K_1_Function_Eq_Three(1)*x^5+T_K_1_Function_Eq_Three(2)*x^4+T_K_1_Function_Eq_Three(3)*x^3+T_K_1_Function_Eq_Three(4)*x^2+T_K_1_Function_Eq_Three(5)*x+T_K_1_Function_Eq_Three(6);

T_K_2_Function_Eq_Three = polyfit(Table3.T_K_2,Table3.Var1,5);
T_K_2_Function_Three = @(x) T_K_2_Function_Eq_Three(1)*x^5+T_K_2_Function_Eq_Three(2)*x^4+T_K_2_Function_Eq_Three(3)*x^3+T_K_2_Function_Eq_Three(4)*x^2+T_K_2_Function_Eq_Three(5)*x+T_K_2_Function_Eq_Three(6);

%% Table Four Functions - Returns Height
P_Bar_Function_Eq_Four = polyfit(Table4.P_Bar,Table4.Var1,5);
P_Bar_Function_Four = @(x) P_Bar_Function_Eq_Four(1).*x.^5+P_Bar_Function_Eq_Four(2).*x.^4+P_Bar_Function_Eq_Four(3).*x.^3+P_Bar_Function_Eq_Four(4).*x.^2+P_Bar_Function_Eq_Four(5).*x+P_Bar_Function_Eq_Four(6);
 
P_Bar_1_Function_Eq_Four = polyfit(Table4.P_Bar_1,Table4.Var1,5);
P_Bar_1_Function_Four = @(x) P_Bar_1_Function_Eq_Four(1)*x^5+P_Bar_1_Function_Eq_Four(2)*x^4+P_Bar_1_Function_Eq_Four(3)*x^3+P_Bar_1_Function_Eq_Four(4)*x^2+P_Bar_1_Function_Eq_Four(5)*x+P_Bar_1_Function_Eq_Four(6);
 
P_Bar_2_Function_Eq_Four = polyfit(Table4.P_Bar_2,Table4.Var1,5);
P_Bar_2_Function_Four = @(x) P_Bar_2_Function_Eq_Four(1)*x^5+P_Bar_2_Function_Eq_Four(2)*x^4+P_Bar_2_Function_Eq_Four(3)*x^3+P_Bar_2_Function_Eq_Four(4)*x^2+P_Bar_2_Function_Eq_Four(5)*x+P_Bar_2_Function_Eq_Four(6);
 
T_K_Function_Eq_Four = polyfit(Table4.T_K,Table4.Var1,5);
T_K_Function_Four = @(x) T_K_Function_Eq_Four(1)*x^5+T_K_Function_Eq_Four(2)*x^4+T_K_Function_Eq_Four(3)*x^3+T_K_Function_Eq_Four(4)*x^2+T_K_Function_Eq_Four(5)*x+T_K_Function_Eq_Four(6);
 
T_K_1_Function_Eq_Four = polyfit(Table4.T_K_1,Table4.Var1,5);
T_K_1_Function_Four = @(x) T_K_1_Function_Eq_Four(1)*x^5+T_K_1_Function_Eq_Four(2)*x^4+T_K_1_Function_Eq_Four(3)*x^3+T_K_1_Function_Eq_Four(4)*x^2+T_K_1_Function_Eq_Four(5)*x+T_K_1_Function_Eq_Four(6);
 
T_K_2_Function_Eq_Four = polyfit(Table4.T_K_2,Table4.Var1,5);
T_K_2_Function_Four = @(x) T_K_2_Function_Eq_Four(1)*x^5+T_K_2_Function_Eq_Four(2)*x^4+T_K_2_Function_Eq_Four(3)*x^3+T_K_2_Function_Eq_Four(4)*x^2+T_K_2_Function_Eq_Four(5)*x+T_K_2_Function_Eq_Four(6);

%% Table Five Functions - Returns Height
P_Bar_Function_Eq_Five = polyfit(Table5.P_Bar,Table5.Var1,5);
P_Bar_Function_Five = @(x) P_Bar_Function_Eq_Five(1)*x^5+P_Bar_Function_Eq_Five(2)*x^4+P_Bar_Function_Eq_Five(3)*x^3+P_Bar_Function_Eq_Five(4)*x^2+P_Bar_Function_Eq_Five(5)*x+P_Bar_Function_Eq_Five(6);
 
P_Bar_1_Function_Eq_Five = polyfit(Table5.P_Bar_1,Table5.Var1,5);
P_Bar_1_Function_Five = @(x) P_Bar_1_Function_Eq_Five(1)*x^5+P_Bar_1_Function_Eq_Five(2)*x^4+P_Bar_1_Function_Eq_Five(3)*x^3+P_Bar_1_Function_Eq_Five(4)*x^2+P_Bar_1_Function_Eq_Five(5)*x+P_Bar_1_Function_Eq_Five(6);
 
P_Bar_2_Function_Eq_Five = polyfit(Table5.P_Bar_2,Table5.Var1,5);
P_Bar_2_Function_Five = @(x) P_Bar_2_Function_Eq_Five(1)*x^5+P_Bar_2_Function_Eq_Five(2)*x^4+P_Bar_2_Function_Eq_Five(3)*x^3+P_Bar_2_Function_Eq_Five(4)*x^2+P_Bar_2_Function_Eq_Five(5)*x+P_Bar_2_Function_Eq_Five(6);
 
T_K_Function_Eq_Five = polyfit(Table5.T_K,Table5.Var1,5);
T_K_Function_Five = @(x) T_K_Function_Eq_Five(1)*x^5+T_K_Function_Eq_Five(2)*x^4+T_K_Function_Eq_Five(3)*x^3+T_K_Function_Eq_Five(4)*x^2+T_K_Function_Eq_Five(5)*x+T_K_Function_Eq_Five(6);
 
T_K_1_Function_Eq_Five = polyfit(Table5.T_K_1,Table5.Var1,5);
T_K_1_Function_Five = @(x) T_K_1_Function_Eq_Five(1)*x^5+T_K_1_Function_Eq_Five(2)*x^4+T_K_1_Function_Eq_Five(3)*x^3+T_K_1_Function_Eq_Five(4)*x^2+T_K_1_Function_Eq_Five(5)*x+T_K_1_Function_Eq_Five(6);
 
T_K_2_Function_Eq_Five = polyfit(Table5.T_K_2,Table5.Var1,5);
T_K_2_Function_Five = @(x) T_K_2_Function_Eq_Five(1)*x^5+T_K_2_Function_Eq_Five(2)*x^4+T_K_2_Function_Eq_Five(3)*x^3+T_K_2_Function_Eq_Five(4)*x^2+T_K_2_Function_Eq_Five(5)*x+T_K_2_Function_Eq_Five(6);
 
%% Table 6 Functions - Returns Height
P_Bar_Function_Eq_Six = polyfit(Table6.P_Bar,Table6.Var1,5);
P_Bar_Function_Six = @(x) P_Bar_Function_Eq_Six(1)*x^5+P_Bar_Function_Eq_Six(2)*x^4+P_Bar_Function_Eq_Six(3)*x^3+P_Bar_Function_Eq_Six(4)*x^2+P_Bar_Function_Eq_Six(5)*x+P_Bar_Function_Eq_Six(6);
 
P_Bar_1_Function_Eq_Six = polyfit(Table6.P_Bar_1,Table6.Var1,5);
P_Bar_1_Function_Six = @(x) P_Bar_1_Function_Eq_Six(1)*x^5+P_Bar_1_Function_Eq_Six(2)*x^4+P_Bar_1_Function_Eq_Six(3)*x^3+P_Bar_1_Function_Eq_Six(4)*x^2+P_Bar_1_Function_Eq_Six(5)*x+P_Bar_1_Function_Eq_Six(6);
 
P_Bar_2_Function_Eq_Six = polyfit(Table6.P_Bar_2,Table6.Var1,5);
P_Bar_2_Function_Six = @(x) P_Bar_2_Function_Eq_Six(1)*x^5+P_Bar_2_Function_Eq_Six(2)*x^4+P_Bar_2_Function_Eq_Six(3)*x^3+P_Bar_2_Function_Eq_Six(4)*x^2+P_Bar_2_Function_Eq_Six(5)*x+P_Bar_2_Function_Eq_Six(6);
 
T_K_Function_Eq_Six = polyfit(Table6.T_K,Table6.Var1,5);
T_K_Function_Six = @(x) T_K_Function_Eq_Six(1)*x^5+T_K_Function_Eq_Six(2)*x^4+T_K_Function_Eq_Six(3)*x^3+T_K_Function_Eq_Six(4)*x^2+T_K_Function_Eq_Six(5)*x+T_K_Function_Eq_Six(6);
 
T_K_1_Function_Eq_Six = polyfit(Table6.T_K_1,Table6.Var1,5);
T_K_1_Function_Six = @(x) T_K_1_Function_Eq_Six(1)*x^5+T_K_1_Function_Eq_Six(2)*x^4+T_K_1_Function_Eq_Six(3)*x^3+T_K_1_Function_Eq_Six(4)*x^2+T_K_1_Function_Eq_Six(5)*x+T_K_1_Function_Eq_Six(6);
 
T_K_2_Function_Eq_Six = polyfit(Table6.T_K_2,Table6.Var1,5);
T_K_2_Function_Six = @(x) T_K_2_Function_Eq_Six(1)*x^5+T_K_2_Function_Eq_Six(2)*x^4+T_K_2_Function_Eq_Six(3)*x^3+T_K_2_Function_Eq_Six(4)*x^2+T_K_2_Function_Eq_Six(5)*x+T_K_2_Function_Eq_Six(6);

%% Table 7 - Functions - Returns Height

Density_Function_Eq = polyfit(Table7.Density.*1000,Table7.Altitude,13);
Density_Function = @(x) Density_Function_Eq(1).*x.^13 + Density_Function_Eq(2).*x.^12+ Density_Function_Eq(3).*x.^11 + Density_Function_Eq(4).*x.^10 + Density_Function_Eq(5).*x.^9 + Density_Function_Eq(6).*x.^8 +Density_Function_Eq(7).*x.^7 +Density_Function_Eq(8).*x.^6+Density_Function_Eq(9).*x.^5 + Density_Function_Eq(10).*x.^4 +Density_Function_Eq(11).*x.^3 + Density_Function_Eq(12).*x.^2 + Density_Function_Eq(13).*x.^1 + Density_Function_Eq(14)
Density = Table7.Density*1000;

Molecular_Mass_Function_Eq = polyfit(Table7.MolecularMass,Table7.Altitude,1);
Molecular_Mass_Function = @(x) Molecular_Mass_Function_Eq(1).*x+Molecular_Mass_Function_Eq(2);

Number_Density_Function_Eq = polyfit(Table7.NumberDensity,Table7.Altitude,2);
Number_Density_Function = @(x) Number_Density_Function_Eq(1).*x+Number_Density_Function_Eq(2);


Viscosity_Function_Eq = polyfit(Table7.Viscosity,Table7.Altitude,6);
Viscosity_Function = @(x) Viscosity_Function_Eq(1).*x.^6+Viscosity_Function_Eq(2).*x.^5+Viscosity_Function_Eq(3).*x.^4+Viscosity_Function_Eq(4).*x.^3+Viscosity_Function_Eq(5).*x.^2+Viscosity_Function_Eq(6).*x+Viscosity_Function_Eq(7);

%% Figures
figure(1)
%sgtitle('\phi < 35^{\circ}')
subplot(2,4,1)
plot(Table2.P_Bar,Table2.Var1,'b*',Table2.P_Bar,P_Bar_Function_Two(Table2.P_Bar)) 

title('L_s = 20^{\circ}-90^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,5)
plot(Table2.T_K,Table2.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,2)
plot(Table2.P_Bar_1,Table2.Var1,'b*')
xlabel('Pressure [bar]')
ylabel('Height [km]')
title('L_s = 90^{\circ}-130^{\circ}')
subplot(2,4,6)
plot(Table2.T_K_1,Table2.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,3)
plot(Table2.P_Bar_2,Table2.Var1,'b*')
title('L_s = 200^{\circ}-270^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,7)
plot(Table2.T_K_2,Table2.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,4)
plot(Table2.P_Bar_3,Table2.Var1,'b*')
title('L_s = 270^{\circ}-310^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,8)
plot(Table2.T_K_3,Table2.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')


figure(2)
%sgtitle('\phi = 35^{\circ} - 55^{\circ}')
subplot(2,4,1)
plot(Table3.P_Bar,Table3.Var1,'b*')
title('L_s = 20^{\circ}-90^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,5)
plot(Table3.T_K,Table3.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,2)
plot(Table3.P_Bar_1,Table3.Var1,'b*')
xlabel('Pressure [bar]')
ylabel('Height [km]')
title('L_s = 90^{\circ}-130^{\circ}')
subplot(2,4,6)
plot(Table3.T_K_1,Table3.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,3)
plot(Table3.P_Bar_2,Table3.Var1,'b*')
title('L_s = 200^{\circ}-270^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,7)
plot(Table3.T_K_2,Table3.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,4)
plot(Table3.P_Bar_3,Table3.Var1,'b*')
title('L_s = 270^{\circ}-310^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,8)
plot(Table3.T_K_3,Table3.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')


figure(3)
%sgtitle('\phi = 50^{\circ} - 70^{\circ}')
subplot(2,4,1)
plot(Table4.P_Bar,Table4.Var1,'b*')
title('L_s = 20^{\circ}-90^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,5)
plot(Table4.T_K,Table4.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,2)
plot(Table4.P_Bar_1,Table4.Var1,'b*')
xlabel('Pressure [bar]')
ylabel('Height [km]')
title('L_s = 90^{\circ}-130^{\circ}')
subplot(2,4,6)
plot(Table4.T_K_1,Table4.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,3)
plot(Table4.P_Bar_2,Table4.Var1,'b*')
title('L_s = 200^{\circ}-270^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,7)
plot(Table4.T_K_2,Table4.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,4)
plot(Table4.P_Bar_3,Table4.Var1,'b*')
title('L_s = 270^{\circ}-310^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,8)
plot(Table4.T_K_3,Table4.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')


figure(4)
%sgtitle('\phi = 70^{\circ} - 80^{\circ}')
subplot(2,4,1)
plot(Table5.P_Bar,Table5.Var1,'b*')
title('L_s = 20^{\circ}-90^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,5)
plot(Table5.T_K,Table5.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,2)
plot(Table5.P_Bar_1,Table5.Var1,'b*')
xlabel('Pressure [bar]')
ylabel('Height [km]')
title('L_s = 90^{\circ}-130^{\circ}')
subplot(2,4,6)
plot(Table5.T_K_1,Table5.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,3)
plot(Table5.P_Bar_2,Table5.Var1,'b*')
title('L_s = 200^{\circ}-270^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,7)
plot(Table5.T_K_2,Table5.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,4)
plot(Table5.P_Bar_3,Table5.Var1,'b*')
title('L_s = 270^{\circ}-310^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,8)
plot(Table5.T_K_3,Table5.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

figure(5)
%sgtitle('\phi = 85^{\circ}')
subplot(2,4,1)
plot(Table6.P_Bar,Table6.Var1,'b*')
title('L_s = 20^{\circ}-90^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,5)
plot(Table6.T_K,Table6.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,2)
plot(Table6.P_Bar_1,Table6.Var1,'b*')
xlabel('Pressure [bar]')
ylabel('Height [km]')
title('L_s = 90^{\circ}-130^{\circ}')
subplot(2,4,6)
plot(Table6.T_K_1,Table6.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,3)
plot(Table6.P_Bar_2,Table6.Var1,'b*')
title('L_s = 200^{\circ}-270^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,7)
plot(Table6.T_K_2,Table6.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')

subplot(2,4,4)
plot(Table6.P_Bar_3,Table6.Var1,'b*')
title('L_s = 270^{\circ}-310^{\circ}')
xlabel('Pressure [bar]')
ylabel('Height [km]')
subplot(2,4,8)
plot(Table6.T_K_3,Table6.Var1,'r*')
xlabel('Temperature [k]')
ylabel('Height [km]')



figure(6)
%sgtitle('1972 - Venus Atmosphere (Model 1) (most probable molecular mass and mean solar activity)')
subplot(2,2,1)
plot(Table7.Density*1000, Table7.Altitude,'b*',Density, Density_Function(Density),'r-')
xlabel('$\displaystyle \textnormal{Density} [\frac{kg}{m^3}]$','Interpreter','latex')
ylabel('Height [km]')

subplot(2,2,2)
plot(Table7.MolecularMass,Table7.Altitude,'b*',Table7.MolecularMass, Molecular_Mass_Function(Table7.MolecularMass),'r-')
xlabel('$\displaystyle \textnormal{Molecular Mass} [\frac{g}{g \cdot mole}]$','Interpreter','latex')
ylabel('Height [km]')

subplot(2,2,3)
plot(Table7.NumberDensity,Table7.Altitude,'b*',Table7.NumberDensity, Number_Density_Function(Table7.NumberDensity),'r-')
xlabel('$\textnormal{Number Density} [\frac{1}{cm^3}$]','Interpreter','latex')
ylabel('Height [km]')

subplot(2,2,4)
plot(Table7.Viscosity,Table7.Altitude,'b*',Table7.Viscosity, Viscosity_Function(Table7.Viscosity),'r-')
xlabel('$\textnormal{Viscosity} [\frac{kg}{m \cdot s}$]','interpreter','latex')
ylabel('Height [km]')


%% Analysis
% Conduct Level Flight at 53 km

rho_50_km = fsolve(@(x) (50-Density_Function(x)),1); %kg/m^3
rho_60_km = fsolve(@(x) (60-Density_Function(x)),1); %kg/m^3
rho_70_km = fsolve(@(x) (70-Density_Function(x)),1); %kg/m^3
rho_80_km = fsolve(@(x) (80-Density_Function(x)),1); %kg/m^3
rho_53_km = fsolve(@(x) (53-Density_Function(x)),1); %kg/m^3


Diameters = 0:0.01:10; %m
Radi = Diameters/2; %m
Vol_Balloon = @(r) (4/3)*pi.*r.^3;   %m^3
Mass_Total = @(rho) Vol_Balloon(Radi)*rho;

figure(7)
plot(Vol_Balloon(Radi), Mass_Total(rho_50_km),Vol_Balloon(Radi), Mass_Total(rho_60_km),Vol_Balloon(Radi), Mass_Total(rho_70_km),Vol_Balloon(Radi), Mass_Total(rho_80_km), Vol_Balloon(Radi), Mass_Total(rho_53_km), Vol_Balloon(3.4/2),21.5,'r*',Vol_Balloon(7.1/2),162.5,'r*')
title('Stable Altitudes - Mass and Volume')
legend('50 [km]','60 [km]','70 [km]','80 [km]','53 [km]','Vega 1','Venus Flagship (VDRM)','location','best')
xlabel('Volume of Balloon [m^3]')
ylabel('Mass of Balloon [kg]')
ylim([0 250])
xlim([0 250])

%% Temperature and Pressure

Pressure_B_35 = [fsolve(@(x) 53-P_Bar_Function_Two(x),0.7), fsolve(@(x) 53-P_Bar_1_Function_Two(x),0.7),fsolve(@(x) 53-P_Bar_1_Function_Two(x),0.7)];
Pressure_BW_35_55 = [fsolve(@(x) 53-P_Bar_Function_Three(x),0.7), fsolve(@(x) 53-P_Bar_Function_Three(x),0.7),fsolve(@(x) 53-P_Bar_Function_Three(x),0.7)];
Pressure_BW_50_70 = [fsolve(@(x) 53-P_Bar_Function_Four(x),0.7), fsolve(@(x) 53-P_Bar_Function_Four(x),0.7),fsolve(@(x) 53-P_Bar_Function_Four(x),0.7)];
Pressure_BW_70_80 = [fsolve(@(x) 53-P_Bar_Function_Five(x),0.7), fsolve(@(x) 53-P_Bar_Function_Five(x),0.7),fsolve(@(x) 53-P_Bar_Function_Five(x),0.7)];
Pressure_B_85 = [fsolve(@(x) 53-P_Bar_Function_Six(x),0.7), fsolve(@(x) 53-P_Bar_Function_Six(x),0.7),fsolve(@(x) 53-P_Bar_Function_Six(x),0.7)];

Temp_B_35 = [fsolve(@(x) 53-T_K_Function_Two(x),350), fsolve(@(x) 53-T_K_1_Function_Two(x),350),fsolve(@(x) 53-T_K_2_Function_Two(x),350)];
Temp_BW_35_55 = [fsolve(@(x) 53-T_K_Function_Three(x),350), fsolve(@(x) 53-T_K_1_Function_Three(x),350),fsolve(@(x) 53-T_K_2_Function_Three(x),350)];
Temp_BW_50_70 = [fsolve(@(x) 53-T_K_Function_Four(x),350), fsolve(@(x) 53-T_K_1_Function_Four(x),350),fsolve(@(x) 53-T_K_2_Function_Four(x),350)];
Temp_BW_70_80 = [fsolve(@(x) 53-T_K_Function_Five(x),350), fsolve(@(x) 53-T_K_1_Function_Five(x),350),fsolve(@(x) 53-T_K_2_Function_Five(x),350)];
Temp_B_85 = [fsolve(@(x) 53-T_K_Function_Six(x),350), fsolve(@(x) 53-T_K_1_Function_Six(x),350),fsolve(@(x) 53-T_K_2_Function_Six(x),350)];

Pres_Solar_Long_20_90 = [Pressure_B_35(1),Pressure_BW_35_55(1),Pressure_BW_50_70(1),Pressure_BW_70_80(1),Pressure_B_85(1)];
Pres_Solar_Long_90_130 = [Pressure_B_35(2),Pressure_BW_35_55(2),Pressure_BW_50_70(2),Pressure_BW_70_80(2),Pressure_B_85(2)];
Pres_Solar_Long_200_270 = [Pressure_B_35(3),Pressure_BW_35_55(3),Pressure_BW_50_70(3),Pressure_BW_70_80(3),Pressure_B_85(3)];
%Solar_Long_270_310 = [Pressure_B_35(3),Pressure_BW_35_55(3),Pressure_BW_50_70(3),Pressure_BW_70_80(3),Pressure_B_85(3)];

Temp_Solar_Long_20_90 = [Temp_B_35(1),Temp_BW_35_55(1),Temp_BW_50_70(1),Temp_BW_70_80(1),Temp_B_85(1)];
Temp_Solar_Long_90_130 = [Temp_B_35(2),Temp_BW_35_55(2),Temp_BW_50_70(2),Temp_BW_70_80(2),Temp_B_85(2)];
Temp_Solar_Long_200_270 = [Temp_B_35(3),Temp_BW_35_55(3),Temp_BW_50_70(3),Temp_BW_70_80(3),Temp_B_85(3)];
%Temp_Solar_Long_270_310 = [Temp_B_35(3),Temp_BW_35_55(3),Temp_BW_50_70(3),Temp_BW_70_80(3),Temp_B_85(3)];

%% Sphere Plot
% N = 10;
% thetavec = linspace(0,pi,N);
% phivec = linspace(0,2*pi,2*N);
% [th, ph] = meshgrid(thetavec,phivec);
% R = ones(size(th)); % should be your R(theta,phi) surface in general
% 
% x = R.*sin(th).*cos(ph);
% y = R.*sin(th).*sin(ph);
% z = R.*cos(th);
% c_data = ones(size(th)).*[Temp_Solar_Long_20_90(1), Temp_Solar_Long_90_130(1), Temp_Solar_Long_200_270(1)];
% 
% surf(x,y,z,c_data);
% axis vis3d
