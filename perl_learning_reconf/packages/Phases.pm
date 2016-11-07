package Phases;
use 5.012;

BEGIN     { say 'Ran BEGIN' }
UNITCHECK { say 'Ran UNITCHECK' }
CHECK     { say 'Ran CHECK' }
INIT      { say 'Ran INIT' }
END       { say 'Ran END' }

1;
