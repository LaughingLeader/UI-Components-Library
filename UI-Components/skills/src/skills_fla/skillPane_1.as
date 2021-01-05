package skills_fla
{
   import LS_Classes.grid;
   import LS_Classes.scrollList;
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public dynamic class skillPane_1 extends MovieClip
   {
       
      
      public var Xclose_mc:MovieClip;
      
      public var allBtn_mc:AllBtn;
      
      public var avatarFrame_mc:MovieClip;
      
      public var changeNameBtn_mc:changeNameBtn;
      
      public var deckDropDown_mc:dropDownBtn;
      
      public var deckManager_txt:TextField;
      
      public var defaultDeck_txt:TextField;
      
      public var filterBG_mc:MovieClip;
      
      public var filterContainer_mc:MovieClip;
      
      public var frame_mc:MovieClip;
      
      public var iggy_char:MovieClip;
      
      public var iggy_grid:MovieClip;
      
      public var iggy_memory:MovieClip;
      
      public var knownSchools_txt:TextField;
      
      public var leftCycle_mc:MovieClip;
      
      public var leftPageFrame_mc:gridFrame;
      
      public var memoryContainer_mc:MovieClip;
      
      public var newDeckBtn_mc:newDeckBtn;
      
      public var occupiedMemory_mc:MovieClip;
      
      public var resetBtn_mc:MovieClip;
      
      public var rightCycle_mc:MovieClip;
      
      public var rightPageFrame_mc:gridFrame;
      
      public var saveDeckBtn_mc:saveDeckBtn;
      
      public var skillContainer_mc:MovieClip;
      
      public var title1holder:MovieClip;
      
      public var title2holder:MovieClip;
      
      public var root_mc:MovieClip;
      
      public var memoryLists:scrollList;
      
      public var skillLists:scrollList;
      
      public const multiMemorySkillIndex = 0;
      
      public const innateSkillIndex = 1;
      
      public const fromItemSkillIndex = 2;
      
      public const fromGMSkillIndex = 3;
      
      public var previewHighlight_mc:MovieClip;
      
      public var listWidth:int;
      
      public var characterHandle:Number;
      
      public var currentlyHovering:MovieClip;
      
      public var skillsFrameArray:Array;
      
      public function skillPane_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.skillsFrameArray = new Array();
         this.root_mc = root as MovieClip;
         this.listWidth = 500;
         this.initMemoryList();
         this.initSkillLists();
         this.skillLists.EL_SPACING = 0;
         this.allBtn_mc.init(this.selectAllPressed);
         this.allBtn_mc.onOverFunc = this.allBtnOver;
         this.allBtn_mc.onOutFunc = this.allBtnOut;
         this.defaultDeck_txt.htmlText = this.root_mc.defaultDeck;
         textHelpers.smallCaps(this.defaultDeck_txt);
         this.knownSchools_txt.htmlText = this.root_mc.memoryHeaderTitle[0];
         textHelpers.smallCaps(this.knownSchools_txt);
         this.deckManager_txt.htmlText = this.root_mc.memoryHeaderTitle[1];
         textHelpers.smallCaps(this.deckManager_txt);
         this.newDeckBtn_mc.initialize("",this.newDeck,null,-1,true);
         this.changeNameBtn_mc.initialize("",this.changeDeckName,null,-1,true);
         this.saveDeckBtn_mc.initialize("",this.saveDeck,null,-1,true);
         this.deckDropDown_mc.initialize("",this.chooseDeck,null,-1,true);
         this.newDeckBtn_mc.visible = false;
         this.deckManager_txt.visible = false;
         this.defaultDeck_txt.visible = false;
         this.deckDropDown_mc.visible = false;
         this.changeNameBtn_mc.visible = false;
         this.saveDeckBtn_mc.visible = false;
         this.resetBtn_mc.initButton(new resetButton(),function():*
         {
            ExternalInterface.call(root_mc.buttonCallBack[0]);
            deactivateAllSkills();
         });
      }
      
      public function allBtnOver() : *
      {
         this.allBtn_mc.text_txt.textColor = 16777215;
      }
      
      public function allBtnOut() : *
      {
         this.allBtn_mc.text_txt.textColor = 11900037;
      }
      
      public function selectAllPressed() : *
      {
         ExternalInterface.call("showAllFilters");
         (parent as MovieClip).selectAllFilters();
      }
      
      public function newDeck() : *
      {
      }
      
      public function chooseDeck() : *
      {
      }
      
      public function changeDeckName() : *
      {
      }
      
      public function saveDeck() : *
      {
      }
      
      public function setSkillCooldown(param1:String, param2:Number, param3:Boolean = true) : *
      {
         var _loc6_:MovieClip = null;
         var _loc7_:grid = null;
         var _loc8_:* = undefined;
         var _loc9_:uint = 0;
         var _loc10_:MovieClip = null;
         var _loc4_:uint = this.skillLists.length;
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = this.skillLists.getAt(_loc5_);
            if(_loc6_)
            {
               _loc7_ = _loc6_.list;
               if(_loc7_)
               {
                  _loc8_ = _loc7_.length;
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     _loc10_ = _loc7_.getAt(_loc9_);
                     if(_loc10_ && _loc10_.tooltipID == param1)
                     {
                        _loc10_.setCooldown(param2,true);
                        return;
                     }
                     _loc9_++;
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function clearMemoryFrames() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.memoryLists.length)
         {
            _loc2_ = this.memoryLists.getAt(_loc1_);
            if(_loc2_)
            {
               _loc2_.skillFrame_mc.clearFrame();
            }
            _loc1_++;
         }
      }
      
      public function createMemorySkillList(param1:Number, param2:String) : MovieClip
      {
         var _loc3_:MovieClip = new memoryList();
         _loc3_.debugName = param2;
         if(param1 == this.multiMemorySkillIndex)
         {
            _loc3_.initMemory(this.root_mc.amountOfColumns,this.root_mc.memoryAmount);
         }
         else
         {
            _loc3_.initMemory(this.root_mc.amountOfColumns);
         }
         _loc3_.title_txt.htmlText = this.root_mc.memoryListTitle[param1];
         var _loc4_:MovieClip = new skillFrame();
         _loc4_.init(6,6,74,"skillFrame_Cell","skillFrame_LeftArrow","skillFrame_LeftBorder","skillFrame_LeftOpenBorder","skillFrame_RightArrow","skillFrame_RightBorder","skillFrame_RightOpenBorder","skillFrame_Separator");
         _loc4_.clearFrame();
         _loc4_.x = 10;
         _loc4_.y = 40 + 8;
         _loc3_.frameHolder_mc.addChild(_loc4_);
         _loc3_.skillFrame_mc = _loc4_;
         this.memoryLists.addElement(_loc3_,false,false);
         return _loc3_;
      }
      
      public function initMemoryList() : *
      {
         this.memoryLists = new scrollList();
         this.memoryContainer_mc.addChild(this.memoryLists);
         this.memoryContainer_mc.y = 322;
         this.memoryLists.setFrame(this.listWidth,665 - 34 * 2);
         this.memoryLists.containerContent_mc.addChild(this.iggy_memory);
         this.iggy_memory.x = 16;
         this.iggy_memory.y = 46 + 8;
         this.memoryLists.m_scrollbar_mc.m_FullSizeBG = true;
         this.memoryLists.m_scrollbar_mc.m_hideWhenDisabled = true;
         this.memoryLists.SB_SPACING = -45;
         this.memoryLists.m_scrollbar_mc.ScaleBG = true;
         this.memoryLists.m_scrollbar_mc.setLength(365);
         this.memoryLists.m_scrollbar_mc.y = 143 - 27;
         this.memoryLists.m_scrollbar_mc.x = this.memoryLists.m_scrollbar_mc.x + 12;
         this.memoryLists.mouseWheelWhenOverEnabled = true;
         this.memoryLists.m_scrollbar_mc.m_SCROLLSPEED = 74;
         var _loc1_:* = this.createMemorySkillList(this.multiMemorySkillIndex,"multiList");
         this.previewHighlight_mc = new previewHighlight();
         this.previewHighlight_mc.init();
         this.previewHighlight_mc.x = 10;
         this.previewHighlight_mc.y = 40 + 8;
         _loc1_.frameHolder_mc.addChild(this.previewHighlight_mc);
         var _loc2_:* = this.createMemorySkillList(this.innateSkillIndex,"innateSkills");
         _loc2_.visible = false;
         var _loc3_:* = this.createMemorySkillList(this.fromItemSkillIndex,"fromItem");
         _loc3_.visible = false;
         var _loc4_:* = this.createMemorySkillList(this.fromGMSkillIndex,"fromGM");
         _loc4_.visible = false;
         this.memoryLists.positionElements();
         this.rightPageFrame_mc.x = this.memoryContainer_mc.x - 32 + 12;
         this.rightPageFrame_mc.y = this.memoryContainer_mc.y - 2;
         this.rightPageFrame_mc.setSize(this.memoryLists.width,this.memoryLists.height + 4);
      }
      
      public function resetMemoryList() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.memoryLists.length)
         {
            _loc2_ = this.memoryLists.getAt(_loc1_);
            if(_loc2_)
            {
               _loc2_.clearSlots();
               if(_loc1_ != this.multiMemorySkillIndex)
               {
                  _loc2_.visible = false;
               }
               else
               {
                  _loc2_.setMaxMemory(this.root_mc.memoryAmount);
               }
            }
            _loc1_++;
         }
         this.memoryLists.positionElements();
      }
      
      public function setMemory(param1:uint, param2:String, param3:uint, param4:Number = 0, param5:String = "000000") : *
      {
         var _loc6_:* = null;
         if(param4 != this.multiMemorySkillIndex)
         {
            _loc6_ = this.memoryLists.getAt(param4);
            _loc6_.addMemory(param2,param3,true);
            _loc6_.visible = true;
            _loc6_.skillFrame_mc.setColor(param5);
            _loc6_.skillFrame_mc.addFrameCells(1);
         }
         else
         {
            _loc6_ = this.memoryLists.getAt(param4);
            _loc6_.setMemory(param1,param2,param3,false);
            _loc6_.skillFrame_mc.setColor(param5);
            _loc6_.skillFrame_mc.addFrameCells(param1);
         }
      }
      
      public function updateMemory() : *
      {
         var _loc3_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.memoryLists.length)
         {
            _loc3_ = this.memoryLists.getAt(_loc1_);
            if(_loc3_)
            {
               if(_loc1_ == this.multiMemorySkillIndex)
               {
                  _loc3_.cleanUpUnusedMemory();
               }
               else
               {
                  _loc3_.memoryHolder.positionElements();
               }
            }
            _loc1_++;
         }
         this.memoryLists.positionElements();
         var _loc2_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < this.memoryLists.content_array.length)
         {
            _loc2_ = _loc2_ + this.memoryLists.content_array[_loc1_].height;
            _loc1_++;
         }
         this.memoryLists.m_scrollbar_mc.visible = _loc2_ > this.memoryLists.height;
         this.setIggyMemorySize();
      }
      
      public function initSkillLists() : *
      {
         this.skillLists = new scrollList("down_id","up_id","handle_id","scrollBg_id");
         this.skillLists.setFrame(this.listWidth,665 - 34 * 2);
         this.skillLists.EL_SPACING = 0;
         this.skillLists.mouseWheelWhenOverEnabled = true;
         this.skillContainer_mc.addChild(this.skillLists);
         this.skillContainer_mc.y = 322;
         this.skillContainer_mc.x = this.skillContainer_mc.x + 12;
         this.skillLists.scrollbarSpacing = -this.listWidth - 58;
         this.skillLists.m_scrollbar_mc.m_FullSizeBG = true;
         this.skillLists.m_scrollbar_mc.ScaleBG = true;
         this.skillLists.m_scrollbar_mc.y = 153 - 37;
         this.skillLists.m_scrollbar_mc.x = this.skillLists.m_scrollbar_mc.x - 12;
         this.skillLists.m_scrollbar_mc.setLength(365);
         this.skillLists.m_scrollbar_mc.m_hideWhenDisabled = true;
         this.skillLists.m_scrollbar_mc.m_SCROLLSPEED = 74;
         this.skillLists.containerBG_mc.addChild(this.iggy_grid);
         this.iggy_grid.x = 18;
         this.iggy_grid.y = 48;
         this.leftPageFrame_mc.x = this.skillContainer_mc.x - 12;
         this.leftPageFrame_mc.y = this.skillContainer_mc.y - 2;
         this.leftPageFrame_mc.setSize(this.skillLists.width,this.skillLists.height + 4);
      }
      
      public function resetSkillLists() : *
      {
         this.skillLists.clearElements();
      }
      
      public function setIggyGridSize() : *
      {
         this.iggy_grid.bg_mc.height = this.skillLists.containerContent_mc.height;
         this.iggy_grid.bg_mc.width = this.skillLists.containerContent_mc.width;
      }
      
      public function setIggyMemorySize() : *
      {
         this.memoryLists.containerContent_mc.addChild(this.iggy_memory);
         this.iggy_memory.mouseEnabled = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.iggy_memory.numChildren)
         {
            if(this.iggy_memory.getChildAt(_loc1_) is MovieClip)
            {
               (this.iggy_memory.getChildAt(_loc1_) as MovieClip).mouseEnabled = false;
            }
            _loc1_++;
         }
         this.iggy_memory.bg_mc.height = this.memoryLists.containerContent_mc.height;
         this.iggy_memory.bg_mc.width = this.memoryLists.containerContent_mc.width;
      }
      
      public function addSkillList(param1:uint, param2:int, param3:Boolean = false) : MovieClip
      {
         var _loc4_:MovieClip = new skillList();
         _loc4_.initList(param1,param2,this.root_mc.amountOfColumns,this.root_mc,param3);
         this.skillLists.addElement(_loc4_,true,false);
         return _loc4_;
      }
      
      public function clearFrames() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.skillsFrameArray.length)
         {
            if(this.skillsFrameArray[_loc1_])
            {
               (this.skillsFrameArray[_loc1_] as MovieClip).clearFrame();
               this.skillsFrameArray[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function fitFrames() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.skillsFrameArray.length)
         {
            _loc2_ = this.skillsFrameArray[_loc1_];
            if(_loc2_)
            {
               _loc3_ = this.getSkillList(_loc1_);
               if(_loc3_)
               {
                  _loc2_.x = _loc3_.x + 18;
                  _loc2_.y = _loc3_.y + 48;
               }
            }
            _loc1_++;
         }
      }
      
      public function getSkillsFrame(param1:uint) : MovieClip
      {
         var _loc2_:skillFrame = null;
         if(this.skillsFrameArray[param1] == null)
         {
            _loc2_ = new skillFrame();
            _loc2_.init(6,6,74,"skillFrame_Cell","skillFrame_LeftArrow","skillFrame_LeftBorder","skillFrame_LeftOpenBorder","skillFrame_RightArrow","skillFrame_RightBorder","skillFrame_RightOpenBorder","skillFrame_Separator");
            _loc2_.clearFrame();
            this.skillsFrameArray[param1] = _loc2_;
            this.skillLists.containerBG_mc.addChild(_loc2_);
            this.skillLists.containerBG_mc.addChild(this.iggy_grid);
         }
         return this.skillsFrameArray[param1];
      }
      
      public function getSkillList(param1:uint) : MovieClip
      {
         var _loc3_:uint = 0;
         var _loc4_:MovieClip = null;
         var _loc2_:* = null;
         if(this.skillLists.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < this.skillLists.length)
            {
               _loc4_ = this.skillLists.getAt(_loc3_);
               if(_loc4_.memoryCost == param1)
               {
                  _loc2_ = _loc4_;
                  break;
               }
               _loc3_++;
            }
         }
         if(!_loc2_)
         {
            _loc2_ = this.addSkillList(param1,this.listWidth);
         }
         return _loc2_;
      }
      
      public function getSkillByTooltipID(param1:String) : *
      {
         var _loc4_:uint = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:Number = this.skillLists.length;
         if(_loc3_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.skillLists.getAt(_loc4_).findSkillByTooltipID(param1);
               if(_loc2_)
               {
                  break;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function sortSkillLists() : *
      {
         if(this.skillLists.length > 0)
         {
            this.skillLists.sortOnce("memoryCost",Array.NUMERIC);
         }
      }
      
      public function setSkillListHeight() : *
      {
         var _loc2_:uint = 0;
         var _loc3_:MovieClip = null;
         var _loc1_:Number = this.skillLists.length;
         if(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.skillLists.getAt(_loc2_);
               _loc3_.bg_mc.height = _loc3_.height + 2;
               _loc2_++;
            }
         }
      }
      
      public function getGlobalPositionOfMC(param1:MovieClip, param2:Boolean) : Point
      {
         var _loc3_:Point = param1.localToGlobal(new Point(0,0));
         _loc3_.x = _loc3_.x - root.x;
         _loc3_.y = _loc3_.y - root.y;
         return _loc3_;
      }
      
      public function setIggyIcon(param1:MovieClip, param2:String, param3:*, param4:*) : *
      {
         var _loc5_:* = undefined;
         if(param1)
         {
            _loc5_ = new iggySlot();
            _loc5_.name = param2;
            param1.addChild(_loc5_);
            _loc5_.x = _loc5_.x + param3;
            _loc5_.y = _loc5_.y + param4;
         }
      }
      
      public function deactivateAllSkills() : *
      {
         var _loc2_:uint = 0;
         var _loc1_:Number = this.skillLists.length;
         if(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.skillLists.getAt(_loc2_).deactivateAllSkills();
               _loc2_++;
            }
         }
      }
      
      public function findSkillByID(param1:uint) : MovieClip
      {
         var _loc4_:uint = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:Number = this.skillLists.length;
         if(_loc3_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.skillLists.getAt(_loc4_);
               if(_loc2_.skillID == param1)
               {
                  break;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      function frame1() : *
      {
         this.currentlyHovering = null;
      }
   }
}
