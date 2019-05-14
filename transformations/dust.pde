class Dust {
    float x;
    float y;
    color c;

    PVector loc;

    Dust(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;

    }

    void move() {
        x += random(-2,2);
        if (y < height - 6) {
            y += 1;
        }
    }

    void display() {
        fill(c);
        ellipse(x, y, 6, 6);
    }
}
