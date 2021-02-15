sas off.
lock steering to ship:retrograde.
wait 15.
stage.
wait 15.
stage.
set kuniverse:timewarp:mode to "rails".
set kuniverse:timewarp:warp to 4.
wait until ship:altitude < 70000.
brakes on.
set kuniverse:timewarp:mode to "physics".
set kuniverse:timewarp:warp to 3.
wait until ship:altitude < 7000.
stage.
wait until ship:altitude < 4000.
stage.
unlock steering.
wait until ship:altitude < 100.
set kuniverse:timewarp:warp to 0.