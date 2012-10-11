on run {input, parameters}
        
        tell application "Finder" to try -- get the current selection
                
                set ThePath to the first item of (get selection)
                
                if the last character of (ThePath as text) is not ":" then -- a file
                        
                        set ThePath to the container of ThePath
                        
                end if
                
        on error -- default to the desktop
                
                set ThePath to (get path to desktop folder)
                
        end try
        
        set NewFolderName to text returned of (display dialog "New Folder Name?" default answer "New Folder")
        
        tell application "Finder"
                try
                        set newFolder to make new folder at ThePath with properties {name:NewFolderName}
                        reveal newFolder
                end try
        end tell
        
        
end run
