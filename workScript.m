filename = 'Data1.xls';
data = xlsread(filename);

x = data(:, 1);
y = data(:, 2);
z = data(:, 3);

sf = fit([x, y],z,'poly22');

figure
plot(sf,[x,y],z)