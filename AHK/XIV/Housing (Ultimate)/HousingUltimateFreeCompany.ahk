SetWorkingDir %A_ScriptDir%
#NoEnv
#SingleInstance force

SetKeyDelay , 30, 30

Delete::
	CoordMode, Pixel, Screen
	Loop {
		shortRandomSleep()
		Send {F10}
		medRandomSleep()
		Send {Numpad0}
		medRandomSleep()
		ImageSearch, , , 1020, 575, 1090, 625, *20 ForSale.jpg

		if (ErrorLevel > 0) {
			; MsgBox Failure First Try, Trying Again
			; Uncomment the above line if you want to change the sleep 
			; times and see how it affects the failure rate.
			; Here we try again, because failure could be due to latency.
			medRandomSleep()
			ImageSearch, , , 1020, 575, 1090, 625, *20 ForSale.jpg
			if (ErrorLevel > 0) {
				; Try again.
				Sleep 10000
				ImageSearch, , , 1020, 575, 1090, 625, *20 ForSale.jpg
				if (ErrorLevel > 0) {
					; Search failed.
					Send {Esc}
					longRandomSleep()
					MsgBox Not Found or House Sold
					break
				}
			}
		}
		Send {Numpad0}
		shortRandomSleep()
		Send {Numpad2}
		shortRandomSleep()
		Send {Numpad0}
		shortRandomSleep()
		Send {Numpad4}
		shortRandomSleep()
		Send {Numpad0}
		longRandomSleep()
	}
	return

^Home::Pause,Toggle

End::ExitApp

shortRandomSleep() {
	; faster values than 30 seem to "overload" and make polling more delayed
	Random, random, 30, 50
	Sleep %random%
}

medRandomSleep() {
	Random, random, 400, 420
	Sleep %random%
}

longRandomSleep() {
	Random, random, 1000, 1030
	Sleep %random%
}