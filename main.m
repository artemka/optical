%% Course project 2012/2013 by Bogachev Artem

% multilayer system initial options
n0 = 1.52; % glass
na = 1.0; % air
H = 20000; % thickness
N = 150; % max number of layers

options = [n0 na H N];

iv = 1.2 * rand(1,N) + 1.4; % initial vector
%iv(50) = 2.6;
%iv(75) = 10.0;
%iv(30:44) = 1.8;
%iv(10:15) = 2.6;

printf('Multilayered system with n0 = %f, na = %f\n', n0, na);


% wave lenghts in angstrems
lambda1 = 4000;
lambda2 = 7000;


% desired distribution
linearD = @(lambda) (lambda - lambda1) / (lambda2 - lambda1);
RDes = linearD(lambda1:10:lambda2);
RCalc = arrayfun(@(k) energeticReflectCoeff(iv, 2 * pi / k, options), 4000:10:7000);

spectrumRange = lambda1:10:lambda2;

figure(1);
clf;
hold on;

title('Reflect coefficents');
xlabel('wave length');
plot(spectrumRange, RDes, '-r');
plot(spectrumRange, RCalc, '-b');
plot(spectrumRange, abs(RDes-RCalc), '-g');

hold off;

% plot desired distribution



R = energeticReflectCoeff(iv, 2 * pi / lambda1, options);
printf('Reflect coeffient at %f is %f.\n', 4000, R);

Rn = arrayfun(@(n) energeticReflectCoeff([n iv(2:length(iv))], 2 * pi / 4000, options) - linearD(4000), 1.4:0.05:2.6);

figure(2);
clf;
hold on;
plot( 1.4:0.05:2.6, Rn);
hold off;


