package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public dynamic class skillPreview extends MovieClip
   {
       
      
      public var frame_mc:skillFrame;
      
      public function skillPreview()
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
      
      public function show(param1:uint, param2:String) : void
      {
         this.frame_mc.visible = true;
         this.frame_mc.setColor(param2);
         this.frame_mc.addFrameCells(param1);
         this.updatePreview(null);
         addEventListener(Event.ENTER_FRAME,this.updatePreview);
      }
      
      public function hide() : void
      {
         this.frame_mc.clearFrame();
         this.frame_mc.visible = false;
         removeEventListener(Event.ENTER_FRAME,this.updatePreview);
      }
      
      public function updatePreview(param1:Event) : void
      {
         this.x = stage.mouseX + 2;
         this.y = stage.mouseY + 22;
         var _loc2_:Number = 32;
         var _loc3_:Boolean = this.x < _loc2_ || this.x + this.width > stage.stageWidth - _loc2_ || this.y < _loc2_ || this.y + this.height > stage.stageHeight - _loc2_ - 100;
         var _loc4_:* = !!_loc3_?-0.1:0.1;
         this.alpha = Math.max(0,Math.min(1,this.alpha + _loc4_));
      }
      
      function frame1() : *
      {
      }
   }
}
