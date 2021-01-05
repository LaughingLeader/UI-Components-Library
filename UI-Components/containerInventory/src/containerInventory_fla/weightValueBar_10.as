package containerInventory_fla
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   public dynamic class weightValueBar_10 extends MovieClip
   {
       
      
      public var bar_mc:MovieClip;
      
      public function weightValueBar_10()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setBarColour(param1:uint) : *
      {
         var _loc2_:ColorTransform = new ColorTransform(0,0,0,1,255,0,0,0);
         _loc2_.color = param1;
         this.bar_mc.transform.colorTransform = _loc2_;
      }
      
      function frame1() : *
      {
      }
   }
}
