class Circle extends Shape {
    protected float size;
    Circle(float x, float y, float xSpeed, float ySpeed, float size) {
        super(x, y, xSpeed, ySpeed, size, size);
        this.size = size;
    }
  
    @Override
    public void draw() {
        /* Draw self on the canvas. 
           Size is multiplied by 2, because the ellipse method requires the diameter of the shape
        */
        super.draw();
        ellipse(this.draw_x, this.draw_y,
                this.size * 2, this.size * 2);
    }
    public float getSize(){
        /* returns the radius */
        return this.size;
    }
}
