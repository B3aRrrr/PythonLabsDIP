clear all; close all;
% Чтение изображения
I=imread('A6_05_2.jpg');
% Конвертация в чб и в double
I = im2double(I);
% получение размера изображения
[sy,sx] = size(I);
CH = F_chess_2D(sy,sx);
RF1=fft2(I.*CH);
figure(1);
imshow(log(1+abs(RF1)), [ ]);

RF1(541, 1161)=0;
RF1(541, 761)=0;
RF1(341, 961)=0;
RF1(741, 961)=0;
figure(2);
imshow(log(1+abs(RF1)), [ ]);

G2 = ifft2(RF1);
figure(3); imshow(abs(G2),[]);



