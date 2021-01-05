package
{
   import LS_Classes.larTween;
   import fl.motion.easing.Cubic;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class StatInfo extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var texts_mc:MovieClip;
      
      public var timeline:larTween;
      
      public var base:MovieClip;
      
      public function StatInfo()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.base.showTooltipForMC(this,"showStatTooltip");
         if(this.timeline)
         {
            this.timeline.onComplete = null;
         }
         this.hl_mc.visible = true;
         this.timeline = new larTween(this.hl_mc,"alpha",Cubic.easeOut,this.hl_mc.alpha,1,0.1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.timeline = new larTween(this.hl_mc,"alpha",Cubic.easeOut,this.hl_mc.alpha,0,0.1,this.hlInvis);
         this.base.hasTooltip = false;
         ExternalInterface.call("hideTooltip");
      }
      
      public function hlInvis() : *
      {
         this.hl_mc.visible = false;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.hl_mc.visible = false;
         this.hl_mc.alpha = 0;
         hitArea = this.hl_mc;
      }
   }
}
