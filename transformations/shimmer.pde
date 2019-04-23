class Shimmer {
    float x;
    float y;
    color c;

    float theta;
    float amp = 20;
    boolean increase = true;
    float change;
    float px;
    float py;
    //rgb are global because they need to remain constants
    float r;
    float g;
    float b;

    Shimmer(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;

        r = red(c);
        g = green(c);
        b = blue(c);
        px = x;
        py = y;
    }

    void move() {
        //pulse by incrementing brightness based on a sine wave
        if (theta < TWO_PI) { //2pi comes from 2nd root of graphing sin(x)
            theta += 0.03;
        } else {
            theta = 0;
        }
        //amplify the sine wave so that the result can be seen
        change = sin(theta) * 60;

        /*move to a random position when not visible, and move back to priignal
        position when visible*/
        if (change < -55 && frameCount % 40 == 0) {
            px = int(random(100))*6;
            py = int(random(83))*6;
        } else if (change > -40) {
            float v = 0.1;
            float dx = x - px;
            float dy = y - py;
            px += dx * 0.06;
            py += dy * 0.06;
        }

    }

    void display() {
        //set values directly
        fill(r + change, g + change, b + change);
        ellipse(px, py, 6, 6);
    }
}
