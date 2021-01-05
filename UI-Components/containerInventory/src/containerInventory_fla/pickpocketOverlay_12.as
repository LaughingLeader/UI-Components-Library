package containerInventory_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class pickpocketOverlay_12 extends MovieClip
   {
       
      
      public var valueBox_mc:MovieClip;
      
      public var weightBox_mc:MovieClip;
      
      public var hasTooltip:Boolean;
      
      public function pickpocketOverlay_12()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(param1.target.tooltip && param1.target.tooltip != "")
         {
            ExternalInterface.call("showTooltip",param1.target.tooltip);
            this.hasTooltip = true;
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            this.hasTooltip = false;
         }
      }
      
      function frame1() : *
      {
         this.weightBox_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.weightBox_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.valueBox_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.valueBox_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.hasTooltip = false;
      }
   }
}
