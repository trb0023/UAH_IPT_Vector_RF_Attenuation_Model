function [margin, datarate] = link_calc_alt(bandwidth, ebno, coderate, landergain, orbitergain, landerpower, miscloss, atmosphereloss, pathloss, noisetemp)

%bandwidth = 1.34 * datarate/(coderate*2);
datarate = bandwidth*2*coderate/1.34;

erip = 10*log10(landerpower)+landergain;

reciever_carrier_power = erip+orbitergain-pathloss-atmosphereloss;

available_ebno = (reciever_carrier_power-noisetemp+228.6)-(10*log10(datarate*10^6));

margin = available_ebno-miscloss-ebno;
end