package skills_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class memoryPageHitRect_45 extends MovieClip
   {
       
      
      public function memoryPageHitRect_45()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         (root as MovieClip).showMemoryHighlight();
         if((root as MovieClip).isDragging)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         (root as MovieClip).hideMemoryHighlight();
         if((root as MovieClip).hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            (root as MovieClip).hasTooltip = false;
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:String = (root as MovieClip).draggingSkillId;
         if(_loc2_ != "")
         {
            ExternalInterface.call((root as MovieClip).buttonCallBack[1],_loc2_,true);
         }
         else if((root as MovieClip).isDragging)
         {
            ExternalInterface.call("dragActivate");
         }
         (root as MovieClip).clearDragging();
      }
      
      public function handleMouseWheel(param1:MouseEvent) : *
      {
         (root as MovieClip).skillPane_mc.dispatchEvent(param1);
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
      }
   }
}
