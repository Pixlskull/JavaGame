class Controller {
    private boolean left;
    private boolean right;
    private boolean up;
    private boolean down;
    private float magnitude;
    private float targetMagnitude;
    private float shootDelay;
    private float xTargetDistance;
    private float yTargetDistance;
    public float xSpeedMult;
    public float ySpeedMult;
    public float xTargetMult;
    public float yTargetMult;
    Controller(){
        this.left = false;
        this.right = false;
        this.up = false;
        this.down = false;
        this.xSpeedMult = 0;
        this.ySpeedMult = 0;
        this.shootDelay = 0;
        //this.yVelocityMult = 0;
    }
    public void update(){
        /* Checks to see what direction the player is moving in
        The -= and += operators are used to make sure the player 
        won't move when both the "left" and the "right" key are 
        pressed down at the same time
        */
        this.xSpeedMult = 0;
        this.ySpeedMult = 0;
        this.shootDelay -= timestep;
        if (this.left == true){
            this.xSpeedMult -= 1;
        }
        if (this.right == true){
            this.xSpeedMult += 1;
        }
        if (this.up == true){
            this.ySpeedMult -= 1;
        }
        if (this.down == true){
            this.ySpeedMult += 1;
        }
        normalizeMovement();
    }
    private void normalizeMovement(){
       //normalizes the movement vector, to make the player move at a constant speed
       magnitude = sqrt(pow(this.xSpeedMult, 2) + pow(this.ySpeedMult, 2));
        if (magnitude != 0){
            this.xSpeedMult = this.xSpeedMult * abs(this.xSpeedMult) / this.magnitude;
            this.ySpeedMult = this.ySpeedMult * abs(this.ySpeedMult) / this.magnitude;
        }
    }
    private void normalizeTargetCoord(){
        //Didn't have enough time to figure out how to use pairs
        //Didn't have time to make code good
        //Normalizes the direction at which the bullet moves
        this.xTargetDistance = mouseX - (player.getX() - camera.getX());
        this.yTargetDistance = mouseY - (player.getY() - camera.getY());
        targetMagnitude = sqrt(pow(this.xTargetDistance, 2)+ pow(this.yTargetDistance, 2));
        this.xTargetMult = this.xTargetDistance / targetMagnitude;
        this.yTargetMult = this.yTargetDistance / targetMagnitude;
    }
    public void keyPressed(char key){
        //Sets movement booleans to true when keys are pressed down
        if (key == 'w'){
            this.up = true;
        }
        if (key == 'a'){
            this.left = true;
        }
        if (key == 's'){
            this.down = true;
        }
        if (key == 'd'){
            this.right = true;
        }
        if (key == ' '){
            //planning 
            if (shootDelay <= 0){
                normalizeTargetCoord();
                player.shootEvent();
                this.shootDelay = 0.3;
            }
        }
    }
    public void keyReleased(char key){
        //Stops movement in a direction once a key is released
        if (key == 'w'){
            this.up = false;
        }
        if (key == 'a'){
            this.left = false;
        }
        if (key == 's'){
            this.down = false;
        }
        if (key == 'd'){
            this.right = false;
        }
    }
  
  
}
