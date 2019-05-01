prague = imread('inputSeamCarvingPrague.jpg');
mall = imread('inputSeamCarvingMall.jpg');

pragueEnergy = energy_img(prague);
mallEnergy = energy_img(mall);

% reduce width by 100 px
for n=1:100
    [reducedPragueColor, reducedPragueEnergy] = decrease_width(prague, pragueEnergy);
    prague = reducedPragueColor;
    pragueEnergy = reducedPragueEnergy;
end

for n=1:100
    [reducedMallColor, reducedMallEnergy] = decrease_width(mall, mallEnergy);
    mall = reducedMallColor;
    mallEnergy = reducedMallEnergy;
end

imwrite(reducedPragueColor, 'outputReduceWidthPrague.png')
imwrite(reducedMallColor, 'outputReduceWidthMall.png')
