package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class btnB_id extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var label_mc:MovieClip;
      
      public var texttY:Number;
      
      public var snd_OnUp:String;
      
      public var snd_OnOver:String;
      
      public function btnB_id()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = root as MovieClip;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("PlaySound",this.snd_OnUp);
         ExternalInterface.call("ButtonPressed",this.id,_loc2_.currentDevice);
         this.label_mc.y = this.texttY;
         this.bg_mc.gotoAndStop(2);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.label_mc.y = this.texttY;
         this.bg_mc.gotoAndStop(1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound",this.snd_OnOver);
         this.label_mc.y = this.texttY;
         this.bg_mc.gotoAndStop(2);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.label_mc.y = this.texttY + 2;
         this.bg_mc.gotoAndStop(3);
      }
      
      function frame1() : *
      {
         this.label_mc.mouseEnabled = false;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.texttY = 4;
         this.snd_OnOver = "UI_Generic_Over";
      }
   }
}
