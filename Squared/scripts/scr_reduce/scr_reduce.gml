/// @function scr_reduce(value)
/// @description Returns the value, but reduced so it is closer to 0
/// @argument value the value to reduce

return max(abs(argument0)-1,0)*sign(argument0);
