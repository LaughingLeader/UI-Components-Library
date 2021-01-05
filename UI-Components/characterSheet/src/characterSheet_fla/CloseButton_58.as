package characterSheet_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class CloseButton_58 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var onPressedFunction:Function;
      
      public function CloseButton_58()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Generic_Over");
         this.bg_mc.gotoAndStop(2);
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(1);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(3);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Inventory_Close");
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(this.base.isDragging)
         {
            ExternalInterface.call("cancelDragging");
         }
         else if(this.onPressedFunction != null)
         {
            this.onPressedFunction();
         }
         this.bg_mc.gotoAndStop(2);
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.onPressedFunction = null;
         this.hitArea = this.hit_mc;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
   }
}
