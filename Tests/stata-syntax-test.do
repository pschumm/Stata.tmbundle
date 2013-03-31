// This file contains a list of the language constructs that should be
// recognized within scope source.stata.


// storage.type.macro.stata
loc macname
loca macname
local macname
gl macname
glo macname
glob macname
globa macname
global macname
tempvar macname
tempname macname
tempfile macname

// leading spaces ok, but must come at beginning of line
    loc macname
foo loc macname  // should not be colorized


// compound double quotes and comment blocks should nest
// the command -display- and the number 123 should not be colorized below
display `" `" my string "' "' 123
display /* left-outer comment /* inner comment */ right-outer comment */ 123

mata:
    /* left-outer comment /* inner comment */ right-outer comment */
    strofreal(123) + `" `" my string "' "' + strofreal(456)
end
