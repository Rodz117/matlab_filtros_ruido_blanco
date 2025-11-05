
% main_filtros.m
% Proyecto: Actividad Formativa 3 - Implementación y evaluación de filtros digitales
% Autor: Rodrigo Alejandro Trigo Partida
% Descripción:
%   - Genera una señal de ruido blanco
%   - Diseña filtros pasa bajos, pasa altos y pasa bandas (IIR Butterworth)
%   - Aplica los filtros y guarda resultados automáticos en formato PNG

clear; close all; clc;

%% 1) Definición de la señal de entrada (ruido blanco)
fs = 2000;             % Frecuencia de muestreo [Hz]
T  = 2;                % Duración [s]
N  = fs*T;             % Número de muestras
t  = (0:N-1)/fs;       % Vector de tiempo
x  = randn(1,N);       % Ruido blanco

% Crear carpeta para resultados
if ~exist('figuras','dir')
    mkdir figuras;
end

% Gráfica de la señal original
figure;
plot(t, x, 'b'); grid on; xlim([0 0.2]);
xlabel('Tiempo [s]'); ylabel('Amplitud');
title('Señal original: Ruido blanco');
saveas(gcf, fullfile('figuras', 'senal_original.png'));

% PSD de la señal original (referencia)
figure;
pwelch(x, [], [], [], fs);
title('Densidad espectral de potencia - Señal original');
saveas(gcf, fullfile('figuras', 'psd_senal_original.png'));

%% 2) Diseño de filtros y aplicación
% Frecuencias de corte
fpb = 150;                 % Pasa bajos
fpa = 300;                 % Pasa altos
fpb1 = 200; fpb2 = 400;    % Pasa bandas

orden_iir = 4; % Orden Butterworth

% Filtro pasa bajos Butterworth
[y_pb_iir, Hd_pb_iir] = filtro_pasabajos(x, fs, fpb, 'butter', orden_iir);

% Filtro pasa altos Butterworth
[y_pa_iir, Hd_pa_iir] = filtro_pasaaltos(x, fs, fpa, 'butter', orden_iir);

% Filtro pasa bandas Butterworth
[y_pbw_iir, Hd_pbw_iir] = filtro_pasabandas(x, fs, [fpb1 fpb2], 'butter', orden_iir);

%% 3) Guardar resultados específicos (figuras)

% Señal original vs filtrada (pasa bajos)
figure;
subplot(2,1,1);
plot(t, x, 'b'); grid on; xlim([0 0.2]);
title('Señal original (ruido blanco)');
xlabel('Tiempo [s]'); ylabel('Amplitud');

subplot(2,1,2);
plot(t, y_pb_iir, 'r'); grid on; xlim([0 0.2]);
title('Señal filtrada - Pasa bajos IIR (Butterworth)');
xlabel('Tiempo [s]'); ylabel('Amplitud');

saveas(gcf, fullfile('figuras', 'senial_filtrada_pasabajos_IIR.png'));

% --- RESPUESTA EN FRECUENCIA DE CADA FILTRO ---

% Pasa bajos IIR
[Hpb, wpb] = freqz(Hd_pb_iir.b, Hd_pb_iir.a, 1024, fs);
figure;
subplot(2,1,1);
plot(wpb, 20*log10(abs(Hpb)+eps), 'b'); grid on;
title('Magnitud - Filtro pasa bajos IIR (Butterworth)');
xlabel('Frecuencia [Hz]'); ylabel('|H(f)| [dB]');
subplot(2,1,2);
plot(wpb, unwrap(angle(Hpb))*180/pi, 'r'); grid on;
xlabel('Frecuencia [Hz]'); ylabel('Fase [°]');
saveas(gcf, fullfile('figuras', 'resp_freq_pasabajos_IIR.png'));

% Pasa altos IIR
[Hpa, wpa] = freqz(Hd_pa_iir.b, Hd_pa_iir.a, 1024, fs);
figure;
subplot(2,1,1);
plot(wpa, 20*log10(abs(Hpa)+eps), 'b'); grid on;
title('Magnitud - Filtro pasa altos IIR (Butterworth)');
xlabel('Frecuencia [Hz]'); ylabel('|H(f)| [dB]');
subplot(2,1,2);
plot(wpa, unwrap(angle(Hpa))*180/pi, 'r'); grid on;
xlabel('Frecuencia [Hz]'); ylabel('Fase [°]');
saveas(gcf, fullfile('figuras', 'resp_freq_pasaaltos_IIR.png'));

% Pasa bandas IIR
[Hpbw, wpbw] = freqz(Hd_pbw_iir.b, Hd_pbw_iir.a, 1024, fs);
figure;
subplot(2,1,1);
plot(wpbw, 20*log10(abs(Hpbw)+eps), 'b'); grid on;
title('Magnitud - Filtro pasa bandas IIR (Butterworth)');
xlabel('Frecuencia [Hz]'); ylabel('|H(f)| [dB]');
subplot(2,1,2);
plot(wpbw, unwrap(angle(Hpbw))*180/pi, 'r'); grid on;
xlabel('Frecuencia [Hz]'); ylabel('Fase [°]');
saveas(gcf, fullfile('figuras', 'resp_freq_pasabandas_IIR.png'));

disp('✅ Imágenes generadas en la carpeta "figuras":');
disp(' - senal_original.png');
disp(' - senial_filtrada_pasabajos_IIR.png');
disp(' - resp_freq_pasabajos_IIR.png');
disp(' - resp_freq_pasaaltos_IIR.png');
disp(' - resp_freq_pasabandas_IIR.png');
