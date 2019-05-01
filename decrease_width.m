function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)

[rows,cols] = size(energyImg);

c_energy = cumulative_min_energy_map(energyImg,'VERTICAL');
v = flip(find_vertical_seam(c_energy));

for i = 1:rows
    %shifts elements on right side of seam one pixel to left
    im(i, v(i):cols-1, :) = im(i, v(i)+1:cols, :); 
end
reducedColorImg = im(:,1:cols-1,:); % copies all pixels after shifting to reducedColorImg
reducedEnergyImg = energy_img(reducedColorImg);

imshow(reducedColorImg, 'InitialMagnification', 200)

end
