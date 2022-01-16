# XIV Scripts

## Instructions for all XIV scripts

- Use these scripts at your own risk.

- ### The sleep times (both the minimum and maximum of the random values) in these scripts may need to be changed depending on the user.
  - Sleep times may not be long enough for some users, most likely due to their latency. 

- ### It is likely you will need to change the hotkeys or key presses for the scripts to hotkeys or key presses that work better for you. 
  - These scripts mostly operate on default NumPad controls.

- ### Every script can be paused and resumed by pressing `CTRL+Home`, and can be terminated by pressing the `End` key.

## QuickVenture

This script goes through your list of retainers and *reassigns* them Quick Ventures. 

- ### **This script is only fully functional if all of your retainers have the Venture Status "Completed."** 
  - Otherwise, there may be unexpected navigation and actions. Use this script at your own risk.

- ### **The script loops endlessly by default**.
  - You can make it stop after a certain number of retainers by setting the variable `numberOfRetainers`. 

- ### **If your retainer takes longer than (timeToWait variable) seconds to appear and disappear, you must change the variable's value or the script will fail.** 

  - You can change the amount of time the script waits for a retainer to summon and disappear by editing the `timeToWait` variable in `QuickVenture.ahk`.
  - The default value of `timeToWait` is ~3000 milliseconds (3 seconds).
  - The inconsistent appearing/disappearing times is most likely due to latency. 

- The default key to start is `F8`. You can change this in `QuickVenture.ahk`.

### **Steps:**
1. Click on the Summoning Bell.
1. Make sure nothing is selected.
1. Run Script.
1. Press `F8` (default key) to start.

## Housing (Ultimate)

- This script automatically selects a house placard and attempts to purchase it for a Free Company.
- The first run will likely fail, which is normal.
  - The script occasionally fails, but will fix itself.

### **Steps:**
1. Click on the placard and press your Focus Target key.
1. Run Script.
1. Press `Del` (default key) to start.
