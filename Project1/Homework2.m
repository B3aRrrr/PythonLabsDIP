clear,clc

% Создаем пустую матрицу размером 1000x1000 для изображения
img = zeros(500,500);
width = 20;

% в каком кольце точке
f = @(r,width,x0,y0) (x-x0).^2+(y-y0).^2<=(r + width) ^2 &(x-x0).^2+(y-y0).^2>=r^2;


% первой кольцо черное
isBlack = false;

% Размеры кольца изменяются от 0 до 500
for r = 1:width:500
    for i = r:r+width
        for j = r:r+width
            if(isBlack)
                img(i,j,1) = 0;
                img(i,j,2) = 0;
                img(i,j,3) = 0;
            else
                img(i,j,1) = 255;
                img(i,j,2) = 255;
                img(i,j,3) = 255;
            end
        end
    end
    
    if(isBlack)
        isBlack = false;
    else
        isBlack = true;
    end
end
imwrite(uint8(img), 'test2.jpg');
   