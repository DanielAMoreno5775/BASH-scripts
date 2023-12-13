#reads in text in the following format but only if the target file starts with the word "Degrees" and converts the angle to the range of [0, 360)
#Degrees
#135
#90
#1170

NR == 1 && $0 != "Degrees" { hasDegreesHeaderFlag = 0 }
NR == 1 && $0 == "Degrees" { hasDegreesHeaderFlag = 1 }
NR > 1 && hasDegreesHeaderFlag == 1 {
	originalAngle = $0
	newAngle = originalAngle
	while (newAngle >= 360) {
		newAngle = newAngle - 360
	}
	while (newAngle < 0) {
		newAngle = newAngle + 360
	}
	printf ("%-8d\t%-3d\n", originalAngle, newAngle)
}
