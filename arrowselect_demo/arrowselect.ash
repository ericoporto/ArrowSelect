//Arrow Select Module Header
#define MAX_HOTSPOTS_PER_ROOM 49
#define MAX_LABELS 70

enum InteractiveType{
  eInteractiveTypeNothing = eLocationNothing,   
  eInteractiveTypeObject = eLocationObject, 
  eInteractiveTypeCharacter = eLocationCharacter, 
  eInteractiveTypeHotspot = eLocationHotspot,   
  eInteractiveTypeGUIControl,     
  eInteractiveTypeGUI,    
};

managed struct Triangle{
  int a_x;
  int a_y;
  int b_x;
  int b_y;
  int c_x;
  int c_y;
};

managed struct Interactive{
  int x;
  int y;
  int ID;
  InteractiveType type;
};

struct ArrowSelect
{
  import static Triangle* triangleFromOriginAngleAndDirection(Point* origin, int direction, int spreadAngle=90);
  import static int distanceInteractivePoint(Interactive* s, Point* a);
  import static Interactive* closestValidInteractivePoint(Interactive* Interactives[], Point* a);
  import static Interactive*[] getInteractives();
  import static bool isInteractiveInsideTriangle(Interactive* p, Point* a, Point* b, Point* c);
  import static Interactive*[] whichInteractivesInTriangle(Interactive* Interactives[], Point* a, Point* b, Point* c);
  
  import static bool moveCursorDirection(CharacterDirection dir);
  
  import static bool areKeyboardArrowsEnable();
  import static bool enableKeyboadArrows(bool isKeyboardArrowsEnabled = 1);
};
