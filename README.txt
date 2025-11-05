Buen día al que esté leyendo esto

Mi nombre es Rodrigo Alejandro Trigo Partida.

Esta es la Actividad Formativa 3 de la materia de Señales y Sistemas.

Laboratorio: Implementación y evaluación de filtros digitales en MATLAB.

Contenido:
- main_filtros.m ............... Script principal que genera la señal de ruido blanco, diseña los filtros y guarda los resultados.
- filtro_pasabajos.m ........... Filtro pasa bajos (Butterworth o FIR).
- filtro_pasaaltos.m ........... Filtro pasa altos (Butterworth o FIR).
- filtro_pasabandas.m .......... Filtro pasa bandas (Butterworth o FIR).
- figuras/ ..................... Carpeta donde se guardan las imágenes (.PNG) generadas por MATLAB.
- README.txt ................... Documento explicativo.

Descripción general:
Se implementan filtros digitales pasa bajos, pasa altos y pasa bandas sobre una señal de ruido blanco.
Los filtros se diseñan con métodos IIR (Butterworth) y FIR (ventana Hamming) para comparar sus respuestas.
El código guarda automáticamente las gráficas de las señales y respuestas en frecuencia.

Herramientas MATLAB usadas:
- randn(), butter(), fir1(), filtfilt(), freqz(), pwelch(), saveas().

Resultados esperados:
- senal_original.png
- psd_senal_original.png
- senial_filtrada_pasabajos_IIR.png
- resp_freq_pasabajos_IIR.png
- resp_freq_pasaaltos_IIR.png
- resp_freq_pasabandas_IIR.png
