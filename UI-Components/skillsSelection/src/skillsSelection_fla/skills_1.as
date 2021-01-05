package skillsSelection_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.scrollList;
   import LS_Classes.textEffect;
   import com.flashdynamix.motion.TweensyZero;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class skills_1 extends MovieClip
   {
       
      
      public var accept_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public var bottomTitle_txt:TextField;
      
      public var chosenSkillContainer_mc:MovieClip;
      
      public var close_mc:MovieClip;
      
      public var emptySlot1_mc:MovieClip;
      
      public var emptySlot2_mc:MovieClip;
      
      public var emptySlot3_mc:MovieClip;
      
      public var iggy_chosenSkills:MovieClip;
      
      public var iggy_icon_Container:IggyCont;
      
      public var noSkills_txt:TextField;
      
      public var reset_mc:deleteBtn;
      
      public var scrollbarBG_mc:MovieClip;
      
      public var skillContainer_mc:MovieClip;
      
      public var topTitle_txt:TextField;
      
      public var currentAP:Number;
      
      public var currentFilter:Number;
      
      public var chosenSkillList:horizontalList;
      
      public var skillList:scrollList;
      
      public var base:MovieClip;
      
      public var SkillIconSize:Number;
      
      public var SkillSpacing:Number;
      
      public function skills_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onInit() : *
      {
         var skillEl:MovieClip = null;
         var root_mc:MovieClip = root as MovieClip;
         this.chosenSkillList = new horizontalList();
         this.chosenSkillContainer_mc.addChild(this.chosenSkillList);
         this.chosenSkillList.EL_SPACING = (root as MovieClip).chosenListSpacing - 10;
         this.noSkills_txt.htmlText = root_mc.noSkills;
         this.noSkills_txt.visible = false;
         var i:uint = 0;
         while(i < root_mc.numberOfSlots)
         {
            skillEl = new Skill();
            skillEl.visible = false;
            skillEl.listPos = i;
            this.chosenSkillList.addElement(skillEl,false);
            i++;
         }
         this.chosenSkillList.m_positionInvisibleElements = true;
         this.chosenSkillList.positionElements();
         this.topTitle_txt.htmlText = root_mc.topTitle.toUpperCase();
         this.bottomTitle_txt.htmlText = root_mc.bottomTitle.toUpperCase();
         this.reset_mc.initialize("",function():*
         {
            ExternalInterface.call("emptyChosen");
         });
         this.emptySlot1_mc.slotPos = 0;
         this.emptySlot2_mc.slotPos = 1;
         this.emptySlot3_mc.slotPos = 2;
      }
      
      public function onBGOut(param1:MouseEvent) : *
      {
         this.bg_mc.removeEventListener("rightMouseUp",this.closeUIOnClick);
      }
      
      public function onRightDown(param1:MouseEvent) : *
      {
         this.bg_mc.addEventListener("rightMouseUp",this.closeUIOnClick);
      }
      
      public function closeUIOnClick(param1:MouseEvent) : *
      {
         this.bg_mc.removeEventListener("rightMouseUp",this.closeUIOnClick);
         ExternalInterface.call("PlaySound","UI_Game_Skills_Close");
         ExternalInterface.call("hideUI");
      }
      
      public function dragStop(param1:MouseEvent) : *
      {
         if(this.base.isDragging)
         {
            ExternalInterface.call("cancelDragging");
         }
      }
      
      public function updateIconHolder() : *
      {
         if(this.skillList.visibleLength > 0)
         {
            this.iggy_icon_Container.bg_mc.height = this.skillList.visibleLength * this.SkillSpacing - 20;
         }
         else
         {
            this.iggy_icon_Container.bg_mc.height = 1;
         }
      }
      
      public function clearSkills() : *
      {
         this.skillList.clearElements();
      }
      
      public function findSkillInGroups(param1:String) : MovieClip
      {
         var _loc3_:uint = 0;
         var _loc4_:MovieClip = null;
         var _loc2_:MovieClip = null;
         while(_loc3_ < this.skillList.length)
         {
            _loc4_ = this.skillList.getAt(_loc3_);
            if(_loc4_)
            {
               _loc2_ = _loc4_.findSkillbyId(param1);
            }
            if(_loc2_)
            {
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function updateChosenSkills() : *
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc1_:MovieClip = root as MovieClip;
         if(_loc1_ && _loc1_.chosenSkillsList.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.chosenSkillsList.length)
            {
               _loc3_ = _loc1_.chosenSkillsList[_loc2_++];
               _loc4_ = _loc1_.chosenSkillsList[_loc2_++];
               _loc5_ = this.chosenSkillList.getElementByNumber("listPos",_loc3_);
               if(_loc5_)
               {
                  if(_loc5_.skillID != null)
                  {
                     _loc6_ = this.findSkillInGroups(_loc5_.skillID);
                     if(_loc6_)
                     {
                        _loc6_.skillActivated_mc.visible = false;
                     }
                  }
                  _loc5_.skillID = _loc4_;
                  _loc5_.root_mc = _loc1_;
                  _loc5_.isChosenSkill = true;
                  _loc5_.isUpdated = true;
                  _loc6_ = this.findSkillInGroups(_loc4_);
                  if(_loc6_ && !_loc6_.isChosenSkill)
                  {
                     _loc6_.skillActivated_mc.visible = true;
                  }
               }
            }
            this.chosenSkillList.sortOn("listPos");
            this.chosenSkillList.positionElements();
         }
         _loc1_.chosenSkillsList = new Array();
         this.clearOldChosenSkills();
         ExternalInterface.call("hideTooltip");
      }
      
      public function clearOldChosenSkills() : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc1_:* = false;
         var _loc2_:uint = 0;
         while(_loc2_ < this.chosenSkillList.length)
         {
            _loc3_ = this.chosenSkillList.getElement(_loc2_);
            if(_loc3_)
            {
               if(!_loc3_.isUpdated)
               {
                  _loc3_.visible = false;
                  _loc1_ = true;
                  if(_loc3_.skillID != null)
                  {
                     _loc4_ = this.findSkillInGroups(_loc3_.skillID);
                     if(_loc4_)
                     {
                        _loc4_.skillActivated_mc.visible = false;
                     }
                     _loc3_.skillID = null;
                  }
               }
               else
               {
                  _loc3_.visible = true;
                  _loc3_.isUpdated = false;
               }
            }
            _loc2_++;
         }
         if(this.chosenSkillList.length <= 0)
         {
            this.iggy_chosenSkills.visible = false;
         }
         else
         {
            this.iggy_chosenSkills.visible = true;
         }
         this.accept_mc.setDisabled(_loc1_);
      }
      
      public function updateSkills() : *
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         var _loc7_:MovieClip = null;
         var _loc1_:MovieClip = root as MovieClip;
         var _loc2_:Array = _loc1_.skillsUpdateList;
         var _loc3_:* = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] != undefined)
            {
               _loc4_ = Number(_loc2_[_loc3_++]);
               _loc5_ = Number(_loc2_[_loc3_++]);
               _loc6_ = String(_loc2_[_loc3_++]);
               this.addSkill(_loc5_,_loc6_);
            }
         }
         this.skillList.sortOn(["tabID"],Array.NUMERIC);
         this.skillList.positionElements();
         _loc3_ = 0;
         while(_loc3_ < this.skillList.length)
         {
            _loc7_ = this.skillList.getAt(_loc3_);
            if(_loc7_)
            {
               _loc7_.skillGrid.positionElements();
               _loc7_.heightOverride = _loc7_.height + (_loc3_ == this.skillList.length - 1?this.SkillIconSize:0);
            }
            _loc3_++;
         }
         (root as MovieClip).skillsUpdateList = new Array();
         this.updateIconHolder();
         this.skillList.m_scrollbar_mc.scrollbarVisible();
         this.scrollbarBG_mc.visible = this.skillList.m_scrollbar_mc.visible;
         this.noSkills_txt.visible = this.skillList.length == 0;
      }
      
      public function addSkill(param1:Number, param2:String) : *
      {
         var _loc3_:MovieClip = this.skillList.getElementByNumber("tabID",param1);
         if(_loc3_ == null)
         {
            _loc3_ = new skillGroup();
            this.skillList.addElement(_loc3_,false);
            _loc3_.onInit(param1);
         }
         _loc3_.addSkill(param2);
      }
      
      public function rescaleCharIcon(param1:Bitmap) : *
      {
         if(param1.width > param1.height)
         {
            param1.width = this.SkillIconSize;
            param1.scaleY = param1.scaleX;
         }
         else
         {
            param1.height = this.SkillIconSize;
            param1.scaleX = param1.scaleY;
         }
      }
      
      public function addIcon(param1:MovieClip, param2:String, param3:Function) : *
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:Bitmap = null;
         if(param2 != param1.texture)
         {
            _loc4_ = param1.getChildByName("img") as DisplayObject;
            if(_loc4_ != null)
            {
               param1.removeChild(_loc4_);
            }
            if(param2 != "")
            {
               _loc5_ = new Bitmap(new bitmapPlaceholder(1,1));
               _loc5_.name = "img";
               param1.addChild(_loc5_);
               IggyFunctions.setTextureForBitmap(_loc5_,param2);
               param1.alpha = 0;
               TweensyZero.to(param1,{"alpha":1},0.6);
               if(param3 != null)
               {
                  param3(_loc5_);
               }
            }
            param1.texture = param2;
         }
      }
      
      function frame1() : *
      {
         this.currentAP = 0;
         this.currentFilter = 0;
         this.skillList = new scrollList();
         this.skillList.SB_SPACING = 0;
         this.skillList.TOP_SPACING = 0;
         this.skillList.EL_SPACING = 2;
         this.skillList.m_scrollbar_mc.m_SCROLLSPEED = 50;
         this.base = root as MovieClip;
         this.SkillIconSize = 50;
         this.SkillSpacing = 77;
         this.skillList.m_customElementHeight = this.SkillSpacing;
         this.skillList.setFrame(240,436);
         this.skillContainer_mc.addChild(this.skillList);
         this.skillList.m_scrollbar_mc.y = 25;
         this.skillList.m_scrollbar_mc.setLength(436 - 59);
         this.skillList.x = 30;
         this.skillList.mouseWheelEnabled = true;
         this.skillList.containerBG_mc.addChild(this.iggy_icon_Container);
         this.iggy_icon_Container.x = 3;
         this.iggy_icon_Container.y = 30;
         this.iggy_icon_Container.mouseEnabled = false;
         this.iggy_icon_Container.mouseChildren = false;
         this.bg_mc.addEventListener("rightMouseDown",this.onRightDown);
         this.bg_mc.addEventListener(MouseEvent.ROLL_OUT,this.onBGOut);
         this.close_mc.text_txt.filters = textEffect.createStrokeFilter(0,2,1,1.2,3);
         this.bg_mc.addEventListener(MouseEvent.MOUSE_UP,this.dragStop);
      }
   }
}
