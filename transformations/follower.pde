class Follower {
    float x;
    float y;
    color c;

    float dx = 40;
    float dy = 40;

    Follower(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;

    }

    void move() {
        if (abs(dx) < 6 && abs(dy) < 6) {
            x = random(width);
            y = random(height);
        }

        dx = mouseX - x;
        dy = mouseY - y;

        x += dx * 0.02;
        y += dy * 0.02;
    }

    void display() {
        fill(c);
        ellipse(x, y, 6, 6);
    }
}
