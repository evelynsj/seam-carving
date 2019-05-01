function energyImg = energy_img(im)
    gray = rgb2gray(im); % convert image to grayscale
    
    h = fspecial('prewitt'); % emphasize horizontal
    dx = imfilter(im2double(gray), h'); % vertical
    dy = imfilter(im2double(gray), h); % horizontal
    energyImg = sqrt(dx.^2 + dy.^2);

end