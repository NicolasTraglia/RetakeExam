clc;
clear all;
close all;

#The signal is composed of a linear combination of 2 sine waves that may evolve over time and white noise

Fs=650; #Sampling frequency
signal = csvread('unknownsignal.csv');
n=length(signal);

t=0:1/Fs:(n-1)/Fs;
#plot(t,signal(:)); #raw signal with sampling frequency Fs
signalFT=fft(signal,n);
#plot(t,20*log10(abs(fftshift(signalFT)))) #Spectral rep of signal

##Moving average filter
signalAvg= zeros(n);
windowSize=5;
for i = windowSize:n
  signalAvg(i)=sum(signal(i-windowSize+1:i)/windowSize);
endfor
##
#plot(t,signalAvg)

