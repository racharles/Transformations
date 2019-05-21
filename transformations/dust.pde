class Dust {
    float x;
    float y;
    color c;

    //boolean flags
    boolean move = true;
    boolean setup = false;

    int lastframe; //counter for timing

    PVector loc;
    PVector v = new PVector(0,random(1,2)); //random velocity
    PVector destination;
    PVector step;

    Dust(float x, float y, color tempCol) {
        loc = new PVector(x,y);
        c = tempCol;
        destination = new PVector(x,y);
    }

    void move() {
        if (loc.y < height && move == true) {
            //move downward
            loc.add(v);
        } else {
            if (setup == false) {
                //make a direction vector to a random point
                destination = new PVector(random(width),random(height));
                move = false;
                step = destination.sub(loc);
                step.div(50); //controls speed of particle
                setup = true;
                lastframe = frameCount; //start the timer
            }
            loc.add(step);
            if (frameCount - lastframe > 60) {
                //until time is up, move according to the vector
                move = true;
                setup = false;
            }
        }


    }

    void display() {
        fill(c);
        ellipse(loc.x, loc.y, 6, 6);
    }
}
