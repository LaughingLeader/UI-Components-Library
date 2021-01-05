package containerInventory_fla
{
   import flash.display.MovieClip;
   
   public dynamic class multiselect_19 extends MovieClip
   {
       
      
      public function multiselect_19()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,19,this.frame20);
      }
      
      function frame1() : *
      {
         stop();
         visible = false;
         mouseEnabled = false;
      }
      
      function frame2() : *
      {
         visible = true;
      }
      
      function frame20() : *
      {
         stop();
      }
   }
}
