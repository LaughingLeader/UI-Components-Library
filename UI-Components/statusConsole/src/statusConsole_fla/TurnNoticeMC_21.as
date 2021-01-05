package statusConsole_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public dynamic class TurnNoticeMC_21 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var timer_txt:TextField;
      
      public const smallFontSize:int = 16;
      
      public const bigFontSize:int = 26;
      
      public const timerPosY = -14;
      
      public function TurnNoticeMC_21()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setTurnTimer(param1:int) : *
      {
         this.timer_txt.visible = param1 >= 0;
         var _loc2_:TextFormat = this.timer_txt.defaultTextFormat;
         if(param1 <= 3)
         {
            _loc2_.size = this.bigFontSize;
            this.timer_txt.textColor = 16711680;
            this.timer_txt.y = this.timerPosY - 7;
         }
         else
         {
            _loc2_.size = this.smallFontSize;
            this.timer_txt.textColor = 16777215;
            this.timer_txt.y = this.timerPosY;
         }
         this.timer_txt.defaultTextFormat = _loc2_;
         this.timer_txt.htmlText = String(param1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
