from tkinter import *
from PIL import ImageTk, Image
from tkinter import filedialog
import os

root = Tk()
root.geometry("550x300+300+150")
root.resizable(width=True, height=True)

SOURCE_PIC =r"C:\Users\Dmitry\Desktop\M8\Matlab\HomeWorkProjects\LW_2\Task_08\Pictures" 
pic = "Img2_08_1.jpg"
    
SOURCE_FILE = os.path.join(SOURCE_PIC,pic)


def open_img(SOURCE_FILE):
    img = Image.open(SOURCE_FILE)
    img = img.resize((250, 250), Image.ANTIALIAS)
    img = ImageTk.PhotoImage(img)
    panel = Label(root, image=img)
    panel.image = img
    panel.pack()

open_img(SOURCE_FILE)

root.mainloop()