package skillsSelection_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class emptySlot_4 extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var root_mc:MovieClip;
      
      public function emptySlot_4()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("dragactivate",this.slotPos);
         this.hl_mc.alpha = 0;
      }
      
      function frame1() : *
      {
         this.root_mc = root as MovieClip;
         this.hl_mc.alpha = 0;
         addEventListener(MouseEvent.MOUSE_OVER,function():*
         {
            if(root_mc.isDragging)
            {
               hl_mc.alpha = 0.3;
            }
         });
         addEventListener(MouseEvent.MOUSE_OUT,function():*
         {
            if(root_mc.isDragging)
            {
               hl_mc.alpha = 0;
            }
         });
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
   }
}
