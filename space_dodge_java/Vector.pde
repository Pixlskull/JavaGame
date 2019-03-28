class Vector{
    private float x;
    private float y;
    Vector(float x, float y){
        this.x = x;
        this.y = y;
    }
    public float getMagnitude(){
        return sqrt(pow(this.x, 2) + pow(this.y, 2));
    }
    public float getX(){
        return this.x;
    }
    public float getY(){
        return this.y;
    }
    public Vector getUnit(){
        Vector unit = new Vector(this.x, this.y);
        unit.divide(getMagnitude(), getMagnitude());
        return unit; //<>//
    }
    public void divide(float a, float b){
        this.x /= a;
        this.y /= b;
    }
} //<>//
