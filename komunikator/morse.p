#include <futurocube>
#include <abeceda> //knihovna s polem znaků a funkcí pro jejich vypsání na stěnu

#define I1   0xFF000000 //proměnné pro vykreslení ikony
#define I2   0x00FF0000
#define I3   0x0000AA00

new icon[]=[ICON_MAGIC1,ICON_MAGIC2,2,1,I1,I2,I1,I2,I2,I2,I3,I3,I3,''cge_n_SPACE'',''cge_n_SPACE'',ICON_MAGIC3,''SPACE_ALERT'',3,2,0] //nastavení ikony

new kod=0 //proměnná, do které se ukládají úhozy na kostce (tečky/čárky) - vznikne zde čtyřmístný kód
new ik=0 //pomocná proměnná pro číslování indexů v kódu
new znakNalezen=false
new motion

line() { //vypíše čárku na stěnu 3
	s=3
	DrawPoint(_w(s,1))
	DrawPoint(_w(s,4))
	DrawPoint(_w(s,7))
	PrintCanvas()
}

dot() { //vypíše tečku na stěnu 2
	s=2
	DrawPoint(_w(s,4))
	PrintCanvas()
}

space() { /vypíše mezeru ("_") na stěnu 4
	s=4
	DrawPoint(_w(s,0))
	DrawPoint(_w(s,1))
	DrawPoint(_w(s,2))
	PrintCanvas()
}

Default() { //tímto ohlásí chybu, když nenajde v poli odpovídající kód -> zapípá a vypíše na stěnu 0 červené "x"
	SetRgbColor(200,0,0)
	s=0
	DrawPoint(_w(s,0))
	DrawPoint(_w(s,2))
	DrawPoint(_w(s,4))
	DrawPoint(_w(s,6))
	DrawPoint(_w(s,8))
	PrintCanvas()
	Play "beep"
	SetRgbColor(0,100,200)
}

ctu() { //Toto dělá, pokud je při spojení vyhodnocena jako podřízená kostka.
	new data[50] //vyhradí místo v paměti pro přijatá data
	while(1)
	{
		Sleep(200);
		if (IsRadioMsgReadable())
		{
			printf("data ready\r\n")
			cellset(data,0x00) //?
			if (RadioMsgRead(data)) //Pokud dorazila nějaká data:...
			{
				printf("prisel mi znak: %lu\r\n",data[1]) //napíše do konzole "přišel mi znak"
				vypisZnak(data[1]) //vypíše na stěnu 0 příslušný znak
			}
			else printf("error while reading\r\n") //jinak ohlásí chybu
		}
		if (RadioIsLost()) break;
	}
  
	printf("over\r\n") //pokud ztratí signál, napíše do konzole "over"
    
}

posilam() { //Toto dělá, pokud je vyhodnocena jako nadřízená kostka.
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
			if (eTapSideOK()==1) { //Pokud je zaznamenáno klepnutí na stěnu:...
				if (eTapSide()==1) { //strana 1 = reset (smaže rozepsané písmeno)
					kod=0
					ik=0
				}
				else if (eTapSide()==2) { //strana 2 = tečka
					s=0
					DrawPoint(_w(s,4))
					PrintCanvas() //napíše tečku na stěnu 0
					for(new r=3-ik; r>0; r--) {
						rady=rady*10
					} //vyhodnotí, co má přičíst, aby se číslice uložila na správné místo ve čtyřmístném kódu - index určuje mocnina deseti, kterou přičtu
					kod = kod + rady //zapíše zadanou hodnotu do kódu 
					ik++ //posune index
					Delay(500)
					rady=1
					ClearCanvas()
				}
				else if (eTapSide()==3) { //strana 3 = čárka
					s=0
					DrawPoint(_w(s,3))
					DrawPoint(_w(s,4))
					DrawPoint(_w(s,5))
					PrintCanvas() //napíše čárku na stěnu 0
					for(new r=3-ik; r>0; r--) {
						rady=rady*10
					} //stejný postup jako u tečky
					kod = kod + 2*rady //jen s tím rozdílem, že mocninu deseti vynásobí dvěma, aby se na místo v kódu zapsala 2
					ik++
					Delay(500)
					rady=1
					ClearCanvas()
				}
				else if (eTapSide()==4) { //stěna 4 = mezera =>vyhodnocení zadaného kódu
					s=0
					DrawPoint(_w(s,6))
					DrawPoint(_w(s,7))
					DrawPoint(_w(s,8))
					PrintCanvas() //napíše mezeru na stěnu 0
					Delay(500)
					ClearCanvas()
					for (new j=0; j<sizeof morse; j++) { //porovná kód s polem znaků v morseovce, pomocí indexu najitého prvku vyhledá znak v abededě
						if(morse[j] == kod) {
							znakNalezen=true //znak byl nalezen
							vypisZnak(j) //napíše zadaný znak na stěnu 0
							break;
						}
					}
					if(znakNalezen==false) { //Pokud znak nebyl nalezen:...
						Default() //ohlásí chybu (červené "x" na stěnu 0)
					}
					new prenos[2] = [1, j]; //vytvoří soubor pro odeslání ?
					/*Mám takové tušení, že tady má ještě něco být. Něco, co ty data odešle.*/
					if (RadioMessage(prenos)) printf("sent\r\n") //ohlášení, že prenos byl odeslán
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
	ICON(icon) //zobrazí ikonu
	RadioSetBinary() //?
	RadioInit("TESTGAME");  //okopírováno z examplu, tento řádek údajně nefunguje
	printf("order: %lu\r\n",RadioGetOrder()); //vypíše do konzole instrukci
	printf("session id: %lu\r\n",RadioGetSessionID()); //napíše do konzole ID spojení
	if (RadioGetOrder() == 0) { //když je dominantní kostka, vypíše do konzole "posílám" a spustí funkci posilam()
		printf("posilam")
		posilam()
	}
	else { //když je podřízená kostka, vypíše do konzole "čtu" a spustí funkci ctu()
		printf("ctu")
		ctu()
	}
}