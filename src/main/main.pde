UIControl view;
ConvexHull hull;
int defaultNumPoints = 5;

void settings() {
  size(800, 600);
}

void setup() {
  surface.setTitle("Tucil 1 Stima: Convex Hull - by Jonathan Yudi");
  surface.setResizable(false);
  noStroke();
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(mediumText);
  view = new UIControl();
  hull = new ConvexHull(defaultNumPoints);
}

void draw() {
  background(bgColor);
  view.display();
  hull.display();
}

void mouseClicked(){
  if (view.bottomBtns.btns.get("nextBtn").onHover()){
    hull.generateNewPoints(hull.ps.size());
  } else if (view.bottomBtns.btns.get("addBtn").onHover()){
    int times = view.multBtns.btns.get("x1").toggle? 1 :
                view.multBtns.btns.get("x10").toggle? 10:
                view.multBtns.btns.get("x100").toggle? 100:0;
    hull.addPoint(times);
    hull.getConvexHull();
  } else if (view.bottomBtns.btns.get("subBtn").onHover()){
    int times = view.multBtns.btns.get("x1").toggle? 1 :
                view.multBtns.btns.get("x10").toggle? 10:
                view.multBtns.btns.get("x100").toggle? 100:0;
    times = min(hull.ps.size()-1, times);
    hull.removePoint(times);
    hull.getConvexHull();
  } else if (view.bottomBtns.btns.get("outBtn").onHover()){
    view.bottomBtns.btns.get("outBtn").toggle ^= true;
  } else if (view.bottomBtns.btns.get("numBtn").onHover()){
    view.bottomBtns.btns.get("numBtn").toggle ^= true;
    hull.getConvexHull();
  } else if (view.bottomBtns.btns.get("interBtn").onHover()){
    view.bottomBtns.btns.get("interBtn").toggle ^= true;
  } else if (view.multBtns.btns.get("x1").onHover()){
    view.multBtns.btns.get("x1").toggle = true;
    view.multBtns.btns.get("x10").toggle = false;
    view.multBtns.btns.get("x100").toggle = false;
    view.bottomBtns.btns.get("addBtn").desc = "Add 1 point";
    view.bottomBtns.btns.get("subBtn").desc = "Reduce 1 point";
  } else if (view.multBtns.btns.get("x10").onHover()){
    view.multBtns.btns.get("x1").toggle = false;
    view.multBtns.btns.get("x10").toggle = true;
    view.multBtns.btns.get("x100").toggle = false;
    view.bottomBtns.btns.get("addBtn").desc = "Add 10 points";
    view.bottomBtns.btns.get("subBtn").desc = "Reduce 10 points";
  } else if (view.multBtns.btns.get("x100").onHover()){
    view.multBtns.btns.get("x1").toggle = false;
    view.multBtns.btns.get("x10").toggle = false;
    view.multBtns.btns.get("x100").toggle = true;
    view.bottomBtns.btns.get("addBtn").desc = "Add 100 points";
    view.bottomBtns.btns.get("subBtn").desc = "Reduce 100 points";
  }
}

void mouseDragged(){
  if(view.bottomBtns.btns.get("interBtn").toggle){
    if(!hull.isDraggingPoint()){
      for(Point p: hull.ps){
        if(p.onHover()){
          p.isDragged = true;
        }
      }
    } else {
      for(Point p: hull.ps){
        if(p.isDragged){
          p.pos.x = mouseX;
          p.pos.y = mouseY;
        }
      }
    }
    hull.getConvexHull();
  }
}

void mouseReleased(){
  if(view.bottomBtns.btns.get("interBtn").toggle){
    for(Point p: hull.ps){
      p.isDragged = false;
    }
  }
}
