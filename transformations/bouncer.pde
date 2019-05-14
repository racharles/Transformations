class Bouncer {
    color c;

    PVector loc;
    PVector v = new PVector(random(-1,1),random(-2,2)); //speed
    float acceleration = 1; //1 = neutral, does not slow or speed up
    float topspeed = 6; //controls the max speed

    Bouncer(float x, float y, color tempCol) {
        c = tempCol;
        loc = new PVector(x,y);
    }

    void move() {
        acceleration += 0.005; //building momentum
        //move the particle
        v.mult(acceleration);
        v.limit(topspeed);
        loc.add(v);
        if ((loc.x >= width - 5) || (loc.x <= -1)) {
            acceleration = 1; //reset momentum everytime it touches a wall
            v.x *= -1; //bounce
        }
        if ((loc.y >= height - 5) || (loc.y <= -1)) {
            acceleration = 1; //reset momentum
            v.y *= -1; //bounce
        }
    }

    void display() {
        fill(c);
        ellipse(loc.x, loc.y, 6, 6);
    }
}
