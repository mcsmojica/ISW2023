/* clear variables, tidy up the console, and
close all figure windows */
clear; clc; close(winsid());

/* load a grayscale image */
A = rgb2gray(imread('images/cameraman.png'));

/* display the image */
figure('Name','cameraman'); imshow(A);

/* display the image dimensions */
printf('\nSize of the grayscale image:'); 
disp(size(A))

/* display the entries on the first 10x10 pixels */
A(1:10,1:10)

/* load an RGB image */
B = imread('images/heart_fibers.jpg');

/* display the image */
figure('Name','heart fibers'); 
imshow(B);

/* display the image dimensions */
printf('\nSize of the color image:'); 
disp(size(B))

/* create a simple image 7x7 that has a black
background and a white diagonal line spanning
the matrix */
C = eye(7,7);
imshow(C);

/* replace the middle pixel with a shade of gray */
C(4,4) = 0.3;
figure('Name','Sample Image');
imshow(C);

/* create your own digital image!
1) start with the dimensions of the image that you would like to create. 
2) then choose the background color (0 for black, 255 for white, and values in between 0 and 255 for different shades of gray).
         for a black bg: my_image = np.zeros((7,7))
         for a white bg: my_image = 255*np.ones((7,7))
 3) replace some entries of the array, e.g., to change the value of the entry on the intersection of the 
    4th row and 6th column to 100:
         my_image[3,5] = 100 */

