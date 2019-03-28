abstract class Shape {
    protected float x;
    protected float y;
    protected float xSpeed;
    protected float ySpeed;
    protected color col;
    protected float xSize; //<>//
    protected float ySize;
    protected float draw_x;
    protected float draw_y;
    protected Faction faction;
    public static final float maxBulletSpeed = 100;
    
    Shape(float x, float y, float xSpeed, float ySpeed, float xSize, float ySize) {
        /*
         * Create a new shape at the given
         * x,y point with a random speed,
         * color, and size.
         */
        this.x = x;
        this.y = y;
        this.xSpeed = xSpeed; //<>//
        this.ySpeed = ySpeed;
        this.xSize = xSize;
        this.ySize = ySize;
        this.col = color(random(0,255),
                         random(0,255),
                         random(0,255));
        this.faction = Faction.NEUTRAL;
    }

    public void update() {
        /* Update current location by speed. */
        this.x += this.xSpeed * timestep;
        this.y += this.ySpeed * timestep;
    }

    public void draw(){
        /* Draws the shape, with respect to the camera */
        fill(this.col); // set shape color
        stroke(0,0,0); // add a black outline
        this.draw_x = this.x - camera.getX();
        this.draw_y = this.y - camera.getY();
    }
    public float getX(){
        return this.x;
    }
    public float getY(){
        return this.y;
    }
    public Faction getFaction(){
        return this.faction;
    }
}
