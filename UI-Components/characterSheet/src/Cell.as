package
{
   import LS_Classes.larTween;
   import LS_Classes.tooltipHelper;
   import fl.motion.easing.Cubic;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class Cell extends MovieClip
   {
       
      
      public var condition_mc:MovieClip;
      
      public var disable_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public var img_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var timeline:larTween;
      
      public function Cell()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function addIcon(param1:Event) : *
      {
         if(this.img_mc != null && this.texture != null)
         {
            (root as MovieClip).equip_mc.addIcon(this.img_mc,this.texture,(root as MovieClip).equip_mc.cellSize);
         }
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.itemHandle)
         {
            ExternalInterface.call("slotOver",this.itemHandle);
         }
         if(this.base.isDragging || this.itemHandle != null)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
            this.base.curTooltip = this.pos;
            tooltipHelper.ShowItemTooltipForMC(this,root,"rightTop");
            if(this.timeline && this.timeline.isPlaying)
            {
               this.timeline.stop();
            }
            this.hl_mc.visible = true;
            this.timeline = new larTween(this.hl_mc,"alpha",Cubic.easeOut,this.hl_mc.alpha,1,0.1);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.itemHandle)
         {
            ExternalInterface.call("slotOut",this.itemHandle);
         }
         this.timeline = new larTween(this.hl_mc,"alpha",Cubic.easeOut,this.hl_mc.alpha,0,0.1,this.hlInvis);
         ExternalInterface.call("slotOut",this.pos);
         if(this.base.curTooltip == this.pos && this.base.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            this.base.hasTooltip = false;
         }
         this.base.curTooltip = -1;
      }
      
      public function hlInvis() : *
      {
         this.hl_mc.visible = false;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         mouseChildren = false;
         hitArea = this.hl_mc;
      }
   }
}
