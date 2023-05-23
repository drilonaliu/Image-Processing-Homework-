function grayImg = imageToGray(img)
% Convert an RGB image to grayscale

% Get the dimensions of the image
[height, width, ~] = size(img);

% Initialize the grayscale image
grayImg = zeros(height, width);

% Convert each pixel to grayscale
for i = 1:height
    for j = 1:width
        grayImg(i, j) = 0.2989*img(i, j, 1) + 0.5870*img(i, j, 2) + 0.1140*img(i, j, 3);
    end
end

% Convert the grayscale image to uint8 format
grayImg = uint8(grayImg);

end
