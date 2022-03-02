# Multimedia-Course-Homeworks


# Overview of Content
Homework 1 <br>
Q1: Horizental flip, transpose, crop, right/left/up/down shift, diagonal up-right/up-left/down-right/down-left shift <br>
Q2: Image MSE Calculator <br>
Q3: MSE between original image and outputs of Q2 <br>
Q4: Resize (bicubic, bilinear, and nearest) and calculate MSE <br> <br>

Homework 2 <br>
Hide a logo in image, CDF Histogram, equalize image <br><br>

Homework 3 <br>
PSNR, Reconstructed PSNR, DCT, DCT Coefficients, Median <br><br>

Homework 4 <br>
Q1: Add shadow to text by adding 2-D Gaussian filtering of image to original image<br>
Q2: Create a hybrid of two images <br> <br>

Homework 4<br>
Replaces all occurrences of one color in the image with another color <br><br>

Homework 6 <br>
- Part 1:<br>
1. Devide image into B x B blocks (B = 8, 10, 12)<br>
2. Calculate 2D DCT of each block<br>
3. Convert the binary and two-dimensional image of the logo into a string after resizing it to fit the original image<br>
4.  Then randomize the string using the K key (k=19)<br>
5.  Embed each bit of the string in one block of image. The law of embedding or extracting a binary bit in the mentioned block is determined from the following relation, which compares two DCT coefficients in (a,a+1) and (a+1,a) coordinations:<br>
𝑖f 𝐷(𝑎 + 1, 𝑎) > 𝐷(𝑎, 𝑎 + 1) 𝑡ℎ𝑒n data = 1 else data = 0 <br>
- Part2:<br>
Attack to watermarkrd image and calculate normalized correlation(NC) 60,80 and 100 between extracted logo and original one
