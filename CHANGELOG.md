# UI-Components-Library Changelog

----------

## [0.3.2.1] --- 30th December 2020 --- **_Minor Fixes_**

### CHANGED

* _Organized_ files.

## [0.3.2.0] --- 27th December 2020 --- **_Initial Release_**

* _Released_ the mod on the steam-workshop.

## [0.3.0.0] --- 17th December 2020 --- **_Casual Rewrite of the entire code_**

### CHANGED

* Casual Rewrite of the entire code.
* _Renamed_ `S7_UCL_Auxiliary.lua` to `Auxiliary.lua`.

### REMOVED

* _Dropped_ LikedLists. lol

## [0.3.0.0] --- 15th December 2020 --- **_LinkedLists_**

### NEW

* _Created_ `S7_LinkedList.lua` for doubly linked-list functionality. -- Time to revamp journal again.

## [0.3.0.0] --- 12th December 2020 --- **_Unload Journal_**

### NEW

* _Created_ `UnloadJournal`. <-- Removes all entries from the journal.

## [0.3.0.0] --- 7th December 2020 --- 📖**_Remastered Journal_**📖

### NEW

* _Added_ *SubComponent* option to toggle `ToggleEditButton_mc` Visibility.
* _Added_ *SubComponent* option to toggle `CloseButton_mc` Visibility.
* _Sync_ `JournalData` when text-updates.

### CHANGED

* _Recreated_ `Journal.lua` from the ground-up.

## [0.2.7.0] -- 27th November 2020 --- **_Journal Improvements_**

### CHANGED

* All journal text-fields now support `htmlText`. <-- haven't tested extensively.

### FIXED

* _Fixed_ `Listener` duplication bug.
## [0.2.7.0] --- 24th November 2020 --- **_Added Pyramid_**

### NEW

* _Added_ `pyramid.swf` and `pyramid.fla`.
* _Created_ a rudimentary `autoResize` for msgBox. Will improve as I add more popup-types.

### CHANGED

* `editableElement` supports `htmlText` now.
* _Refactored_ `Journal.lua`.

### FIXED

* Buttons now throw unqiue `ExternalInterfaceCalls`. `Listeners` should be registered by client mod. `S7_msgBoxBtnClick::[ID]`
* _Fixed_ incorrect position on intial msgBox creation. Called twice now for good measure.

### REMOVED

* `OpenMessageBox` call removed. Redundant as the standard msgBox build does the same thing but better.

## [0.2.6.0] --- 22nd November 2020 --- **_Return to msgBox_**

### CHANGED

* _Renamed_ `FunctionMapper` to `SpecsHandler`. More appropriate imo.
* _Remastered_ `msgBox` positioning. <-- This took me waaayyyy longer than I'd care to admit.
* Completely _Decoupled_ my msgBox from the Vanilla msgBox. Gives me (much needed) freedom.
* _Renamed_ `ActiveUI` to `UILibrary` to represent that its a global table of UI data.
* Major _Refactor_ of the `MsgBox` data table. `Journal` soon to follow.

### REMOVED

* _Commented_ out `PathOverrides`. Keeps UI elements standalone and preserves vanilla UI settings.

## [0.2.5.0] --- 20th November 2020 --- **_🎉🎉 Working Journal API 🎉🎉_**

### NEW

* Dynamically generate Journal and entries.
* _Created_ Flash Method to `updateCaptions()`
* _Fixed_ Close Button.
* _Improved_ Font Selection.

## [0.2.4.0] --- 18th November 2020 --- **_Reverse-Engineer GMJournal.swf_**

### NEW

* _Deciphered_ GMJournal.swf. - partly. 🤯
* _Adding/Removing_ elements now actually works. 🎉🎉

### CHANGED

* _Moved_ Listeners to a new local function.

## [0.2.3.0] --- 13th November 2020 --- **⭐ OpenMessageBox Reborn ⭐**

### NEW

* _Created_ a `lua` implementation of OpenMessageBox with superior UI elements and no 256 characters crash!!!

## [0.2.2.0] --- 11th November 2020 --- **_Building msgBox using BuildSpecifications_**
### NEW

* Dynamically _generate_ msgBox based on passed parameters.
* _Implemented_ basic repositioning of msgBox subcomponents.
### REMOVED

* _Deleted_ actionProgression and font_en for now. Weren't needed.

## [0.2.1.0] --- 8th November 2020 --- **_Added actionProgression Files and Testing Lua side of things_**

### NEW

* _Added_ `actionProgression` files.
* _Created_ `msgBox.lua` to handle everything msgBox related.
* Lua calls to generate msgBox. -- kinda works. Needs more time.

### CHANGED

* _Updated_ `.gitignore`.

## [0.2.0.0] --- 7th November 2020 --- **_Added GMJournal Files and Python_**

### NEW

* _Added_ `GMJournal` files.
* _Wrote_ python script (`syncSWF.py`) to automatically move `.swf`s to the `Public/ModName/GUI` folder.
* _Created_ a close button for the message-box! - You won't believe how long this took me to implement.

## [0.1.0.0] --- 6th November 2020 --- **_Added msgBox Files_**

### NEW

* _Added_ `msgBox` source files.
* _Created_ `BootstrapClient.lua`, `BootstrapServer.lua` and `S7_UCL_Auxiliary.lua`.

## [0.1.0.0] --- 6th November 2020 --- **_Initialized Script-Extender_**

### NEW

* _Created_ `OsiToolsConfig.json`.

### CHANGED

* _Changed_ project meta-data.

## [0.1.0.0] --- 6th November 2020 --- **_Initial Commit_**

### NEW

* Initial Commit.
