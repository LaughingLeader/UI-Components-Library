package
{
   import flash.display.MovieClip;
   
   public dynamic class resetButton extends MovieClip
   {
       
      
      public var resetTextHolder:MovieClip;
      
      public function resetButton()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
