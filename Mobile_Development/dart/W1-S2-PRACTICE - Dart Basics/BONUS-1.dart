enum Direction { north, east, south, west }
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  for (var instruction in instructions.split('')) {
    switch (instruction) {
      case 'R':
        // Turn right
        direction = turnRight(direction);
        break;
      case 'L':
        // Turn left
        direction = turnLeft(direction);
        break;
      case 'A':
        // Advance
        var position = advance(x,y,direction);
        x= position[0];
        y= position[1];
        break;
    }
  }

  // Print the final position and direction
  print("Final position: [$x, $y] ");
  print("Facing: ${direction.toString().split('.').last} ");
}
Direction turnRight(Direction direction){
  switch (direction) {
    case Direction.north:
      return Direction.east;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
    case Direction.east:
      return Direction.south;
      
  }
}
Direction turnLeft(Direction direction){
switch(direction){
  case Direction.north:
    return Direction.west;
  case Direction.south:
    return Direction.east;
  case Direction.west:
    return Direction.south;
  case Direction.east:
    return Direction.north;
}
}
List<int> advance(int x, int y, Direction direction){
  switch (direction) {
    case Direction.north:
    return [x, y+1];
    case Direction.south:
    return[x, y-1];
    case Direction.east:
    return [x+1 ,y ];
    case Direction.west:
    return [x-1 , y];
  }
}


