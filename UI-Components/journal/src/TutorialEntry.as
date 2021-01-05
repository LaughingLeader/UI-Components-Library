package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class TutorialEntry extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var imgAnim_mc:MovieClip;
      
      public var img_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public function TutorialEntry()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function Init() : *
      {
         this.title_txt.mouseEnabled = false;
         this.img_mc.stop();
         this.imgAnim_mc.stop();
         this.hl_mc.alpha = 0;
         this.hl_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.hl_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.hl_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
      }
      
      public function onAction() : *
      {
         var _loc1_:MovieClip = parent.parent.parent.parent.parent as MovieClip;
         if(_loc1_)
         {
            _loc1_.onAction();
         }
      }
      
      public function deselectElement() : *
      {
         this.setTextColor(this.deselectColour);
         this.img_mc.gotoAndStop(1);
         this.imgAnim_mc.gotoAndStop(1);
      }
      
      public function selectElement() : *
      {
         this.img_mc.gotoAndStop(4);
         this.imgAnim_mc.gotoAndStop(4);
         this.setTextColor(this.selectColour);
      }
      
      public function setTextColor(param1:uint) : *
      {
         this.title_txt.textColor = param1;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.hl_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.hl_mc.alpha = 1;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.hl_mc.alpha = 0;
         this.hl_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
         this.hl_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(this.mainlist)
         {
            this.mainlist.selectMC(this);
         }
      }
      
      function frame1() : *
      {
      }
   }
}
