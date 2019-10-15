function [margin, bandwidth, actual_datarate] = link_calc(datarate, max_bandwidth, ebno, coderate, landergain, orbitergain, landerpower, miscloss, atmosphereloss, pathloss, noisetemp)

bandwidth = 1.34 * datarate/coderate/2;
if(bandwidth <= max_bandwidth)
    actual_datarate = datarate;
else
    datarate = max_bandwidth*2*coderate/1.34;
    actual_datarate = datarate;
end

erip = 10*log10(landerpower)+landergain;

reciever_carrier_power = erip+orbitergain-pathloss-atmosphereloss;

available_ebno = (reciever_carrier_power-noisetemp+228.6)-(10*log10(datarate*10^6));

margin = available_ebno-miscloss-ebno;
end