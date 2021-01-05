package skills_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.textEffect;
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Timer;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var dragHit_mc:MovieClip;
      
      public var memoryPageHitRect_mc:MovieClip;
      
      public var skillPane_mc:MovieClip;
      
      public var skillPreview_mc:skillPreview;
      
      public var events:Array;
      
      public var layout:String;
      
      public var _isDragging:Boolean;
      
      public var hasTooltip:Boolean;
      
      public var isInCombat:Boolean;
      
      public var memoryAmount:uint;
      
      public var memoryUsed:uint;
      
      public var memoryCommitted:Array;
      
      public var skillsUpdateList:Array;
      
      public var skillsCoolDownList:Array;
      
      public var memoryText:Array;
      
      public var memoryListTitle:Array;
      
      public var memoryHeaderTitle:Array;
      
      public var tabTooltip:Array;
      
      public var skillsColors:Array;
      
      public var skillListTitle:String;
      
      public var defaultDeck:String;
      
      public var draggingSkillId:String;
      
      public var draggingSkillSchool:uint;
      
      public var draggingSkillMemory:uint;
      
      public var filterButtons:horizontalList;
      
      public var charIconW:Number;
      
      public var charIconH:Number;
      
      public var skillSize:uint;
      
      public var deafultSkillSize:uint;
      
      public var skillSpacing:int;
      
      public var memorySpacing:int;
      
      public var listSpacing:int;
      
      public var amountOfColumns:uint;
      
      public var extraMemorySpacing:int;
      
      public var extraMemorySize:uint;
      
      public var memoryListSpacing:int;
      
      public var memoryVerticalSpacing:int;
      
      public var memoryHorizintalSpacing:int;
      
      public const filterBGSpacing:Number = 15;
      
      public var buttonCallBack:Array;
      
      public const anchorId:String = "skillPanel";
      
      public const anchorPos:String = "center";
      
      public const anchorTPos:String = "center";
      
      public const anchorTarget:String = "screen";
      
      public var tooltipId:String;
      
      public var tooltipHideTimer:Timer;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function clearDragging() : void
      {
         this.draggingSkillId = "";
         this.draggingSkillSchool = 1;
         this.draggingSkillMemory = 1;
      }
      
      public function set isDragging(param1:Boolean) : void
      {
         this._isDragging = param1;
         if(!param1)
         {
            this.hideSkillPreview();
         }
         this.memoryPageHitRect_mc.visible = param1;
      }
      
      public function get isDragging() : Boolean
      {
         return this._isDragging;
      }
      
      public function showTooltip(param1:Number, param2:String, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.tooltipHideTimer.reset();
         this.tooltipHideTimer.stop();
         if(this.tooltipId != param2)
         {
            this.tooltipId = param2;
            ExternalInterface.call("showSkillTooltip",param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function hideTooltip() : void
      {
         this.tooltipHideTimer.start();
      }
      
      public function onTooltipTimerComplete(param1:TimerEvent) : void
      {
         this.tooltipId = "";
         this.tooltipHideTimer.reset();
         this.tooltipHideTimer.stop();
         ExternalInterface.call("hideTooltip");
      }
      
      public function showSkillPreview() : void
      {
         this.skillPreview_mc.show(this.draggingSkillMemory,this.skillsColors[this.draggingSkillSchool]);
      }
      
      public function hideSkillPreview() : void
      {
         this.skillPreview_mc.hide();
      }
      
      public function onEventInit() : *
      {
         this.skillPane_mc.init();
         this.skillPane_mc.filterContainer_mc.addChild(this.filterButtons);
         this.filterButtons.canPositionInvisibleElements = false;
         this.filterButtons.EL_SPACING = 3;
         var _loc1_:uint = 1;
         while(_loc1_ < 13)
         {
            this.addFilter(_loc1_);
            _loc1_++;
         }
         this.skillPane_mc.leftCycle_mc.initButton(true);
         this.skillPane_mc.rightCycle_mc.initButton(false);
         this.memoryPageHitRect_mc.visible = false;
         this.skillPreview_mc.init();
         this.skillPane_mc.occupiedMemory_mc.text_txt.autoSize = TextFieldAutoSize.LEFT;
         this.skillPane_mc.frame_mc.setHL(false);
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UICancel":
            case "IE ToggleInGameMenu":
               ExternalInterface.call("PlaySound","UI_Game_Inventory_Close");
               ExternalInterface.call("hideUI");
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onEventDown(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UICancel":
            case "IE ToggleInGameMenu":
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function setTitle(param1:String, param2:String) : *
      {
         if(param1 != "" && param2 != "")
         {
            this.skillPane_mc.title1holder.title1_txt.htmlText = param1;
            this.skillPane_mc.title2holder.title2_txt.htmlText = param2;
            textHelpers.smallCaps(this.skillPane_mc.title1holder.title1_txt);
            textHelpers.smallCaps(this.skillPane_mc.title2holder.title2_txt);
            this.skillPane_mc.title1holder.title1_txt.filters = this.skillPane_mc.title2holder.title2_txt.filters = textEffect.createStrokeFilter(0,2,0.9,1.8,4);
         }
      }
      
      public function setButtonText(param1:Number, param2:String) : *
      {
         if(param1 == 1)
         {
            this.skillPane_mc.allBtn_mc.text_txt.htmlText = param2;
         }
         else if(param2 != "")
         {
            if(this.skillPane_mc.resetBtn_mc.template_mc.resetTextHolder.text_txt)
            {
               this.skillPane_mc.resetBtn_mc.template_mc.resetTextHolder.text_txt.htmlText = param2.toUpperCase();
            }
         }
         this.skillPane_mc.resetBtn_mc.template_mc.resetTextHolder.filters = textEffect.createStrokeFilter(0,2,0.9,1.8,3);
      }
      
      public function setMemoryText(param1:String) : *
      {
         var _loc2_:Number = NaN;
         if(param1 != "")
         {
            this.skillPane_mc.occupiedMemory_mc.text_txt.htmlText = param1;
            _loc2_ = this.skillPane_mc.occupiedMemory_mc.text_txt.textWidth;
            this.skillPane_mc.occupiedMemory_mc.x = 1200 + 60 - Math.round(20 + _loc2_);
         }
      }
      
      public function setPlayer(param1:Number, param2:Boolean) : *
      {
         this.skillPane_mc.avatarFrame_mc.visible = param2;
         ExternalInterface.call("registerAnchorId","skills" + param1);
         ExternalInterface.call("setAnchor","center","screen","center");
         this.skillPane_mc.characterHandle = param1;
         this.skillPane_mc.frame_mc.setAvatar(param2);
      }
      
      public function setPlayerMemory(param1:Number) : *
      {
         this.memoryAmount = param1;
         this.skillPane_mc.resetMemoryList();
      }
      
      public function addFilter(param1:uint) : *
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         else if(param1 > 13)
         {
            param1 = 13;
         }
         var _loc2_:MovieClip = new filter();
         _loc2_.visible = false;
         this.filterButtons.addElement(_loc2_,true,false);
         _loc2_.icon_mc.gotoAndStop(param1);
         _loc2_.iconInactive_mc.gotoAndStop(param1);
         _loc2_.init(this);
         this.filterButtons.x = -Math.round(this.filterButtons.width * 0.5);
         this.skillPane_mc.filterBG_mc.x = this.skillPane_mc.filterContainer_mc.x + this.filterButtons.x - this.filterBGSpacing;
         this.skillPane_mc.filterBG_mc.setWidth(this.filterButtons.width + this.filterBGSpacing + this.filterBGSpacing);
      }
      
      public function updateSkills(param1:Boolean) : *
      {
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:String = null;
         var _loc11_:uint = 0;
         var _loc12_:Boolean = false;
         var _loc13_:uint = 0;
         var _loc14_:Boolean = false;
         var _loc15_:skillSlot = null;
         var _loc16_:MovieClip = null;
         var _loc17_:uint = 0;
         this.skillPane_mc.clearFrames();
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc4_:Number = this.skillPane_mc.skillLists.scrolledY;
         this.skillPane_mc.resetSkillLists();
         var _loc5_:Number = this.skillsUpdateList.length;
         var _loc6_:String = "";
         if(this.skillPane_mc.currentlyHovering)
         {
            _loc6_ = this.skillPane_mc.currentlyHovering.tooltipID;
         }
         _loc7_ = 1;
         while(_loc7_ <= 3)
         {
            _loc2_ = this.skillPane_mc.getSkillList(_loc7_);
            if(_loc2_)
            {
               _loc2_.visible = false;
            }
            _loc7_++;
         }
         if(_loc5_ > 0)
         {
            if(param1)
            {
               _loc8_ = 0;
               while(_loc8_ < this.filterButtons.length)
               {
                  this.filterButtons.getAt(_loc8_).setKnown(false);
                  _loc8_++;
               }
            }
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc9_ = this.skillsUpdateList[_loc7_++];
               _loc10_ = this.skillsUpdateList[_loc7_++];
               _loc11_ = this.skillsUpdateList[_loc7_++];
               _loc12_ = this.skillsUpdateList[_loc7_++];
               _loc13_ = this.skillsUpdateList[_loc7_++];
               _loc14_ = this.skillsUpdateList[_loc7_++];
               _loc2_ = _loc13_ > 0?this.skillPane_mc.getSkillList(_loc13_):null;
               _loc3_ = this.skillPane_mc.getSkillsFrame(_loc13_);
               if(_loc2_)
               {
                  _loc2_.visible = true;
                  _loc8_ = 0;
                  while(_loc8_ < _loc13_)
                  {
                     _loc15_ = new skillSlot();
                     _loc15_.memoryCost = _loc13_;
                     _loc15_.skillSchoolId = _loc11_;
                     _loc15_.tooltipID = _loc10_;
                     _loc15_.skillID = _loc9_;
                     _loc15_.isLearned = _loc12_;
                     _loc15_.root_mc = this;
                     _loc15_.isActive = _loc14_ && _loc8_ == 0;
                     _loc15_.dragAvailable = !_loc14_;
                     _loc15_.localCellIndex = _loc8_;
                     _loc15_.initSkill(_loc11_ + 1);
                     _loc2_.list.addElement(_loc15_);
                     _loc8_++;
                  }
                  if(_loc3_)
                  {
                     _loc3_.setColor(this.skillsColors[_loc11_]);
                     _loc3_.addFrameCells(_loc13_);
                  }
               }
               if(_loc13_ > 0 && param1)
               {
                  _loc16_ = this.filterButtons.getAt(_loc11_);
                  if(_loc16_)
                  {
                     if(!_loc16_.isKnown)
                     {
                        _loc16_.setKnown(true);
                     }
                     _loc16_.knownSkillCounter++;
                  }
               }
            }
            if(param1)
            {
               _loc17_ = this.filterButtons.length;
               _loc7_ = 0;
               while(_loc7_ < _loc17_)
               {
                  _loc16_ = this.filterButtons.getAt(_loc7_);
                  if(_loc16_)
                  {
                     _loc16_.setNumberOfKnownSkills(_loc16_.knownSkillCounter);
                  }
                  _loc7_++;
               }
               this.filterButtons.positionElements();
               this.filterButtons.x = -Math.round(this.filterButtons.width * 0.5);
               this.skillPane_mc.filterBG_mc.x = this.skillPane_mc.filterContainer_mc.x + this.filterButtons.x - this.filterBGSpacing;
               this.skillPane_mc.filterBG_mc.setWidth(this.filterButtons.width + this.filterBGSpacing + this.filterBGSpacing);
            }
            this.skillsUpdateList = new Array();
            this.skillPane_mc.setSkillListHeight();
            this.skillPane_mc.sortSkillLists();
            this.skillPane_mc.setIggyGridSize();
            this.skillsUpdateList.length = 0;
         }
         this.skillPane_mc.skillLists.m_scrollbar_mc.scrolledY = _loc4_;
         this.skillPane_mc.skillLists.m_scrollbar_mc.scrollToFit(true);
         this.skillPane_mc.skillLists.positionElements();
         this.skillPane_mc.fitFrames();
      }
      
      public function selectAllFilters() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = this.filterButtons.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.filterButtons.getAt(_loc3_);
            if(_loc2_)
            {
               _loc2_.setKnown(_loc2_.knownSkillCounter > 0);
            }
            _loc3_++;
         }
      }
      
      public function forceUpdate() : *
      {
         this.resetFilters();
         this.skillPane_mc.resetMemoryList();
      }
      
      public function updateMemory() : *
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         var _loc8_:MovieClip = null;
         this.skillPane_mc.clearMemoryFrames();
         this.memoryUsed = 0;
         var _loc1_:Number = this.skillPane_mc.memoryLists.scrolledY;
         if(this.skillPane_mc.currentlyHovering)
         {
            this.skillPane_mc.currentlyHovering.onOver(null);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.memoryCommitted.length)
         {
            _loc3_ = this.memoryCommitted[_loc2_++];
            _loc4_ = this.memoryCommitted[_loc2_++];
            _loc5_ = this.memoryCommitted[_loc2_++];
            _loc6_ = this.memoryCommitted[_loc2_++];
            _loc7_ = this.memoryCommitted[_loc2_++];
            if(_loc4_ < 0)
            {
               _loc4_ = 0;
            }
            if(_loc6_)
            {
               this.skillPane_mc.setMemory(_loc3_,_loc5_,_loc4_ + 1,_loc7_,this.skillsColors[_loc4_]);
            }
            _loc8_ = this.skillPane_mc.getSkillByTooltipID(_loc5_);
            if(_loc8_ && _loc8_.isActive != _loc6_)
            {
               _loc8_.isActive = _loc6_;
            }
            if(_loc7_ == this.skillPane_mc.multiMemorySkillIndex)
            {
               this.memoryUsed = this.memoryUsed + _loc3_;
            }
         }
         this.memoryCommitted = new Array();
         this.skillPane_mc.updateMemory();
         this.skillPane_mc.memoryLists.m_scrollbar_mc.scrollTo(_loc1_);
      }
      
      public function resetFilters() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.filterButtons.length)
         {
            this.filterButtons.getAt(_loc1_).setFilterActive(true);
            _loc1_++;
         }
      }
      
      public function updateCooldowns() : *
      {
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc1_:uint = this.skillsCoolDownList.length;
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.skillsCoolDownList[_loc2_++];
            _loc4_ = this.skillsCoolDownList[_loc2_++];
            this.skillPane_mc.setSkillCooldown(_loc3_,_loc4_);
         }
         this.skillsCoolDownList = new Array();
      }
      
      public function selectSkillByID(param1:String) : *
      {
         var _loc2_:MovieClip = this.skillPane_mc.getSkillByTooltipID(param1);
         if(_loc2_)
         {
            _loc2_.onUp(null);
            if(!_loc2_.skillSelectedHL_mc.visible)
            {
               _loc2_.onOut(null);
            }
         }
      }
      
      public function showMemoryHighlight() : void
      {
         if(this.isDragging)
         {
            addEventListener(Event.ENTER_FRAME,this.updateMemoryHighlight);
         }
      }
      
      public function hideMemoryHighlight() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.updateMemoryHighlight);
         if(this.skillPane_mc.previewHighlight_mc != null)
         {
            this.skillPane_mc.previewHighlight_mc.hideHighlight();
         }
      }
      
      public function updateMemoryHighlight(param1:Event) : void
      {
         var _loc4_:* = false;
         var _loc2_:uint = this.memoryUsed;
         var _loc3_:uint = this.draggingSkillMemory;
         if(this.isDragging)
         {
            _loc4_ = _loc2_ + _loc3_ <= this.memoryAmount;
            _loc3_ = !!_loc4_?uint(_loc3_):uint(this.memoryAmount - _loc2_);
            this.skillPane_mc.previewHighlight_mc.showHighlight(_loc2_,_loc3_,_loc4_);
         }
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UICancel","IE ToggleInGameMenu");
         this.layout = "fixed";
         this._isDragging = false;
         this.isInCombat = false;
         this.memoryAmount = 0;
         this.memoryUsed = 0;
         this.memoryCommitted = new Array();
         this.skillsUpdateList = new Array();
         this.skillsCoolDownList = new Array();
         this.memoryText = new Array();
         this.memoryListTitle = new Array();
         this.memoryHeaderTitle = new Array();
         this.tabTooltip = new Array();
         this.skillsColors = new Array();
         this.draggingSkillId = "";
         this.draggingSkillSchool = 1;
         this.draggingSkillMemory = 1;
         this.filterButtons = new horizontalList();
         this.charIconW = 80;
         this.charIconH = 100;
         this.skillSize = 69;
         this.deafultSkillSize = 56;
         this.skillSpacing = 5;
         this.memorySpacing = 18;
         this.listSpacing = 57;
         this.amountOfColumns = 6;
         this.extraMemorySpacing = 40;
         this.extraMemorySize = 34;
         this.memoryListSpacing = 64;
         this.memoryVerticalSpacing = 18;
         this.memoryHorizintalSpacing = 18;
         this.buttonCallBack = new Array("resetMemory","applyChanges");
         this.tooltipId = "";
         this.tooltipHideTimer = new Timer(1,1);
         this.tooltipHideTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTooltipTimerComplete);
      }
   }
}
