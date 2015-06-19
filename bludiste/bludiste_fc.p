#include <futurocube>

new map0 [9][9] = [
	[1, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 1, 1, 0, 1, 1, 0, 1],
	[1, 1, 1, 0, 0, 0, 0, 0, 1],
	[1, 2, 1, 0, 1, 1, 1, 0, 1],
	[1, 0, 0, 0, 1, 0, 0, 0, 1],
	[1, 0, 1, 1, 1, 0, 1, 1, 1],
	[1, 0, 0, 0, 1, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1]
]

new map2 [12][12] = [
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
	[1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1],
	[1, 1, 2, 1, 0, 0, 0, 0, 1, 0, 1, 1],
	[1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1],
	[1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1],
	[1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1],
	[1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1],
	[1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1],
	[1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1],
	[1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
]
new map3 [12][12] = [
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1],
	[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
	[1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1],
	[1, 2, 1, 0, 1, 0, 1, 0, 0, 1, 2, 1],
	[1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
]

new map4 [9][9] = [
	[1, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 1, 1, 0, 1, 1, 0, 1],
	[1, 1, 1, 0, 0, 0, 0, 0, 1],
	[1, 0, 1, 0, 1, 1, 1, 0, 1],
	[1, 0, 0, 0, 1, 0, 0, 0, 1],
	[1, 0, 1, 1, 1, 0, 1, 1, 1],
	[1, 0, 0, 2, 1, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1]
]

main()
{
	for (; ;) {

		DrawPoint(4)

		DrawPoint(38)
		DrawPoint(42)

		DrawPoint(20)
		DrawPoint(22)
		DrawPoint(24)

		DrawPoint(27)
		DrawPoint(29)
		DrawPoint(33)
		DrawPoint(35)

		DrawPoint(45)
		DrawPoint(47)
		DrawPoint(49)
		DrawPoint(51)
		DrawPoint(53)

		DrawPoint(9)
		DrawPoint(11)
		DrawPoint(12)
		DrawPoint(14)
		DrawPoint(15)
		DrawPoint(17)

		SetColor(WHITE)
		PrintCanvas()
		ClearCanvas()

		RegAllSideTaps()
		SetIntensity(256)

		new motion = Motion()
		if (motion) {
			if (eTapSide() == 0) {
				hra(map0, 2, 1)
			}

			if (eTapSide() == 2) {
				hra(map2, 10, 1)
			}

			if (eTapSide() == 3) {
				hra(map3, 1, 10)
			}

			if (eTapSide() == 4) {
				hra(map4, 7, 7)
			}
		}
	}
}

vykresleni(map[][], hracY, hracX)
{
	SetColor(RED)
	DrawPoint(40)

	if (map [hracY - 1] [hracX - 1] != 0) {
		SetColor(GREEN)
		if (map [hracY - 1] [hracX - 1] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(36)
	}


	if (map [hracY - 1] [hracX] != 0) {
		SetColor(GREEN)
		if (map [hracY - 1] [hracX] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(37)
	}

	if (map [hracY - 1] [hracX + 1] != 0) {
		SetColor(GREEN)
		if (map [hracY - 1] [hracX + 1] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(38)
	}

	if (map [hracY] [hracX - 1] != 0) {
		SetColor(GREEN)
		if (map [hracY] [hracX - 1] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(39)
	}

	if (map [hracY] [hracX + 1] != 0) {
		SetColor(GREEN)
		if (map [hracY] [hracX + 1] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(41)
	}

	if (map [hracY + 1] [hracX - 1] != 0) {
		SetColor(GREEN)
		if (map [hracY + 1] [hracX - 1] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(42)
	}

	if (map [hracY + 1] [hracX] != 0) {
		SetColor(GREEN)
		if (map [hracY + 1] [hracX] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(43)
	}

	if (map [hracY + 1] [hracX + 1] != 0) {
		SetColor(GREEN)
		if (map [hracY + 1] [hracX + 1] == 2) {
			SetColor(BLUE)
		}
		DrawPoint(44)
	}

	PrintCanvas()
	ClearCanvas()
}

hra(map[][], hracY, hracX)
{
	vykresleni(map, hracY, hracX)
	do {
		RegAllSideTaps()
		SetIntensity(256)

		new motion = Motion()
		if (motion) {
			if (eTapSide() == 1) {
				if (map[hracY - 1][hracX] != 1) {
					hracY = hracY - 1
					vykresleni(map, hracY, hracX)
				}
			}
			if (eTapSide() == 0) {
				if (map[hracY + 1][hracX] != 1) {
					hracY = hracY + 1
					vykresleni(map, hracY, hracX)
				}
			}
			if (eTapSide() == 2) {
				if (map[hracY][hracX - 1] != 1) {
					hracX = hracX - 1
					vykresleni(map, hracY, hracX)
				}
			}
			if (eTapSide() == 3) {
				if (map[hracY][hracX + 1] != 1) {
					hracX = hracX + 1
					vykresleni(map, hracY, hracX)
				}
			}

		}
		AckMotion()
	} while (map[hracY][hracX] != 2)
	Sleep(500)
	ClearCanvas()
	PrintCanvas()
}
