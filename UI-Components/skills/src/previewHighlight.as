package
{
   import flash.display.MovieClip;
   
   public dynamic class previewHighlight extends MovieClip
   {
       
      
      public var frame_mc:skillFrame;
      
      public function previewHighlight()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : void
      {
         this.frame_mc.init(6,6,74,"skillFrame_Cell","skillFrame_LeftArrow","skillFrame_LeftBorder","skillFrame_LeftOpenBorder","skillFrame_RightArrow","skillFrame_RightBorder","skillFrame_RightOpenBorder","skillFrame_Separator");
         this.frame_mc.clearFrame();
         this.mouseEnabled = false;
         this.frame_mc.mouseEnabled = false;
      }
      
      public function showHighlight(param1:uint, param2:uint, param3:Boolean) : void
      {
         this.frame_mc.visible = true;
         this.frame_mc.clearFrame();
         this.frame_mc.setColor(!!param3?"ffffff":"ff0000");
         this.frame_mc.addFrameCells(param1,true);
         this.frame_mc.addFrameCells(param2);
      }
      
      public function hideHighlight() : void
      {
         this.frame_mc.clearFrame();
         this.frame_mc.visible = false;
      }
      
      function frame1() : *
      {
      }
   }
}
