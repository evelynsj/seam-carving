function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
[rows, cols] = size(cumulativeEnergyMap);
horizontalSeam = zeros(1, cols);
ct = 1;

% find minimum of last column
[~,idx] = min(cumulativeEnergyMap(:,cols));
horizontalSeam(ct) = idx;
ct = ct + 1;
r = idx;

% backtrack
for c = cols:-1:2
    if r == 1
        M = min([cumulativeEnergyMap(r,c-1), cumulativeEnergyMap(r+1, c-1)]);
        if M == cumulativeEnergyMap(r,c-1)
            idx = r;
        else
            idx = r+1;
        end
    elseif r == rows
        M = min([cumulativeEnergyMap(r-1,c-1), cumulativeEnergyMap(r,c-1)]);
        if M == cumulativeEnergyMap(r-1,c-1)
            idx = r-1;
        else
            idx = r;
        end
    else
        M = min([cumulativeEnergyMap(r-1,c-1), cumulativeEnergyMap(r,c-1), cumulativeEnergyMap(r+1,c-1)]);
        if M == cumulativeEnergyMap(r-1,c-1)
            idx = r-1;
        elseif M == cumulativeEnergyMap(r,c-1)
            idx = r;
        else
            idx = r+1;
        end
    end
    horizontalSeam(ct) = idx;
    r = idx;
    ct = ct + 1;
end

end