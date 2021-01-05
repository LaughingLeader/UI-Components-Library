package skillsSelection_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class cancelButton_9 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var base:MovieClip;
      
      public var textY:Number;
      
      public function cancelButton_9()
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
         this.text_txt.y = this.textY;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(3);
         this.text_txt.y = this.textY + 2;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(this.base.isDragging)
         {
            ExternalInterface.call("cancelDragging");
         }
         else
         {
            this.bg_mc.gotoAndStop(2);
            ExternalInterface.call("PlaySound","UI_Gen_Cancel");
            ExternalInterface.call("hideTooltip");
            ExternalInterface.call("hideUI");
         }
         this.text_txt.y = this.textY;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.textY = 3;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
   }
}
