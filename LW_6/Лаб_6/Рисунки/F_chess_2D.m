function CH = F_chess_2D(m,n)
%% Программа формирования шахматной матрицы (-1)^(x+y)
% для центрирования изображений в частотной области
CH = zeros(m,n);
for im = 1:m
for in = 1:n
CH(im,in) = (-1)^(in+im);
end
end
end

