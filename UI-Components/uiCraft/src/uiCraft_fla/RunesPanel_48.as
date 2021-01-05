package uiCraft_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class RunesPanel_48 extends MovieClip
   {
       
      
      public var accept_mc:smallRedBtn;
      
      public var bgOverlay:MovieClip;
      
      public var error_txt:TextField;
      
      public var iconHolder_mc:MovieClip;
      
      public var inventory_mc:MovieClip;
      
      public var name_txt:TextField;
      
      public var runeTarget_mc:MovieClip;
      
      public var runeslotHolder_mc:MovieClip;
      
      public var shine_mc:MovieClip;
      
      public var targetHit_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var list:horizontalList;
      
      public var iconMC;
      
      public const c_RuneDefaultOffset:uint = 210;
      
      public const c_RuneAmount:uint = 3;
      
      public var currRuneCount;
      
      public function RunesPanel_48()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.targetHit_mc.itemHandle = 0;
         this.targetHit_mc.contextParam = -1;
         this.inventory_mc.close_mc.visible = false;
         this.list = new horizontalList();
         this.runeslotHolder_mc.addChild(this.list);
         this.list.canPositionInvisibleElements = true;
         this.list.m_customElementWidth = this.c_RuneDefaultOffset;
         this.list.elementSpacing = 0;
         var _loc1_:uint = 0;
         while(_loc1_ < this.c_RuneAmount)
         {
            this.addRuneSlot(_loc1_);
            _loc1_++;
         }
         this.inventory_mc.init();
         this.accept_mc.init(this.onAcceptPressed);
         this.accept_mc.setEnabled(true);
         this.iconMC = new iggyIcon();
         this.iconHolder_mc.addChild(this.iconMC);
         this.iconMC.name = "Iggy_craftResult";
         this.targetHit_mc.addEventListener(MouseEvent.ROLL_OVER,this.overTarget);
         this.targetHit_mc.addEventListener(MouseEvent.CLICK,this.onTargetHitClicked);
         this.targetHit_mc.addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
         this.shine_mc.alpha = 0;
         this.shine_mc.mouseChildren = false;
         this.shine_mc.mouseEnabled = false;
      }
      
      public function onTargetHitClicked(param1:MouseEvent) : *
      {
         this.onAcceptPressed();
      }
      
      public function setCraftResultHandle(param1:Number, param2:int) : *
      {
         var _loc3_:uint = 0;
         var _loc4_:MovieClip = null;
         this.targetHit_mc.itemHandle = param1;
         this.targetHit_mc.contextParam = param2;
         this.inventory_mc.close_mc.visible = param1 != 0;
         if(param1 == 0 && this.list.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < this.list.length)
            {
               _loc4_ = this.list.getAt(_loc3_);
               if(_loc4_)
               {
                  _loc4_.visible = false;
               }
               _loc3_++;
            }
         }
      }
      
      public function stopDragging() : *
      {
         ExternalInterface.call("stopDraggingRuneTraget");
      }
      
      public function overTarget(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = null;
         this.shine_mc.alpha = 1;
         this.targetHit_mc.addEventListener(MouseEvent.ROLL_OUT,this.outTarget);
         if(this.targetHit_mc.itemHandle != 0)
         {
            _loc2_ = root as MovieClip;
            tooltipHelper.ShowItemTooltipForMC(this.targetHit_mc,_loc2_,"rightTop");
         }
         else
         {
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function setNoRuneWeaponsError(param1:String, param2:Boolean) : *
      {
         var _loc3_:* = param1 == "";
         this.bgOverlay.gotoAndStop(1);
         this.inventory_mc.visible = _loc3_;
         this.error_txt.htmlText = param1;
         this.accept_mc.setEnabled(!param2 && _loc3_);
      }
      
      public function outTarget(param1:MouseEvent) : *
      {
         this.shine_mc.alpha = 0;
         this.targetHit_mc.removeEventListener(MouseEvent.ROLL_OUT,this.outTarget);
         ExternalInterface.call("hideTooltip");
      }
      
      public function onAcceptPressed() : *
      {
         this.inventory_mc.selectRuneTargetMode = true;
         ExternalInterface.call("openGearPopup");
         ExternalInterface.call("PlaySound","UI_Generic_Click");
      }
      
      public function addRuneSlot(param1:Number) : *
      {
         var _loc2_:MovieClip = new RuneSlot();
         _loc2_.id = param1;
         _loc2_.base = this;
         _loc2_.iconMC = new iggyIcon();
         _loc2_.iconHolder_mc.addChild(_loc2_.iconMC);
         var _loc3_:MovieClip = root as MovieClip;
         if(_loc3_.runeTitleStr)
         {
            _loc2_.title_txt.htmlText = _loc3_.runeTitleStr.str + " " + (param1 + 1);
         }
         _loc2_.btn_mc.init(this.buttonPressed,_loc2_);
         this.list.addElement(_loc2_);
         _loc2_.visible = false;
      }
      
      public function buttonPressed(param1:MovieClip) : *
      {
         if(param1.state == 0)
         {
            ExternalInterface.call("extractRuneFromSlot",param1.id);
            ExternalInterface.call("PlaySound","UI_Game_Runes_Extract");
         }
         else if(param1.state == 1)
         {
            ExternalInterface.call("selectRuneForSlot",param1.id);
            this.inventory_mc.selectRuneTargetMode = false;
         }
      }
      
      public function setRuneSlot(param1:Number, param2:String, param3:String, param4:Number, param5:Number, param6:String) : *
      {
         var _loc7_:MovieClip = this.list.getAt(param1);
         if(_loc7_)
         {
            _loc7_.name_txt.htmlText = param2.toUpperCase();
            _loc7_.desc_txt.htmlText = param3;
            _loc7_.state = param5;
            _loc7_.shine_mc.tooltip = null;
            _loc7_.shine_mc.alpha = 0;
            this.setRuneSlotBtnText(_loc7_);
            _loc7_.iconMC.name = "Iggy_R" + param4;
            switch(_loc7_.state)
            {
               case 0:
                  _loc7_.shine_mc.tooltip = "rune_" + param1;
                  _loc7_.desc_txt.textColor = 16777215;
                  _loc7_.iconMC.visible = true;
                  _loc7_.visible = true;
                  break;
               case 1:
                  _loc7_.desc_txt.textColor = 9202514;
                  _loc7_.iconMC.visible = false;
                  _loc7_.visible = param2 != "";
            }
            if(param6)
            {
               _loc7_.btn_mc.setEnabled(false);
               _loc7_.btn_mc.tooltip = param6;
            }
            else
            {
               _loc7_.btn_mc.setEnabled(true);
               _loc7_.btn_mc.tooltip = null;
            }
         }
      }
      
      public function resetTexts() : *
      {
         var _loc3_:MovieClip = null;
         var _loc1_:MovieClip = root as MovieClip;
         var _loc2_:uint = 0;
         while(_loc2_ < this.list.length)
         {
            _loc3_ = this.list.getAt(_loc2_);
            if(_loc3_)
            {
               _loc3_.title_txt.htmlText = _loc1_.runeTitleStr.str + " " + (_loc2_ + 1);
               this.setRuneSlotBtnText(_loc3_);
            }
            _loc2_++;
         }
      }
      
      public function setRuneSlotBtnText(param1:MovieClip) : *
      {
         var _loc2_:MovieClip = null;
         if(param1)
         {
            _loc2_ = root as MovieClip;
            switch(param1.state)
            {
               case 0:
                  if(_loc2_.runeSlotBtnExtractStr)
                  {
                     param1.btn_mc.setText(_loc2_.runeSlotBtnExtractStr.str);
                  }
                  break;
               case 1:
                  if(_loc2_.runeSlotBtnInsertStr)
                  {
                     param1.btn_mc.setText(_loc2_.runeSlotBtnInsertStr.str);
                  }
            }
         }
      }
      
      public function clearRuneSlots() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.list.length)
         {
            _loc2_ = this.list.getAt(_loc1_);
            if(_loc2_)
            {
               _loc2_.name_txt.htmlText = "";
               _loc2_.desc_txt.htmlText = "";
            }
            _loc1_++;
         }
      }
      
      public function updateRuneSlots() : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc1_:MovieClip = root as MovieClip;
         var _loc2_:Array = _loc1_.runeslotUpdateList;
         this.clearRuneSlots();
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc4_++];
            _loc6_ = _loc2_[_loc4_++];
            if(_loc6_)
            {
               _loc3_++;
            }
            this.setRuneSlot(_loc5_,_loc6_,_loc2_[_loc4_++],_loc2_[_loc4_++],_loc2_[_loc4_++],_loc2_[_loc4_++]);
         }
         this.setRuneCount(_loc3_);
         _loc1_.runeslotUpdateList = new Array();
      }
      
      public function setRuneCount(param1:*) : *
      {
         var _loc4_:MovieClip = null;
         this.currRuneCount = param1;
         this.bgOverlay.gotoAndStop(param1);
         var _loc2_:* = 360;
         if(param1 != 1)
         {
            _loc2_ = this.bgOverlay.width / param1;
         }
         this.list.m_customElementWidth = _loc2_;
         this.list.positionElements();
         var _loc3_:uint = 0;
         while(_loc3_ < this.c_RuneAmount)
         {
            _loc4_ = this.list.getAt(_loc3_);
            if(_loc4_)
            {
               _loc4_.setElemWidth(_loc2_ - 30);
            }
            _loc3_++;
         }
         this.runeslotHolder_mc.x = 339 - _loc2_ * 0.5 * (param1 - 1);
      }
      
      public function reset() : *
      {
         this.inventory_mc.reset();
      }
      
      public function updateItems() : *
      {
         this.inventory_mc.updateItems();
      }
      
      function frame1() : *
      {
         this.currRuneCount = 0;
      }
   }
}
