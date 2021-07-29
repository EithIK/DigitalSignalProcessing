% 06-11-2020 CPE KUSRC
% Dog, Cat, Sheep Sounds Classification using FFT and SAD Algorithms

clc
clear
close all

% initial hardware setup
fs = 44100; % sampling rate
rectime = 2; % recording time in second
data = record(rectime, fs);

% time variable
t=0:1/fs:length(data)/fs - 1/fs;

% FFT method to show in Frequency Domain
fx = fft(data, fs);
afx = abs(fx(1:2000)); % input frequency

afx = afx/max(abs(afx)); % normalization

% load data
datain = load('DataProjectDSP.csv'); % recorded audio data
class1 = datain(:,1); % column 1 = Lion
class1 = class1/max(abs(class1));
class2 = datain(:,2); % column 2 = Bird
class2 = class2/max(abs(class2));
class3 = datain(:,3); % column 3 = Cat
class3 = class3/max(abs(class3));

% minimum distance classifier by sum of absolute differences (SAD)
dist1 = sum(abs(afx - class1)); % Lion
dist2 = sum(abs(afx - class2)); % Bird
dist3 = sum(abs(afx - class3)); % Cat
dist1
dist2
dist3
[a b] = min([dist1 dist2 dist3]) % 'b' is to determine the minimum distance


  
% show output
subplot(3,1,1);plot(t, data);
subplot(3,1,2);stem(afx, 'm');


if(a == dist1)
  subplot(3,1,3);imshow('Lion.jpg');
end

if(a == dist2)
  subplot(3,1,3);imshow('Bird.jpg');
end

if(a == dist3)
  subplot(3,1,3);imshow('Cat.jpg');
end