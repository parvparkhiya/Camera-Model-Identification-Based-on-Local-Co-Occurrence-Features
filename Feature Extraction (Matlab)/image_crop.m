
%% Crops images into 512x512 blocks and saves them in the respective specified directory
function [] = image_crop(I,directory,imagenumber)
i=1;
j=1;

count =1;

while i< size(I,1)
    while j< size(I,2)
        Image = uint8(I(i: i+511,j:j+511,:));
        j = j+ 512;
        imwrite(Image,strcat(directory,'/',num2str(imagenumber),'_',num2str(count),'.png'));
        count = count +1;
        
    end
    i = i+ 512;
    j=1;
end

end