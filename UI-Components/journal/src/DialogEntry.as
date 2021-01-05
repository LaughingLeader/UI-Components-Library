package
{
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class DialogEntry extends MovieClip
   {
       
      
      public var title_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var list:scrollList;
      
      public function DialogEntry()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setTextColour(param1:uint) : *
      {
         this.title_mc.dateTime_txt.textColor = param1;
         this.title_mc.name_txt.textColor = param1;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
         this.title_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.base.toggleDialog(this,true);
         ExternalInterface.call("questPressed",this.id);
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
         this.title_mc.hl_mc.alpha = 0;
      }
      
      public function selectElement(param1:*) : *
      {
         this.title_mc.hl_mc.alpha = 1;
      }
      
      function frame1() : *
      {
         this.title_mc.hl_mc.alpha = 0;
         this.title_mc.hl_mc.mouseEnabled = false;
         this.title_mc.name_txt.mouseEnabled = false;
         this.title_mc.dateTime_txt.mouseEnabled = false;
         this.title_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.title_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.title_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.base = (root as MovieClip).journal_mc;
         this.list = this.base.dialogList;
      }
   }
}
