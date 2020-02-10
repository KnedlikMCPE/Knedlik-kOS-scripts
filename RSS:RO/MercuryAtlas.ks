//BETA AND NOT TESTED

//Variables start
set pitch to heading(90,85).





//Variables end
print "Program start".
sas off.
lock throttle to 1.
lock steering to up.
stage.
wait 5.
stage.
print "The clock is running.".
wait 3.
lock steering to heading(90,90).
print "Roll program.".
wait until ship:velocity:surface:mag >= 50.
//Pitch program start
lock steering to pitch.
print "Pitch program.".
wait 5.
until altitude >= 34999 {
    set pitch to pitch - 1.
    wait 5.
}

//Booster sep
when altitude >= 35000 then {
    stage.
    print "Booster sep".
    set pitch to heading(90,15).
}

//Pitch continuation
when apoapsis >= 105000 then {
    set pitch to heading(90,10).
}
when apoapsis >= 130000 then {
    set pitch to heading(90,5).
}

//Circularization loop
when apoapsis >= 160000 then {
    set pitch to heading(90,0).
    preserve.
}
when apoapsis <= 155000 then {
    set pitch to heading(90,5).
    preserve.
}
when periapsis >= 148000 then {
    lock throttle to 0.
    print "Orbit reached, MECO".
    wait 1.
    stage.
    print "Capsule sep".
    print apoapsis + "by" + periapsis.
}
set ship:control:pilotmainthrottle to 0.
