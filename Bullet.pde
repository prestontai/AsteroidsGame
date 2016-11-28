//ArrayList <Bullet   > magazine = new ArrayList <Bullet>();

class Bullet extends Floater{
  private double dRadians; //myBulletX, myBulletY, dRadians;
  private int myColorBullet;
  private boolean counter;  
  public Bullet(){  //SpaceShip ghost/flyer
      //myBulletX = 300; //flyer.getCenterX();
      //myBulletY = 300; //flyer.getCenterY();
      myCenterX = 300;
      myCenterY = 300;
      dRadians = ghost.getPointDirection()*(Math.PI/180);
      myDirectionX = 5 * Math.cos(dRadians); //+ ghost.getDirectionX();
      myDirectionY = 5 * Math.sin(dRadians); // + ghost.getDirectionY();
    }
    public void move(){
      myCenterX += myDirectionX;
      myCenterY += myDirectionY;
    }
    public void show(){
      //noStroke();
      fill(255,0,0);
      ellipse((float)myCenterX, (float)myCenterY, 5, 5);
    }
    public void setX(int x){myCenterX= x;}; 
    public int getX(){return (int)myCenterX;};
    public void setY(int y){myCenterY= y;};
    public int getY(){return (int)myCenterY;};
    public void setDirectionX(double x){myDirectionX = x;};
    public double getDirectionX(){return myDirectionX;};
    public void setDirectionY(double y){myDirectionY = y;};
    public double getDirectionY(){return myDirectionY;};   
    public void setPointDirection(int degrees){myPointDirection = degrees;};
    public double getPointDirection(){return (int)myPointDirection;};
}