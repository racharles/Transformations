class Spiral {
    float x;
    float y;
    float r = 0;
    float theta;
    float px;
    float py;
    color c;


    Spiral(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
    }

    void move() {
        //theta and r for polar equation of a spiral (r = theta)
        //reset movement when spirals become too chaotic, and add more
        //complexity to system
        if (theta < 60) {
            //slight variance in rotational speed for a more natural system
            theta += random(0.05,0.15);
            r += 0.1;
        } else {
            //reset behavior to loop
            if (r >= 0) {
                r -= 0.1;
                theta -= 0.1;
            } else {
                theta = 0;
            }
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
