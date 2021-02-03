set desiredApoapsis to 100000.
set circNode to 0.
set margin to 0.01. //1 = 100%, 0.01 = 1%
set atmoHeight to 70000.

clearscreen.
wait until ship:unpacked.

set throttle to 1.
set steering to heading(90,90).

until ship:apoapsis > desiredApoapsis {
	lock steering to heading(90,90-(90*(ship:apoapsis/desiredApoapsis))).
	if stage:liquidfuel = 0 {stage.}
	wait 0.01.
}

lock steering to heading(90,0).
lock throttle to 0.
wait until ship:altitude > atmoHeight.

set etaApoapsis to ship:orbit:eta:apoapsis.
set TS_etaApoapsis to TimeSpan(0,0,0,0,etaApoapsis).
set dv to 0.
set circNode to node(TS_etaApoapsis,0,0,dv).
add circNode.

from {local deltaDenom is 1.} until circNode:orbit:periapsis >= (desiredApoapsis + (desiredApoapsis * margin)) and circNode:orbit:periapsis <= (desiredApoapsis - (desiredApoapsis * margin)) step {set deltaDenom to deltaDenom + 1.} do {
	set etaApoapsis to ship:orbit:eta:apoapsis.
	set TS_etaApoapsis to TimeSpan(0,0,0,0,etaApoapsis).
	remove circNode.
	set circNode to node(TS_etaApoapsis,0,0,dv).
	add circNode.
	set nodePeriapsis to circNode:orbit:periapsis.
	print "Periapsis: " + nodePeriapsis.
	print nodePeriapsis < desiredApoapsis.
	if nodePeriapsis < desiredApoapsis {
		set dv to dv + 1000/deltaDenom. //if possible, make a variable for the 1000
	} else {
		set dv to dv - 1000/deltaDenom.
	}
}

print "Node Added".



shutdown.