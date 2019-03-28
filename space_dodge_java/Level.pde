class Level {
    private ArrayList gameObjects;
    private ArrayList gameBullets;
    private ListIterator<Ship> objectsIterator;
    private ListIterator<Projectile> bulletsIterator;
    private Ship gameObject;
    private Projectile gameBullet;
    Level(){
        gameObjects = new ArrayList<Ship>();
        gameBullets = new ArrayList<Projectile>();
        gameObjects.add(player);
        gameObjects.add(new CircleShip(5, 10, random(5,75), 10, Faction.ENEMY));
        gameObjects.add(new CircleShip(5, 50, random(5,75), 10, Faction.ENEMY));
        gameObjects.add(new CircleShip(5, 100, random(5,75), 10, Faction.ENEMY));
    }
    public void update(){
        //Updates everything, and runs collision checks 
        //efficient collision checks will be here eventually, or maybe not
        objectsIterator = this.gameObjects.listIterator();
        controller.update();
        gameObjectLoop(new Callback(){
            public void onSuccess(Ship gameObject){
                gameObject.update();
            }
        });
        camera.yFollowUpdate(300);
        bulletsIterator = this.gameBullets.listIterator();
        while (bulletsIterator.hasNext()){
            gameBullet = bulletsIterator.next();
            gameBullet.update();
            objectsIterator = this.gameObjects.listIterator();
            while (objectsIterator.hasNext()){
                gameObject = objectsIterator.next();
                if(gameBullet.collisionCheck(gameObject)){
                    if(gameObject.collisionEvent(gameBullet)){
                        objectsIterator.remove();
                    }
                    bulletsIterator.remove();
                    break;
                }
            }
        }
    }
    public void draw(){
        /* Draws Ships and Projectiles onto the canvas*/
        gameObjectLoop(new Callback(){
            public void onSuccess(Ship gameObject){
                gameObject.draw();
                if (gameObject.getFaction() == Faction.PLAYER){
                    //println(gameObject.getY() - camera.getY());
                }
            }
        });
        bulletsIterator = this.gameBullets.listIterator();
        while (bulletsIterator.hasNext()){
            gameBullet = bulletsIterator.next();
            gameBullet.draw();
        }
    }
    private void gameObjectLoop(Callback callback){
        /*Loops through the gameObjects Array
        Why didn't I make this function for the gameBullets Array?
        Not sure
        Why didn't I make good callback function interfaces?
        Also not quite sure...
        */
        objectsIterator = this.gameObjects.listIterator();
        while (objectsIterator.hasNext()){
        Ship gameObject = objectsIterator.next();
        callback.onSuccess(gameObject);
        }
    }
    
    public void addObjects(Ship ship){
        this.gameObjects.add(ship);
    }
    public void addBullets(Projectile projectile){
        this.gameBullets.add(projectile);
    }
    public void mousePressed(){
        //For debugging
        addObjects(new CircleShip(mouseX + camera.getX(), mouseY + camera.getY(), random(5,75), 10, Faction.ENEMY));
    }
}
