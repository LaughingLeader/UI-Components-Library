package journal_fla
{
   import LS_Classes.LSStateButton;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var journal_mc:MovieClip;
      
      public var events:Array;
      
      public var layout:String;
      
      public var curTooltip:String;
      
      public var hasTooltip:Boolean;
      
      public var add_icons:Array;
      
      public var add_dirs:Array;
      
      public var postponeBtnText:Array;
      
      public var add_quest:Array;
      
      public var add_subquest:Array;
      
      public var add_questInfo:Array;
      
      public var add_mystery:Array;
      
      public var add_mysteryInfo:Array;
      
      public var add_dialog:Array;
      
      public var add_dialogLine:Array;
      
      public var add_tutEntry:Array;
      
      public var charIconW:Number;
      
      public var charIconH:Number;
      
      public var collapsedHeight:uint;
      
      public var text_array:Array;
      
      public var questCompletedLabel:String;
      
      public var pingPoolIdx:int;
      
      public var pingPool:Array;
      
      public var isMouseOverMap:Boolean;
      
      public var pingModeEnabled:Boolean;
      
      public var activePings:Array;
      
      public var regionPos:Array;
      
      public var regionRadius:Number;
      
      public const anchorId:String = "journal";
      
      public const anchorPos:String = "center";
      
      public const anchorTPos:String = "center";
      
      public const anchorTarget:String = "screen";
      
      public var label_array:Array;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventInit() : *
      {
         var _loc2_:Ping = null;
         ExternalInterface.call("registerAnchorId","journal");
         ExternalInterface.call("setAnchor","center","screen","center");
         this.journal_mc.questSelectedId = "";
         this.journal_mc.openedQuest = null;
         this.journal_mc.infoContainer_mc.init();
         this.journal_mc.tutorialContainer_mc.init();
         this.journal_mc.map_mc.init();
         this.journal_mc.leftJournalBtn_mc.initialize("",this.journal_mc.loadQuests,true,true);
         this.journal_mc.leftJournalBtn_mc.m_AllowToggleActive = false;
         this.journal_mc.rightJournalBtn_mc.initialize("",this.journal_mc.loadQuests,false);
         this.journal_mc.rightJournalBtn_mc.m_AllowToggleActive = false;
         this.journal_mc.showPostponed_mc.init(this.journal_mc.showPostponed);
         this.journal_mc.showPostponed_mc.setActive(true);
         this.journal_mc.postponeBtn_mc.init(this.journal_mc.PostponeQuest);
         this.journal_mc.onMapBtn_mc.init(this.journal_mc.OnMapQuest);
         var _loc1_:uint = 0;
         while(_loc1_ <= this.pingPoolIdx)
         {
            _loc2_ = new Ping();
            _loc2_.visible = false;
            this.journal_mc.map_mc.mapContentHolder_mc.addChild(_loc2_);
            this.pingPool[_loc1_] = _loc2_;
            _loc1_++;
         }
         this.journal_mc.map_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOverMap);
      }
      
      public function setText(param1:Number, param2:String) : *
      {
         if(param1 >= 0 && param1 < this.label_array.length)
         {
            if(this.label_array[param1] == this.journal_mc.tutorialContainer_mc.showTutorialPopups_mc)
            {
               this.label_array[param1].setText(param2);
            }
            else
            {
               this.label_array[param1].htmlText = param2;
            }
         }
      }
      
      public function onEventResize() : *
      {
      }
      
      public function setMapLegendHidden(param1:Boolean) : *
      {
         this.journal_mc.map_mc.legend_mc.visible = !param1;
      }
      
      public function setMapTitle(param1:String) : *
      {
         if(param1 != "" && param1 != " ")
         {
            this.journal_mc.mapName_txt.htmlText = param1;
         }
      }
      
      public function setLabels() : *
      {
         var _loc1_:uint = this.text_array.length;
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_)
         {
            switch(_loc2_)
            {
               case 0:
                  this.journal_mc.map_mc.legend_mc.title_txt.htmlText = this.text_array[_loc2_].toUpperCase();
                  break;
               case 1:
                  if(!this.postponeBtnText[0])
                  {
                     this.postponeBtnText.push(this.text_array[_loc2_]);
                  }
                  else
                  {
                     this.postponeBtnText[0] = this.text_array[_loc2_];
                  }
                  break;
               case 2:
                  if(!this.postponeBtnText[1])
                  {
                     this.postponeBtnText.push(this.text_array[_loc2_]);
                  }
                  else
                  {
                     this.postponeBtnText[1] = this.text_array[_loc2_];
                  }
                  break;
               case 3:
                  this.journal_mc.leftJournalBtn_mc.setText(this.text_array[_loc2_]);
                  break;
               case 4:
                  this.journal_mc.rightJournalBtn_mc.setText(this.text_array[_loc2_]);
                  break;
               case 5:
                  this.journal_mc.showPostponed_mc.setText(this.text_array[_loc2_]);
                  break;
               case 6:
                  this.journal_mc.postponeBtnText = new Array();
               case 7:
                  this.journal_mc.postponeBtnText[_loc2_ % 6] = this.text_array[_loc2_];
                  break;
               case 8:
                  this.journal_mc.map_mc.info_mc.htmlText = this.text_array[_loc2_];
                  break;
               case 9:
                  this.journal_mc.onMapBtn_mc.setText(this.text_array[_loc2_]);
            }
            _loc2_++;
         }
         this.text_array = new Array();
      }
      
      public function selectTab(param1:uint) : *
      {
         this.journal_mc.selectTab(param1);
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE ToggleInGameMenu":
               this.fadeOut();
               ExternalInterface.call("PlaySound","UI_Game_Journal_Close");
               _loc2_ = true;
               break;
            case "IE UIUp":
            case "IE UIDown":
               this.journal_mc.setListLoopable(true);
               _loc2_ = true;
               break;
            case "IE UIAccept":
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onEventDown(param1:Number) : *
      {
         var _loc2_:String = "";
         var _loc3_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE ToggleInGameMenu":
               _loc3_ = true;
               break;
            case "IE UIAccept":
               this.executeSelected();
               _loc3_ = true;
               break;
            case "IE Ping":
               if(this.isMouseOverMap)
               {
                  ExternalInterface.call("pingOnMap",this.journal_mc.map_mc.mapContentHolder_mc.mapContent_mc.iggy_map.mouseX,this.journal_mc.map_mc.mapContentHolder_mc.mapContent_mc.iggy_map.mouseY);
                  _loc3_ = true;
               }
               break;
            case "IE UIUp":
               this.moveCursor(true);
               _loc3_ = true;
               break;
            case "IE UIDown":
               this.moveCursor(false);
               _loc3_ = true;
         }
         return _loc3_;
      }
      
      public function onMouseOverMap(param1:MouseEvent) : *
      {
         this.isMouseOverMap = true;
         this.journal_mc.map_mc.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOverMap);
         this.journal_mc.map_mc.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOutMap);
      }
      
      public function onMouseOutMap(param1:MouseEvent) : *
      {
         this.isMouseOverMap = false;
         this.journal_mc.map_mc.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOutMap);
         this.journal_mc.map_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOverMap);
      }
      
      public function setBtnTooltip(param1:Number, param2:String) : *
      {
         this.journal_mc.setBtnTooltip(param1,param2);
      }
      
      public function addQuest(param1:String, param2:String, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Boolean, param9:Number, param10:int, param11:Boolean = true) : *
      {
         this.journal_mc.addQuest(param1,param2,param3.toUpperCase(),param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function updateTutorials() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.add_tutEntry.length)
         {
            this.journal_mc.addTutorialEntry(this.add_tutEntry[_loc1_].toUpperCase(),this.add_tutEntry[_loc1_ + 1],this.add_tutEntry[_loc1_ + 2],this.add_tutEntry[_loc1_ + 3]);
            _loc1_ = _loc1_ + 4;
         }
         this.add_tutEntry = new Array();
         this.journal_mc.tutorialUpdateDone();
      }
      
      public function setTutorialCheckboxState(param1:Boolean) : *
      {
         this.journal_mc.tutorialContainer_mc.showTutorialPopups_mc.setActive(param1);
      }
      
      public function swapCharacter(param1:Boolean) : *
      {
         this.journal_mc.clearDialogs();
         this.journal_mc.clearQuests();
      }
      
      public function clearDialogs() : *
      {
         this.journal_mc.clearDialogs();
      }
      
      public function isInArenaMode(param1:Boolean) : *
      {
         var _loc2_:LSStateButton = this.journal_mc.tabList.getElementByNumber("id",4) as LSStateButton;
         var _loc3_:LSStateButton = this.journal_mc.tabList.getElementByNumber("id",0) as LSStateButton;
         if(_loc2_ && _loc3_)
         {
            _loc2_.setEnabled(!param1);
            _loc3_.setEnabled(!param1);
         }
      }
      
      public function addTab(param1:Number, param2:Number, param3:String, param4:Boolean = false) : *
      {
         this.journal_mc.addTab(param1,param2,param3,param4);
      }
      
      public function setTabEnabled(param1:Number, param2:Boolean) : *
      {
         this.journal_mc.setTabEnabled(param1,param2);
      }
      
      public function addDialog(param1:Number, param2:Number, param3:String, param4:String, param5:String) : *
      {
         this.journal_mc.addDialog(param1,param2,param3,param4,param5);
      }
      
      public function addDialogLine(param1:Number, param2:int, param3:String, param4:String) : *
      {
         this.journal_mc.addDialogLine(param1,param2,param3,param4);
      }
      
      public function executeSelected() : *
      {
         this.journal_mc.executeSelected();
      }
      
      public function moveCursor(param1:Boolean) : *
      {
         this.journal_mc.moveCursor(param1);
      }
      
      public function hideWin() : void
      {
         this.journal_mc.visible = false;
      }
      
      public function showWin() : void
      {
         this.journal_mc.visible = true;
      }
      
      public function getHeight() : Number
      {
         return this.journal_mc.height;
      }
      
      public function getWidth() : Number
      {
         return this.journal_mc.width;
      }
      
      public function setX(param1:Number) : void
      {
         this.journal_mc.x = param1;
      }
      
      public function setY(param1:Number) : void
      {
         this.journal_mc.y = param1;
      }
      
      public function setPos(param1:Number, param2:Number) : void
      {
         this.journal_mc.x = param1;
         this.journal_mc.y = param2;
      }
      
      public function getX() : Number
      {
         return this.journal_mc.x;
      }
      
      public function getY() : Number
      {
         return this.journal_mc.y;
      }
      
      public function fadeIn() : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Open");
      }
      
      public function fadeOut() : *
      {
         ExternalInterface.call("closedUI");
      }
      
      public function update() : *
      {
         var _loc1_:* = 0;
         while(_loc1_ < this.add_icons.length)
         {
            this.setObjectIcon(this.add_icons[_loc1_],this.add_icons[_loc1_ + 1],this.add_icons[_loc1_ + 2],this.add_icons[_loc1_ + 3],this.add_icons[_loc1_ + 4],this.add_icons[_loc1_ + 5],this.add_icons[_loc1_ + 6],this.add_icons[_loc1_ + 7]);
            _loc1_ = _loc1_ + 8;
         }
         this.add_icons = new Array();
         this.journal_mc.map_mc.cleanupOfUnused();
      }
      
      public function updateSecrets() : *
      {
      }
      
      public function updateJournal(param1:String) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         if(this.add_quest.length > 0)
         {
            this.journal_mc.openedQuest = null;
            this.journal_mc.questSelectedId = param1;
            _loc2_ = 0;
            while(_loc2_ < this.add_quest.length)
            {
               _loc3_ = this.add_quest[_loc2_++];
               _loc4_ = this.add_quest[_loc2_++];
               _loc5_ = this.add_quest[_loc2_++];
               _loc6_ = this.add_quest[_loc2_++];
               _loc7_ = this.add_quest[_loc2_++];
               _loc8_ = this.add_quest[_loc2_++];
               _loc9_ = this.add_quest[_loc2_++];
               _loc10_ = this.add_quest[_loc2_++];
               _loc11_ = this.add_quest[_loc2_++];
               _loc12_ = this.add_quest[_loc2_++];
               _loc13_ = this.add_quest[_loc2_++];
               this.addQuest(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
            }
            _loc2_ = 0;
            while(_loc2_ < this.add_subquest.length)
            {
               this.journal_mc.addSubQuest(this.add_subquest[_loc2_++],this.add_subquest[_loc2_++],this.add_subquest[_loc2_++],this.add_subquest[_loc2_++],this.add_subquest[_loc2_++],this.add_subquest[_loc2_++],this.add_subquest[_loc2_++],this.add_subquest[_loc2_++]);
            }
            _loc2_ = 0;
            while(_loc2_ < this.add_mystery.length)
            {
               this.journal_mc.addMystery(this.add_mystery[_loc2_++],this.add_mystery[_loc2_++],this.add_mystery[_loc2_++],this.add_mystery[_loc2_++],this.add_mystery[_loc2_++],this.add_mystery[_loc2_++],this.add_mystery[_loc2_++]);
            }
            this.journal_mc.questAddingDone();
            _loc2_ = 0;
            while(_loc2_ < this.add_questInfo.length)
            {
               this.journal_mc.addQuestAction(false,this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++],this.add_questInfo[_loc2_++]);
            }
            _loc2_ = 0;
            while(_loc2_ < this.add_mysteryInfo.length)
            {
               this.journal_mc.addQuestAction(true,"",this.add_mysteryInfo[_loc2_++],"",0,"",this.add_mysteryInfo[_loc2_++],this.add_mysteryInfo[_loc2_++],this.add_mysteryInfo[_loc2_++],this.add_mysteryInfo[_loc2_++],"");
            }
            this.add_mystery = new Array();
            this.add_mysteryInfo = new Array();
            this.add_quest = new Array();
            this.add_questInfo = new Array();
            this.add_subquest = new Array();
            this.journal_mc.questUpdateDone();
         }
         this.journal_mc.resizeToContent();
      }
      
      public function clearQuests() : *
      {
         this.journal_mc.clearQuests();
      }
      
      public function updateDialogLog() : *
      {
         this.journal_mc.clearDialogs();
         var _loc1_:* = 0;
         while(_loc1_ < this.add_dialog.length)
         {
            this.addDialog(this.add_dialog[_loc1_],this.add_dialog[_loc1_ + 1],this.add_dialog[_loc1_ + 2],this.add_dialog[_loc1_ + 3],this.add_dialog[_loc1_ + 4]);
            _loc1_ = _loc1_ + 5;
         }
         _loc1_ = 0;
         while(_loc1_ < this.add_dialogLine.length)
         {
            this.addDialogLine(this.add_dialogLine[_loc1_++],this.add_dialogLine[_loc1_++],this.add_dialogLine[_loc1_++],this.add_dialogLine[_loc1_++]);
         }
         this.add_dialog = new Array();
         this.add_dialogLine = new Array();
         this.journal_mc.dialogUpdateDone();
      }
      
      public function setMapOffset(param1:Number, param2:Number, param3:String = "") : *
      {
         this.journal_mc.map_mc.setMapOffset(param1,param2,param3,true);
      }
      
      public function clearIcons() : *
      {
         this.journal_mc.map_mc.clearIcons();
      }
      
      public function trackIcon(param1:Number) : *
      {
         this.journal_mc.map_mc.trackIcon(param1);
      }
      
      public function clearTrackIcon() : *
      {
         this.journal_mc.map_mc.trackIconMC(null);
      }
      
      public function setObjectIcon(param1:Number, param2:Number, param3:Number, param4:String, param5:Number, param6:Number, param7:Number, param8:String) : *
      {
         this.journal_mc.map_mc.setObjectIcon(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setMapScale(param1:Number) : *
      {
         this.journal_mc.map_mc.setMapScale(param1);
      }
      
      public function setPlayerOnMap(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:String = "") : *
      {
         this.journal_mc.map_mc.setPlayer(param1,param2,param3,param4,param5,param6);
      }
      
      public function setPlayer(param1:Number, param2:Boolean) : *
      {
         this.journal_mc.isAvatar = param2;
      }
      
      public function removePlayer(param1:Number) : *
      {
         this.journal_mc.map_mc.removePlayer(param1);
      }
      
      public function setMapSize(param1:Number, param2:Number) : *
      {
         this.journal_mc.map_mc.setMapSize(param1,param2);
      }
      
      public function addLegend(param1:Number, param2:String) : *
      {
         this.journal_mc.map_mc.addLegend(param1,param2);
      }
      
      public function clearLegend() : *
      {
         this.journal_mc.map_mc.clearLegend();
      }
      
      public function ping(param1:Number, param2:Number, param3:Number) : *
      {
         var _loc4_:Ping = this.getFreePingMC();
         _loc4_.reset();
         _loc4_.objectId = param3;
         _loc4_.x = param1 * this.journal_mc.map_mc.currScale;
         _loc4_.y = param2 * this.journal_mc.map_mc.currScale;
         this.activePings.push(_loc4_);
         _loc4_.updated = true;
         _loc4_.visible = true;
      }
      
      public function hidePing(param1:Ping) : *
      {
         var _loc2_:int = 0;
         param1.visible = false;
         _loc2_ = 0;
         while(_loc2_ < this.activePings.length)
         {
            if(this.activePings[_loc2_].objectId == param1.objectId)
            {
               this.activePings.splice(_loc2_,1);
               return;
            }
            _loc2_++;
         }
      }
      
      public function getFreePingMC() : Ping
      {
         this.pingPoolIdx = (this.pingPoolIdx + 1) % 10;
         return this.pingPool[this.pingPoolIdx];
      }
      
      public function getActivePing(param1:Number) : *
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.activePings.length)
         {
            if(this.activePings[_loc2_].objectId == param1)
            {
               return this.activePings[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function updatePing(param1:Number, param2:Number, param3:Number) : *
      {
         var _loc4_:* = this.getActivePing(param1);
         if(_loc4_ == null)
         {
            this.ping(param2,param3,param1);
            return;
         }
         _loc4_.x = param2 * this.journal_mc.map_mc.currScale;
         _loc4_.y = param3 * this.journal_mc.map_mc.currScale;
         _loc4_.updated = true;
      }
      
      public function clearOldPings() : *
      {
         var _loc1_:int = this.activePings.length - 1;
         while(_loc1_ >= 0)
         {
            if(this.activePings[_loc1_].updated)
            {
               this.activePings[_loc1_].updated = false;
            }
            else
            {
               this.hidePing(this.activePings[_loc1_]);
            }
            _loc1_--;
         }
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UIUp","IE UIDown","IE UIAccept","IE ToggleInGameMenu","IE Ping","IE ContextMenu");
         this.layout = "fixed";
         this.curTooltip = "";
         this.hasTooltip = false;
         this.add_icons = new Array();
         this.add_dirs = new Array();
         this.postponeBtnText = new Array();
         this.add_quest = new Array();
         this.add_subquest = new Array();
         this.add_questInfo = new Array();
         this.add_mystery = new Array();
         this.add_mysteryInfo = new Array();
         this.add_dialog = new Array();
         this.add_dialogLine = new Array();
         this.add_tutEntry = new Array();
         this.charIconW = 80;
         this.charIconH = 100;
         this.collapsedHeight = 50;
         this.text_array = new Array();
         this.pingPoolIdx = 9;
         this.pingPool = new Array();
         this.isMouseOverMap = false;
         this.pingModeEnabled = false;
         this.activePings = new Array();
         this.regionPos = new Array();
         this.label_array = new Array(this.journal_mc.tutorialContainer_mc.showTutorialPopups_mc);
      }
   }
}
