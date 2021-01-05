package skillsSelection_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class buttonUse_11 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var texty:Number;
      
      public function buttonUse_11()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Over");
            this.bg_mc.gotoAndStop(2);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.disabled_mc.visible)
         {
            this.bg_mc.gotoAndStop(1);
            this.text_txt.y = this.texty;
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.bg_mc.gotoAndStop(3);
            this.text_txt.y = this.texty + 2;
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("PlaySound","UI_Gen_Accept");
         ExternalInterface.call("learnSkills");
         this.bg_mc.gotoAndStop(2);
         this.text_txt.y = this.texty;
      }
      
      public function setDisabled(param1:Boolean) : *
      {
         this.text_txt.alpha = !!param1?Number(0.6):Number(1);
         this.disabled_mc.visible = param1;
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.texty = 4;
      }
   }
}
