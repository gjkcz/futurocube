#include <futurocube>
#include <abeceda>

#define I1   0xFF000000
#define I2   0x00FF0000
#define I3   0x0000AA00

new icon[]=[ICON_MAGIC1,ICON_MAGIC2,2,1,I1,I2,I1,I2,I2,I2,I3,I3,I3,''cge_n_SPACE'',''cge_n_SPACE'',ICON_MAGIC3,''SPACE_ALERT'',3,2,0]

new s1=0
new kod=0 //proměnná, do které se ukládají úhozy na kostce (tečky/čárky)
new ik=0 //číslování pro indexy v kódu
new znakNalezen=false
new motion

new morse[23] = [
	1200, //a
	2111, //b
	2121, //c
	2110, //d
	1000, //e
	1121, //f
	2210, //g
	1111, //h
	1100, //i
	1222, //j
	2120, //k
	1211, //l
	2200, //m
	2100, //n
	2220, //o
	1221, //p
	1210, //r
	1110, //s
	2000, //t
	1120, //u
	1112, //v
	2122, //y
	2211 //z
	]

line() {
	s1=3
	DrawPoint(_w(s1,1))
	DrawPoint(_w(s1,4))
	DrawPoint(_w(s1,7))
	PrintCanvas()
}

dot() {
	s1=2
	DrawPoint(_w(s1,4))
	PrintCanvas()
}

space() {
	s1=4
	DrawPoint(_w(s1,0))
	DrawPoint(_w(s1,1))
	DrawPoint(_w(s1,2))
	PrintCanvas()
}

Default() { //tímto ohlásí chybu, když nenajde v poli odpovídající kód
	SetRgbColor(200,0,0)
	DrawPoint(_w(s1,0))
	DrawPoint(_w(s1,2))
	DrawPoint(_w(s1,4))
	DrawPoint(_w(s1,6))
	DrawPoint(_w(s1,8))
	PrintCanvas()
	Play "beep"
	SetRgbColor(0,100,200)
}

ctu() {
	new data[50]
	while(1)
	{
		Sleep(200);
		if (IsRadioMsgReadable())
		{
			printf("data ready\r\n")
			cellset(data,0x00)
			if (RadioMsgRead(data))
			{
				printf("%lu\r\n",data[0])
				vypisZnak(data[0])
			}
			else printf("error while reading\r\n")
		}
	if (RadioIsLost()) break;
	}
  
  printf("over\r\n")
    
}

posilam() {
	new rady=1 //Pomocná proměnná pro vytvoření mocniny 10, kterou potřebuju níže
	SetRgbColor(0,100,200)
	RegAllSideTaps()
	while(1) {
		line()
		dot()
		space() //označí tlačítka
		motion=Motion()
		if (motion) {
			Play("drip")
			if (eTapSideOK()==1) {
				if (eTapSide()==1) { //reset (rozepsané písmeno)
					kod=0
					ik=0
				}
				else if (eTapSide()==2) { //tečka
					s1=0
					DrawPoint(_w(s1,4))
					PrintCanvas() //napíše tečku
					for(new r=3-ik; r>0; r--) {
						rady=rady*10
					}
					kod = kod + rady
					ik++ //zapíše hodnotu do kódu, posune index
					Delay(500)
					rady=1
					ClearCanvas()
				}
				else if (eTapSide()==3) { //čárka
					s1=0
					DrawPoint(_w(s1,3))
					DrawPoint(_w(s1,4))
					DrawPoint(_w(s1,5))
					PrintCanvas() //napíše čárku
					for(new r=3-ik; r>0; r--) {
						rady=rady*10
					}
					kod = kod + 2*rady
					ik++ //stejný postup jako u tečky
					Delay(500)
					rady=1
					ClearCanvas()
				}
				else if (eTapSide()==4) { //mezera
					s1=0
					DrawPoint(_w(s1,6))
					DrawPoint(_w(s1,7))
					DrawPoint(_w(s1,8))
					PrintCanvas() //napíše mezeru
					Delay(500)
					ClearCanvas()
					for (new j=0; j<sizeof morse; j++) { //porovná kód s polem morseovky, pomocí indexu najitého prvku vyhledá znak v abededě
						if(morse[j] == kod) {
							znakNalezen=true
							//if (RadioMessage(j)) printf("sent\r\n")
							//printf("From %lu %lu",RadioGetOrder(), j)
							vypisZnak(j) //napíše zadaný znak
							break;
						}
					}
					if(znakNalezen==false) {
						Default()
					}
					Delay(1000)
					ClearCanvas()
					znakNalezen=false
					kod=0
					ik=0 //vynuluje
				}
			}
			AckMotion()
		}
	}
}

main()
{
	ICON(icon)
	RadioInit("TESTGAME");  //nefunguje
	printf("order: %lu\r\n",RadioGetOrder());
	printf("session id: %lu\r\n",RadioGetSessionID());
	if (RadioGetOrder() == 0) {
		printf("posilam")
		posilam()
	}
	else {
		printf("ctu")
		ctu()
	}
}