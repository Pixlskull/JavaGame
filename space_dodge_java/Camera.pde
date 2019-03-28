class Camera {
    public float x;
    public float y;
    Camera(){
        this.x = player.getX() - width/2;
        this.y = player.getY()- height/2;
    }
    public void followUpdate(float xCenter, float yCenter){
        //places the camera at the upper left corner above the player
        this.x = player.getX() - xCenter;
        this.y = player.getY()- yCenter;
    }
    public void yFollowUpdate(float yCenter){
        //camera only follows player when moving along the y-axis
        this.y = player.getY()- yCenter;
    }
    public float getX(){
        return this.x;
    }
    public float getY(){
        return this.y;
    }
}
