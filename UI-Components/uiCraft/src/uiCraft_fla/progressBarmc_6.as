package uiCraft_fla
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class progressBarmc_6 extends MovieClip
   {
       
      
      public var cancel_mc:cancelCraftBtn;
      
      public var progressBar_mc:MovieClip;
      
      public function progressBarmc_6()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function cancelPressed() : *
      {
         ExternalInterface.call("cancelCraft");
      }
      
      function frame1() : *
      {
         this.progressBar_mc.mouseEnabled = false;
         this.progressBar_mc.mouseChildren = false;
         this.cancel_mc.init(this.cancelPressed);
      }
   }
}
