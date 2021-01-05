package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class comboElement extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var sel_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var base:MovieClip;
      
      public function comboElement()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function deselectElement(param1:MouseEvent) : *
      {
         this.hl_mc.visible = false;
      }
      
      public function selectElement(param1:MouseEvent) : *
      {
         this.hl_mc.visible = true;
         ExternalInterface.call("PlaySound","UI_Gen_OptMenu_Over");
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         if(this.tooltip != null && this.tooltip != "")
         {
            this.base.curTooltip = this.pos;
            ExternalInterface.call("showItemTooltip",this.tooltip);
            this.base.hasTooltip = true;
         }
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         if(this.base.curTooltip == this.pos && this.base.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            this.base.hasTooltip = false;
         }
         this.base.curTooltip = -1;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
   }
}
