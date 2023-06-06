clear all; close all;
% Чтение изображения
I=imread('A6_08_1.jpg');
% Конвертация в чб и в double
I = im2double(rgb2gray(I));
figure(1); 
imshow(I);
% получение размера изображения
sz=size(I);
sy=sz(1);  % высота
sx=sz(2);  % ширина
CH = F_chess_2D(sy,sx);
RF1=fft2(I.*CH);
figure(2); 
imshow(log(1+abs(RF1)), [ ]);
% генерируем переодический шум
SH= zeros(sy,sx);
a = 1;
u=25;
v=25;
fx=1;
fy=1;
for im = 1:sy
    for in = 1:sx
        SH(im,in)= a*sin(2*pi*(v*(in+fx)/sx+u*(im+fy)/sy));
    end
end
% накладываем шум на изображние
ISH = I+2.5*SH;
figure(3)
imshow(ISH, [ ]);
% строим спектр зашумленного изображения
RF=fft2(ISH.*CH);
figure(4); 
imshow(log(1+abs(RF)), [ ]);
% 2. Формирование кольцевого фильтра Баттерворта
nb = 3; % порядок фильтра
HB = zeros(sy,sx); % инициализация передат.ф-ии фильтра
d0 = 25; % радиус окружности
d02 = d0*d0;
w0 = 25; % ширина кольца
mi2 = round(sy/2);
ni2 = round(sx/2);
for im = 1:sy
    for in = 1:sx
        dt2 = (im-mi2)^2 + (in-ni2)^2;
        dt = sqrt(dt2);
        zn = (dt*w0/(dt2-d02))^(2*nb);
        HB(im,in) = 1/(1+zn);
    end
end
% 3. Фильтрация в частотной области
ISH2 = ISH.*CH; % центрирование спектра
FI1 = fft2(ISH2);
G1 = real(ifft2(FI1.*HB)); % отфильтрованное изображение
G1 = G1.*CH; % восстановление координат
figure(5); imshow(G1,[]);
% 4. Формирование узкополосного режек. фильтра Баттерворта
nb = 3; % порядок фильтра
HB2 = zeros(sy,sx); % инициализация передат. ф-ии фильтра
d0 = 25; % радиус кольца
d02 = d0*d0;
mi2 = 1+round(sy/2); 
ni2 = 1+round(sx/2);
for im = 1:sy
    for in = 1:sx
        dt1 = sqrt((im-mi2-u)^2 + (in-ni2-v)^2);
        dt2 = sqrt((im-mi2+u)^2 + (in-ni2+v)^2);
        zn = (d02/(dt1*dt2))^(2*nb);
        HB2(im,in) = 1/(1+zn);
    end
end
% 5. Фильтрация в частотной области
ISH3 = ISH.*CH; % центрирование спектра
FI2 = fft2(ISH3);
G2 = real(ifft2(FI2.*HB2)); % отфильтрованное изображение
G2 = G2.*CH; % восстановление координат
figure(6); imshow(G2,[]);