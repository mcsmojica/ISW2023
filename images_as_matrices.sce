/* load a grayscale image */
A = rgb2gray(imread('images/cameraman.png'));

/* display the image */
figure('Name','cameraman'); imshow(A);

/* display the image dimensions */
display('Size of the grayscale image:'); 
size(A)

/* display the entries on the first 10x10 pixels */
A(1:10,1:10)

/* load an RGB image */
B = imread('images/heart_fibers.jpg');

/* display the image dimensions */
display('Size of the color image:'); 
size(B)

