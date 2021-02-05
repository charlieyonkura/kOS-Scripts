set desiredApoapsis to 100000.
set circNode to 0.
set margin to 0.01. //1 = 100%, 0.01 = 1%
set atmoHeight to 70000.

clearscreen.
wait until ship:unpacked.

set throttle to 1.
set steering to heading(90,90).

until ship:orbit:apoapsis > desiredApoapsis {
	lock steering to heading(90,90-(90*(ship:orbit:apoapsis/desiredApoapsis))).
	if stage:liquidfuel = 0 {stage.}
	wait 0.01.
}

lock steering to heading(90,0).
lock throttle to 0.
wait until ship:altitude > atmoHeight.

lock steering to prograde.
wait 5.
until ship:orbit:apoapsis >= desiredApoapsis {
	lock throttle to 0.05.
}

set etaApoapsis to ship:orbit:eta:apoapsis.
set TS_etaApoapsis to TimeSpan(0,0,0,0,etaApoapsis).
set dv to 0.
set circNode to node(TS_etaApoapsis,0,0,dv).

set acceleration to constant:g*(kerbin:mass/(kerbin:radius + ship:orbit:apoapsis)^2).
set orbitPeriod to (sqrt(4*(constant:pi)^2*(kerbin:radius + ship:orbit:apoapsis)) / sqrt(acceleration)).
set dv to (2*constant:pi*(kerbin:radius + ship:orbit:apoapsis) / orbitPeriod) - velocityat(ship,timestamp(time:seconds + ship:orbit:eta:apoapsis)):orbit:mag.
set circNode to node(TS_etaApoapsis,0,0,dv).

add circNode.

lock throttle to 0.
lock steering to circNode:burnvector.
//wait until circNode:eta.





shutdown.