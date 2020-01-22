import java.util.HashMap;

class ButtonBox{
  HashMap<String, Button> btns;
  ArrayList<String> prio;
  String dir;
  float sizeBox, pad, posx, posy;
  
  ButtonBox(String dir, float posx, float posy, float sizeBox, float tmpPad){
    this.btns = new HashMap<String, Button>();
    this.prio = new ArrayList<String>();
    this.dir = dir;
    this.sizeBox = sizeBox;
    this.pad = tmpPad;
    this.posx = posx;
    this.posy = posy;
  }
  
  void display(){
    for(Button btn: btns.values()){
      btn.display();
    }
  }
  
  void add(String name, String text, int sizeBtn, String desc, float textSz){
    PVector pos;
    if (dir == "horizontal"){
      pos = new PVector(this.posx, this.posy-this.sizeBox-this.pad);
    } else {
      pos = new PVector(this.posx-this.sizeBox-this.pad, this.posy-this.pad);
    }
    if(this.prio.size() != 0){
      pos = this.btns.get(this.prio.get(this.prio.size()-1)).pos;
    }
    if(this.dir == "horizontal"){
      this.btns.put(name, new Button(text, pos.x-sizeBtn-this.pad, pos.y, sizeBtn, this.sizeBox, desc, textSz));
    } else {
      this.btns.put(name, new Button(text, pos.x, pos.y-sizeBtn-this.pad, this.sizeBox, sizeBtn, desc, textSz));
    }
    this.prio.add(name);
  }
}
