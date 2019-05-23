class Plant {
    float x;
    float y;
    color c;

    float theta = random(90); //controls angle of branching
    float smallest = random(4,6);
    float length = random(10,25);
    float direction = round(random(-1,1));

    Plant(float tempX, float tempY, color tempCol) {
        x = tempX;
        y = tempY;
        c = tempCol;
    }

    void branch(float h) {
        h *= 0.66;

        if (h > smallest) { //stop the function when less than 5 pixels
            //branch off to the right
            pushMatrix();
            rotate(theta);
            line(0, 0, 0, h * direction); //draw branch
            translate(0, h * direction); //move to branch end
            branch(h);
            popMatrix();
        }
    }

    void move () {
        if (theta < 100) {
            theta += 0.1;
        } else {
            theta = 0;
        }
    }

    void display() {
        stroke(c);
        strokeWeight(3);
        pushMatrix();
        translate(x,y);
        line(0,0,0,-10);
        // Move to the end of the line
        translate(0,-10);
        branch(10);
        popMatrix();
    }
}
