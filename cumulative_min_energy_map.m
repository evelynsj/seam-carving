function cumulativeEnergyMap = cumulative_min_energy_map(energyImg, seamDirection)

    [rows, cols] = size(energyImg);
    M = zeros(rows,cols);
    
    if strcmp(seamDirection, 'VERTICAL')
        M(1,:) = energyImg(1,:);
        for r = 2:rows
            for c = 1:cols
                if c == 1
                    M(r,c) = energyImg(r,c) + min(M(r-1,c), M(r-1,c+1));
                elseif c == cols
                    M(r,c) = energyImg(r,c) + min(M(r-1, c-1), M(r-1,c));
                else
                    M(r,c) = energyImg(r,c) + min(M(r-1,c-1), min(M(r-1,c), M(r-1,c+1)));
                end
            end
        end
    else
        M(:,1) = energyImg(:,1);
        for c = 2:cols
            for r = 1:rows
                if r == 1
                    M(r,c) = energyImg(r,c) + min(M(r,c-1), M(r+1,c-1));
                elseif r == rows
                    M(r,c) = energyImg(r,c) + min(M(r-1,c-1), M(r,c-1));
                else
                    M(r,c) = energyImg(r,c) + min([M(r-1,c-1), M(r,c-1), M(r+1,c-1)]);
                end
            end
        end
        
    end
    
    cumulativeEnergyMap = M;
    
end

