public interface Projectile{
    public boolean enemyCheck(Ship ship);
    public boolean collisionCheck(Ship ship);
    public float getDamage();
    public void update();
    public void draw();
}
