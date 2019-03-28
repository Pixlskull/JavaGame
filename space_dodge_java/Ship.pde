public interface Ship{
    public boolean collisionEvent(Projectile projectile);
    public void shootEvent();
    public void update();
    public void draw();
    public Faction getFaction();
    public void setColor();
    public float getX();
    public float getY();
    public float getSize();
}
