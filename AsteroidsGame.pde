//your variable declarations here
SpaceShip flyer = new SpaceShip();
Star [] night = new Star[200];
public int boulderX=700;
public int boulderY=700;
public void setup() 
{
  //your code here 
  size(400, 400);
  flyer.setX(200);
  flyer.setY(200);
  for(int i=0; i<night.length; i++){
    night[i]= new Star();
  }
}
public void draw() 
{
  //your code here
  background(0); 
  for(int i=0; i<night.length; i++){
    night[i].change();
    night[i].show();
    night[i].follow();
  }
  flyer.show();
  flyer.move();
  boulderX--;
  boulderY--;
  ellipse(boulderX, boulderY, 20,20);

  for(int i=0; i<night.length; i++){
    night[i].setStarDirectionX(.5);
    //night[i].setStarDirectionX(.5);
    night[i].setStarDirectionY(.5);
    //night[i].setStarDirectionY(.5);
  }
}
public void keyPressed(){

  if(keyCode== 87){ //w
    flyer.accelerate(.5); 
  }
  else if(keyCode==83)
    flyer.accelerate(-.5);
  if(keyCode==65) //a
    flyer.rotate(-5);
  if(keyCode==68) //d
    flyer.rotate(5);
  if(keyCode==90) //s
    flyer.rotate(180);
  if(keyCode == 70){  //f
    flyer.setX((int)(Math.random()*360)+20);
    flyer.setY((int)(Math.random()*360)+20);
    flyer.setDirectionX(0);
    flyer.setDirectionY(0);
    flyer.setPointDirection((int)(Math.random()*360));
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
public class Asteroids{
 // super();
}

class Star extends Floater{
    /*private int myStarX, myStarY, myColorStar;
    private boolean counter;  
    private double myStarDirectionX, myStarDirectionY; //holds x and y coordinates of the vector for direction of travel   
    private double myStarPointDirection, starAccelerate;
    Star(){
      myStarX= ((int)(Math.random()*380)+10);
      myStarY= ((int)(Math.random()*380)+10);
    }
    public void change(){
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
    }
    public void follow(){
         myStarX += myStarDirectionX;    
         myStarY += myStarDirectionY;     

        //wrap around screen    
        if(myStarX >width+3)
        {     
          myStarX = -3;    
        }    
        else if (myStarX<-3)
        {     
          myStarX = width+3;    
        }    
        if(myStarY >height+3)
        {    
          myStarY = -3;    
        }   
        else if (myStarY < -3)
        {     
          myStarY = height+3;    
        }     
    }
    public void show(){
      noStroke();
      fill(myColorStar);
      ellipse(myStarX, myStarY, 2, 2);
        
    }
    public void setStarX(int x){myStarX= x;}; 
    public int getStarX(){return (int)myStarX;};
    public void setStarY(int y){myStarY= y;};
    public int getStarY(){return (int)myStarY;};

    public void setStarDirectionX(double x){myStarDirectionX = x;};
    public double getStarDirectionX(){return myStarDirectionX;};
    public void setStarDirectionY(double y){myStarDirectionY = y;};
    public double getStarDirectionY(){return myStarDirectionY;};   
    public void setStarPointDirection(int degrees){myStarPointDirection = degrees;};
    public double getStarPointDirection(){return (int)myStarPointDirection;};
    
    public void starAccelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myStarPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myStarDirectionX += ((dAmount) * Math.cos(dRadians));    
    myStarDirectionY += ((dAmount) * Math.sin(dRadians));       
  }*/

  private double myStarX, myStarY;
  private int myColorStar;
  private boolean counter;  
  Star(){
      myStarX= ((int)(Math.random()*380)+10);
      myStarY= ((int)(Math.random()*380)+10);
      myDirectionX=0;
      myDirectionY=0;
    }
    public void change(){
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
    }
     public void follow(){
         myStarX += myDirectionX;    
         myStarY += myDirectionY;   

        //wrap around screen    
        if(myStarX >width+3)
        {     
          myStarX = -3;    
        }    
        else if (myStarX<-3)
        {     
          myStarX = width+3;    
        }    
        if(myStarY >height+3)
        {    
          myStarY = -3;    
        }   
        else if (myStarY < -3)
        {     
          myStarY = height+3;    
        }     
    }
    public void show(){
      noStroke();
      fill(myColorStar);
      ellipse((float)myStarX, (float)myStarY, 2, 2);
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