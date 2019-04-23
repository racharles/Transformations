/*Transformations

a moving picture

inspired by: Murasaki's Impressionist Blobs
             https://codepen.io/murasaki/pen/BmOzMP

Rachel Bai
*/

PImage l_res;
Spiral[] spirals = new Spiral[0];
Wave[] waves = new Wave[0];
Shimmer[] shimmers = new Shimmer[0];


void setup() {
    size(600,498,P2D);
    frameRate(30);
    ellipseMode(CORNER);
    l_res = loadImage("picture.jpg");
    noStroke();
    //sort and copy the pixels of img into objects that can be moved
    sort(l_res);
    l_res.resize(width, height);
}

void draw() {
    //background(l_res);
    background(0);
    //move every object
    /*cooler colors in back because they fade into background, reds and oranges
    also have more action*/
    for (int i = 0; i < shimmers.length; ++i) {
        shimmers[i].move();
        shimmers[i].display();
    }
    for (int i = 0; i < waves.length; ++i) {
        waves[i].move();
        waves[i].display();
    }
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
                if (r + g + b < 60 || (r + g + b / 3) < 50) {
                    // dark or black colors
                    Shimmer s = new Shimmer(x * 6, y * 6, color(r, g, b));
                    shimmers = (Shimmer[]) append(shimmers, s);

                } else if (r + g + b > 200 * 3) {
                    // white/pastels
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (abs(r-g) < 25 && abs(g-b) < 25 && abs(r-b) < 25) {
                    // gray
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r > (g + b) && r >= 55 && g < 80 && r > g + 40
                          && (g - b < 40 || r > 170)) {
                    // red spiral,includes maroon
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    spirals = (Spiral[]) append(spirals, s);

                } else if ((r > 160 && b + 10 > g && abs(b-g) < 55 && g < 230 && (b+g)/2 < r)
                            || (r > 50 && r > g && r > b && abs(g-b) < 15)
                            || (r > 200 && r > (g + b) / 2 && g - b < 60 && r > g)) {
                    // pink, peach and lighter purples
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r * 3/5 > g && r < 160 && g - b > 0) {
                    //brown rgb(79, 33, 16), includes cocoa rgb(210, 105, 30)
                    /*defining brown is very arbitrary, so lighter browns like
                    beige are not considered brown
                    */
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r > 200 && g > 170 && b < 120) {
                    // yellow
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r > 150 && g > 40 && g < 170 && g > b + 20 && r > b + g) {
                    // orange
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (r + 10 >= g && b > g && abs(r - b) < 50) {
                    // dark purple
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else if (b > r && b + 25 >= g && b > 20) {
                    // blue, includes cyan and teal
                    Wave s = new Wave(x * 6, y * 6, color(r, g, b));
                    waves = (Wave[]) append(waves, s);

                } else if ((g > r + 3 && g > b) || (b + 40 < g && g + 20 > r)) {
                    // green, includes olive
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);

                } else {
                    //green behavior
                    if (g + 20 < 255) {
                        //g += 20;
                    }
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);
                }
            }
        }
    }
}
