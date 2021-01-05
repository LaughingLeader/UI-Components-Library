package partyInventory_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class checkButtonLabel_11 extends MovieClip
   {
       
      
      public var checkB_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var base:MovieClip;
      
      public var onDownBool:Boolean;
      
      public var pressedFunc:Function;
      
      public var disabledTextAlpha:Number;
      
      public function checkButtonLabel_11()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setText(param1:String) : *
      {
         var _loc2_:Number = 1;
         var _loc3_:Number = 2;
         this.text_txt.htmlText = param1.toUpperCase();
         var _loc4_:Number = Math.round((this.hit_mc.width - (this.text_txt.textWidth + this.checkB_mc.width + _loc2_)) * 0.5) - _loc3_;
         this.checkB_mc.x = _loc4_;
         this.text_txt.x = this.checkB_mc.x + this.checkB_mc.width + _loc2_;
      }
      
      public function setState(param1:Boolean) : *
      {
         this.checkB_mc.check_mc.visible = param1;
         if(this.pressedFunc != null)
         {
            this.pressedFunc(this.checkB_mc.check_mc.visible);
         }
         var _loc2_:Number = this.checkB_mc.bg_mc.currentFrame;
         if(_loc2_ == 4 || _loc2_ == 2)
         {
            this.checkB_mc.bg_mc.gotoAndStop(!!this.checkB_mc.check_mc.visible?1:3);
         }
         else
         {
            this.checkB_mc.bg_mc.gotoAndStop(!!this.checkB_mc.check_mc.visible?2:4);
         }
      }
      
      public function setDisabled(param1:Boolean) : *
      {
         this.visible = !param1;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(!this.checkB_mc.disabled_mc.visible)
         {
            this.checkB_mc.bg_mc.gotoAndStop(!!this.checkB_mc.check_mc.visible?1:3);
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.checkB_mc.disabled_mc.visible)
         {
            this.checkB_mc.bg_mc.gotoAndStop(!!this.checkB_mc.check_mc.visible?2:4);
            ExternalInterface.call("PlaySound","UI_Generic_Over");
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(!this.checkB_mc.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_ShowParty");
            this.setState(!this.checkB_mc.check_mc.visible);
            ExternalInterface.call("checkBtnClicked",this.id,this.checkB_mc.check_mc.visible);
            this.checkB_mc.bg_mc.gotoAndStop(!!this.checkB_mc.check_mc.visible?2:4);
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.checkB_mc.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.onDownBool = false;
         this.checkB_mc.disabled_mc.visible = false;
         this.disabledTextAlpha = 0.4;
         mouseChildren = false;
      }
   }
}
