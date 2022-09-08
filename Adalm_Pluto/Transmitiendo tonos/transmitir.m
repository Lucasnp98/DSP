 fs = 2e6;
 
 
 %x1
 sw = dsp.SineWave;
 sw.Amplitude = 0.5;
 sw.Frequency = 500e3;
 sw.ComplexOutput = true;
 sw.SampleRate = fs;
 sw.SamplesPerFrame = 5000;
 x1 = sw();
 %segundo seno
 sw = dsp.SineWave;
 sw.Amplitude = 0.5;
 sw.Frequency = 700e3;
 sw.ComplexOutput = true;
 sw.SampleRate = fs;
 sw.SamplesPerFrame = 5000;
 x2 = sw();

 
 %Constructor del TX de la pluto. Una sola linea!!!!
 tx = sdrtx('Pluto');
%Señal a transmitir
 tx_wv=x2+x1; 
%Configuración del TX a través de métodos (Ese mismo cuatri tienen POO)
 tx.CenterFrequency = 2.415e9;
 tx.BasebandSampleRate = fs;
 tx.Gain = -5;
 %transmisión repetida
 transmitRepeat(tx,tx_wv);