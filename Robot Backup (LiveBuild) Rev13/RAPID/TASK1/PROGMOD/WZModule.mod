
MODULE WZModule
    VAR shapedata WZMntPos;
    VAR shapedata WZPckDropPos;
    VAR shapedata WZEngravPos;
    VAR shapedata WZXryPos;
    VAR wzstationary wzmaint1:=[0];
    VAR shapedata WZHPos;
    VAR shapedata WZPickDropShape;
    VAR pos WZPickDropShapePos:=[353.26,461.15,73.80];
    VAR num WZPickDropSphRad:=150;
    VAR shapedata WZXrayShape;
    VAR pos WZXrayShapePos:=[439.27,70.95,277.95];
    VAR num WZXraySphRad:=150;
    VAR shapedata WZEngraveShape;
    VAR pos WZEngraveShapePos:=[307.95,-328.11,289.81];
    VAR num WZEngraveSphRad:=150;
    CONST jointtarget WZHomePos:=[[-0.176891,-50.2994,53.5662,0.811068,87.414,85.8761],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZXrayPos:=[[18.3482,33.254,-31.0063,8.85449,22.3116,-12.3312],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZPickDropPos:=[[39.255,83.3401,-21.2393,-45.4022,-68.9449,194.87],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZEngravePos:=[[0.0488288,-4.7004,6.22241,0.940596,25.808,-3.73257],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZHomePosDelta:=[[4,4,4,4,4,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZXrayPosDelta:=[[2,2,2,2,2,2],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZEngravePosDelta:=[[2,2,2,2,2,2],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZPickDropPosDelta:=[[2,2,2,2,2,2],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR wzstationary wzhome1:=[0];
    VAR wzstationary wzpickdrop1:=[0];
    VAR wzstationary wzxray1:=[0];
    VAR wzstationary wzengrave1:=[0];
    VAR wzstationary wzPickArea:=[0];
    VAR wzstationary wzXrayArea:=[0];
    VAR wzstationary wzEngraveArea:=[0];
    CONST jointtarget syncCheckPos:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS wobjdata wobj1:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];

    PROC RefPositions()
        WZHomeJointDef\Inside,WZMntPos,WZMaintenancePos,WZMaintenancePosDelta;
        WZDOSet\Stat,wzmaint1\Inside,WZMntPos,AtMaintenancePos,1;
        !home WZ logic
        WZHomeJointDef\Inside,WZHPos,WZHomePos,WZHomePosDelta;
        WZDOSet\Stat,wzhome1\Inside,WZHPos,AtHomePos,1;
        !at pickdrop pos logic
        WZHomeJointDef\Inside,WZPckDropPos,WZPickDropPos,WZPickDropPosDelta;
        WZDOSet\Stat,wzpickdrop1\Inside,WZPckDropPos,AtPickDropPos,1;


        WZsphdef\Inside,WZPickDropShape,WZPickDropShapePos,WZPickDropSphRad;
        WZDOSet\Stat,wzPickArea\Inside,WZPickDropShape,InPickArea,1;
        !above is the shape to monitor if in the picking area  

        WZsphdef\Inside,WZXrayShape,WZXrayShapePos,WZXraySphRad;
        WZDOSet\Stat,wzXrayArea\Inside,WZXrayShape,InXrayArea,1;
        !above is the shape to monitor if in the xraying area

        WZsphdef\Inside,WZEngraveShape,WZEngraveShapePos,WZEngraveSphRad;
        WZDOSet\Stat,wzEngraveArea\Inside,WZEngraveShape,InEngraveArea,1;
        !above is the shape TO monitor IF in the engraving area

        TPErase;
        !providing visual proof the zones were properly loaded in
        TPWrite "Wz Loaded Successfully";
    ENDPROC

    PROC syncCheck()
        MoveAbsJ syncCheckPos\NoEOffs,v1000,z50,tool0;
    ENDPROC

ENDMODULE