/*Transformations

a moving picture

inspired by: Murasaki's Impressionist Blobs
             https://codepen.io/murasaki/pen/BmOzMP

Rachel Bai
*/

PImage l_res;
Spiral[] spirals = new Spiral[0];


void setup() {
    size(600,500,P2D);
    frameRate(30);
    l_res = loadImage("picture2.jpg");
    noStroke();
    //sort and copy the pixels of img into objects that can be moved
    sort(l_res);
    l_res.resize(width, height);
}

void draw() {
    //background(l_res);
    background(255);
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
                if (r > (g + b + 10) && r > 100 && g < 70) {
                    //red spiral
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    spirals = (Spiral[]) append(spirals, s);

                } else if (r > 200 && g > 170 && b < 120) {
                    //yellow
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r > 200 && g > 70 && b < 50) {
                    //orange
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r > 200 && g < 180 && b > 80) {
                    //pink
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (abs(r - b) < 20 && g < 70 && r > 80) {
                    //purple
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (b > (r + g - 40) && b > 50 && r + g > 50) {
                    //blue
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);
                } else if (g > 200) {
                    //green
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r + g + b < 70) {
                    //black
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else {
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);
                }
            }
        }
    }
}
