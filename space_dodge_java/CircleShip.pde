class CircleShip extends Circle implements Ship{
    private float hp;
    private Faction faction;
    private float shootDelay;
    CircleShip (float x, float y, float size, float hp, Faction faction){
        super(x, y, 0, 0, size);
        this.hp = hp;
        this.shootDelay = 0.5;
        this.faction = faction;
        
    }
    public float getHp(){
        return this.hp;
    }
    public boolean collisionEvent(Projectile projectile){
        /* Decreases the hp of the Ship upon collision */
        if(hpDecrease(projectile.getDamage())){
            return true;
        }
        return false;
    }
    private boolean hpDecrease(float damage){
        /* Decreases the hp of the Ship, and checks to see if the Ship is dead (hitpoints below 0) */
        this.hp -= damage;
        if (this.hp <= 0){
            return true;
        }
        return false;
    }
    private void shootCycle(){
        /* Checks to see if the bullet cycle timer reaches 0
        Fires a bullet if cycle timer is 0, and resets timer
        */
        if (this.shootDelay <= 0){
            shootEvent();
            this.shootDelay = 0.5;
        }
    }
    public void shootEvent(){
        float targetX = this.x - player.getX();
        float targetY = this.y - player.getY();
        Vector targetVector = new Vector(targetX, targetY);
        Vector unitTarget = targetVector.unit();
        level1.addBullets(new BulletCircle(
            this.x, 
            this.y, 
            (Shape.maxBulletSpeed * -unitTarget.getX()), 
            (Shape.maxBulletSpeed * -unitTarget.getY()), 
            5, 
            10, 
            1, 
            Faction.ENEMY));
    }
    
    public void setColor(){
        /* Sets a random color, mainly for testing purposes */
        this.col = color(random(0,255),
                         random(0,255),
                         random(0,255));
    }
    @Override
    public void update() {
        super.update();
        this.shootDelay -= timestep;
        shootCycle();
    }
    public Faction getFaction(){
        return this.faction;
    }
}
