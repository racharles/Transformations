/*Transformations

a moving picture

inspired by: Murasaki's Impressionist Blobs
             https://codepen.io/murasaki/pen/BmOzMP

Rachel Bai
*/

PImage l_res;
Shimmer[] shimmers = new Shimmer[0];
Floater[] floaters = new Floater[0];
Wave[] waves = new Wave[0];
Spiral[] spirals = new Spiral[0];
Flower[] flowers = new Flower[0];
Follower[] followers = new Follower[0];
Dust[] dust = new Dust[0];
Bouncer[] bouncers = new Bouncer[0];


void setup() {
    size(600,498,P2D); //picture: 6(100 x 83)
    //size(1200,672,P2D);//picture1: 6(200 x 112)
    //size(600,900); //picture2: 6(100 x 150)
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
        //shimmers[i].display();
    }
    for (int i = 0; i < floaters.length; ++i) {
        floaters[i].move();
        //floaters[i].display();
    }
    for (int i = 0; i < flowers.length; ++i) {
        flowers[i].move();
        //flowers[i].display();
    }
    for (int i = 0; i < waves.length; ++i) {
        waves[i].move();
        //waves[i].display();
    }
    for (int i = 0; i < bouncers.length; ++i) {
        bouncers[i].move();
        bouncers[i].display();
    }
    for (int i = 0; i < spirals.length; ++i) {
        spirals[i].move();
        //spirals[i].display();
    }
    for (int i = 0; i < dust.length; ++i) {
        dust[i].move();
        //dust[i].display();
    }
    for (int i = 0; i < followers.length; ++i) {
        followers[i].move();
        //followers[i].display();
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
                    Floater s = new Floater(x * 6, y * 6, color(r, g, b));
                    floaters = (Floater[]) append(floaters, s);

                } else if (abs(r-g) < 25 && abs(g-b) < 25 && abs(r-b) < 25) {
                    // gray
                    //drift down and settle
                    Dust s = new Dust(x * 6, y * 6, color(r, g, b));
                    dust = (Dust[]) append(dust, s);

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
                    spirals = (Spiral[]) append(spirals, s);

                } else if (r * 3/5 > g && r < 160 && g - b > 0) {
                    //brown rgb(79, 33, 16), includes cocoa rgb(210, 105, 30)
                    /*defining brown is very arbitrary, so lighter browns like
                    beige are not considered brown
                    */
                    //bouncing ball
                    Bouncer s = new Bouncer(x * 6, y * 6, color(r, g, b));
                    bouncers = (Bouncer[]) append(bouncers, s);

                } else if (r > 200 && g > 160 && b < 120) {
                    // yellow
                    // Follower s = new Follower(x * 6, y * 6, color(r, g, b));
                    // followers = (Follower[]) append(followers, s);
                    Flower s = new Flower(x * 6, y * 6, color(r, g, b));
                    flowers = (Flower[]) append(flowers, s);

                } else if (r > 150 && g > 40 && g < 170 && g > b + 20 && r > b + g) {
                    // orange
                    //makes orangebows, semicircles


                } else if (r + 10 >= g && b > g && abs(r - b) < 50) {
                    // dark purple
                    Floater s = new Floater(x * 6, y * 6, color(r, g, b));
                    floaters = (Floater[]) append(floaters, s);

                } else if (b > r && b + 25 >= g && b > 20) {
                    // blue, includes cyan and teal
                    Wave s = new Wave(x * 6, y * 6, color(r, g, b));
                    waves = (Wave[]) append(waves, s);

                } else if ((g > r + 3 && g > b) || (b + 40 < g && g + 20 > r)) {
                    // green, includes olive
                    Spiral s = new Spiral(x * 6, y * 6, color(r, g, b));
                    //spirals = (Spiral[]) append(spirals, s);
                    //plants self, then grows into fractal tree

                } else {
                    //change to green particles
                    if (g + 20 < 255) {
                        //g += 20;
                    }

                }
            }
        }
    }
}
