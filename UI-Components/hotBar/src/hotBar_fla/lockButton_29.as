package hotBar_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class lockButton_29 extends MovieClip
   {
       
      
      public var disabled_mc:MovieClip;
      
      public var bIsLocked:Boolean;
      
      public function lockButton_29()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setLocked(param1:Boolean) : *
      {
         if(this.bIsLocked != param1)
         {
            this.bIsLocked = param1;
            if(this.bIsLocked)
            {
               this.gotoAndStop(4);
            }
            else
            {
               this.gotoAndStop(1);
            }
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Gen_XButton_Click");
            if(this.bIsLocked)
            {
               this.gotoAndStop(6);
            }
            else
            {
               this.gotoAndStop(3);
            }
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bIsLocked = !this.bIsLocked;
         ExternalInterface.call("setHotbarLocked",this.bIsLocked);
         if(this.bIsLocked)
         {
            this.gotoAndStop(5);
         }
         else
         {
            this.gotoAndStop(2);
         }
         this.showTooltip();
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            if(this.bIsLocked)
            {
               this.gotoAndStop(5);
            }
            else
            {
               this.gotoAndStop(2);
            }
         }
         ExternalInterface.call("PlaySound","UI_Generic_Over");
         this.showTooltip();
      }
      
      public function showTooltip() : *
      {
         var _loc1_:MovieClip = root as MovieClip;
         if(this.bIsLocked)
         {
            if(this.tooltipB != null && this.tooltipB != "")
            {
               _loc1_.hotbar_mc.showBtnTooltip(this,this.tooltipB);
            }
         }
         else if(this.tooltipA != null && this.tooltipA != "")
         {
            _loc1_.hotbar_mc.showBtnTooltip(this,this.tooltipA);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.disabled_mc.visible)
         {
            if(this.bIsLocked)
            {
               this.gotoAndStop(4);
            }
            else
            {
               this.gotoAndStop(1);
            }
         }
         if(this.tooltipA != null && this.tooltipA != "" || this.tooltipB != null && this.tooltipB != "")
         {
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function setEnabled(param1:Boolean) : *
      {
         this.disabled_mc.visible = !param1;
      }
      
      function frame1() : *
      {
         stop();
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.disabled_mc.visible = false;
      }
   }
}
