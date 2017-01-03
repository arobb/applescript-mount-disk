#!/usr/bin/env osascript

-- http://hints.macworld.com/article.php?story=20120211184732735

----------------  START OF USER-EDITABLE VARIABLES  ----------------
-- Name of the disk
set diskName to "Promise Pegasus"
----------------  END OF USER-EDITABLE VARIABLES  ----------------

-- Mount
tell application "Finder"
  if not (disk diskName exists) then
    tell current application

      -- Get the diskutil identifier for diskName's volume
      set deviceLine to (do shell script "diskutil list | grep \"" & diskName & "\" | awk '{ print $NF }'")

      -- If we don't see that volume, present a message to the user
      -- if deviceLine = "" then
      --  display dialog "The disk \"" & diskName & "\" cannot be found." buttons {"OK"} default button 1 with title "Error" with icon caution
      -- end if

      -- Perform the mount
      set foundDisks to paragraphs of deviceLine
      repeat with i from 1 to number of items in foundDisks
        set this_item to item i of foundDisks
        if this_item contains "disk" then
          do shell script "diskutil mountDisk /dev/" & this_item
        end if
      end repeat

    end tell
  end if
end tell
