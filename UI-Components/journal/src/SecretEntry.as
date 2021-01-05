package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class SecretEntry extends MovieClip
   {
       
      
      public var info_mc:MovieClip;
      
      public var spacing_mc:MovieClip;
      
      public var title_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var list:MovieClip;
      
      public function SecretEntry()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
         this.title_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("questPressed",this.id);
         this.base.toggleQuest(this,true);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.title_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.title_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Over");
         this.base.setCursorPositionMC(this);
      }
      
      public function deselectElement(param1:*) : *
      {
         this.title_mc.hl_mc.visible = false;
      }
      
      public function selectElement(param1:*) : *
      {
         this.title_mc.hl_mc.visible = true;
      }
      
      public function stopAnim() : *
      {
      }
      
      function frame1() : *
      {
         this.title_mc.hl_mc.visible = false;
         this.title_mc.hl_mc.mouseEnabled = false;
         this.title_mc.img_mc.mouseEnabled = false;
         this.title_mc.name_txt.mouseEnabled = false;
         this.title_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.title_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.title_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.base = (root as MovieClip).journal_mc;
         this.list = parent.parent.parent as MovieClip;
      }
   }
}
