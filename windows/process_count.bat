SET p_count = tasklist | FIND /C %1

IF /I "%p_count%" GEQ "1" ECHO "YEAH"

IF /I "%p_count%" EQU "0" ECHO "NAH"