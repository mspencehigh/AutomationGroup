MODULE Custom_Functions_NoStepin(NOSTEPIN)
       
    FUNC bool TestIfReachable(robtarget TestTarg,PERS tooldata TestTool,PERS wobjdata TestWobj)
        VAR bool trueIfReachable:=FALSE;
        VAR jointtarget jntReach;
        jntReach := CalcJointT(TestTarg,TestTool\WObj:=TestWobj);
        RETURN trueIfReachable;
    ERROR
        IF ERRNO=ERR_ROBLIMIT THEN
            trueIfReachable:=FALSE;
            TRYNEXT;
        ENDIF
    ENDFUNC
ENDMODULE