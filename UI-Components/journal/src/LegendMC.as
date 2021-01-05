package
{
   import flash.display.MovieClip;
   
   public dynamic class LegendMC extends MovieClip
   {
       
      
      public var icon_mc:MapIcon;
      
      public var label_mc:MovieClip;
      
      public function LegendMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         mouseEnabled = false;
         mouseChildren = false;
         this.icon_mc.iconHL_mc.visible = false;
         this.icon_mc.focusHL_mc.visible = false;
      }
   }
}
