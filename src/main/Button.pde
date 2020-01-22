class Button {
  PVector pos, size;
  color c, textc, descc;
  String text, desc;
  float roundness;
  float textSz;
  boolean toggle;
  color white = color(250);
  color gray = color(190);
  color black = color(40);
  color green = color(160,240,130);
  
  Button (String text, float posx, float posy, float sizex, float sizey, String desc, float textSz){
    this.pos = new PVector(posx, posy);
    this.size = new PVector(sizex, sizey);
    this.roundness = 7;
    this.c = this.white;
    
    this.text = text;
    this.textc = this.black;
    this.textSz = textSz;
    this.desc = desc;
    this.descc = this.black;
    this.toggle = false;
  }
  
  void display(){
    this.setColor();
    fill(this.c);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y, this.roundness);
    fill(this.textc);
    textSize(this.textSz);
    text(this.text, this.pos.x+this.size.x/2, this.pos.y+this.size.y/2);
    fill(this.descc);
    if(this.onHover()){
      view.desc = this.desc;
    }
  }
  
  boolean onHover(){
    return this.pos.x <= mouseX && mouseX <= this.pos.x+this.size.x &&
           this.pos.y <= mouseY && mouseY <= this.pos.y+this.size.y;
  }
  
  void setColor(){
    if(this.onHover()){
      this.c = gray;
    } else {
      if(this.toggle){
        this.c = green;
      } else {
        this.c = white;
      }
    }
  }
}
