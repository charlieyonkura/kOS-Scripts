clearscreen.
//from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} do {
//	print countdown.
//	wait 1.
//}
set throttle to 1.
set steering to heading(90,90).

when maxthrust = 0 then {
	stage.
	preserve.
}

from {local threshold is 0. local pitch is 90.} until threshold >= 900 step {set threshold to threshold + 100. set pitch to pitch - 10.} do {
	wait until ship:velocity:surface:mag >= threshold.
	set steering to heading(90,pitch).
	print "Pitch: " + pitch.
}
