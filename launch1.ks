clearscreen.
wait until ship:unpacked.
//from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} do {
//	print countdown.
//	wait 1.
//}
set throttle to 1.
set steering to heading(90,90).

//stage.
//print stage:liquidfuel.
when stage:liquidfuel = 0 then {
	stage.
//	print "Staged.".
	preserve.
}

when ship:apoapsis > 100000 then {
//	print "Apoapsis".
	set throttle to 0.
	unlock steering.
}

from {local threshold is 2500. local pitch is 90.} until threshold >= 50000 step {set threshold to threshold + 4750. set pitch to pitch - 10.} do {
	wait until ship:altitude >= threshold.
	set steering to heading(90,pitch).
	print "Pitch: " + pitch.
}