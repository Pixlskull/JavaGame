class Player extends CircleShip implements Ship{
    private float xSpeedTop;
    private float ySpeedTop;
    private Faction faction;
    Player(float size, float hp) {
        super(width/2, height/2, size, hp, Faction.PLAYER);
        this.xSpeedTop = 150;
        this.ySpeedTop = 150;
        this.faction = Faction.PLAYER;
    }
    @Override
    public void update(){
         this.xSpeed = xSpeedTop * controller.xSpeedMult;
         this.ySpeed = ySpeedTop * controller.ySpeedMult;
         this.x += this.xSpeed * timestep;
         this.y += this.ySpeed * timestep;
         this.clampX();
         this.clampY();
    }
    public void draw() {
        /* Draw self on the canvas. */
        super.draw();
    }
    public void shootEvent(){
        level1.addBullets(new BulletCircle(player.x, player.y, (Shape.maxBulletSpeed * controller.xTargetMult), (Shape.maxBulletSpeed * controller.yTargetMult), 5, 10, 1, Faction.PLAYER));
        
    }
    public Faction getFaction(){
        //Couldn't figure out how to inherit this method from Shape
        //The getFaction() method from Shape kept returning the Faction of the Shape, not the player
        return this.faction;
    }
    private void clampX(){
        //Didn't have time to figure out pairs
        //Prevents the player from moving off-screen
        this.x = max(camera.getX(), min(player.x, camera.getX() + width));
    }
    private void clampY(){
        //prevents the player from moving off-screen
        //There is a weird glitch where the player drawX will randomly stutter between 200 and 198
        //Not quite sure why this happens.
        //My theory is that the code is running too fast
        this.y = max(camera.getY(), min(player.y, camera.getY() + height));
    }
}
