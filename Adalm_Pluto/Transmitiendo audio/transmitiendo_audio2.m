[x,fs]=audioread("prueba.wav");
%Cargamos la señal de audio y su fs
%Reproducimos
%sound(x,fs);
%Vector de tiempos
t=(1:length(x))*1/fs;
t=t';
x_normalizada = x / max(x);
figure;
plot(t,x_normalizada)
title("Representación temporal de la señal de audio")
%%FFT
X=fftshift(fft(x));
L = length(X);
dF = fs/L;
f = dF*(-L/2:(L/2)-1)';
figure;
plot(f,abs(X));
title("Espectro de Señal de audio a transmitir")
x=complex(x);
tx = sdrtx('Pluto');
%Señal a transmitir
%Configuración del TX a través de métodos (Ese mismo cuatri tienen POO)
tx.CenterFrequency = 2.415e9;
tx.BasebandSampleRate = 2e6;
tx.Gain = -5;
 %transmisión repetida
transmitRepeat(tx,x);
 %recepcion
recibidas=real(double(out.rx));
recibidas=recibidas(1:500000);
soundsc(recibidas,fs);




