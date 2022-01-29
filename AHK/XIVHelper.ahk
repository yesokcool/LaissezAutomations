

; How much time to wait for the retainer to appear and disappear.
global timeToWait := 3000

; Number of retainers you want to use. 
; You can sort your retainers so only the ones you want to
; put on Quick Ventures are at the top of your retainer 
; list, and then put the number of them here.

global numberOfRetainers := 9

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

shortRandomSleep() {
	Random, randomVentShort, 200, 250
	Sleep %randomVentShort%
}

longRandomSleep() {
	Random, randomVentLong, 1000, 1100
	Sleep %randomVentLong%
}

randomTimeToWait() {
	Random, randomVentTime, timeToWait, (timeToWait+100)
	Sleep %randomVentTime%
}













ActivityKick() {
	TrayTip #1, AFK Helper Active
	Loop {
		longRandomSleepKick()
		Send {1}
		longRandomSleepKick()
		Send {2}
		longRandomSleepKick()
		Send {3}
		longRandomSleepKick()
		Send {4}
		longRandomSleepKick()
		Send {XButton1}
		longRandomSleepKick()
		longRandomSleepKick()
		Send {Q}
		longRandomSleepKick()
		Send {E}
		longRandomSleepKick()
		Send {R}
		longRandomSleepKick()
		Send {Z}
		longRandomSleepKick()
		Send {XButton1}
		longRandomSleepKick()
}

	return
}



longRandomSleepKick() {
	Random, randomSleepKick, 1029, 2234
	Sleep %randomSleepKick%
}












global timeToWaitSynth := 41000

synth() {
Loop 10 {
	Send {Numpad0}
	longRandomSleepSynth()
	Send {Numpad0}
	longRandomSleepSynth()
	SendInput {G}
	randomTimeToWaitSynth()
	SendInput {F}
	Sleep 30000
}
return
}

longRandomSleepSynth() {
	Random, randomLongSynth, 1571, 1742
	Sleep %randomLongSynth%
}

randomTimeToWaitSynth() {
	Random, randomTimeSynth, timeToWaitSynth, (timeToWaitSynth+100)
	Sleep %randomTimeSynth%
}








priceChange() {
	InputBox, price, Enter New Price
	i := 0
	Loop {
		if (i = 0) {
			Send {Numpad0}
		}
		else {
			Send {Numpad2}
		}
		randomSleepPrice()
		Send {Numpad0}
		randomSleepPrice()
		Send {Numpad0}
		randomSleepPrice()
		Send {Numpad0}
		if (i = 0) {
			Send {Numpad0}
		}
		else {
			Send {Numpad2}
		}
		randomSleepPrice()
		Send {Enter}
		randomSleepPrice()
		Send {Enter}
		randomSleepPrice()
		Send %price%
		randomSleepPrice()
		Send {Enter}
		randomSleepPrice()
		Send {Numpad2}
		randomSleepPrice()
		Send {Numpad2}
		randomSleepPrice()
		Send {Numpad0}
		i++
	}
	return
}

randomSleepPrice() {
	Random, randomPrice, 183, 269
	Sleep %randomPrice%
}







^+!F8::
quickVentures()
return

^+!F5::
ActivityKick()
return

^+!F6::
priceChange()
return

^+!F7::
synth()
return

End::Reload
^+!End::ExitApp




