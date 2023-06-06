clear,clc

% Создаем пустую матрицу размером 1000x1000 для изображения
img = zeros(1000,1000);

% Устанавливаем начальную ширину полосы
width = 5;

% Устанавливаем начальное значение яркости
brightness = 0;

% Обходим каждый столбец изображения
for col = 1:1000
    % Устанавливаем яркость для текущей полосы
    brightness = brightness + 255/(2^(width-5));% 255/(2^(width-5)-1);
    
    % Обходим каждую строку текущей полосы
    for row = 1:1000
        % Если текущая позиция принадлежит текущей полосе, устанавливаем яркость
        if (floor(col/width) == floor((col-1)/width))
            img(row,col,1) = brightness;
            img(row,col,2) = brightness;
            img(row,col,3) = brightness;
        end
    end
    
    % Если достигли конца текущей полосы, увеличиваем ширину и сбрасываем яркость
    if (mod(col,width) == 0)
        width = width*2;
        brightness = 0;
    end
end

% Сохраняем изображение в файл
%imagesc(img)
imwrite(uint8(img), 'test1.jpg');