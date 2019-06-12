MODULE MainModule
    VAR signalgi JobSelectNumber;
    VAR speeddata ReorientSpeed:=[100,20,0,0];
    VAR speeddata EngravingSpeed:=[50,10,0,0];
    CONST robtarget Home_Pos:=[[96.91,0.72,443.16],[0.00916771,-0.68257,-0.730762,-0.00114657],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR signaldi ClearToEntr;
    CONST robtarget PouncePickDropPos:=[[380.14,392.74,85.86],[0.0218601,-0.648454,0.760179,-0.0340209],[0,-1,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR signalao CycleComp;
    VAR num CycComp:=0;
    CONST robtarget MaintenancePos:=[[96.14,71.62,514.79],[0.0333708,-0.0176185,-0.708688,-0.704512],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PounceEngraverPos:=[[308.18,-238.28,266.97],[0.0021322,-0.614952,-0.788562,-0.000430096],[-1,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR robtarget EngraverPos:=[[229.54,-321.89,489.37],[0.569032,0.590965,-0.420446,0.387541],[-1,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PickDropPos:=[[393.92,478.98,85.19],[0.0218783,-0.648449,0.760183,-0.0340105],[0,-1,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget XrayPos:=[[439.24,70.93,277.88],[7.23526E-05,0.00389536,-0.999906,0.0131518],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PounceXrayPos:=[[377.22,76.20,278.84],[0.00401271,-0.0098676,0.999943,-0.00104897],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZMaintenancePos:=[[-0.210032,-50.3001,53.5648,89.6221,91.481,0.86268],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget WZMaintenancePosDelta:=[[2,2,2,2,2,2],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget CameraPos:=[[412.82,74.68,126.97],[0.0485981,-0.682868,0.0239708,-0.728529],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PounceCameraPos:=[[412.82,74.68,213.71],[0.0408324,-0.708947,0.0307577,-0.703407],[0,0,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !PERS tooldata tool2:=[TRUE,[[0,0,114],[0,-0.7071068,0,0.7071068]],[0.5,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata NoDiamondPresent:=[TRUE,[[0.3937,-0.08255,112.181],[0,-0.707107,0,0.707107]],[0.5,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata EngravingTCP:=[TRUE,[[0.3937,-0.08255,116.279],[0,-0.707107,0,0.707107]],[0.5,[0,0,1],[1,0,0,0],0,0,0]];
    !PERS tooldata RepositionedTool:=[TRUE,[[-122.781,0,9.49],[0.0413195,-0.153671,-0.969241,0.18775]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata DiamondPresent:=[TRUE,[[0.3937,-0.08255,120.308],[0,-0.707107,0,0.707107]],[0.5,[0,0,1],[1,0,0,0],0,0,0]];
    VAR num TCPZOffset:=0;
    CONST robtarget p10:=[[480.27,57.43,299.14],[0.668968,-0.240676,0.654747,-0.256638],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget EngraveDropTransfer:=[[377.22,76.20,278.85],[0.00403293,-0.00986535,0.999943,-0.00105653],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget probetest:=[[172.57,28.89,54.81],[2.71505E-06,-0.911021,-0.412361,1.54279E-05],[0,0,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget probetest10robtarget:=[[172.569,28.8903,58.4417],[3.81371E-06,-0.91102,-0.412361,1.94685E-05],[0,0,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget probetest10:=[[172.57,28.89,67.05],[2.91144E-06,-0.911021,-0.412361,1.58075E-05],[0,0,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST speeddata micron10:=[0.1,500,5000,1000];
    VAR num diamSize:=0;
    CONST robtarget probetest20:=[[183.24,20.20,119.69],[0.0519805,-0.897877,-0.410539,-0.150238],[0,-1,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget probetest30:=[[359.93,37.00,345.64],[0.214861,0.647691,0.293166,0.669615],[0,-1,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num RotZOffset:=0;
    VAR num RotYOffset:=0;
    VAR num RotXOffset:=0;
    CONST robtarget PounceXrayReposition:=[[377.22,76.20,278.84],[0.00401531,-0.00986731,0.999943,-0.00104829],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget XrayReposition:=[[439.24,70.93,277.88],[7.23526E-05,0.00389536,-0.999906,0.0131518],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR robtarget ReposRobTargetForTool1:=[[0,0,0],[0.00260983,-0.910437,-0.411961,0.0372329],[0,0,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !TASK PERS tooldata tool1:=[TRUE,[[0,0,0],[1,0,0,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    CONST robtarget PounceTouchMeasurement:=[[231.42,155.41,178.58],[0.479139,0.526833,-0.47233,0.5194],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget TouchMeasurement:=[[233.53,154.35,60.64],[0.479168,0.526823,-0.472355,0.519361],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PouncePickDropPos10:=[[406.66,78.83,278.12],[0.00402834,0.0503304,-0.998722,-0.00211837],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget EngraveDropTransfer10:=[[406.66,78.83,278.12],[0.00402834,0.0503304,-0.998722,-0.00211837],[0,-1,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS wobjdata wobjMeasurepos:=[FALSE,TRUE,"",[[439.255,70.939,277.866],[0.00138891,-0.00397561,0.99999,0.00178245]],[[0,0,0],[1,0,0,0]]];
    TASK PERS wobjdata wobjEngravepos:=[FALSE,TRUE,"",[[301.311,-332.453,290.406],[0.0031661,0.703122,0.711043,0.00516784]],[[0,0,0],[1,0,0,0]]];

    CONST robtarget XrayPos10:=[[0.00,0.00,0.00],[1,0,0,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR robtarget ReposRobTargetForTool2:=[[0,0,0],[0.00260983,-0.910437,-0.411961,0.0372329],[0,0,-3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PounceTouchMeasurement10:=[[231.93,156.45,79.01],[0.479134,0.526845,-0.472328,0.519395],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget ptest:=[[281.79,-280.74,198.25],[0.00380773,-0.72444,-0.689327,0.000838936],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget testingpos:=[[219.57,-194.53,90.94],[0.014381,-0.710716,-0.00632764,-0.703304],[-1,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget testingpos1:=[[219.58,-194.53,91.20],[0.637906,-0.313554,-0.625861,-0.321024],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget testingpos11:=[[429.68,79.23,279.60],[0.00404177,-0.00991159,0.999942,-0.00103396],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget testingpos21:=[[296.18,-273.72,181.51],[0.0035564,0.699444,0.714675,0.0020975],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PouncePickDropPos20:=[[371.93,45.09,326.84],[0.355792,0.29229,-0.66145,0.591999],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PrePouncePickDropPos:=[[307.28,244.95,203.00],[0.188393,-0.667118,0.62305,-0.362313],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PounceELC:=[[-20.44,429.25,233.72],[0.190078,-0.693486,0.66079,-0.215184],[1,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget MeasureWobjX1:=[[439.24,70.94,277.87],[0.000102915,0.00391421,-0.999906,0.0131551],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget MeasureWobjX2:=[[347.29,70.21,277.61],[0.000117399,0.0039003,-0.999905,0.0131858],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget MeasureWobjY1:=[[437.92,238.81,278.47],[0.000129338,0.00391834,-0.999905,0.0132111],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget EngraverWobjX1:=[[301.32,-331.35,290.41],[0.032471,0.711579,0.701061,0.0333788],[-1,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget EngraverWobjX2:=[[298.69,-95.28,291.06],[0.0322818,0.711591,0.701083,0.0328303],[0,1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget EngraverWobjY1:=[[453.51,-328.75,292.20],[0.0323274,0.711565,0.701081,0.0333807],[-1,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS tooldata testtoolnodiamnd:=[TRUE,[[0,0,112.25],[0,-0.707107,0,0.707107]],[0.5,[0,0,1],[1,0,0,0],0,0,0]];
    CONST robtarget MeasureWobjX11:=[[437.92,238.81,278.47],[0.000129338,0.00391834,-0.999905,0.0132111],[0,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        !the system starts by running in the main routine.
        !when in this routine it starts by running ResetIO that sets
        !various Input and Output signals back to their "Homed" state.

        ResetIO;

        !After running ResetIO on first start up the system falls into
        !a job selection loop that checks what the current job number is
        !for the robot to run. When the robot receives its job number
        !the program pointer breaks out of the loop and begins executing
        !the correct job number. 
        loop_start:
        IF Job_Selection=10 THEN
            Cycle;
        ELSEIF Job_Selection=40 THEN
            AutoHome;
            !ELSEIF Job_Selection=30 THEN
            !    Maintenance;
        ELSEIF Job_Selection=100 THEN
            Reposition;
            SetDO Cycle_Complete,0;
            GOTO loop_start;
        ENDIF
    ENDPROC


    PROC Maintenance()
        !If the robot is at a position that it can safely
        !navigate to maintenance position it will do so
        RetryMaint:
        IF AtHomePos=1 THEN
            MoveJ MaintenancePos,v100,fine,tool0;
            WaitDI ReturnFromMaintPos,1;
            MoveJ Home_Pos,v100,fine,tool0;
        ELSE
            GOTO RetryMaint;
        ENDIF
    ENDPROC

    PROC Cycle()

        !checking that if the robot is at home, if it is it 
        !continues with the rest of the program, if not it tries
        !to go home by running the Home routine
        IF AtPickDropPos=0 THEN
            AutoHome;
            MoveJ PrePouncePickDropPos,v100,z100,NoDiamondPresent;
            MoveJ PouncePickDropPos,v100,fine,NoDiamondPresent;
            MoveL PickDropPos,v100,fine,NoDiamondPresent;
        ELSE
            !the robot is currently at the pick location and is waiting
            !for the operator to press cycle start and begin the cycle
            WaitDI ReturnFromPickDropPos,1;
            !robot will return from the pounce position and move to the
            !diamond measurement position where it will wait until it is
            !give the OK to proceed from the PLC software
            MoveL PouncePickDropPos,v100,z50,NoDiamondPresent;
            Touchprobe;
            !The offset or diamond size is sent from the software and
            !changes the values of the "DiamondPresent" Tool data to 
            !account for the additional length of the diamond
            TCPZOffset:=TCPOffset/1000;
            DiamondPresent.tframe.trans.z:=112.25+TCPZOffset;
            EngravingTCP.tframe.trans.z:=(112.25+(TCPZOffset/2));
            !Moving from the measurement station and proceeds to the
            !Xray inspection station so that the system can begin the
            !laue procress
            MoveJ PounceXrayPos,ReorientSpeed,z50,DiamondPresent;
            MoveL XrayPos,v100,fine,DiamondPresent;
            waitTime(3);
            SetDO AtXrayPos,1;
            !The Laue software will signal "GoReposition" which tells
            !the robot to begin the "Reposition" routine and reorient
            !to the new position
            WaitDI GoReposition,1;
            SetDO AtXrayPos,0;
            Loop2:
            Reposition;
            loop3:
            !this gives the operator a few options, they can set the 
            !robot "GoReposition" and the robot will loop back above
            !and begin a the reposition process again. Also they can send
            !"ConfirmedRepos" and the system will proceed to the next station
            !depending on the value of "EngraveThisPart"
            IF ConfirmedRepos=1 THEN
                GOTO Break1;
            ELSEIF GoReposition=1 THEN
                GOTO Loop2;
            ELSEIF ReturnFromXrayToDropNoEngrave=1 THEN
                GOTO NoEngraveJump;
            Else
                GOTO loop3;
            ENDIF
            Break1:
            SetDO AtRepos,0;
!removed to change june 06 MSH IF ReturnFromXrayToDropNoEngrave=1 THEN
            !                GOTO NoEngraveJump;
            !            ELSE
            !                GOTO EngraveJump;
            !            ENDIF
            EngraveJump:
            !The movements from the xray position to where the robot 
            !needs to be so that it can start the engraving process
            !The calling of the engraving routine
            NewEngraveRoutine;
            MoveJ PounceEngraverPos,ReorientSpeed,z50,DiamondPresent;
            !WaitDI ReturnFromEngravePos,1;
            !Proceeding from the engraving position to the drop position
            !where the robot will stay unless a cycle stop is called which will
            !signal the robot to park itself at home
            MoveJ EngraveDropTransfer,v100,z50,DiamondPresent;
            NoEngraveJump:
            MoveL PounceXrayPos,v100,z50,DiamondPresent;
            MoveJ PouncePickDropPos,v100,z50,DiamondPresent;
            MoveL PickDropPos,v100,fine,NoDiamondPresent;
            !signaling that that system is no longer in cycle and setting
            !cycle_complete to true so the PLC can do production tracking

            SetDO Cycle_Complete,1;
            WaitTime 1;
            WaitDI SystemCycleComplete,1;
            SetDo EngravingComplete,0;

        ENDIF
    ENDPROC

    PROC ResetIO()
        !This is a routine that cleans up all the I/O at the start
        !of the cycle to account for anything that may have been skipped
        !over and ensure that the system will operate according to the
        !correct I/O logic
        SetDO In_Cycle,0;
        SetDO Cycle_Complete,0;
        SetDO AtRepos,0;
        SetDO AtEngravePos,0;
        SetDO AtProbePos,0;
        SetDO EngravingComplete,0;
        SetDO AtXrayPos,0;



    ENDPROC

    PROC Stop_Home()
        !this routine is called when the system has requested a cycle stop,
        !when the cycle is complete the robot will proceed to park itself 
        !in the home position
        MoveJ PouncePickDropPos,v100,z50,NoDiamondPresent;
        MoveJ EngraveDropTransfer,v100,z50,NoDiamondPresent;
        MoveJ Home_Pos,v100,z50,tool0;
        Stop;
    ENDPROC

    PROC Reposition()
        RepositionRetry:
        !ConfJ\off;
        !This logic is for the repositioning of the robot in front of the
        !xray equipment so that it can be reinspected before proceeding to
        !the engraving process
        SetDO AtRepos,0;
        WaitDI GoReposition,1;
        !We divide the results because we cannot send numbers with decimals 
        !accross the connection, by multiplying first we shift he decimal place
        !and we divide by the complimentary amount to restore the correct 
        !decimal values
        RotXOffset:=RotationAboutX/100;
        RotYOffset:=RotationAboutY/100;
        RotZOffset:=RotationAboutZ/100;
        MoveJ PounceXrayReposition,ReorientSpeed,fine,DiamondPresent;
        MoveJ ApplyRotations(PounceXrayReposition,RotXOffset,RotYOffset,RotZOffset),ReorientSpeed,z0,DiamondPresent;
        MoveJ ApplyRotations(XrayReposition,RotXOffset,RotYOffset,RotZOffset),v100,fine,DiamondPresent;
        EngraverPos:=CRobT(\tool:=DiamondPresent,\WObj:=wobjMeasurepos);
        !        WaitTime(3);
        !        MoveJ ApplyRotations(PounceXrayReposition,RotXOffset,RotYOffset,RotZOffset),ReorientSpeed,z0,DiamondPresent;
        SetDO AtRepos,1;
    ENDPROC

    FUNC robtarget ApplyRotations(robtarget tar,num x,num y,num z)
        !VAR orient KappaRot;
        ! Quaternion defining rotation around Y axis
        !VAR orient GammaRot;
        ! Quaterion defining rotation around -Z axis 
        !VAR orient DeltaRot;

        VAR robtarget ret;
        !  Quaternion we will use to combine those rotations in the order we choose.
        VAR orient comb;

        VAR orient CoordChange;
        VAR orient RevCoordChange;
        VAR orient TotalRot;

        !! Copy the Target Parameter to get position and wrist configuration        
        ret:=tar;

        !! Create individual quaternions, that represent a single rotation about an axis using the given parameters
        CoordChange:=OrientZYX(0,0,90);
        TotalRot:=OrientZYX(-x,-y,0);
        RevCoordChange:=OrientZYX(0,0,-90);
        !!GammaRot:=OrientZYX(0,x,0);
        !!DeltaRot:=OrientZYX(-y,0,0);
        !KappaRot:=OrientZYX(0,0,z);

        !  Multiply these quaterions together in the order we desire to form a final quaterion that is a combination of our built transformations.
        !comb:=KappaRot*DeltaRot*GammaRot;
        comb:=CoordChange*TotalRot*RevCoordChange;

        ! Apply our new rotation to the previous one,  transforming it by the given values
        ret.rot:=tar.rot*comb;
        RETURN ret;

    ENDFUNC

    PROC NewEngraveRoutine()
        !this is a test for the new engraving routine that incorporates the phi table
        !the robot moves to the position, says it's in position and waits for signal
        !to return from this position. when signal return is high, complete is true, and
        !the robot leaves the engraver.

        ConfL\Off;
        MoveL PounceXrayPos,ReorientSpeed,fine,DiamondPresent;
        MoveJ PounceEngraverPos,ReorientSpeed,Fine,DiamondPresent;
        wobjEngravepos.oframe:=wobjMeasurepos.oframe;
        MoveJ EngraverPos,v100,fine,EngravingTCP\WObj:=wobjEngravepos;
        SetDO AtEngravePos,1;
        WaitDI ReturnFromEngravePos,1;
        SetDO AtEngravePos,0;
        SetDO EngravingComplete,1;
        MoveJ PounceEngraverPos,V100,Fine,DiamondPresent;
        ConfL\on;
        WaitTime 0.5;

    ENDPROC

    PROC Engrave()

        !        ConfL\off;
        !        MoveL PounceXrayPos,V100,fine,DiamondPresent;
        !        MoveJ PounceEngraverPos,V100,Fine,DiamondPresent;
        !        wobjEngravepos.oframe:=wobjMeasurepos.oframe;
        !        MoveJ EngraverPos,v100,fine,DiamondPresent,\WObj:=wobjEngravepos;
        !        SetDO AtEngravePos,1;
        !        WaitDI EngraveComplete,1;
        !        SetDO AtEngravePos,0;
        !        ConfL\on;
        !        WaitTime 1;
        EngravingSpeed.v_ori:=10;
        ConfL\off;
        MoveL PounceXrayPos,ReorientSpeed,fine,DiamondPresent;
        MoveJ PounceEngraverPos,ReorientSpeed,Fine,DiamondPresent;
        wobjEngravepos.oframe:=wobjMeasurepos.oframe;
        !wobjEngravepos.oframe.rot:=wobjEngravepos.oframe.rot*Orientzyx(0,0,-45);
        MoveJ EngraverPos,v100,fine,NoDiamondPresent\WObj:=wobjEngravepos;
        SetDO AtEngravePos,1;
        waitTime(3);
        FOR i FROM 0 TO 180 DO
            wobjEngravepos.oframe.rot:=wobjEngravepos.oframe.rot*OrientZYX(0,0,1);
            MoveL EngraverPos,EngravingSpeed,z0,EngravingTCP\WObj:=wobjEngravepos;
        ENDFOR
        FOR i FROM 0 TO 180 DO
            wobjEngravepos.oframe.rot:=wobjEngravepos.oframe.rot*OrientZYX(0,0,-1);
            MoveL EngraverPos,EngravingSpeed,z0,EngravingTCP\WObj:=wobjEngravepos;
        ENDFOR
        SetDO AtEngravePos,0;
        MoveJ PounceEngraverPos,V100,Fine,DiamondPresent;
        SetDO EngravingComplete,1;
        !WaitDI EngraveComplete,1;

        ConfL\on;
        WaitTime 1;

    ENDPROC

    PROC HomePosition()
        !this is the at home parked position of the robot
        MoveJ Home_Pos,v100,fine,tool0;
    ENDPROC

    PROC Touchprobe()
        MoveJ PouncePickDropPos,v100,z50,NoDiamondPresent;
        MoveJ PounceTouchMeasurement,v100,z50,NoDiamondPresent;
        MoveL PounceTouchMeasurement10,v100,z50,NoDiamondPresent;
        MoveL TouchMeasurement,v50,fine,NoDiamondPresent;
        SetDO AtProbePos,1;
        WaitDI ReturnFromProbePos,1;
        SetDO AtProbePos,0;
        MoveL PounceTouchMeasurement10,v100,z50,DiamondPresent;
        MoveJ PounceTouchMeasurement,v100,z50,DiamondPresent;
    ENDPROC

    PROC AutoHome()
        !This routine checks where the robot is, and executes a homing routine
        !based on where the robot is and safely navigates home
        Tpwrite("IN AutoHome Function");
        IF InPickArea=1 THEN
            MoveJ PouncePickDropPos,v100,fine,NoDiamondPresent;
            MoveJ EngraveDropTransfer,v100,z50,noDiamondPresent;
            MoveJ Home_Pos,v100,z50,tool0;
            stop;
        ELSEIF InXrayArea=1 THEN
            MoveJ PounceXrayPos,v100,z50,noDiamondPresent;
            MoveJ EngraveDropTransfer,v100,z50,noDiamondPresent;
            MoveJ Home_Pos,v100,z50,tool0;
            stop;
        ELSEIF InEngraveArea=1 THEN
            MoveJ PounceEngraverPos,v100,z50,noDiamondPresent;
            MoveJ EngraveDropTransfer,v100,z50,noDiamondPresent;
            MoveJ Home_Pos,v100,z50,tool0;
            stop;
        ELSE
            MoveJ Home_Pos,v100,z50,tool0;
        ENDIF
    ENDPROC

    PROC SignalInCycleOn()
        SetDo In_Cycle,1;
    ENDPROC

    PROC SignalInCycleOff()
        SetDo In_Cycle,0;
    ENDPROC

    PROC tstpts()
        MoveJ MeasureWobjX1,v100,fine,NoDiamondPresent;
        moveJ MeasureWobjX2,v100,fine,NoDiamondPresent;
        MoveJ MeasureWobjY1,v100,fine,NoDiamondPresent;
        moveJ EngraverWobjX1,v100,fine,NoDiamondPresent;
        MoveJ EngraverWobjX2,v100,fine,NoDiamondPresent;
        moveJ EngraverWobjY1,v100,fine,NoDiamondPresent;

    ENDPROC

    PROC RoutineFrank()
        MoveJ [[245.71,-225.70,223.73],[0.00653083,-0.703874,-0.710294,-0.000287668],[-1,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1000,z50,NoDiamondPresent;
    ENDPROC




ENDMODULE