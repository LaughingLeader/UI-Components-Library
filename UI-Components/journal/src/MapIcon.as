package
{
   import LS_Classes.larTween;
   import fl.motion.easing.Linear;
   import flash.display.MovieClip;
   
   public dynamic class MapIcon extends MovieClip
   {
       
      
      public var focusHL_mc:MovieClip;
      
      public var iconHL_mc:MovieClip;
      
      public var sel_mc:MovieClip;
      
      public var iconHLTween:larTween;
      
      public function MapIcon()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function glow() : *
      {
         if(this.iconHLTween)
         {
            this.iconHLTween.stop();
         }
         this.iconHLTween = new larTween(this.focusHL_mc,"alpha",Linear.easeNone,0,1,0.6,this.reduce);
         this.iconHLTween.start();
      }
      
      public function reduce() : *
      {
         if(this.iconHLTween)
         {
            this.iconHLTween.stop();
         }
         this.iconHLTween = new larTween(this.focusHL_mc,"alpha",Linear.easeNone,1,0,0.6,this.glow);
         this.iconHLTween.start();
      }
      
      public function stopGlow() : *
      {
         if(this.iconHLTween)
         {
            this.iconHLTween.stop();
         }
         this.scaleX = 1;
         this.scaleY = 1;
         this.focusHL_mc.alpha = 0;
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
