package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class gridFrame extends MovieClip
   {
       
      
      public var b_mc:MovieClip;
      
      public var bl_mc:MovieClip;
      
      public var br_mc:MovieClip;
      
      public var l_mc:MovieClip;
      
      public var r_mc:MovieClip;
      
      public var t_mc:MovieClip;
      
      public var tl_mc:MovieClip;
      
      public var tr_mc:MovieClip;
      
      public function gridFrame()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function handleWheel(param1:MouseEvent) : void
      {
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this.tl_mc.x = 0;
         this.tl_mc.y = 0;
         this.tr_mc.x = param1 - this.tr_mc.width;
         this.tr_mc.y = 0;
         this.bl_mc.x = 0;
         this.bl_mc.y = param2 - this.bl_mc.height;
         this.br_mc.x = param1 - this.br_mc.width;
         this.br_mc.y = param2 - this.br_mc.height;
         this.t_mc.x = this.tl_mc.width;
         this.t_mc.y = 0;
         this.t_mc.width = param1 - this.tl_mc.width - this.tr_mc.width;
         this.b_mc.x = this.bl_mc.width;
         this.b_mc.y = param2 - this.b_mc.height;
         this.b_mc.width = param1 - this.bl_mc.width - this.br_mc.width;
         this.l_mc.x = 0;
         this.l_mc.y = this.tl_mc.height;
         this.l_mc.height = param2 - this.tl_mc.height - this.bl_mc.height;
         this.r_mc.x = param1 - this.r_mc.width;
         this.r_mc.y = this.tr_mc.height;
         this.r_mc.height = param2 - this.tr_mc.height - this.br_mc.height;
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.MOUSE_WHEEL,this.handleWheel);
      }
   }
}
