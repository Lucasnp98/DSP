[x,fs]=audioread("prueba.wav");
sound(x,fs);
t=(1:length(x))*1/fs;
t=t';

%
X=fftshift(fft(x));
L = length(X);
dF = fs/L;
f = dF*(-L/2:(L/2)-1)';
figure;
plot(f,abs(X));

%exponencial
t=(1:length(x))*1/fs;
t=t';
fc=50e3;
portadora=exp(1*j*2*pi*fc*t);

P=fftshift(fft(portadora));
figure;
plot(f,10*log(abs(P)));
title("Portadora")

tx_wv=x.*portadora;

TX=fftshift(fft(tx_wv));
figure;
plot(f,10*log(abs(TX)));
title("Señal a transmitir");

 tx = sdrtx('Pluto');
%Señal a transmitir
 
%Configuración del TX a través de métodos (Ese mismo cuatri tienen POO)
 tx.CenterFrequency = 2.415e9;
 tx.BasebandSampleRate = 2e6;
 tx.Gain = -5;
 %transmisión repetida
 transmitRepeat(tx,tx_wv);


 rx=out.rx;
 RX=fftshift(fft(rx));
 L2 = length(RX);
 fs2=2e6;
 dF2 = fs2/L2;
f2 = dF2*(-L2/2:(L2/2)-1)';

figure;
plot(f2,10*log(abs(RX)));
title("Recibida");
 

trx=(1:length(rx))*1/fs2;
trx=trx';
fc=50e3;
portadora2=exp(-1*j*2*pi*fc*trx);

P2=fftshift(fft(portadora2));
figure;
plot(f2,10*log(abs(P2)));

rx_bb=double(rx).*portadora2;
RX_BB=fftshift(fft(rx_bb));
figure;
plot(f2,10*log(abs(RX_BB)));




