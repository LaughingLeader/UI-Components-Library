package
{
   import LS_Classes.larTween;
   import fl.motion.easing.Sine;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class CloseButton extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var down_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var onPressedFunction:Function;
      
      public var timeline:larTween;
      
      public var tweentime:Number;
      
      public function CloseButton()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
         if(this.timeline)
         {
            this.timeline.onComplete = null;
         }
         this.hl_mc.visible = true;
         this.timeline = new larTween(this.hl_mc,"alpha",Sine.easeIn,this.hl_mc.alpha,1,this.tweentime);
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.down_mc.visible = false;
         this.timeline = new larTween(this.hl_mc,"alpha",Sine.easeOut,this.hl_mc.alpha,0,this.tweentime,this.hlInvis);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.down_mc.visible = true;
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
            this.down_mc.visible = false;
            if(this.onPressedFunction != null)
            {
               this.onPressedFunction();
            }
         }
      }
      
      public function hlInvis() : *
      {
         this.hl_mc.visible = false;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.onPressedFunction = null;
         this.tweentime = 0.2;
         this.hl_mc.visible = false;
         this.down_mc.visible = false;
         this.hitArea = this.hit_mc;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
   }
}
