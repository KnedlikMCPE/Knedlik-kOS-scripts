//Credit for this script goes to Tobias der Luftfahrer#4004 from kOS discord.

//node execution
clearscreen.
SAS off.
print("Orientating").
set nd to nextnode.
lock steering to nd:deltav.
lock throttle to 0.
set kuniverse:timewarp:mode to "rails".
when ship:altitude > 70000 then set kuniverse:timewarp:warp to 3.
//thrust, specific impulse, burn time
set mt to maxthrust.
list engines in englist. //engine list
set ff to 0. //fuel flow
for eng in englist if eng:ignition set ff to ff + eng:maxmassflow. //sum over all engines
set ce to mt/ff. //effective exhaust velocity, = ISP * 9.81m/s²
set tb to mass/ff*(1-constant:e^(-0.5*nd:deltav:mag/ce)). //time to node at burn start

//execution
wait until nd:eta <= (tb + 60).
set kuniverse:timewarp:warp to 0.
wait until nd:eta <= tb.
print("Executing").
lock throttle to 1. //engine ignition
lock tb to nd:deltav:mag*mass/mt. //simplyfied remaining burn time
wait until tb <= 0.1. //final execution
set dir to facing.
lock steering to dir. //don't turn wildly at the last 0.1 seconds.
lock throttle to 0.1. //low thrust
wait tb*6.
lock throttle to 0. //cutoff engine
print("Completed, orbit " + round(apoapsis) + " by " + round(periapsis) + ".").
SAS on.