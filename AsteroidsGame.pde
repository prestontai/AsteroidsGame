//your variable declarations here
SpaceShip flyer = new SpaceShip();
SpaceShip ghost = new SpaceShip();
Star [] night = new Star[400];
//Asteroids [] field = new Asteroids[35];
ArrayList <Asteroids> field = new ArrayList <Asteroids>();
ArrayList <Bullet > magazine = new ArrayList <Bullet>();
public int asteroidSpawn = 0;
public boolean counterAsteroid;
public double distance, distance2;

public void setup() 
{
  //your code here 
  size(600, 600);
  flyer.setX(300);
  flyer.setY(300);
  ghost.setX(300);
  ghost.setY(300);
  for(int i=0; i<night.length; i++){
    night[i]= new Star();
  }
  /*for(int i=0; i<field.length; i++){
    field[i]= new Asteroids();
    field[i].setX((int)(Math.random()*560)+20);
    field[i].setY((int)(Math.random()*560)+20);
  }*/
  for(int a=0; a<50; a++){
    field.add((a), new Asteroids());
    field.get(a).setX((int)(Math.random()*560)+20);
    field.get(a).setY((int)(Math.random()*560)+20);
  }
  /*for(int i=0; i<0; i++){
    magazine.add((i), new Bullet());
    magazine.get(i).setX(350);
    magazine.get(i).setY(350);
  }*/
  
//(int)(asteroidSpawn/20)
}
public void draw() 
{
  //your code here
  background(0); 
  for(int i=0; i<night.length; i++){
    night[i].move();
    night[i].show();
  }
  for(int a=0; a<field.size(); a++){
    field.get(a).move();
    field.get(a).show();
    field.get(a).setDirectionX(-ghost.getDirectionX());
    field.get(a).setDirectionY(-ghost.getDirectionY());
    distance =  Math.hypot(field.get(a).getX()-300, field.get(a).getY()-300);
    if(distance<8){ // distance2<8){    //|| distance2<10                //removing asteroids on contact
      field.remove(a);
      a--;
    }
    //if(counterAsteroid==true){
    //  field.add((i), new Asteroids);
    //}
  }
  /*for(int i=0; i<field.size(); i++){
    field.get(i).move();
    field.get(i).show();
    field.get(i).setDirectionX(-ghost.getDirectionX());
    field.get(i).setDirectionY(-ghost.getDirectionY());
  }*/
  for(int i=0; i<magazine.size(); i++){
    magazine.get(i).move();
    magazine.get(i).show();
      //dRadians = ghost.getPointDirection()*(Math.PI/180);
      //myDirectionX = 5 * Math.cos(dRadians) + ghost.getDirectionX();
      //myDirectionY = 5 * Math.sin(dRadians) + ghost.getDirectionY();
    if(magazine.get(i).getX()<0 ||magazine.get(i).getY()<0||magazine.get(i).getX()>600|| magazine.get(i).getY()>600){                    //removing asteroids on contact
      magazine.remove(i);
      i--; 
    }
  }
  for(int i=0; i< magazine.size(); i++){
    for(int a=0; a<field.size(); a++){
      distance2 =  Math.hypot(field.get(a).getX()- magazine.get(i).getX(), field.get(a).getY()-magazine.get(i).getY());
      if(distance2<8){
        magazine.remove(i);
        i--;
        field.remove(a);
        i--;
      }
    }
  }

  flyer.show();
  flyer.setDirectionY(0);
  flyer.setDirectionX(0);
  flyer.move();
  //ghost.show();
  ghost.move();

  if(counterAsteroid==true){
    field.add( (int)(Math.random()*40), new Asteroids());
  }
  if (asteroidSpawn==60){
        counterAsteroid=true;
    }else if(asteroidSpawn==0){
        counterAsteroid=false;
  }
  if(counterAsteroid==true){
      asteroidSpawn--;
    }else{
      asteroidSpawn++;
  } 
}

public void keyPressed(){

  if(keyCode== 87){ //w
     ghost.accelerate(.5);
  }
  else if(keyCode==83)
    ghost.accelerate(-.5);
  if(keyCode==65){ //a
    ghost.rotate(-7);
    flyer.rotate(-7);
  }
  if(keyCode==68){//d
    ghost.rotate(7);
    flyer.rotate(7); 
  }
  if(keyCode==90){ //z
    flyer.rotate(180);
    ghost.rotate(180);
  }
  if(keyCode == 70){  //f
    /*flyer.setX((int)(Math.random()*360)+20);
    flyer.setY((int)(Math.random()*360)+20);
    flyer.setDirectionX(0);
    flyer.setDirectionY(0);
    flyer.setPointDirection((int)(Math.random()*360));*/
    ghost.accelerate(20);
  }
  if(keyCode == 71){  //g  sudden stop
    ghost.setDirectionX(0);
    ghost.setDirectionY(0);
  }
  if(keyCode == 32){  //spacebar shoot bullets
    magazine.add(0, new Bullet());
  }
}

class SpaceShip extends Floater  
{   
    //your code here
    public SpaceShip(){
    corners = 5;
    int[] xS = {-8, 10, -8, -5, -5};
    int[] yS = { 8,  0, -8, -4,  4};
    xCorners = xS;
    yCorners = yS;
    myColor = color(150, 160, 230);
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
public class Asteroids extends Floater{
    int rotSpeed;
    public Asteroids(){
    corners = 6;
    int[] xS = { -12, 0, 10, 10, 0, -12};
    int[] yS = {  4, 10, 6, -6, -10, -4};
    rotSpeed = (int)(Math.random()*PI*2);
    xCorners = xS;
    yCorners = yS;
    myColor = color(170, 180, 200);
    }
    
    public void show(){
      noStroke();
      super.show();
    }
    public void move(){
      super.move();
      rotate(rotSpeed);
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

class Star extends Floater{
  private double myStarX, myStarY;
  private int myColorStar;
  private boolean counter;  
  public Star(){
      myStarX= ((int)(Math.random()*580)+10);
      myStarY= ((int)(Math.random()*580)+10);
    }
    public void move(){
      if (myColorStar==255){
        counter=true;
      }else if(myColorStar==70){
        counter=false;
      }
      if(counter==true){
      myColorStar--;
      }else{
      myColorStar++;
      } 
        super.move();
    }
    public void show(){
      noStroke();
      fill(myColorStar);
      ellipse((float)myStarX, (float)myStarY, 2, 2);
      super.show();
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
/*class Bullet extends Floater{
  private double myBulletX, myBulletY, dRadians;
  private int myColorBullet;
  private boolean counter;  
  public Bullet(){  //SpaceShip ghost/flyer
      myBulletX = 350; //flyer.getCenterX();
      myBulletY = 350; //flyer.getCenterY();
      dRadians = ghost.getPointDirection()*(Math.PI/180);
      myDirectionX = 5 * Math.cos(dRadians) + ghost.getDirectionX();
      myDirectionY = 5 * Math.sin(dRadians) + ghost.getDirectionY();
    }
    public void move(){
      //super.move();
    }
    public void show(){
      //noStroke();
      fill(255,0,0);
      ellipse((float)myBulletX, (float)myBulletY, 5, 5);
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
}*/
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

