class Spiral {
    float x;
    float y;
    float r = 0;
    float theta;
    float px;
    float py;
    color c;
    boolean reverse = false;


    Spiral(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
    }

    void move() {
        //theta and r for polar equation of a spiral (r = theta)
        if (theta < 50 && reverse == false) {
            //slight variance in rotational speed for a more natural system
            theta += random(0.05,0.15);
            r += 0.1;
        } else if (theta > 0) {
            //reverse movement
            theta -= 0.2;
            r -= 0.2;
            reverse = true;
        } else {
            //start forward motion again
            reverse = false;
        }

        //convert from polar to cartesian coordinates, x,y already in cartesian
        px = r * cos(theta);
        py = r * sin(theta);
    }

    void display() {
        fill(c);
        //x,y is the spiral's center, px,py is the spiral's farthest point
        ellipse(px + x ,py + y, 6, 6);
    }
}
