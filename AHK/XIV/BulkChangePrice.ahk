
#NoEnv
#SingleInstance force

global i := 0

; Sometimes the cursor in the list is saved at 
; the first position if not cleared beforehand. 
;
; Therefore, we make 0 "cursor moves" for the first
; iteration to avoid moving one more than we need.
;
; This works because just doing Confirm without a
; selection will automatically select the first iteration.
;
; From then on, the cursor will start at the first position.

SetKeyDelay , 30, 30

quickVentures() {
	InputBox, price, Enter New Price
	i := 0
	Loop {
		if (i = 0) {
			Send {Numpad0}
		}
		else {
			Send {Numpad2}
		}
		randomSleep()
		Send {Numpad0}
		randomSleep()
		Send {Numpad0}
		randomSleep()
		Send {Numpad0}
		randomSleep()
		Send {Enter}
		randomSleep()
		Send {Enter}
		randomSleep()
		Send %price%
		randomSleep()
		Send {Enter}
		randomSleep()
		Send {Numpad2}
		randomSleep()
		Send {Numpad2}
		randomSleep()
		Send {Numpad0}
		i++
	}
	return
}

^F8::
quickVentures()
return

Home::Pause,Toggle

End::ExitApp

randomSleep() {
	Random, random, 100, 200
	Sleep %random%
}