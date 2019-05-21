class Rainbow {
    float x;
    float y;
    color c;

    float r = random(20,50);
    float theta = PI; //start angle
    float px;
    float py;

    Rainbow(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
    }

    void move() {
        //semicircle path
        if (theta < TWO_PI) {
            theta += 0.05;
        } else {
            //reset movement to new point
            theta = PI;
            x = x + 2 * px; //make start point the end point
        }
        //wrap around right edge, since it only moves right
        if (x > width + 6) {
            x = 0;
        }
        //polar coordinates
        px = r * cos(theta);
        py = r * sin(theta);
    }

    void display() {
        fill(c);
        ellipse(x + px, y + py, 6, 6);
    }
}
