/// @function scr_sequenceMoreRecent
/// @description returns most recent sequence account for sequence wrap around
/// @argument s1 incoming sequence
/// @argument s2 old sequence
/// @argument smax max

// set input
var s1 = argument0;
var s2 = argument1;
var smax = argument2;

return 
    ( s1 > s2 ) && 
    ( s1 - s2 <= smax/2 ) 
        ||
    ( s2 > s1 ) && 
    ( s2 - s1  > smax/2 );