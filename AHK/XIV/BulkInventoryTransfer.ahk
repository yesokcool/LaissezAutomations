; ///////////////////////////////////////////////
; // The randomSleep() calls can be removed at //
; // the user's own risk. ///////////////////////
; ///////////////////////////////////////////////

#NoEnv
#SingleInstance force

retrieveFromRetainerOneLine() {
	Loop 5 {
		Send {Numpad0}
		randomSleep()
		Send {Numpad0}
		randomSleep()
		Send {Numpad0}
		randomSleep()
		Send {Numpad6}
	}
	
	return
}

inventoryToRetainerOneLine() {
	Loop 5 {
		Send {Numpad0}
		randomSleep()
		Send {Numpad6}
		randomSleep()
	}
	Send {Numpad0}
	
	return
}

inventoryToRetainerTwoLines() {
	Loop 4 {
		Send {Numpad0}
		randomSleep()
		Send {Numpad6}
		randomSleep()
	}
	Send {Numpad0}
	randomSleep()
	Send {Numpad2}
	Loop 5 {
		Send {Numpad0}
		randomSleep()
		Send {Numpad4}
		randomSleep()
	}
	
	return
}

F7::
retrieveFromRetainerOneLine()
return

PgUp::
inventoryToRetainerOneLine()
return

PgDn::
inventoryToRetainerTwoLines()
return

Home::Pause,Toggle

End::ExitApp

randomSleep() {
	Random, random, 50, 100
	Sleep %random%
}