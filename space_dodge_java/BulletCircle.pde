class BulletCircle extends Circle  implements Projectile{
    private float lifetime;
    private float damage;
    private Faction faction;
    BulletCircle(
            float x, 
            float y, 
            float xSpeed, 
            float ySpeed, 
            float size, 
            float lifetime, 
            float damage,
            Faction faction
        ) {
        super(x, y, xSpeed, ySpeed, size);
        this.lifetime = lifetime;
        this.damage = damage;
        this.faction = faction;
    }
    public Faction getFaction(){
        return this.faction;
    }
    public boolean enemyCheck(Ship ship){
        /* Checks to see if the bullet and the Ship are of opposing Factions */
        if (ship.getFaction() != this.faction){
            return true;
        }
        return false;
    }
    public boolean collisionCheck(Ship ship){
        /* Checks if the bullet is colliding with a Ship
        */
        if (enemyCheck(ship)){
            if (pow(this.x - ship.getX(), 2) + pow(this.y - ship.getY(), 2) <= pow(this.size + ship.getSize(), 2)){
                return true;
            }
            return false;
        }
        return false;
    }
    public float getDamage(){
        return this.damage;
    }    
    @Override
    public void update(){
        super.update();
        this.lifetime -= timestep;
        if (this.lifetime <= 0){
            //do something with deleting projectile
        }
    }
    
}
