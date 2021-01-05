package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class SortEntry extends MovieClip
   {
       
      
      public var check_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var oldChecked:Boolean;
      
      public function SortEntry()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setCheck(param1:Boolean) : *
      {
         this.check_mc.visible = param1;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.hl_mc.visible = false;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.hl_mc.visible = true;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Dialog_Click");
         this.list.select(this.list_pos);
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function selectElement() : *
      {
         this.check_mc.visible = true;
      }
      
      public function deselectElement() : *
      {
         this.check_mc.visible = false;
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}
