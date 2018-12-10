clear
%Read in image
image = imread('circuit.tif');
%Fourier transform
fft = fftshift(fft2(image));
%High-Pass filter
filter = fftshift(ones(size(image)));
filter(size(filter,1)/2 - 15:size(filter,1)/2 + 15,...
       size(filter,2)/2 - 15:size(filter,2)/2 + 15) = 0;
fft_out = fft.*filter;
%Homomorphic filter
filter2 = fftshift(ones(size(image)))*2;
filter2(size(filter2,1)/2 - 15:size(filter2,1)/2 + 15,...
       size(filter2,2)/2 - 15:size(filter2,2)/2 + 15) = 0.6;
fft_out2 = fft.*filter2;
%Inverse Fourier transform
image_out = ifft2(fft_out);
image_out2 = ifft2(fft_out2);
%Display image
subplot(1,3,1); imshow(image), title('Original Image');
subplot(1,3,2); imshow(abs(image_out),[]), title('High-Pass filter');
subplot(1,3,3); imshow(abs(image_out2),[]), title('Homomorphic filter');