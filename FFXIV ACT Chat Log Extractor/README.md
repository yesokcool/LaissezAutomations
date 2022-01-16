# For a more full-fledged ACT Chat Log extractor, check out [ALE](https://github.com/yesokcool/ALE).

# FFXIV ACT Chat Log Extractor

This Ruby script will take an ACT (Advanced Combat Tracker) `.log` file you point it to and will extract from the specific chat channels that players use to communicate. It will ignore everything else such as battle logs. 

The contents will be stored in a new file called `ExtractedLog.txt` in the same directory as the `extractor.rb` file.

To be safe, please keep a backup of your log files.

Usage: `ruby extractor.rb [filepath] [0 or 1] [0 or 1]`

The first argument is the full path to the `.log` file. 

The second argument is to toggle timestamps on (1) and off (0). 

The third argument is to toggle labels for each line on (1) and off (0). If on, each line will have a prepended label such as `(SAY)`, `(SHOUT)`, `(TELL)`, and so on.

Channels included:
* Say
* Shout
* Tell (Sent)
* Tell (Received)
* Party
* Alliance
* Yell
* Custom Emote (Self)
* Custom Emote (Other)
* FC
* All Linkshells
* All Cross-world Linkshells

ACT log files are usually found in `AppData\Roaming\Advanced Combat Tracker\FFXIVLogs`.
