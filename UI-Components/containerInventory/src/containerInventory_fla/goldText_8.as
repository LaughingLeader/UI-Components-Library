package containerInventory_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class goldText_8 extends MovieClip
   {
       
      
      public var text_txt:TextField;
      
      public function goldText_8()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.tooltip && this.tooltip != "")
         {
            ExternalInterface.call("showTooltip",this.tooltip);
         }
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
      }
   }
}
