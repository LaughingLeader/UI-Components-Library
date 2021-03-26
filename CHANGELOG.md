# UI-Components-Library Changelog

---

## [0.4.3.0] --- 26th March 2021 --- **_InputEvents for fun and profit_**

### NEW

- _Created_ `InputEvent.lua` to track **InputEvents**.

## [0.4.2.0] --- 21st March 2021 --- **_Game World Context Menus_**

### NEW

- _Added_ support for game-world context-menus! (with a lot of duct-tape).
- _Created_ `enemyHealthBar.lua` component.
- _Created_ `tooltip.lua` component.
- Context-Menu entries now accept `Resolver Functions` that return dynamically generated values for context-menus during run-time.
- _Created_ `ContextMenu:Add()` to handle table insertion properly. Can handle multiple entries at once.
- _Added_ `TargetType` and `restrictUI` options.
- _Created_ `Any::[Type]` activators for `Item` and `Characters`.
- _Added_ `isUnavailable` option for context-entry.
- _Added_ `range` attribute to context-entry. Option is only available within range.

### CHANGED

- _Refactored_ net-channels as global variables.
- _Extracted_ `ContextMenuResponders` into a separate file.
- _Renamed_ `ContextMenu.Item` to `ContextMenu.Target` as both Items and Characters are now possible.

### FIXED

- _Fixed_ Context-Entry duplication on inheritance bug [#31](https://github.com/HunterGhost27/UI-Components-Library/issues/31)
- _Fixed_ Missing options bug [#36](https://github.com/HunterGhost27/UI-Components-Library/issues/36)

## [0.4.1.3] --- 19th March 2021 --- **_Activator Conflict Resolution_**

### NEW

- _Created_ an ugly, opinionated and unscalable solution to the activator conflict resolution problem (#30).
- _Added_ developer console command to print the state of ContextMenu object for inspection.

### CHANGED

- ContextMenu code _Cleanup_ and _Refactor_.

### REMOVED

- _Removed_ `actions` table from ContextMenu. Was redundant and unneeded. Responding with Net-Listeners offers more flexibility.

## [0.4.1.2] --- 16th March 2021 --- **_Improve Context-Menu_**

### NEW

- _Added_ context-menu support for `containerInventory`, `uiCraft` and `characterSheet`.
- _Added_ `LiveUIReports` and a console command to toggle it.

## [0.4.1.1] --- 15th March 2021 --- **_ItemNetID_**

### CHANGED

- _Added_ `ItemNetID` to ContextMenu payload.

## [0.4.1.0] --- 20th February 2021 --- **_AuxFunctions Init_**

### NEW

- _Initialized_ AuxFunctions.

### REMOVED

- _Removed_ `Pyramid` UI Component.

## [0.4.0.0] --- 4th January 2020 --- **_Markdown_**

### NEW

- _Created_ function to convert _JournalData_ to _Markdown_ and vice-versa.
- `LoadFile` now only parses json if the file-extension is `.json`.

### CHANGED

- `S7_Journal_UI_Hide` listeners now trigger in two parts.
- _Added_ ability to register custom-listeners.

### FIXED

- _Fixed_ `caption` update bug.

### COMMENTS

- Got tired of writing `Changelogs` lol.

## [0.4.0.0] --- 1st January 2020 --- **_ContextMenu_**

### NEW

- _Added_ `contextMenu` Source Files. (No custom swfs, yet)
- _Added_ hooks.
- _Added_ support for callbacks.
- `contextMenu` pings both Server and Client contexts. Mods can respond to them on channel `S7UCL_ContextMenu`.

## [0.3.2.1] --- 30th December 2020 --- **_Minor Fixes_**

### NEW

- Edited _caption_ is saved when the JournalUI closes.

### CHANGED

- _Organized_ files.

## [0.3.2.0] --- 27th December 2020 --- **_Initial Release_**

- _Released_ the mod on the steam-workshop.

## [0.3.0.0] --- 17th December 2020 --- **_Casual Rewrite of the entire code_**

### CHANGED

- Casual Rewrite of the entire code.
- _Renamed_ `S7_UCL_Auxiliary.lua` to `Auxiliary.lua`.

### REMOVED

- _Dropped_ LikedLists. lol

## [0.3.0.0] --- 15th December 2020 --- **_LinkedLists_**

### NEW

- _Created_ `S7_LinkedList.lua` for doubly linked-list functionality. -- Time to revamp journal again.

## [0.3.0.0] --- 12th December 2020 --- **_Unload Journal_**

### NEW

- _Created_ `UnloadJournal`. <-- Removes all entries from the journal.

## [0.3.0.0] --- 7th December 2020 --- 📖**_Remastered Journal_**📖

### NEW

- _Added_ _SubComponent_ option to toggle `ToggleEditButton_mc` Visibility.
- _Added_ _SubComponent_ option to toggle `CloseButton_mc` Visibility.
- _Sync_ `JournalData` when text-updates.

### CHANGED

- _Recreated_ `Journal.lua` from the ground-up.

## [0.2.7.0] -- 27th November 2020 --- **_Journal Improvements_**

### CHANGED

- All journal text-fields now support `htmlText`. <-- haven't tested extensively.

### FIXED

- _Fixed_ `Listener` duplication bug.

## [0.2.7.0] --- 24th November 2020 --- **_Added Pyramid_**

### NEW

- _Added_ `pyramid.swf` and `pyramid.fla`.
- _Created_ a rudimentary `autoResize` for msgBox. Will improve as I add more popup-types.

### CHANGED

- `editableElement` supports `htmlText` now.
- _Refactored_ `Journal.lua`.

### FIXED

- Buttons now throw unique `ExternalInterfaceCalls`. `Listeners` should be registered by client mod. `S7_msgBoxBtnClick::[ID]`
- _Fixed_ incorrect position on intial msgBox creation. Called twice now for good measure.

### REMOVED

- `OpenMessageBox` call removed. Redundant as the standard msgBox build does the same thing but better.

## [0.2.6.0] --- 22nd November 2020 --- **_Return to msgBox_**

### CHANGED

- _Renamed_ `FunctionMapper` to `SpecsHandler`. More appropriate imo.
- _Remastered_ `msgBox` positioning. <-- This took me waaayyyy longer than I'd care to admit.
- Completely _Decoupled_ my msgBox from the Vanilla msgBox. Gives me (much needed) freedom.
- _Renamed_ `ActiveUI` to `UILibrary` to represent that its a global table of UI data.
- Major _Refactor_ of the `MsgBox` data table. `Journal` soon to follow.

### REMOVED

- _Commented_ out `PathOverrides`. Keeps UI elements standalone and preserves vanilla UI settings.

## [0.2.5.0] --- 20th November 2020 --- **_🎉🎉 Working Journal API 🎉🎉_**

### NEW

- Dynamically generate Journal and entries.
- _Created_ Flash Method to `updateCaptions()`
- _Fixed_ Close Button.
- _Improved_ Font Selection.

## [0.2.4.0] --- 18th November 2020 --- **_Reverse-Engineer GMJournal.swf_**

### NEW

- _Deciphered_ GMJournal.swf. - partly. 🤯
- _Adding/Removing_ elements now actually works. 🎉🎉

### CHANGED

- _Moved_ Listeners to a new local function.

## [0.2.3.0] --- 13th November 2020 --- **⭐ OpenMessageBox Reborn ⭐**

### NEW

- _Created_ a `lua` implementation of OpenMessageBox with superior UI elements and no 256 characters crash!!!

## [0.2.2.0] --- 11th November 2020 --- **_Building msgBox using BuildSpecifications_**

### NEW

- Dynamically _generate_ msgBox based on passed parameters.
- _Implemented_ basic repositioning of msgBox subcomponents.

### REMOVED

- _Deleted_ actionProgression and font_en for now. Weren't needed.

## [0.2.1.0] --- 8th November 2020 --- **_Added actionProgression Files and Testing Lua side of things_**

### NEW

- _Added_ `actionProgression` files.
- _Created_ `msgBox.lua` to handle everything msgBox related.
- Lua calls to generate msgBox. -- kinda works. Needs more time.

### CHANGED

- _Updated_ `.gitignore`.

## [0.2.0.0] --- 7th November 2020 --- **_Added GMJournal Files and Python_**

### NEW

- _Added_ `GMJournal` files.
- _Wrote_ python script (`syncSWF.py`) to automatically move `.swf`s to the `Public/ModName/GUI` folder.
- _Created_ a close button for the message-box! - You won't believe how long this took me to implement.

## [0.1.0.0] --- 6th November 2020 --- **_Added msgBox Files_**

### NEW

- _Added_ `msgBox` source files.
- _Created_ `BootstrapClient.lua`, `BootstrapServer.lua` and `S7_UCL_Auxiliary.lua`.

## [0.1.0.0] --- 6th November 2020 --- **_Initialized Script-Extender_**

### NEW

- _Created_ `OsiToolsConfig.json`.

### CHANGED

- _Changed_ project meta-data.

## [0.1.0.0] --- 6th November 2020 --- **_Initial Commit_**

### NEW

- Initial Commit.
