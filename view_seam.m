function view_seam(im, seam, seamDirection)
    seamPath = flip(seam); % y-axis
    % x-axis: index of vector
    
    % for vertical seam, seamPath should be the x-axis while y-axis is 1 to
    % num cols of seam
    if strcmp(seamDirection, 'HORIZONTAL')
        imagesc(im);
        hold on;
        plot(seamPath, 'Color', 'red');
    else
        y_axis = 1:size(seamPath, 2);
        imagesc(im);
        hold on;
        plot(seamPath, y_axis, 'Color', 'red');
    end
end
