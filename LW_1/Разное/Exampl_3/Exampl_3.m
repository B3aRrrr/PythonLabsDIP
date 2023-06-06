clear all; close all;
%% Программа обработки изображений
%  Лаб_раб_1 "Основы работы с изображениями в Matlab"
%  1. Считывание заданных изображений
%  2. Перевод изображений в полутоновые
%  3. Создание негативных изображений для всех заданных изображений
%  4. Создание мозаичного изображения на основе первого
%  5. Создание мозаичного изображения на основе всех изображений
%  6. Запись изображения в файл

%% 1. Считывание изображениий
P1 = imread('Children_1.jpg');   % считывание изображения (оригинал)
P2 = imread('Children_2.jpg');   % считывание изображения (оригинал)
P3 = imread('Cone.jpg');         % считывание изображения (оригинал)
P4 = imread('Flower.jpg');       % считывание изображения (оригинал)
P5 = imread('Hill.jpg');         % считывание изображения (оригинал)
P6 = imread('Plane.jpg');        % считывание изображения (оригинал)
P7 = imread('Space.jpg');        % считывание изображения (оригинал)
P8 = imread('Twig.jpg');         % считывание изображения (оригинал)

P1 = im2double(P1);              % перевод в тип действит. чисел [0,1]
P2 = im2double(P2);              % перевод в тип действит. чисел [0,1]
P3 = im2double(P3);              % перевод в тип действит. чисел [0,1]
P4 = im2double(P4);              % перевод в тип действит. чисел [0,1]
P5 = im2double(P5);              % перевод в тип действит. чисел [0,1]
P6 = im2double(P6);              % перевод в тип действит. чисел [0,1]
P7 = im2double(P7);              % перевод в тип действит. чисел [0,1]
P8 = im2double(P8);              % перевод в тип действит. чисел [0,1]

figure(11); imshow(P1); pause;  % вывод исходного изображения на экран
figure(12); imshow(P2); pause;  % вывод исходного изображения на экран
figure(13); imshow(P3); pause;  % вывод исходного изображения на экран
figure(14); imshow(P4); pause;  % вывод исходного изображения на экран
figure(15); imshow(P5); pause;  % вывод исходного изображения на экран
figure(16); imshow(P6); pause;  % вывод исходного изображения на экран
figure(17); imshow(P7); pause;  % вывод исходного изображения на экран
figure(18); imshow(P8); pause;  % вывод исходного изображения на экран

%% 2. Перевод изображений в полутоновые
PG1 = rgb2gray(P1); figure(21); imshow(PG1); pause;
PG2 = rgb2gray(P2); figure(22); imshow(PG2); pause;
PG3 = rgb2gray(P3); figure(23); imshow(PG3); pause;
PG4 = rgb2gray(P4); figure(24); imshow(PG4); pause;
PG5 = rgb2gray(P5); figure(25); imshow(PG5); pause;
PG6 = rgb2gray(P6); figure(26); imshow(PG6); pause;
PG7 = rgb2gray(P7); figure(27); imshow(PG7); pause;
PG8 = rgb2gray(P8); figure(28); imshow(PG8); pause;

%% 3. Создание негативных изображений
[n1,m1]=size(PG1);PG1neg=ones(n1,m1)-PG1;figure(31);imshow(PG1neg);pause;
[n2,m2]=size(PG2);PG2neg=ones(n2,m2)-PG2;figure(32);imshow(PG2neg);pause;
[n3,m3]=size(PG3);PG3neg=ones(n3,m3)-PG3;figure(33);imshow(PG3neg);pause;
[n4,m4]=size(PG4);PG4neg=ones(n4,m4)-PG4;figure(34);imshow(PG4neg);pause;
[n5,m5]=size(PG5);PG5neg=ones(n5,m5)-PG5;figure(35);imshow(PG5neg);pause;
[n6,m6]=size(PG6);PG6neg=ones(n6,m6)-PG6;figure(36);imshow(PG6neg);pause;
[n7,m7]=size(PG7);PG7neg=ones(n7,m7)-PG7;figure(37);imshow(PG7neg);pause;
[n8,m8]=size(PG8);PG8neg=ones(n8,m8)-PG8;figure(38);imshow(PG8neg);pause;

%% 4. Создание мозаичного изображения на основе первого
PGmoz = PG1;
nmz = round((n1-10)/4);
PM1 = PG1(1:nmz,:); PM2 = PG1(nmz+1:2*nmz,:);
PM3 = PG1(2*nmz+1:3*nmz,:); PM4 = PG1(3*nmz+1:4*nmz,:);
PGmoz = [PM4; PM2; PM1; PM3];

figure(40); imshow(PGmoz);
