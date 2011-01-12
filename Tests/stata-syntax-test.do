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
