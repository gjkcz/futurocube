#include <futurocube>

new s=0 //pomocná proměnná pro určení strany (využívám ve funkci DrawPoint)

new znaky[30][]=[ //Pole znaků: Čísla v závorkách představují body, které se na stěně rozsvítí. (9 nerozsvítí nic, bylo pouze potřeba mít u všech prvků stejný rozsah)
	[1,3,4,5,6,8,9,9], //a=0
	[0,3,4,6,7,9,9,9], //b=1
	[0,1,3,6,7,9,9,9],  //c=2
	[0,1,3,5,6,7,9,9], //d=3
	[0,1,3,4,6,7,9,9], //e=4
	[0,1,3,4,6,9,9,9], //f=5
	[1,3,5,7,9,9,9,9], //g=6
	[0,2,3,4,5,6,8,9], //h=7
	[1,4,7,9,9,9,9,9], //i=8
	[2,3,5,7,9,9,9,9], //j=9
	[0,2,3,4,6,8,9,9], //k=10
	[0,3,6,7,9,9,9,9], //l=11
	[0,1,2,3,4,5,6,8], //m=12
	[0,3,4,5,6,8,9,9], //n=13
	[0,1,2,3,5,6,7,8], //o=14
	[0,1,3,4,6,9,9,9], //p=15
	[0,1,3,4,8,9,9,9], //q=16
	[0,1,3,4,6,8,9,9], //r=17
	[1,2,4,6,7,9,9,9], //s=18
	[0,1,2,4,7,9,9,9], //t=19
	[0,2,3,5,6,7,8,9], //u=20
	[0,2,3,5,7,9,9,9], //v=21
	[0,2,3,4,5,6,7,8], //w=22
	[0,2,4,6,8,9,9,9], //x=23
	[0,2,4,7,9,9,9,9], //y=24
	[0,1,2,4,6,7,8,9], //z=25
	[1,3,4,7,9,9,9,9], //1=26 --- čísla zatím nebyla přidána do seznamu kódů, jejich kód je totiž pětimístný a morse ho neumí zpracovat
	[0,1,4,7,8,9,9,9], //2=27
	[0,1,2,4,5,6,7,8], //3=28
	[0,2,3,4,5,8,9,9] //4=29
]

new morse[26] = [ //pole kódů pro znaky v morseovce: 1=tečka, 2=čárka
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
	2212, //q
	1210, //r
	1110, //s
	2000, //t
	1120, //u
	1112, //v
	1220, //w
	2112, //x
	2122, //y
	2211 //z
	]

vypisZnak(znak) { //vypíše zadaný znak na stěnu s=0
	ClearCanvas()
	s=0
	for (new i=0;i<sizeof znaky[];i++) {
		DrawPoint(_w(s,znaky[znak][i]))
	}
	PrintCanvas()
}
