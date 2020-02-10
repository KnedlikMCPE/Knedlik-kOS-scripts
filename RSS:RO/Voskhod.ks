//BETA AND NOT TESTED

//Variables start
set pitch to heading(90,85).





//Variables end
print "Program started.".
sas off.
lock steering to up.
stage.
wait 5.
stage.
print "The clock is running.".
wait 3.
lock steering to heading(90,90).
print "Roll program.".
wait until ship:velocity:surface:mag >= 100.

//Pitch program start
lock steering to pitch.
print "Pitch program.".

//Monitoring loop 1 start
when altitude >= 35000 then {
    set pitch to heading(90,15).
}

set oldThrust to availableThrust.

when oldThrust > availableThrust then {
    stage.
    print "Booster sep".
}
when availableThrust = 0 then {
    stage.
    print "Stage sep".
}
//Monitoring loop 1 end

when apoapsis >= 105000 then {
    set pitch to heading(90,10).
}
when apoapsis >= 130000 then {
    set pitch to heading(90,5).
}
//Pitch program end

//Circularization loop
when apoapsis >= 170000 then {
    set pitch to heading(90,0).
    preserve.
}
when apoapsis <= 165000 then {
    set pitch to heading(90,5).
    preserve.
}
when periapsis >= 155000 then {
    lock throttle to 0.
    print "Orbit reached, SECO".
    wait 1.
    stage.
    print "Module sep".
    print apoapsis + "by" + periapsis.
}
set ship:control:pilotmainthrottle to 0.
