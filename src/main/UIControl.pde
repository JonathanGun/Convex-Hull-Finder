color bgColor = color(240);
int smallText = 12;
int mediumText = 16;
int largeText = 44;

class UIControl{
  ButtonBox bottomBtns, multBtns;
  String desc, defaultDesc, title, author;
  PVector descPos;
  
  UIControl(){
    this.createBottomBtns();
    this.createMultBtns();
    this.descPos = new PVector(width/2, height-this.bottomBtns.sizeBox-this.bottomBtns.pad*3);
    this.defaultDesc = "Hover on button to see the instruction";
    this.title = "Convex Hull";
    this.author = "Jonathan Yudi";
  }
  
  void display(){
    fill(0);
    textSize(largeText);
    text(this.title, width/2, this.bottomBtns.pad*3);
    textSize(smallText);
    text("by "+this.author, 6*width/10, this.bottomBtns.pad*6);
    textSize(mediumText);
    text("n = "+str(hull.ps.size()), 50, height-this.bottomBtns.pad-this.bottomBtns.btns.get("nextBtn").size.y/2);
    this.desc = this.defaultDesc;
    this.bottomBtns.display();
    this.multBtns.display();
    textSize(smallText);
    text(this.desc, this.descPos.x, this.descPos.y);
  }
  
  void createBottomBtns(){
    this.bottomBtns = new ButtonBox("horizontal", width, height, 50, 10);
    this.bottomBtns.add("nextBtn", "Next", 100, "Generate n new random points", mediumText);
    this.bottomBtns.add("addBtn", "+", 50, "Add 1 point", mediumText);
    this.bottomBtns.add("subBtn", "-", 50, "Reduce 1 point", mediumText);
    this.bottomBtns.add("outBtn", "Show Debug", 150, "Show set of hull points and time taken to find the hull", mediumText);
    this.bottomBtns.add("numBtn", "Show Number", 150, "Show point numbers", mediumText);
    this.bottomBtns.add("interBtn", "Interactive", 150, "Can move points (drag using mouse)", mediumText);
  }
  
  void createMultBtns(){
    this.multBtns = new ButtonBox("vertical", width, height-50, 40, 10);
    this.multBtns.add("x1", "x1", 40, "x1 multiplier add/reduce point", smallText);
    this.multBtns.add("x10", "x10", 40, "x10 multiplier add/reduce point", smallText);
    this.multBtns.add("x100", "x100", 40, "x100 multiplier add/reduce point", smallText);
    this.multBtns.btns.get("x1").toggle = true;
  }
}
