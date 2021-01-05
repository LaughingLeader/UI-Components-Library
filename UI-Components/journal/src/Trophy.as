package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class Trophy extends MovieClip
   {
       
      
      public var desc_txt:TextField;
      
      public var img_mc:empty;
      
      public var killedText_txt:TextField;
      
      public var killed_txt:TextField;
      
      public var name_txt:TextField;
      
      public var base:MovieClip;
      
      public function Trophy()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.base.curTooltip = this.pos;
         if(this.tooltip != null && this.tooltip != "")
         {
            ExternalInterface.call("showTooltip",this.tooltip);
            this.base.hasTooltip = true;
         }
      }
      
      public function onOut(param1:MouseEvent) : *
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
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
      }
   }
}
