class Wave {
    float dx = (TWO_PI / 150); //constant for incrementing x

    float x;
    float y;
    color c;

    float theta = 0;
    float amp = random(18,20);
    float py;
    float px;
    
    Wave(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
        px = x; //assign inside constructor because px only uses x value once
    }

    void move() {
        /*reset theta when particle reaches origin point to keep theta small,
        so sketch can run forever*/
        if (theta < TWO_PI*4) { //2pi comes from the second root of graph sin(x)
            theta += 0.5;
        } else {
            theta = 0;
        }
        //since sine is so small, we need to amplify the movement
        
        py = sin(px)*amp;
        px += dx; //increment px for a wave effect

    }

    void display() {
        fill(c);
        //add y value
        ellipse(x, y + py, 6, 6);
    }

}
