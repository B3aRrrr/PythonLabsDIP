clear all; close all;
% Чтение изображения
I=imread('A6_08_2.jpg');

figure(1);
imshow(I);
% Конвертация в чб и в double
I = im2double(I);
% получение размера изображения
[sy,sx] = size(I);
CH = F_chess_2D(sy,sx);
RF1=fft2(I.*CH);
figure(2);
imshow(log(1+abs(RF1)), [ ]);
% центр
RF1(441,1061)=0;
RF1(641, 861)=0;

figure(3);
imshow(log(1+abs(RF1)), [ ]);

G2 = ifft2(RF1);
figure(4); 
imshow(abs(G2),[]);