on AG10 {
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