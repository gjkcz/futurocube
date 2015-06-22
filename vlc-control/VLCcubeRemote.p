#include <futurocube>

new motion
new i
new palette[]=[cBLUE,cRED,cORANGE,cMAGENTA,cPURPLE]

main()
{
  RegAllSideTaps()          
  SetIntensity(256)
  PaletteFromArray(palette)
  i=1
  SetColor(i)
  DrawPoint(30)
  DrawPoint(31)
  DrawPoint(32)
  DrawPoint(45)
  DrawPoint(48)
  DrawPoint(49)
  DrawPoint(51)
  DrawPoint(50)
  DrawPoint(46)
  DrawPoint(52)
  DrawPoint(28)
  DrawPoint(21)
  DrawPoint(22)
  DrawPoint(23)
  DrawPoint(34)
  PrintCanvas()


      
  for (;;)
  {
    motion=Motion()
    if (motion)
    {
        if (eTapSide()==2)
        {        //vol-
            printf("vol-\r\n")
            Vibrate(200)
            AckMotion();
        }
        if (eTapSide()==3)
        {          //vol+
            printf("vol+\r\n")
            Vibrate(200)
            AckMotion();
        }
        if (eTapSide()==5)
        {          //play/pause
            printf("pause\r\n")
            Vibrate(200)
            AckMotion();
        }
    }
 }
 }
