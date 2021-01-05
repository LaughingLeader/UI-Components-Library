package
{
   import LS_Classes.LSStateButton;
   
   public dynamic class tabBtn extends LSStateButton
   {
       
      
      public function tabBtn()
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
