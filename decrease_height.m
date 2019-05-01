function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)

[rows,cols] = size(energyImg);

c_energy = cumulative_min_energy_map(energyImg,'HORIZONTAL');
h = flip(find_horizontal_seam(c_energy));

for i = 1:cols
    %shifts elements on bottom side of seam one pixel up
    im(h(i):rows-1, i, :) = im(h(i)+1:rows, i, :); 
end
reducedColorImg = im(1:rows-1,:,:); % copies all pixels after shifting to reducedColorImg
reducedEnergyImg = energy_img(reducedColorImg);

% imshow(reducedColorImg)

end

