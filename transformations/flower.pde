class Flower {
    float x;
    float y;
    color c;

    float size = random(6,10); //controls the distance from flower
    float angle = 10 * random(6,12); //controls # of petals

    float theta; //for sine

    Flower(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
    }

    void move() {
        //controls the flower growing/shrinking
        size += sin(theta)/3;

        if (theta < TWO_PI) { //2pi comes from 2nd root of graphing sin(x)
            theta += 0.1;
        } else {
            theta = 0;
        }
    }

    void display() {
        fill(c);
        pushMatrix();
        ellipse(x,y,6,6);
        translate(x,y); //center particle
        ellipseMode(CENTER);
        rotate(radians(frameCount)); //rotate the entire flower

        //draw the petals around circle by rotating
        for (int i = 0; i < 360/angle; ++i) {
            ellipse(size,size,6,6);
            rotate(radians(angle));
        }
        popMatrix();
    }
}
