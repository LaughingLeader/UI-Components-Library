package
{
   import LS_Classes.LSStateButton;
   
   public dynamic class Tab extends LSStateButton
   {
       
      
      public function Tab()
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
