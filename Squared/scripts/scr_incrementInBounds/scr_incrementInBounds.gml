/// @function real = scr_incrementInBounds(value, amount, lowerBound, upperBound, wrapAround)
/// @description Increments a value within a certain bound, returns real
/// @argument value value to increment
/// @argument amount amount to increment or decrement by
/// @argument lowerBound lower bound limit
/// @argument upperBound upper bound limit
/// @argument wrapAround whether to wrap around

// set input
var value = argument0;
var amount = argument1;
var lowerBound = argument2;
var upperBound = argument3;
var wrapAround = argument4;

// increment value
value += amount;

// keep value in bounds
if (value > upperBound) {
    if (wrapAround) {
        var extra = value - upperBound - 1;
        value = lowerBound + extra;
        }
    else
        value = upperBound;
    }
else if (value < lowerBound) {
    if (wrapAround) {
        var extra = value - lowerBound + 1;
        value = upperBound + extra;
        }
    else
        value = lowerBound;
    }

// return result
return value;