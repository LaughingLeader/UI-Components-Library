package
{
   import LS_Classes.larTween;
   import fl.motion.easing.Quartic;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class Text extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var label_txt:TextField;
      
      public var timeline:larTween;
      
      public function Text()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.tooltip != "")
         {
            ExternalInterface.call("showTooltip",this.tooltip);
         }
         if(this.timeline)
         {
            this.timeline.onComplete = null;
         }
         this.hl_mc.visible = true;
         this.timeline = new larTween(this.hl_mc,"alpha",Quartic.easeOut,this.hl_mc.alpha,1,0.1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.timeline = new larTween(this.hl_mc,"alpha",Quartic.easeOut,this.hl_mc.alpha,0,0.1,this.hlInvis);
         this.timeline.onComplete = this.hlInvis;
         ExternalInterface.call("hideTooltip");
      }
      
      public function hlInvis() : *
      {
         this.hl_mc.visible = false;
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
         this.hl_mc.visible = false;
         this.hl_mc.alpha = 0;
      }
   }
}
