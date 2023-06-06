import cv2
import os
import numpy as np
from PIL import Image, ImageDraw

task = 1
SOURCE_PIC =r"C:\Users\Dmitry\Desktop\M8\Matlab\HomeWorkProjects\LW_2\Task_08\Pictures" 

OUTPUT_PIC= os.path.join(SOURCE_PIC,f"task_{task}_OUT")

if not os.path.exists(OUTPUT_PIC):
    os.makedirs(OUTPUT_PIC)
    
pic = "Img2_08_1.jpg"
    
SOURCE_FILE = os.path.join(SOURCE_PIC,pic)

def make_noisy_image(OUTPUT_DIR:str,FILE:str,loc:float=0,scale:float=1):
    img = cv2.imread(FILE)

    # Получение ширины, высоты и количество каналов изображения
    h, w, _ = img.shape

    # Создание сетки из точек вокруг центра изображения
    x, y = np.meshgrid(np.linspace(-1, 1, w), np.linspace(-1, 1, h))

    # Вычисление расстояния каждой точки сетки от центра изображения
    radius = np.sqrt(x**2 + y**2)

    # Нормализация радиуса для создания градиента яркости
    radius = (radius - radius.min()) / (radius.max() - radius.min())
    np.random.normal()
    # Создание маски, которая определяет область имитации неравномерной засветки
    mask = np.random.normal(loc=0,scale=1,size=(h, w))
    mask[radius > 0.95] = 0

    # Накладывание маски на изображение и сохранение результата
    result = cv2.merge([img[:,:,0]*mask, img[:,:,1]*mask, img[:,:,2]*mask])
    cv2.imwrite(os.path.join(OUTPUT_DIR,f"NoiseImage(loc={loc}-scale={scale}).jpg"), result)

def make_dark_spot(OUTPUT_DIR:str,FILE:str):
    # Загрузка изображения
    name = os.path.split(FILE)[-1]
    
    
    im = Image.open(FILE)

    # получаем размер изображения
    width, height = im.size

    # создаем новое изображение черного цвета
    mask = Image.new('L', (width, height), 0)

    # создаем новый объект ImageDraw
    draw = ImageDraw.Draw(mask)

    # вычисляем центр изображения
    center_x, center_y = int(width/2), int(height/2)

    # вычисляем радиус круга
    radius = min(center_x, center_y)

    # рисуем круг на маске
    draw.ellipse((center_x - radius, center_y - radius, center_x + radius, center_y + radius), fill=255)
    rgb_im = im.convert('RGB')
    # получаем пиксели изображения и маски
    pixels = rgb_im.load()
    mask_pixels = mask.load()

   # проходимся по всем пикселям изображения
    for x in range(width):
        for y in range(height):
            # вычисляем расстояние до центра
            distance = ((x - center_x) ** 2 + (y - center_y) ** 2) ** 0.5
            
            # вычисляем яркость маски для данного расстояния
            alpha = int((distance / radius) * 255)
            
            # применяем яркость маски к пикселю 
            r, g, b = rgb_im.getpixel((x, y)) 
            rgb_im.putpixel((x, y), (r, g, b, alpha))
        
    # сохраняем изображение с примененной неравномерной засветкой
    rgb_im.save(os.path.join(OUTPUT_DIR,f"WithDarkSpot_{name}"))

make_dark_spot(OUTPUT_DIR=OUTPUT_PIC,FILE=SOURCE_FILE)

def make_dark_spot(OUTPUT_DIR:str,FILE:str):
    # Загружаем изображение в оттенках серого
    name = os.path.split(FILE)[-1]
    img_gray = cv2.imread(FILE, cv2.IMREAD_GRAYSCALE)

    # Получаем размеры изображения
    height, width = img_gray.shape

    # Вычисляем центр изображения
    center_x = int(width/2)
    center_y = int(height/2)

    # Создаем новое черное изображение
    result = np.zeros((height, width), np.uint8)

    # Проходимся по всем пикселям изображения
    for x in range(width):
        for y in range(height):
            # Вычисляем расстояние до центра
            distance = ((x - center_x) ** 2 + (y - center_y) ** 2) ** 0.5
            radius = ((height - center_x) ** 2 + (width - center_y) ** 2) ** 0.5
            # Нормализуем расстояние, получаем значение от 0 до 1
            norm_distance = distance / radius
            
            # Вычисляем яркость пикселя на основе обратно пропорционального значения нормализованного расстояния
            brightness = int(255 * (norm_distance)) if norm_distance !=0 else 1e-10
            
            # Применяем яркость к пикселю изображения
            result[y, x] = img_gray[y, x] * brightness // 255

    # Показываем результат и сохраняем его
    cv2.imwrite(os.path.join(OUTPUT_DIR,f"WithDarkSpot_{name}"), result)
make_dark_spot(OUTPUT_DIR=OUTPUT_PIC,FILE=SOURCE_FILE)