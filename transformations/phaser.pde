class Phaser {
    float x;
    float y;
    color c;

    Phaser(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;

    }

    void move() {
        
    }

    void display() {
        fill(c);
        ellipse(x, y, 6, 6);
    }
}
