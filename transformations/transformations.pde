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
}

void draw() {
    //background(img);
    background(0);
    //move spiral objects
    for (int i = 0; i < spirals.length; ++i) {
        spirals[i].move();
        spirals[i].display();
    }
}

void sort(PImage img) {
    img.loadPixels();
    for (int y = 0; y < img.height; ++y) {
        for (int x = 0; x < img.width; ++x) {
            int loc = x + y * img.width;

            float r = red(img.pixels[loc]);
            float g = green(img.pixels[loc]);
            float b = blue(img.pixels[loc]);
            //sort by color
            if (loc < img.pixels.length) {
                //check if pixel is past the red threshold on image
                if (r > (g + b) * 2 && r > 150) {
                    //add a spiral object for each pixel
                    //the l_res img is 6x smaller, *6 for correct coordinates
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    spirals = (Spiral[]) append(spirals, s);
                }
            }
        }
    }
}
