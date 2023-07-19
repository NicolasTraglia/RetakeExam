## Copyright (C) 2023 Nicolas Traglia
function FilteredSignal = SignalFilter (OriginalSignal, Cf, HoL='low',PolyCoeff=20)
%%%%%%%%%%%%
% function FilteredSignal = SignalFilter (OriginalSignal, Cf, HoL)
% ex.: SignalFilter(fx,1000/Sf,"low")
%
% Task: Filter a signal with a High or Low pass filter.
%
% Inputs:
%	- OriginalSignal: unfiltered signal /!\ NOT IN Hz
% - Cf: Cutoff frequency in Hz/(Sampling Frequency)
% - HoL: "high" or "low", defines what type of filter is used. Must be char.
% - PolyCoeff: coefficient of the polynomial, 20 by default.
%
% Output:
% 	- FilteredSignal: original signal filtered using a lowpass or highpass filter
%
% Note: if you want to plot the signal in Hz and dB, use plot(Freq,20*log10(abs(fftshift(YourSignal)))), with Freq going from -n/2 : n/2 - 1
%
% Author: Nicolas Traglia, nicolas.traglia@ecam.fr
% Last updated: 17/07/2023
%%%%%%%%%%%%

HoL_Filter = fir1(PolyCoeff,Cf,HoL);
FilteredSignal=filter(HoL_Filter,1,OriginalSignal);
endfunction
