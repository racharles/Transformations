/*Transformations

a moving picture

inspired by: Murasaki's Impressionist Blobs
             https://codepen.io/murasaki/pen/BmOzMP

Rachel Bai
*/

PImage img;
PImage l_res;
Spiral[] spirals = new Spiral[0];


void setup() {
    size(600,500,P2D);
    frameRate(30);
    img = loadImage("picture1.jpg");
    l_res = loadImage("picture2.jpg");
    noStroke();
    //sort and copy the pixels of img into objects that can be moved
    sort(l_res);
    l_res.resize(width, height);
}

void draw() {
    background(l_res);
    //background(255);
    //move spiral objects
    for (int i = 0; i < spirals.length; ++i) {
        spirals[i].move();
        spirals[i].display();
    }
}

void sort(PImage img) {
    //access the xy pixels of the image by looping through the pixel array
    img.loadPixels();
    for (int y = 0; y < img.height; ++y) {
        for (int x = 0; x < img.width; ++x) {
            //convert xy coordinate to location in pixel array
            int loc = x + y * img.width;

            float r = red(img.pixels[loc]);
            float g = green(img.pixels[loc]);
            float b = blue(img.pixels[loc]);

            //sort by color
            if (loc < img.pixels.length) {
                //check if pixel is past the red threshold
                if (r > (g + b) && r > 100) {
                    //add a spiral object for each pixel
                    //the l_res img is 6x smaller, *6 for correct coordinates
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    spirals = (Spiral[]) append(spirals, s);
                }
                //blue threshold
                if (b > (r + g - 40) && b > 50) {
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    spirals = (Spiral[]) append(spirals, s);
                }
            }
        }
    }
}
