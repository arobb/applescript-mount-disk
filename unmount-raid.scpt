#!/usr/bin/env osascript

-- http://hints.macworld.com/article.php?story=20120211184732735

----------------  START OF USER-EDITABLE VARIABLES  ----------------
-- Name of the disk
set diskName to "Promise Pegasus"
----------------  END OF USER-EDITABLE VARIABLES  ----------------

-- Unmount
tell application "Finder"
 if disk diskName exists then
  eject disk diskName
 end if
end tell
