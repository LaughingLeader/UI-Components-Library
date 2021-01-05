package characterSheet_fla
{
   import flash.display.MovieClip;
   
   public dynamic class tagBgHeader_138 extends MovieClip
   {
       
      
      public var left_mc:MovieClip;
      
      public var right_mc:MovieClip;
      
      public function tagBgHeader_138()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function set space(param1:Number) : void
      {
         var _loc2_:Number = 273 - 16;
         var _loc3_:Number = Math.min(param1,273 - 16);
         this.left_mc.x = 16;
         this.left_mc.width = (_loc2_ - _loc3_) * 0.5;
         this.right_mc.x = 16 + _loc2_ - (_loc2_ - _loc3_) * 0.5;
         this.right_mc.width = this.left_mc.width;
      }
      
      function frame1() : *
      {
      }
   }
}
