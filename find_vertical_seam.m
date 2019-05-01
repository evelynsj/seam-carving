function verticalSeam = find_vertical_seam(cumulativeEnergyMap)

[rows, cols] = size(cumulativeEnergyMap);
verticalSeam = zeros(1, rows); 
ct = 1;

% choose minimum from last row
[~,idx] = min(cumulativeEnergyMap(rows,:));
verticalSeam(ct) = idx;
ct = ct + 1;
c = idx;

% backtrack
for r = rows:-1:2
    if c == 1
        M = min([cumulativeEnergyMap(r-1,c), cumulativeEnergyMap(r-1,c+1)]);
        if M == cumulativeEnergyMap(r-1,c)
            idx = c;
        else
            idx = c+1;
        end
    elseif c == cols
        M = min([cumulativeEnergyMap(r-1,c-1), cumulativeEnergyMap(r-1,c)]);
        if M == cumulativeEnergyMap(r-1,c-1)
            idx = c-1;
        else
            idx = c;
        end
    else
        M = min([cumulativeEnergyMap(r-1,c-1), cumulativeEnergyMap(r-1,c), cumulativeEnergyMap(r-1,c+1)]);
        if M == cumulativeEnergyMap(r-1,c-1)
            idx = c-1;
        elseif M == cumulativeEnergyMap(r-1,c)
            idx = c;
        else
            idx = c+1;
        end
    end
    verticalSeam(ct) = idx;
    c = idx;
    ct = ct + 1;
end

end