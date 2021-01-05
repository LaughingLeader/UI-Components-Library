package characterSheet_fla
{
   import LS_Classes.LSPanelHelpers;
   import LS_Classes.horizontalList;
   import LS_Classes.horizontalScrollList;
   import LS_Classes.larTween;
   import LS_Classes.listDisplay;
   import LS_Classes.textEffect;
   import LS_Classes.textHelpers;
   import fl.motion.easing.Sine;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class stats_1 extends MovieClip
   {
       
      
      public var aiSel_mc:comboBox;
      
      public var alignments_mc:comboBox;
      
      public var attrPointsWrn_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public var charInfo_mc:MovieClip;
      
      public var charList_mc:empty;
      
      public var civicAbilityHolder_mc:MovieClip;
      
      public var civilAbilityPointsWrn_mc:MovieClip;
      
      public var close_mc:MovieClip;
      
      public var combatAbilityHolder_mc:MovieClip;
      
      public var combatAbilityPointsWrn_mc:MovieClip;
      
      public var customStats_mc:MovieClip;
      
      public var dragHit_mc:MovieClip;
      
      public var equip_mc:MovieClip;
      
      public var equipment_txt:TextField;
      
      public var hitArea_mc:MovieClip;
      
      public var invTabHolder_mc:MovieClip;
      
      public var leftCycleBtn_mc:MovieClip;
      
      public var mainStats_mc:MovieClip;
      
      public var onePlayerOverlay_mc:MovieClip;
      
      public var panelBg1_mc:MovieClip;
      
      public var panelBg2_mc:MovieClip;
      
      public var pointsFrame_mc:MovieClip;
      
      public var rightCycleBtn_mc:MovieClip;
      
      public var scrollbarHolder_mc:empty;
      
      public var skillTabHolder_mc:MovieClip;
      
      public var tabTitle_txt:TextField;
      
      public var tabsHolder_mc:empty;
      
      public var tagsHolder_mc:MovieClip;
      
      public var talentHolder_mc:MovieClip;
      
      public var talentPointsWrn_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var visualHolder_mc:MovieClip;
      
      public var myText:String;
      
      public var closeCenterX:Number;
      
      public var closeSideX:Number;
      
      public var buttonY:Number;
      
      public var base:MovieClip;
      
      public var lvlUP:Boolean;
      
      public var cellSize:Number;
      
      public var statholderListPosY:Number;
      
      public var listOffsetY:Number;
      
      public var tabsList:horizontalList;
      
      public var charList:horizontalScrollList;
      
      public var primaryStatList:listDisplay;
      
      public var secondaryStatList:listDisplay;
      
      public var expStatList:listDisplay;
      
      public var infoStatList:listDisplay;
      
      public var resistanceStatList:listDisplay;
      
      public const statsElWidth:Number = 240;
      
      public var secELSpacing:Number;
      
      public var currentOpenPanel:Number;
      
      public var panelArray:Array;
      
      public var selectedTabY:Number;
      
      public var deselectedTabY:Number;
      
      public var selectedTabAlpha:Number;
      
      public var deselectedTabAlpha:Number;
      
      public var tabsArray:Array;
      
      public var pointsWarn:Array;
      
      public var pointTexts:Array;
      
      public var root_mc:MovieClip;
      
      public var gmSkillsString:String;
      
      public const tabTweenInTime:Number = 0.12;
      
      public const PointsFrameW:Number = 160;
      
      public const RightFrameW:Number = 304;
      
      public function stats_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.tabsArray = new Array();
         this.root_mc = root as MovieClip;
         this.title_txt.filters = this.equipment_txt.filters = this.charInfo_mc.selCharInfo_txt.filters = this.tabTitle_txt.filters = this.pointsFrame_mc.filters = textEffect.createStrokeFilter(0,1.4,2,1.8,3);
         this.charInfo_mc.renameBtn_mc.initialize("",this.renameCallback);
         this.charInfo_mc.renameBtn_mc.tooltip = this.root_mc.renameBtnTooltip;
         this.charInfo_mc.renameBtn_mc.SND_Press = "UI_GM_Generic_Click_Press";
         this.charInfo_mc.renameBtn_mc.SND_Click = "UI_GM_Generic_Click_Release";
         this.aiSel_mc.init(this.selectAI);
         this.alignments_mc.init(this.selectAlignment);
         this.alignments_mc.SND_Open = "UI_GM_Generic_Slide_Open";
         this.alignments_mc.SND_Close = "UI_GM_Generic_Slide_Close";
         this.alignments_mc.SND_Click = "UI_GM_Generic_Click";
         this.panelArray = new Array(this.mainStats_mc,this.combatAbilityHolder_mc,this.civicAbilityHolder_mc,this.talentHolder_mc,this.tagsHolder_mc,this.invTabHolder_mc,this.skillTabHolder_mc,this.visualHolder_mc,this.customStats_mc);
         this.pointsWarn = new Array(this.attrPointsWrn_mc,this.combatAbilityPointsWrn_mc,this.civilAbilityPointsWrn_mc,this.talentPointsWrn_mc);
         this.pointTexts = new Array(this.pointsFrame_mc.statPoints_txt,this.pointsFrame_mc.combatAbilPoints_txt,this.pointsFrame_mc.civilAbilPoints_txt,this.pointsFrame_mc.talentPoints_txt);
         this.bg_mc.mouseEnabled = false;
         this.bg_mc.mouseChildren = false;
         this.close_mc.onPressedFunction = this.closeUI;
         this.onePlayerOverlay_mc.visible = false;
         ExternalInterface.call("getStats");
         this.equip_mc.init();
         var _loc1_:uint = 0;
         while(_loc1_ < this.pointsWarn.length)
         {
            this.pointsWarn[_loc1_].visible = false;
            this.pointsWarn[_loc1_].stop();
            this.pointsWarn[_loc1_].mouseEnabled = false;
            this.pointsWarn[_loc1_].mouseChildren = false;
            this.pointsWarn[_loc1_].avPoints = 0;
            _loc1_++;
         }
         this.panelBg1_mc.gotoAndStop(1);
         this.panelBg2_mc.gotoAndStop(2);
         this.panelBg2_mc.visible = false;
         if(this.root_mc)
         {
            this.updateAllignments(this.root_mc.allignmentArray);
            this.root_mc.allignmentArray = new Array();
         }
         this.charInfo_mc.min_mc.callbackStr = "minLevel";
         this.charInfo_mc.plus_mc.callbackStr = "plusLevel";
         this.leftCycleBtn_mc.initButton(true);
         this.rightCycleBtn_mc.initButton(false);
         this.leftCycleBtn_mc.visible = false;
         this.rightCycleBtn_mc.visible = false;
         this.onePlayerOverlay_mc.mouseEnabled = false;
         this.currentOpenPanel = -1;
         this.buildTabs(0,true);
      }
      
      public function selectAI() : *
      {
         if(this.aiSel_mc.selectedItem != null)
         {
            ExternalInterface.call("selectAI",this.aiSel_mc.selectedItem.id);
         }
      }
      
      public function selectAlignment() : *
      {
         if(this.alignments_mc.selectedItem != null)
         {
            ExternalInterface.call("selectAlignment",this.alignments_mc.selectedItem.id);
         }
      }
      
      public function renameCallback() : *
      {
         ExternalInterface.call("renameCharacter");
      }
      
      public function updateInventorySlots(param1:Array) : *
      {
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         var _loc5_:uint = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_++];
            _loc4_ = param1[_loc2_++];
            _loc5_ = param1[_loc2_++];
            this.invTabHolder_mc.inventory.addItem(_loc3_,_loc4_,_loc5_);
         }
         this.invTabHolder_mc.inventory.cleanUpItems();
      }
      
      public function resetListPositions() : *
      {
      }
      
      public function buildTabs(param1:Number, param2:Boolean = false) : *
      {
         var _loc3_:uint = 0;
         var _loc6_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:MovieClip = null;
         _loc3_ = 0;
         while(_loc3_ < this.tabsArray.length)
         {
            _loc6_ = this.tabsArray[_loc3_];
            if(_loc6_ != null && _loc6_.tw != null)
            {
               _loc6_.tw.stop();
               _loc6_.tw = null;
            }
            _loc3_++;
         }
         this.tabsList.clearElements();
         this.tabsArray = new Array();
         _loc3_ = 0;
         switch(param1)
         {
            case 0:
               _loc3_ = 0;
               while(_loc3_ < 5)
               {
                  _loc7_ = new StatsTabButton();
                  _loc7_.id = _loc3_;
                  this.tabsArray.push(_loc7_);
                  _loc3_++;
               }
               this.tabsList.EL_SPACING = -10;
               break;
            case 1:
               _loc3_ = 0;
               while(_loc3_ < 9)
               {
                  if(_loc3_ < 4 || _loc3_ == 8)
                  {
                     _loc8_ = new StatsTabButton();
                     _loc8_.id = _loc3_;
                     this.tabsArray.push(_loc8_);
                  }
                  _loc3_++;
               }
               this.tabsList.EL_SPACING = -10;
               break;
            case 2:
               _loc3_ = 0;
               while(_loc3_ < 9)
               {
                  if(_loc3_ != 4)
                  {
                     _loc9_ = new StatsTabButtonGM();
                     _loc9_.id = _loc3_;
                     this.tabsArray.push(_loc9_);
                  }
                  _loc3_++;
               }
               this.tabsList.EL_SPACING = -15;
         }
         var _loc4_:* = this.currentOpenPanel;
         var _loc5_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < this.tabsArray.length)
         {
            this.tabsList.addElement(this.tabsArray[_loc3_],false);
            if(this.currentOpenPanel == this.tabsArray[_loc3_].id)
            {
               _loc5_ = _loc5_ || true;
            }
            _loc3_++;
         }
         this.tabsList.positionElements();
         this.initTabs(!_loc5_,param2);
         this.ClickTab(!!_loc5_?Number(_loc4_):Number(0));
         this.INTSetAvailablePointsVisible();
      }
      
      public function pushTabTooltip(param1:*, param2:*) : *
      {
         var _loc3_:uint = 0;
         while(_loc3_ < this.tabsArray.length)
         {
            if(this.tabsArray[_loc3_].id == param1)
            {
               this.tabsArray[_loc3_].tooltip = param2;
               return;
            }
            _loc3_++;
         }
      }
      
      public function initTabs(param1:Boolean = false, param2:Boolean = false) : *
      {
         var _loc4_:uint = 0;
         var _loc5_:Number = NaN;
         if(param2)
         {
            _loc4_ = 0;
            while(_loc4_ < this.panelArray.length)
            {
               this.panelArray[_loc4_].visible = false;
               if(param1 && this.panelArray[_loc4_].init != null)
               {
                  this.panelArray[_loc4_].init();
               }
               if(this.panelArray[_loc4_].list)
               {
                  this.panelArray[_loc4_].list.enableMouseWheelOnOver = true;
                  this.panelArray[_loc4_].list.m_scrollbar_mc.visible = false;
                  this.panelArray[_loc4_].list.m_scrollbar_mc.disabled = false;
                  this.panelArray[_loc4_].list.m_scrollbar_mc.m_hideWhenDisabled = true;
               }
               _loc4_++;
            }
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.tabsArray.length)
         {
            _loc5_ = this.tabsArray[_loc3_].id;
            if((root as MovieClip).tabsTexts.length > _loc5_)
            {
               this.tabsArray[_loc3_].tooltip = (root as MovieClip).tabsTexts[_loc5_];
            }
            this.tabsArray[_loc3_].icon_mc.gotoAndStop(_loc5_ + 1);
            this.tabsArray[_loc3_].pressedFunc = this.ClickTab;
            if(_loc3_ == this.currentOpenPanel)
            {
               this.panelArray[_loc3_].visible = true;
               this.tabsArray[_loc3_].icon_mc.y = this.selectedTabY;
               this.tabsArray[_loc3_].tw = new larTween(this.tabsArray[_loc3_].icon_mc,"alpha",Sine.easeOut,this.tabsArray[_loc3_].icon_mc.alpha,this.selectedTabAlpha,this.tabTweenInTime);
               this.tabsArray[_loc3_].texty = this.selectedTabY;
               this.tabsArray[_loc3_].setActive(true);
               this.tabTitle_txt.htmlText = this.panelArray[_loc5_].labelStr;
               textHelpers.smallCaps(this.tabTitle_txt);
            }
            else
            {
               this.panelArray[_loc3_].visible = false;
               this.tabsArray[_loc3_].icon_mc.y = this.deselectedTabY;
               this.tabsArray[_loc3_].tw = new larTween(this.tabsArray[_loc3_].icon_mc,"alpha",Sine.easeOut,this.tabsArray[_loc3_].icon_mc.alpha,this.deselectedTabAlpha,this.tabTweenInTime);
               this.tabsArray[_loc3_].texty = this.deselectedTabY;
               this.tabsArray[_loc3_].setActive(false);
            }
            _loc3_++;
         }
         this.pointsFrame_mc.setTab(this.currentOpenPanel);
      }
      
      public function selectCharacter(param1:Number) : *
      {
         var _loc2_:MovieClip = this.charList.getElementByNumber("id",param1);
         if(_loc2_)
         {
            this.charList.selectMC(_loc2_,true);
            this.invTabHolder_mc.inventory.id = param1;
         }
         if(this.aiSel_mc.visible && this.aiSel_mc.m_isOpen)
         {
            this.aiSel_mc.close();
         }
         if(this.alignments_mc.visible && this.alignments_mc.m_isOpen)
         {
            this.alignments_mc.close();
         }
      }
      
      public function addCharPortrait(param1:Number, param2:String, param3:uint) : *
      {
         var _loc4_:MovieClip = this.charList.getElementByNumber("id",param1);
         if(!_loc4_)
         {
            _loc4_ = new charPortrait();
            _loc4_.init();
            _loc4_.id = param1;
            this.charList.addElement(_loc4_,false);
            _loc4_.frame_mc.gotoAndStop(3);
         }
         if(_loc4_)
         {
            _loc4_.order = param3;
            _loc4_.hasUpdated = true;
            _loc4_.setIcon("p" + param2);
         }
      }
      
      public function cleanupCharListObsoletes() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.charList.length)
         {
            _loc2_ = this.charList.getAt(_loc1_);
            if(_loc2_ && _loc2_.hasUpdated)
            {
               _loc2_.hasUpdated = false;
               _loc1_++;
            }
            else
            {
               this.charList.removeElement(_loc1_,false);
            }
         }
         this.charList.sortOnce(["order"],[Array.NUMERIC]);
      }
      
      public function removeChildrenOf(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         if(param1.numChildren != 0)
         {
            _loc2_ = param1.numChildren;
            while(_loc2_ > 0)
            {
               _loc2_--;
               param1.removeChildAt(_loc2_);
            }
         }
      }
      
      public function ClickTab(param1:Number) : *
      {
         var _loc2_:MovieClip = null;
         if(this.currentOpenPanel != param1)
         {
            if(this.currentOpenPanel != -1)
            {
               if(this.panelArray[this.currentOpenPanel])
               {
                  this.panelArray[this.currentOpenPanel].visible = false;
                  if(this.panelArray[this.currentOpenPanel].list)
                  {
                     if(this.panelArray[this.currentOpenPanel].list.m_scrollbar_mc)
                     {
                        this.panelArray[this.currentOpenPanel].list.m_scrollbar_mc.visible = false;
                     }
                  }
               }
               _loc2_ = this.getTabById(this.currentOpenPanel);
               if(_loc2_)
               {
                  _loc2_.setActive(false);
                  _loc2_.icon_mc.y = this.deselectedTabY;
                  _loc2_.icon_mc.alpha = this.deselectedTabAlpha;
                  _loc2_.texty = this.deselectedTabY;
               }
            }
            if(param1 != -1)
            {
               if(this.panelArray[param1])
               {
                  this.panelArray[param1].visible = true;
                  if(this.panelArray[param1].list && this.panelArray[param1].list.m_scrollbar_mc)
                  {
                     this.panelArray[param1].list.m_scrollbar_mc.visible = true;
                     this.panelArray[param1].list.m_scrollbar_mc.scrollbarVisible();
                  }
               }
               this.selectTab(param1);
            }
            this.panelBg1_mc.visible = param1 < 5 || param1 == 6;
            this.panelBg2_mc.visible = param1 == 5;
            if(param1 == 5)
            {
               this.panelBg2_mc.gotoAndStop(2);
            }
            this.currentOpenPanel = param1;
            this.INTSetAvailablePointsVisible();
            this.pointsFrame_mc.setTab(this.currentOpenPanel);
         }
         ExternalInterface.call("selectedTab",this.currentOpenPanel);
      }
      
      public function selectTab(param1:Number) : *
      {
         var _loc2_:MovieClip = this.getTabById(param1);
         if(_loc2_)
         {
            _loc2_.setActive(true);
            _loc2_.icon_mc.y = this.selectedTabY;
            _loc2_.icon_mc.alpha = this.selectedTabAlpha;
            _loc2_.texty = this.selectedTabY;
            this.tabTitle_txt.htmlText = this.panelArray[param1].labelStr;
            textHelpers.smallCaps(this.tabTitle_txt);
         }
      }
      
      public function getTabById(param1:Number) : MovieClip
      {
         var _loc2_:MovieClip = null;
         var _loc3_:uint = 0;
         while(_loc3_ < this.tabsArray.length)
         {
            if(this.tabsArray[_loc3_].id == param1)
            {
               _loc2_ = this.tabsArray[_loc3_];
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setPanelTitle(param1:Number, param2:String) : *
      {
         this.panelArray[param1].title_txt.htmlText = param2;
      }
      
      public function resetScrollBarsPositions() : *
      {
         this.combatAbilityHolder_mc.list.m_scrollbar_mc.resetContentPosition();
         this.civicAbilityHolder_mc.list.m_scrollbar_mc.resetContentPosition();
         this.talentHolder_mc.list.m_scrollbar_mc.resetContentPosition();
         this.tagsHolder_mc.list.m_scrollbar_mc.resetContentPosition();
      }
      
      public function INTSetWarnAndPoints(param1:Number, param2:Number) : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:TextField = null;
         var _loc5_:MovieClip = null;
         if(!(root as MovieClip).isGameMasterChar)
         {
            _loc3_ = this.pointsWarn[param1];
            _loc4_ = this.pointTexts[param1];
            if(_loc3_ && _loc4_)
            {
               _loc4_.htmlText = param2 + "";
               textHelpers.smallCaps(_loc4_);
               _loc4_.x = this.pointsFrame_mc.label_txt.x + this.pointsFrame_mc.label_txt.textWidth + 8;
               this.pointsFrame_mc.x = this.PointsFrameW - Math.round((_loc4_.x + _loc4_.textWidth) * 0.5);
               _loc3_.visible = param2 != 0;
               _loc3_.avPoints = param2;
               if(_loc3_.visible)
               {
                  _loc3_.play();
               }
               else
               {
                  _loc3_.stop();
               }
               if(this.currentOpenPanel == param1)
               {
                  this.INTSetAvailablePointsVisible();
               }
            }
         }
         else
         {
            _loc5_ = this.pointsWarn[param1];
            if(_loc5_)
            {
               _loc5_.stop();
               _loc5_.visible = false;
            }
         }
      }
      
      public function INTSetAvailablePointsVisible() : *
      {
         if(this.currentOpenPanel >= 0 && this.currentOpenPanel < this.pointsWarn.length)
         {
            this.pointsFrame_mc.visible = this.pointsWarn[this.currentOpenPanel].visible;
         }
         else
         {
            this.pointsFrame_mc.visible = false;
         }
         this.tabTitle_txt.visible = !this.pointsFrame_mc.visible;
      }
      
      public function setAvailableStatPoints(param1:Number) : *
      {
         this.INTSetWarnAndPoints(0,param1);
      }
      
      public function setAvailableCombatAbilityPoints(param1:Number) : *
      {
         this.INTSetWarnAndPoints(1,param1);
      }
      
      public function setAvailableCivilAbilityPoints(param1:Number) : *
      {
         this.INTSetWarnAndPoints(2,param1);
      }
      
      public function setAvailableTalentPoints(param1:Number) : *
      {
         this.INTSetWarnAndPoints(3,param1);
      }
      
      public function setVisibilityStatButtons(param1:Boolean) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:uint = 0;
         while(_loc2_ < this.primaryStatList.length)
         {
            _loc3_ = this.primaryStatList.content_array[_loc2_];
            if(_loc3_)
            {
               _loc3_.plus_mc.visible = param1;
               _loc3_.minus_mc.visible = param1;
            }
            _loc2_++;
         }
      }
      
      public function setStatPlusVisible(param1:Number, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.getStat(param1);
         if(_loc3_)
         {
            _loc3_.plus_mc.visible = param2;
         }
      }
      
      public function setStatMinusVisible(param1:Number, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.getStat(param1);
         if(_loc3_)
         {
            _loc3_.minus_mc.visible = param2;
         }
      }
      
      public function setupSecondaryStatsButtons(param1:int, param2:Boolean, param3:Boolean, param4:Boolean, param5:Number = 5) : void
      {
         var _loc6_:MovieClip = this.getSecStat(param1);
         if(_loc6_.setupButtons != null)
         {
            _loc6_.setupButtons(param2,param3,param4,param5);
         }
         else
         {
            _loc6_.minus_mc.visible = param3;
            _loc6_.plus_mc.visible = param4;
         }
      }
      
      public function getStat(param1:Number) : MovieClip
      {
         return this.primaryStatList.getElementByNumber("statId",param1);
      }
      
      public function getSecStat(param1:Number) : MovieClip
      {
         var _loc2_:MovieClip = this.resistanceStatList.getElementByNumber("statId",param1);
         if(_loc2_ == null)
         {
            _loc2_ = this.secondaryStatList.getElementByNumber("statId",param1);
         }
         if(_loc2_ == null)
         {
            _loc2_ = this.infoStatList.getElementByNumber("statId",param1);
         }
         if(_loc2_ == null)
         {
            _loc2_ = this.expStatList.getElementByNumber("statId",param1);
         }
         return _loc2_;
      }
      
      public function getAbility(param1:Boolean, param2:Number, param3:Number) : MovieClip
      {
         var _loc4_:MovieClip = this.combatAbilityHolder_mc;
         if(param1)
         {
            _loc4_ = this.civicAbilityHolder_mc;
         }
         var _loc5_:MovieClip = _loc4_.list.getElementByNumber("groupId",param2);
         if(_loc5_)
         {
            return _loc5_.list.getElementByNumber("statId",param3);
         }
         return null;
      }
      
      public function getTalent(param1:Number) : MovieClip
      {
         return this.talentHolder_mc.list.getElementByNumber("statId",param1);
      }
      
      public function getTag(param1:Number) : MovieClip
      {
         return this.tagsHolder_mc.list.getElementByNumber("statId",param1);
      }
      
      public function setVisibilityAbilityButtons(param1:Boolean, param2:Boolean) : *
      {
         var _loc4_:uint = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:uint = 0;
         var _loc7_:MovieClip = null;
         var _loc3_:MovieClip = this.combatAbilityHolder_mc;
         if(param1)
         {
            _loc3_ = this.civicAbilityHolder_mc;
         }
         if(_loc3_.list.content_array)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.list.length)
            {
               _loc5_ = _loc3_.list.getAt(_loc4_);
               _loc6_ = 0;
               while(_loc6_ < _loc5_.list.length)
               {
                  _loc7_ = _loc5_.list.getAt(_loc6_);
                  if(_loc7_)
                  {
                     _loc7_.texts_mc.plus_mc.visible = param2;
                     _loc7_.texts_mc.minus_mc.visible = param2;
                  }
                  _loc6_++;
               }
               _loc4_++;
            }
         }
      }
      
      public function setAbilityPlusVisible(param1:Boolean, param2:Number, param3:Number, param4:Boolean) : *
      {
         var _loc5_:MovieClip = this.getAbility(param1,param2,param3);
         if(_loc5_)
         {
            _loc5_.texts_mc.plus_mc.visible = param4;
         }
      }
      
      public function setAbilityMinusVisible(param1:Boolean, param2:Number, param3:Number, param4:Boolean) : *
      {
         var _loc5_:MovieClip = this.getAbility(param1,param2,param3);
         if(_loc5_)
         {
            _loc5_.texts_mc.minus_mc.visible = param4;
         }
      }
      
      public function setVisibilityTalentButtons(param1:Boolean) : *
      {
         var _loc2_:uint = 0;
         while(_loc2_ < this.talentHolder_mc.list.length)
         {
            if(this.talentHolder_mc.list.content_array[_loc2_])
            {
               this.talentHolder_mc.list.content_array[_loc2_].plus_mc.visible = param1;
               this.talentHolder_mc.list.content_array[_loc2_].minus_mc.visible = param1;
            }
            _loc2_++;
         }
      }
      
      public function setTalentPlusVisible(param1:Number, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.getTalent(param1);
         if(_loc3_)
         {
            _loc3_.plus_mc.visible = param2;
         }
      }
      
      public function setTalentMinusVisible(param1:Number, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.getTalent(param1);
         if(_loc3_)
         {
            _loc3_.minus_mc.visible = param2;
         }
      }
      
      public function addText(param1:String, param2:String, param3:Boolean) : *
      {
         var _loc4_:MovieClip = new Text();
         _loc4_.label_txt.autoSize = "left";
         _loc4_.label_txt.htmlText = param1;
         _loc4_.tooltip = param2;
         if(param3)
         {
            this.secondaryStatList.addElement(_loc4_);
         }
         else
         {
            this.primaryStatList.addElement(_loc4_);
         }
      }
      
      public function addSpacing(param1:Number, param2:Number) : *
      {
         var _loc3_:MovieClip = new Spacing();
         _loc3_.height = param2;
         _loc3_.heightOverride = param2;
         this.addToListWithId(param1,_loc3_);
      }
      
      public function addAbilityGroup(param1:Boolean, param2:Number, param3:String) : *
      {
         var _loc4_:MovieClip = this.combatAbilityHolder_mc;
         if(param1)
         {
            _loc4_ = this.civicAbilityHolder_mc;
         }
         _loc4_.list.addGroup(param2,param3);
      }
      
      public function addAbility(param1:Boolean, param2:Number, param3:Number, param4:String, param5:String, param6:String, param7:String) : *
      {
         var _loc9_:MovieClip = null;
         var _loc8_:MovieClip = this.getAbility(param1,param2,param3);
         if(!_loc8_)
         {
            _loc9_ = this.combatAbilityHolder_mc;
            if(param1)
            {
               _loc9_ = this.civicAbilityHolder_mc;
            }
            _loc8_ = new AbilityEl();
            _loc8_.isCivil = param1;
            _loc9_.list.addGroupElement(param2,_loc8_,false);
            _loc8_.texts_mc.plus_mc.visible = false;
            _loc8_.texts_mc.minus_mc.visible = false;
            _loc8_.texts_mc.statId = param3;
            _loc8_.statId = param3;
            _loc8_.tooltip = param3;
            _loc8_.texts_mc.id = _loc9_.list.length;
            _loc8_.texts_mc.plus_mc.currentTooltip = "";
            _loc8_.texts_mc.minus_mc.currentTooltip = "";
            _loc8_.texts_mc.label_txt.autoSize = TextFieldAutoSize.LEFT;
         }
         _loc8_.texts_mc.plus_mc.tooltip = param6;
         _loc8_.texts_mc.minus_mc.tooltip = param7;
         if(_loc8_.texts_mc.plus_mc.currentTooltip != "" && _loc8_.texts_mc.plus_mc.currentTooltip != param6)
         {
            ExternalInterface.call("showTooltip",param6);
            _loc8_.texts_mc.plus_mc.currentTooltip = param6;
         }
         if(_loc8_.texts_mc.minus_mc.currentTooltip != "" && _loc8_.texts_mc.minus_mc.currentTooltip != param7)
         {
            ExternalInterface.call("showTooltip",param7);
            _loc8_.texts_mc.plus_mc.currentTooltip = param7;
         }
         _loc8_.texts_mc.label_txt.htmlText = param4;
         _loc8_.texts_mc.text_txt.htmlText = param5;
         _loc8_.textStr = _loc8_.texts_mc.label_txt.text;
         _loc8_.am = Number(_loc8_.texts_mc.text_txt.text);
         _loc8_.texts_mc.statBasePoints = Number(param5);
         _loc8_.texts_mc.statPoints = 0;
         _loc8_.hl_mc.height = _loc8_.abilTooltip_mc.height = _loc8_.texts_mc.label_txt.y + _loc8_.texts_mc.label_txt.textHeight - _loc8_.hl_mc.y;
         _loc8_.texts_mc.text_txt.y = Math.round((_loc8_.hl_mc.height - _loc8_.texts_mc.text_txt.textHeight) * 0.5);
      }
      
      public function recountAbilityPoints(param1:Boolean) : *
      {
         var _loc3_:uint = 0;
         var _loc4_:MovieClip = null;
         var _loc5_:listDisplay = null;
         var _loc6_:Number = NaN;
         var _loc7_:uint = 0;
         var _loc2_:MovieClip = this.combatAbilityHolder_mc;
         if(param1)
         {
            _loc2_ = this.civicAbilityHolder_mc;
         }
         if(_loc2_.list.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.list.length)
            {
               _loc4_ = _loc2_.list.content_array[_loc3_];
               if(_loc4_ && _loc4_.list)
               {
                  _loc5_ = _loc4_.list;
                  _loc6_ = 0;
                  _loc7_ = 0;
                  while(_loc7_ < _loc5_.length)
                  {
                     _loc6_ = _loc6_ + _loc5_.content_array[_loc7_].am;
                     _loc7_++;
                  }
               }
               _loc4_.amount_txt.htmlText = _loc6_;
               _loc3_++;
            }
         }
      }
      
      public function addTalent(param1:String, param2:Number, param3:Number) : *
      {
         var _loc4_:MovieClip = this.getTalent(param2);
         if(!_loc4_)
         {
            _loc4_ = new Talent();
            _loc4_.label_txt.autoSize = "left";
            _loc4_.tooltip = param2;
            _loc4_.statId = param2;
            _loc4_.minus_mc.x = 260;
            _loc4_.plus_mc.x = _loc4_.minus_mc.x + _loc4_.minus_mc.width;
            _loc4_.plus_mc.visible = _loc4_.minus_mc.visible = false;
            _loc4_.id = this.talentHolder_mc.list.length;
            this.talentHolder_mc.list.addElement(_loc4_,false);
         }
         _loc4_.label_txt.htmlText = param1;
         _loc4_.hl_mc.width = this.statsElWidth;
         _loc4_.hl_mc.height = _loc4_.label_txt.textHeight + _loc4_.label_txt.y;
         _loc4_.plus_mc.y = _loc4_.minus_mc.y = _loc4_.hl_mc.y + Math.ceil((_loc4_.hl_mc.height - _loc4_.minus_mc.height) * 0.5) - 3;
         _loc4_.label = _loc4_.label_txt.text;
         _loc4_.talentState = param3;
         _loc4_.bullet_mc.gotoAndStop(this.getTalentStateFrame(param3));
      }
      
      public function getTalentStateFrame(param1:Number) : Number
      {
         switch(param1)
         {
            case 0:
               return 2;
            case 1:
               return 3;
            case 2:
               return 1;
            case 3:
               return 1;
            default:
               return 1;
         }
      }
      
      public function addPrimaryStat(param1:Number, param2:String, param3:String, param4:Number) : *
      {
         var _loc5_:MovieClip = new Stat();
         _loc5_.tooltipAlign = "right";
         _loc5_.hl_mc.alpha = 0;
         _loc5_.plus_mc.visible = false;
         _loc5_.minus_mc.visible = false;
         _loc5_.label_txt.autoSize = TextFieldAutoSize.LEFT;
         _loc5_.label_txt.htmlText = param2;
         _loc5_.text_txt.htmlText = param3;
         _loc5_.text_txt.width = _loc5_.text_txt.width + 8;
         _loc5_.statBasePoints = Number(param3);
         _loc5_.statPoints = 0;
         _loc5_.tooltip = param4;
         _loc5_.statId = param1;
         _loc5_.hl_mc.width = this.statsElWidth;
         _loc5_.text_txt.mouseEnabled = false;
         _loc5_.label_txt.mouseEnabled = false;
         _loc5_.heightOverride = 26;
         _loc5_.icon_mc.gotoAndStop(param1 + 1);
         _loc5_.id = this.primaryStatList.length;
         this.primaryStatList.addElement(_loc5_);
      }
      
      public function addSecondaryStat(param1:Number, param2:String, param3:String, param4:Number, param5:Number, param6:Number) : *
      {
         var _loc11_:larTween = null;
         var _loc7_:Number = 28;
         var _loc8_:Number = this.statsElWidth;
         var _loc9_:MovieClip = null;
         if(param1 == 0)
         {
            _loc8_ = this.statsElWidth;
            _loc9_ = new InfoStat();
         }
         else
         {
            _loc9_ = new SecStat();
            if(param1 != 2)
            {
               _loc9_.heightOverride = 26;
            }
         }
         _loc9_.boostValue = param6;
         _loc9_.hl_mc.alpha = 0;
         _loc9_.texts_mc.label_txt.autoSize = TextFieldAutoSize.LEFT;
         _loc9_.texts_mc.label_txt.htmlText = param2;
         _loc9_.icon_mc.visible = Boolean(param5 != 0);
         if(_loc9_.minus_mc != null)
         {
            _loc9_.minus_mc.visible = false;
         }
         if(_loc9_.plus_mc != null)
         {
            _loc9_.plus_mc.visible = false;
         }
         if(_loc9_.editText_txt != null)
         {
            _loc9_.editText_txt.visible = false;
         }
         _loc9_.texts_mc.text_txt.autoSize = TextFieldAutoSize.RIGHT;
         if(param1 == 0)
         {
            _loc9_.icon_mc.x = 3;
            _loc7_ = 48;
         }
         else if(param1 == 2)
         {
            _loc9_.icon_mc.x = 5;
            _loc9_.icon_mc.y = 5;
            _loc9_.icon_mc.x = -23;
            _loc8_ = _loc8_ + 28;
         }
         else if(param5 != 0)
         {
            _loc9_.icon_mc.x = -23;
            _loc8_ = _loc8_ + 28;
         }
         _loc9_.tooltipAlign = "right";
         _loc9_.hl_mc.width = _loc8_ + 8;
         _loc9_.widthOverride = _loc9_.hl_mc.width;
         _loc9_.texts_mc.text_txt.htmlText = param3;
         _loc9_.texts_mc.text_txt.width = _loc9_.texts_mc.text_txt.width + 8;
         _loc9_.texts_mc.mouseEnabled = false;
         _loc9_.icon_mc.mouseEnabled = false;
         _loc9_.texts_mc.text_txt.mouseEnabled = false;
         _loc9_.texts_mc.label_txt.mouseEnabled = false;
         _loc9_.texts_mc.statBasePoints = Number(param3);
         _loc9_.texts_mc.statPoints = 0;
         _loc9_.tooltip = param4;
         _loc9_.statId = param4;
         _loc9_.hl_mc.height = Math.round(_loc9_.texts_mc.height - 4);
         var _loc10_:Number = _loc8_;
         if(param5 != 0)
         {
            _loc10_ = _loc8_ - _loc7_;
         }
         if(_loc9_.texts_mc.text_txt.width > _loc10_ - _loc9_.texts_mc.label_txt.width)
         {
            _loc9_.texts_mc.text_txt.scaleX = 0.82;
            _loc9_.texts_mc.text_txt.scaleY = 0.82;
            _loc9_.texts_mc.text_txt.y = _loc9_.texts_mc.text_txt.y + 2;
         }
         this.addToListWithId(param1,_loc9_);
         if(param5 != 0)
         {
            _loc9_.icon_mc.gotoAndStop(param5);
            _loc9_.texts_mc.x = _loc9_.icon_mc.x + _loc7_ - 3;
            if((root as MovieClip).initDone)
            {
               _loc9_.icon_mc.alpha = 1;
            }
            else
            {
               _loc11_ = new larTween(_loc9_.icon_mc,"alpha",Sine.easeOut,_loc9_.icon_mc.alpha,1,0.1);
            }
            _loc9_.texts_mc.text_txt.x = _loc8_ - _loc7_ - _loc9_.texts_mc.text_txt.width;
         }
         else
         {
            _loc9_.texts_mc.text_txt.x = _loc8_ - _loc9_.texts_mc.text_txt.width;
         }
      }
      
      public function addTag(param1:String, param2:Number, param3:String, param4:String) : *
      {
         if(param1.length == 0)
         {
            return;
         }
         var _loc5_:MovieClip = this.getTag(param2);
         if(!_loc5_)
         {
            _loc5_ = new TagMC();
            _loc5_.label_txt.autoSize = "left";
            _loc5_.statId = param2;
            _loc5_.x = 40;
            _loc5_.id = this.tagsHolder_mc.list.length;
            this.tagsHolder_mc.list.addElement(_loc5_,false);
         }
         _loc5_.setTag(param1,1,param3,param4);
         _loc5_.label_txt.htmlText = param1;
      }
      
      public function addToListWithId(param1:Number, param2:MovieClip) : *
      {
         if(param1 == 0)
         {
            this.infoStatList.addElement(param2);
         }
         else if(param1 == 1)
         {
            this.secondaryStatList.addElement(param2);
         }
         else if(param1 == 2)
         {
            this.resistanceStatList.addElement(param2);
         }
         else if(param1 == 3)
         {
            this.expStatList.addElement(param2);
         }
      }
      
      public function clearSecondaryStats() : *
      {
         this.secondaryStatList.clearElements();
         this.expStatList.clearElements();
      }
      
      public function addTitle(param1:String) : *
      {
         var _loc2_:MovieClip = new Title();
         _loc2_.title_txt.autoSize = "left";
         _loc2_.title_txt.htmlText = param1;
         this.primaryStatList.addElement(_loc2_);
      }
      
      public function clearStats() : *
      {
         this.primaryStatList.clearElements();
         this.secondaryStatList.clearElements();
         this.expStatList.clearElements();
         this.infoStatList.clearElements();
         this.resistanceStatList.clearElements();
      }
      
      public function clearAbilities() : *
      {
         this.combatAbilityHolder_mc.list.clearGroupElements();
         this.civicAbilityHolder_mc.list.clearGroupElements();
      }
      
      public function addVisual(param1:String, param2:Number) : *
      {
         var _loc3_:MovieClip = this.getVisual(param2);
         if(!_loc3_)
         {
            _loc3_ = new Visual();
            _loc3_.title_txt.autoSize = "center";
            _loc3_.contentID = param2;
            _loc3_.id = this.visualHolder_mc.list.length;
            this.visualHolder_mc.list.addElement(_loc3_);
            this.root_mc = root as MovieClip;
            _loc3_.onInit(this.root_mc);
         }
         _loc3_.title_txt.htmlText = param1;
      }
      
      public function clearVisualOptions() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.visualHolder_mc.list.length)
         {
            _loc2_ = this.visualHolder_mc.list.content_array[_loc1_];
            _loc2_.clearOptions();
            _loc2_.setEnabled(false);
            _loc1_++;
         }
      }
      
      public function addVisualOption(param1:Number, param2:Number, param3:Boolean) : *
      {
         var _loc5_:String = null;
         var _loc4_:MovieClip = this.getVisual(param1);
         if(_loc4_)
         {
            _loc5_ = _loc4_.title_txt.text + " " + param2;
            _loc4_.addOption(param2,_loc5_);
            _loc4_.setEnabled(true);
            if(param3)
            {
               _loc4_.selectOption(param2);
            }
         }
      }
      
      public function getVisual(param1:Number) : MovieClip
      {
         return this.visualHolder_mc.list.getElementByNumber("contentID",param1);
      }
      
      public function clearCustomStatsOptions() : *
      {
         this.customStats_mc.list.clearElements();
      }
      
      public function addCustomStat(param1:Number, param2:String, param3:String) : *
      {
         var _loc4_:MovieClip = new CustomStat();
         _loc4_.hl_mc.alpha = 0;
         var _loc5_:Boolean = (root as MovieClip).isGameMasterChar;
         _loc4_.plus_mc.visible = _loc5_;
         _loc4_.minus_mc.visible = _loc5_;
         _loc4_.edit_mc.visible = _loc5_;
         _loc4_.delete_mc.visible = _loc5_;
         _loc4_.label_txt.autoSize = TextFieldAutoSize.NONE;
         _loc4_.label_txt.htmlText = param2;
         _loc4_.text_txt.htmlText = param3;
         _loc4_.text_txt.width = _loc4_.text_txt.width + 8;
         _loc4_.tooltipAlign = "right";
         _loc4_.statId = param1;
         _loc4_.hl_mc.width = this.statsElWidth;
         _loc4_.text_txt.mouseEnabled = false;
         _loc4_.label_txt.mouseEnabled = false;
         _loc4_.heightOverride = 26;
         _loc4_.id = this.customStats_mc.list.length;
         _loc4_.init();
         this.customStats_mc.list.addElement(_loc4_);
      }
      
      public function justEatClick(param1:MouseEvent) : *
      {
      }
      
      public function onBGOut(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this.onBGOut);
         }
      }
      
      public function closeUIOnClick(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this.onBGOut);
            this.closeUI();
         }
      }
      
      public function closeUI() : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Inventory_Click");
         ExternalInterface.call("closeCharacterUIs");
         stage.focus = null;
      }
      
      public function addIcon(param1:MovieClip, param2:String, param3:Number) : *
      {
         var _loc5_:Bitmap = null;
         if(param2 != param1.texture)
         {
            _loc5_ = param1.getChildByName("img") as Bitmap;
            if(_loc5_ != null)
            {
               param1.removeChild(_loc5_);
            }
            if(param2 != "")
            {
               _loc5_ = new Bitmap(new bitmapPlaceholder(1,1));
               _loc5_.name = "img";
               param1.addChild(_loc5_);
               IggyFunctions.setTextureForBitmap(_loc5_,param2);
               if(_loc5_.width > _loc5_.height)
               {
                  _loc5_.width = param3;
                  _loc5_.scaleY = _loc5_.scaleX;
               }
               else
               {
                  _loc5_.height = param3;
                  _loc5_.scaleX = _loc5_.scaleY;
               }
            }
         }
         param1.texture = param2;
         param1.alpha = 0;
         param1.visible = true;
         var _loc4_:larTween = new larTween(param1,"alpha",Sine.easeOut,param1.alpha,1,0.8);
      }
      
      public function updateAIs(param1:Array) : *
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc6_:MovieClip = null;
         this.aiSel_mc.removeAll();
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_++];
            _loc4_ = param1[_loc2_++];
            _loc5_ = this.aiSel_mc.selectItemByID(_loc3_);
            if(!_loc5_)
            {
               _loc6_ = new comboElement();
               _loc6_.id = _loc3_;
               _loc6_.label = _loc4_;
               this.aiSel_mc.addItem(_loc6_);
            }
         }
      }
      
      public function updateAllignments(param1:Array) : *
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         this.alignments_mc.removeAll();
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_++];
            _loc4_ = param1[_loc2_++];
            _loc5_ = this.alignments_mc.selectItemByID(_loc3_);
            if(!_loc5_)
            {
               _loc5_ = new comboElement();
               _loc5_.id = _loc3_;
               _loc5_.label = _loc4_;
               _loc5_.allignID = _loc3_;
               _loc5_.labelStr = _loc5_.text_txt.htmlText = _loc4_;
               this.alignments_mc.addItem(_loc5_);
            }
         }
      }
      
      public function recheckScrollbarVisibility() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.panelArray.length)
         {
            if(this.panelArray[_loc1_].list)
            {
               this.panelArray[_loc1_].list.mouseWheelWhenOverEnabled = Boolean(_loc1_ == this.currentOpenPanel);
               if(_loc1_ == this.currentOpenPanel)
               {
                  this.panelArray[_loc1_].list.m_scrollbar_mc.scrollbarVisible();
               }
               else
               {
                  this.panelArray[_loc1_].list.m_scrollbar_mc.visible = false;
               }
            }
            _loc1_++;
         }
      }
      
      function frame1() : *
      {
         LSPanelHelpers.makeDraggable(this.dragHit_mc);
         this.myText = "";
         this.closeCenterX = 145;
         this.closeSideX = 82;
         this.buttonY = 605;
         this.base = root as MovieClip;
         this.lvlUP = false;
         this.pointsFrame_mc.mouseEnabled = false;
         this.cellSize = 64;
         this.statholderListPosY = 305;
         this.listOffsetY = 15;
         this.tabsList = new horizontalList();
         this.charList = new horizontalScrollList("empty","empty","empty","empty");
         this.primaryStatList = new listDisplay();
         this.secondaryStatList = new listDisplay();
         this.expStatList = new listDisplay();
         this.infoStatList = new listDisplay();
         this.resistanceStatList = new listDisplay();
         this.charList.m_customElementWidth = 92;
         this.charList.EL_SPACING = 2;
         this.primaryStatList.EL_SPACING = 0;
         this.secELSpacing = 2;
         this.secondaryStatList.EL_SPACING = this.secELSpacing;
         this.expStatList.EL_SPACING = this.secELSpacing;
         this.infoStatList.EL_SPACING = 4;
         this.resistanceStatList.EL_SPACING = 0;
         this.charList.EL_SPACING = 0;
         this.charList.setFrame(368,124);
         this.charList.m_cyclic = true;
         this.charList.m_autoCenter = false;
         this.tabsList.EL_SPACING = 0;
         this.expStatList.y = 240;
         this.mainStats_mc.secStatHolder_mc.addChild(this.secondaryStatList);
         this.mainStats_mc.secStatHolder_mc.addChild(this.expStatList);
         this.mainStats_mc.statHolder_mc.addChild(this.primaryStatList);
         this.equip_mc.infoStatHolder_mc.addChild(this.infoStatList);
         this.mainStats_mc.resistancesStatHolder_mc.addChild(this.resistanceStatList);
         this.charList_mc.addChild(this.charList);
         this.tabsHolder_mc.addChild(this.tabsList);
         this.infoStatList.m_customElementHeight = 22;
         this.resistanceStatList.m_customElementHeight = 30;
         this.selectedTabY = 23;
         this.deselectedTabY = 21;
         this.selectedTabAlpha = 1;
         this.deselectedTabAlpha = 0.8;
         this.bg_mc.mouseChildren = false;
         this.bg_mc.mouseEnabled = false;
         this.title_txt.mouseEnabled = false;
         this.equipment_txt.mouseEnabled = false;
         this.charInfo_mc.selCharInfo_txt.mouseEnabled = false;
         this.hitArea_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.justEatClick);
         this.hitArea_mc.addEventListener(MouseEvent.MOUSE_UP,this.justEatClick);
      }
   }
}