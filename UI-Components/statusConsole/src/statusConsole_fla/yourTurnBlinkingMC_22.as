package statusConsole_fla
{
   import fl.motion.easing.Quadratic;
   import flash.display.MovieClip;
   
   public dynamic class yourTurnBlinkingMC_22 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public const tweenTime:Number = 0.5;
      
      public var blinkTween:IggyTween;
      
      public function yourTurnBlinkingMC_22()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function blink() : *
      {
         var beginValue:Number = NaN;
         var endValue:Number = NaN;
         if(this.stage)
         {
            if(this.hl_mc.alpha <= 0.1)
            {
               beginValue = 0;
               endValue = 1;
            }
            else
            {
               beginValue = 1;
               endValue = 0;
            }
            this.blinkTween = new IggyTween(this.hl_mc,"alpha",Quadratic.easeInOut,beginValue,endValue,this.tweenTime,true,true);
            this.blinkTween.motionFinishCallback = function():*
            {
               blink();
            };
         }
      }
      
      function frame1() : *
      {
         this.blink();
      }
   }
}
