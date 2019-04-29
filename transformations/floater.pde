class Floater {
    float x;
    float y;
    color c;

    float easing = random(0.05,0.1); //controls speed of particles
    float targetX = random(width);
    float targetY = random(height);


    Floater(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;

    }

    void move() {
        //move targets around for effect
        targetX += random(-5,5);
        targetY += random(-5,5);
        //move toward the chosen target
        float dx = targetX - x;
        float dy = targetY - y;
        x += dx * easing;
        y += dy * easing;
    }

    void display() {
        fill(c);
        ellipse(x, y, 6, 6);
    }
}
