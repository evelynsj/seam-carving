prague = imread('inputSeamCarvingPrague.jpg');
mall = imread('inputSeamCarvingMall.jpg');

pragueEnergy = energy_img(prague);
mallEnergy = energy_img(mall);

% reduce height by 50 px
for n=1:50
    [reducedPragueColor, reducedPragueEnergy] = decrease_height(prague, pragueEnergy);
    prague = reducedPragueColor;
    pragueEnergy = reducedPragueEnergy;
end

for n=1:50
    [reducedMallColor, reducedMallEnergy] = decrease_height(mall, mallEnergy);
    mall = reducedMallColor;
    mallEnergy = reducedMallEnergy;
end

imwrite(reducedPragueColor, 'outputReduceHeightPrague.png')
imwrite(reducedMallColor, 'outputReduceHeightMall.png')
