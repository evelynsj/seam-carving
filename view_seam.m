function view_seam(im, seam, seamDirection)
    seamPath = flip(seam); % y-axis
    % x-axis: index of vector
    if strcmp(seamDirection, 'HORIZONTAL')
        imagesc(im);
        hold on;
        plot(seamPath, 'Color', 'red');
    else
        % TODO
    end
end
