+================================================
+                                                
+ Swordfish - Vectric machine output configuration file   
+                                                
+ homepage = "%homepage%"
+ version = "%version%"
+================================================
+                                                
+ History                                        
+                                                  
+ Who      When       What                         
+ ======== ========== ===========================
+ LiamB    4/04/2022   Created



POST_NAME = "Swordfish Laser (*.gcode)"
 
FILE_EXTENSION = "gcode"
 
UNITS = "MM"

LASER_SUPPORT = "YES"
 
+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------
 
LINE_ENDING = "[13][10]"
 
+------------------------------------------------
+    Block numbering                             
+------------------------------------------------
 
LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999
 
+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================
 
VAR LINE_NUMBER = [N|A|N|1.0]
VAR POWER = [P|C|S|1.0|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.4]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]




+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================
 
+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------
 
begin HEADER
"; [TP_FILENAME]"
"; Safe Z height: [SAFEZ]"
"; Tools: [TOOLS_USED]"
"; Notes: [FILE_NOTES]"
"; Generated [DATE] [TIME]"
" "
";[TOOLPATHS_OUTPUT]"
" "	
"G90"
"G21"
"M84 S0"
"G0 [SAFEZ]"
"G0 [XH] [YH]"

+---------------------------------------------------
+  Command output after the header to switch spindle on
+---------------------------------------------------
 
+begin SPINDLE_ON

+"M3 [P]"

 
+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------
 
begin RAPID_MOVE
 
"G0 [X] [Y] [Z]"
 
 
+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------
 
begin FIRST_FEED_MOVE
 
"G1 [X] [Y] [Z] [P] [F]"
 
 
+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------
 
begin FEED_MOVE
 
"G1 [X] [Y] [Z] [P]"
 
 
+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"G2 [X] [Y] [I] [J] [F] [P]"
 
 
+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------
 
begin CW_ARC_MOVE
 
"G2 [X] [Y] [I] [J]"
 
 
+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------
 
begin FIRST_CCW_ARC_MOVE
 
"G3 [X] [Y] [I] [J] [F] [P]"
 
 
+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------
 
begin CCW_ARC_MOVE
 
"G3 [X] [Y] [I] [J]"
 
+---------------------------------------------------

+ Commands output when the jet is turned on

+---------------------------------------------------

begin JET_TOOL_ON

"M3 [P]"

+---------------------------------------------------

+ Commands output when the jet is turned off

+---------------------------------------------------

begin JET_TOOL_OFF

"M5"

+---------------------------------------------------

+ Commands output when the jet power is changed

+---------------------------------------------------

begin JET_TOOL_POWER

"M3 [P]"

+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------
 
begin FOOTER
";  COMMAND_COOLANT_OFF"
";  COMMAND_STOP_SPINDLE"
"M400"
"G0 [SAFEZ]"
"M5" 
"G0 [XH] [YH]"
"M117 ;Job End"
