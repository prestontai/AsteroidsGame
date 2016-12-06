public class Sphee {
   public Sphee(double x, double y) {
  		noFill();
    	stroke(200,200,200);
    	x=4;
    	y=4;
   }
   public void move(){
   		x++;
   		y++;
   		ellispe(300,300, x, y);
   }
}