private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public int r = 0,g = 255,b =0;

public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(r,g,b);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1,angle2;
  
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1,endY1,branchLength,angle1);
    drawBranches(endX2,endY2,branchLength,angle2);
  }
} 
public void mousePressed(){
 g = (int)(Math.random() * 256);
 r = (int)(Math.random() * 256);
 b = (int)(Math.random() * 256);
 stroke(r,g,b);
 redraw();
}
