package
{
   import flash.display.MovieClip;
   
   public dynamic class up_id extends MovieClip
   {
       
      
      public function up_id()
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
