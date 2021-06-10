#NoEnv
#SingleInstance force

; ///////////////////////////////////////////////
; /// Users should change the variable below ///
; ///////////////////////////////////////////////

; How much time to wait for the retainer to appear and disappear.
global timeToWait := 3000

; ///////////////////////////////////////////////
; ///////////////////////////////////////////////
; ///////////////////////////////////////////////

; Number of retainers you want to use. 
; You can sort your retainers so only the ones you want to
; put on Quick Ventures are at the top of your retainer 
; list, and then put the number of them here.

global numberOfRetainers := 0

global i := 0

; Moves cursor in the retainer menu and makes selections
; to reassign a Quick Exploration venture.
reassignVenture() {
	Loop 5 {
		Send {Numpad2}
		shortRandomSleep()
	}
	Send {Numpad0}
	longRandomSleep()
	Send {Numpad4}
	shortRandomSleep()
	Send {Numpad0}
	longRandomSleep()
	Send {Numpad4}
	shortRandomSleep()
	Send {Numpad0}
	longRandomSleep()
	Send {Numpad0}
	longRandomSleep()
	Send {Numpad8}
	longRandomSleep()
	Send {Numpad0}
	longRandomSleep()
	Send {Numpad0}

	return
}

; Moves cursor down x times.
selectRetainer(x) {
	Loop %x% {
		Send {Numpad2}
		Sleep shortRandomSleep()
	}
	return
}

; Sometimes the cursor in the retainer list is saved at the 
; first position if not cleared beforehand. 
; Therefore, we make 0 "cursor moves" for the first retainer
; to avoid moving one more than we need.
; This works because just doing Confirm without a selection will 
; automatically select the first retainer.
; From then on, the cursor will start at the first position.

quickVentures() {
	i := 0
	if (numberOfRetainers) {
		Loop %numberOfRetainers% {
			if (i = 0) {
				Send {Numpad0}
			}
			longRandomSleep()
			selectRetainer(i)
			Send {Numpad0}
			randomTimeToWait()
			Send {Numpad0}
			longRandomSleep()
			reassignVenture()
			randomTimeToWait()
			i++
		}
	}
	else {
		Loop {
			if (i = 0) {
				Send {Numpad0}
			}
			longRandomSleep()
			selectRetainer(i)
			Send {Numpad0}
			randomTimeToWait()
			Send {Numpad0}
			longRandomSleep()
			reassignVenture()
			randomTimeToWait()
			i++
		}
	}
	return
}

F8::
quickVentures()
return

^Home::Pause,Toggle

End::ExitApp

shortRandomSleep() {
	Random, random, 50, 100
	Sleep %random%
}

longRandomSleep() {
	Random, random, 1000, 1100
	Sleep %random%
}

randomTimeToWait() {
	Random, random, timeToWait, (timeToWait+100)
	Sleep %random%
}