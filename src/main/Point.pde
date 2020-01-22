int size = 8;

class Point{
  PVector pos;
  boolean isHull, isDragged;
  color c;
  color black = color(0);
  color red = color(230,50,50);
  color lightred = color(250,100,100);
  color gray = color(100);
  
  Point(){
    this.pos = new PVector(random(0.05*width,0.95*width), random(0.2*height,0.8*height));
    this.c = this.black;
    this.isHull = false;
    this.isDragged = false;
  }
  
  void display(){
    this.setColor();
    fill(this.c);
    ellipse(this.pos.x, this.pos.y, size, size);
  }
  
  boolean onHover(){
    return (this.pos.x-mouseX)*(this.pos.x-mouseX)+(this.pos.y-mouseY)*(this.pos.y-mouseY) <= size*size;
  }
  
  void setColor(){
    boolean interactive = view.bottomBtns.btns.get("interBtn").toggle;
    if(this.isHull){
      if((this.isDragged || this.onHover()) && interactive){
        this.c = this.lightred;
      } else {
        this.c = this.red;
      }
    } else {
      if((this.isDragged || this.onHover()) && interactive){
        this.c = this.gray;
      } else {
        this.c = this.black;
      }
    }
  }
}
