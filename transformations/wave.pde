class Wave {
    float dx = (TWO_PI / 150); //constant for incrementing x

    float x;
    float y;
    color c;

    float amp = random(18,20);
    float py;
    float px;

    Wave(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
        px = x; //assign inside constructor because px needs initial x value
    }

    void move() {
        //since sine is so small, we need to amplify the movement
        py = sin(px)*amp;
        /*reset px when particle reaches origin point to keep it small,
        so sketch can run forever*/
        if (px < TWO_PI + x - dx) { //2pi comes from the second root of graph sin(x)
            px += dx; //increment px for a wave effect
        } else {
            px = x;
        }

    }

    void display() {
        fill(c);
        //add y value
        ellipse(x, y + py, 6, 6);
    }

}
