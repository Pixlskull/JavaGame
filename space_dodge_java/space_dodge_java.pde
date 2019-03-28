import java.util.*;
import javafx.util.*;

float lastMillis;
float millis;
float timestep;
Player player;
Camera camera;
Controller controller;
Level level1;

void setup() {
    size(400, 400);
    player = new Player(10, 20);
    camera = new Camera();
    controller = new Controller();
    level1 = new Level();
}

void draw() {
    /* 
     * Updates the levels and Time
     */
    // draw a white background
    background(255, 255, 255);
    millis = millis();
    timestep  = (millis - lastMillis)/1000;
    level1.update();
    level1.draw();
    lastMillis = millis;
}
void mousePressed(){
    level1.mousePressed();
}
void keyPressed() {
    controller.keyPressed(key);
}
void keyReleased() {
    controller.keyReleased(key);
}
