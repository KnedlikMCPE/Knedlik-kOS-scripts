//Launch script for Bossart-Hermes.
set sas to false.
clearscreen.
print "Program start.".

set P to 90.
set H to 90.
// P = Pitch, H = Heading.
set T to 10.

until T = 0 {
    print T.
    wait 1.
    set Tc to T.
    set T to Tc - 1.
}

lock steering to heading(H,P).
lock throttle to 1.
stage.

print "Liftoff!".
wait until SHIP:VELOCITY:SURFACE:MAG >= 100.
print "Pitching program.".

when apoapsis > 50000 then stage.
when ship:altitude > 50000 then stage.
until (P <= 5) or (apoapsis >= 80000) {
    set cP to P.
    set P to cP - 1.
    wait 1.
}
wait until apoapsis > 80000.

lock throttle to 0.

//Credit for node creation goes to luxgladius#9245 from kOS discord.
set ta to time:seconds+eta:apoapsis.
add node(ta,0,0,sqrt(body:mu/(positionat(ship,ta)-body:position):mag)-velocityat(ship,ta):obt:mag).
run NodeExecute.ks.
