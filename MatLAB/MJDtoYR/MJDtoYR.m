%Converter between Modified Julian Day and Gregorian dates
%CHECK HERE http://pdc.ro.nu/mjd.cgi
clear all; close all;

[JulD, North]=textread('7080y288.txt', '%f %f', 288);

subplot(2,1,1)
plot(JulD, North, 'c')
hold on

L = JulD + 2400001 + 68569;
N = 4 * L / 146097;
L = L - (146097 * N + 3) / 4;
YEAR = 4000 * (L + 1) / 1461001;
L = L - 1461 * YEAR / 4 + 31;
MONTH = 80 * L / 2447;
DAY = L - 2447 * MONTH / 80;
L = MONTH / 11;
MONTH = MONTH + 2 - 12 * L;
YEAR = 100 * (N - 49) + YEAR + L;

subplot(2,1,2)
plot(YEAR, North, '-k')
hold on

fid=fopen('out7080y288.txt','w');
fprintf(fid, '%f %f \n', [YEAR North]');
fclose(fid);