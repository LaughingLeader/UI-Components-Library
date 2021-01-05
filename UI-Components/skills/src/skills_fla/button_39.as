package skills_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class button_39 extends MovieClip
   {
       
      
      public var templateContainer_mc:MovieClip;
      
      public var template_mc:MovieClip;
      
      public var callBackF:Function;
      
      public var textPosY:int;
      
      public function button_39()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initButton(param1:MovieClip, param2:Function, param3:Boolean = false) : *
      {
         if(param1 && param2 != null)
         {
            this.template_mc = param1;
            this.callBackF = param2;
            this.templateContainer_mc.addChild(this.template_mc);
            this.template_mc.gotoAndStop(!!param3?4:1);
            this.textPosY = this.template_mc.resetTextHolder.text_txt.y;
            addEventListener(MouseEvent.ROLL_OVER,this.onOver);
            addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         }
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.template_mc && this.template_mc.currentFrame != 4)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Over");
            addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
            this.template_mc.gotoAndStop(2);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.template_mc && this.template_mc.currentFrame != 4)
         {
            removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            if(this.template_mc.resetTextHolder.text_txt.y != this.textPosY)
            {
               this.template_mc.resetTextHolder.text_txt.y = this.textPosY;
            }
            this.template_mc.gotoAndStop(1);
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(this.template_mc && this.template_mc.currentFrame != 4)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.template_mc.gotoAndStop(3);
            this.template_mc.resetTextHolder.text_txt.y = this.template_mc.resetTextHolder.text_txt.y + 2;
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.template_mc && this.template_mc.currentFrame != 4)
         {
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.template_mc.gotoAndStop(2);
            if(this.template_mc.resetTextHolder.text_txt.y != this.textPosY)
            {
               this.template_mc.resetTextHolder.text_txt.y = this.textPosY;
            }
            if(this.callBackF != null)
            {
               this.callBackF();
            }
            ExternalInterface.call("PlaySound","UI_Gen_Reset");
         }
      }
      
      function frame1() : *
      {
      }
   }
}
