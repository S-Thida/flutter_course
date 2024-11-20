
class Window{
  int amount;
  String color;
  Window(this.amount, this.color);
}
class Roof{
  String shape;
  Roof(this.shape);
}
class Door{
  String position;
  Door(this.position);
}
class Chimney{
  bool available;
  Chimney(this.available);
}
class House{
  String address;
  List<Window> windows =[];
  Roof roof;
  Door door;
  Chimney chimney;

House(this.address, this.chimney, this.door, this.windows, this.roof);

void addWindow(Window newWindow){
   this.windows.add(newWindow);
}
void addDoor(Door newDoor){
   this.door=newDoor;
}
void addRoof(Roof newRoof){
   this.roof=newRoof;
}
void addChimney(Chimney newChimney){
   this.chimney=newChimney;
}

}


