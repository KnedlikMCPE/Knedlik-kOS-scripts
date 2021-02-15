//Launch script for Etoh-Hermes.
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
until P <= 65 {
    set cP to P.
    set P to cP - 0.75.
    wait 1.
}
wait until ship:altitude > 70000.

stage.
print "Retro burn started.".
lock steering to ship:retrograde.
wait 15.
stage.
wait 15.
stage.

wait until ship:altitude < 70000.
brakes on.

wait until ship:altitude < 7000.
stage.

wait until ship:altitude < 4000.
stage.
print "Successful flight!".
