//velocity
clearscreen.
until 0 {
	local vel is ship:velocity:surface.
	print "shid " + sqrt((vel:x)^2 + (vel:y)^2 + (vel:z)^2).
	print "fard " + vel:mag.
	wait 0.1.
}