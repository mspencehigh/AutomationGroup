MODULE MainModule
	VAR signalgi JobSelectNumber;
	CONST robtarget Home_Pos:=[[138.20,13.15,464.38],[0.178775,-0.072895,0.981136,0.00993453],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	VAR signaldo Req_To_Ent;
	VAR signaldi ClearToEntr;
	VAR signaldo Zone_Clear;
	VAR num Zn:=0;
	PROC main()
		loop_start:
		IF JobSelectNumber = 0100 THEN
			Cycle;
		ELSEIF JobSelectNumber = 0200 THEN
			Home;
		ELSEIF JobSelectNumber = 0300 THEN
			Maintenance;
		ELSE
			GOTO loop_start;
		ENDIF
	ENDPROC
	PROC Home()
		<SMT>
	ENDPROC
	PROC Maintenance()
		<SMT>
	ENDPROC
	PROC Cycle()
		MoveJ Home_Pos, v1000, fine, tool0;
	ENDPROC
	PROC RequestToEnter(num Zn)
		SetDO Req_To_Ent  (Zn), 1;
		WaitDI ClearToEntr  (Zn), 1;
		SetDO Req_To_Ent  (Zn), 0;
		SetDO Zone_Clear  (Zn), 0;
	ENDPROC
ENDMODULE