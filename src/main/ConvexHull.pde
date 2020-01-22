class ConvexHull{
  ArrayList<Point> ps;
  ArrayList<PVector> hull;
  
  ConvexHull (int n){
    this.generateNewPoints(n);
  }
  
  void display(){
    for(int i = 0; i < this.ps.size(); ++i){
      Point p = this.ps.get(i);
      p.display();
      if(view.bottomBtns.btns.get("numBtn").toggle){
        text(i, p.pos.x+10, p.pos.y-10);
      }
    }
    stroke(this.ps.get(0).red);
    for(PVector v: hull){
      Point p1 = this.ps.get((int)v.x);
      Point p2 = this.ps.get((int)v.y);
      line(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
    }
    noStroke();
  }
  
  void generateNewPoints(int n){
    this.ps = new ArrayList<Point>();
    for(int i = 0; i < n; ++i){
      this.ps.add(new Point());
    }
    this.getConvexHull();
  }
  
  void getConvexHull(){
    for(Point p: this.ps){
      p.isHull = false;
    }
    long t1 = System.nanoTime();
    this.getConvexHullUtil();
    long t2 = System.nanoTime();
    if(view.bottomBtns.btns.get("outBtn").toggle){
      print("[");
      for(Point p: this.ps){
        if (p.isHull){
          print("("+str(p.pos.x)+","+str(p.pos.y)+"),");
        }
      }
      println("]");
      double t = ((double)t2-t1)/1000000;
      println("Time taken: " + String.valueOf(t) + " milliseconds");
    }
    this.display();
  }
  
  void getConvexHullUtil(){
    this.hull = new ArrayList<PVector>();
    for(int i = 0; i < this.ps.size(); ++i){
      Point p1 = this.ps.get(i);
      float x1,y1;
      x1 = p1.pos.x;
      y1 = p1.pos.y;
      for(int j = i+1; j < this.ps.size(); ++j){
        Point p2 = this.ps.get(j);
        float x2,y2;
        x2 = p2.pos.x;
        y2 = p2.pos.y;
        
        boolean allPos, allNeg;
        allPos = true;
        allNeg = true;
        for(int k = 0; k < this.ps.size(); ++k){
          if(i == k || j == k){
            continue;
          }
          Point p3 = this.ps.get(k);
          float x,y;
          x = p3.pos.x;
          y = p3.pos.y;
          // linear eq: (y2-y1)*x + (x1-x2)*y - x1y2 + x2y1
          if(((y2-y1)*x + (x1-x2)*y - x1*y2 + x2*y1) > 0){
            allNeg = false;
            if(!allPos){
              break;
            }
          } else if(((y2-y1)*x + (x1-x2)*y - x1*y2 + x2*y1) < 0){
            allPos = false;
            if(!allNeg){
              break;
            }
          } else {
            // segaris, ambil 2 titik terjauh
            // karena titik yang diambil random, maka tidak perlu diimplementasikan
          }
        }
        if(allPos || allNeg){
          p1.isHull = true;
          p2.isHull = true;
          this.hull.add(new PVector(i, j));
        }
      }
    }
  }
  
  void addPoint(int n){
    for(int i = 0; i < n; ++i){
      this.ps.add(new Point());
    }
  }
  
  void removePoint(int n){
    for(int i = 0; i < n; ++i){
      this.ps.remove(this.ps.size()-1);
    }
  }
  
  boolean isDraggingPoint(){
    for(Point p: this.ps){
      if(p.isDragged){
        return true;
      }
    }
    return false;
  }
}
