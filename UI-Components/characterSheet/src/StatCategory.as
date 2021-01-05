package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public dynamic class StatCategory extends MovieClip
   {
       
      
      public var amount_txt:TextField;
      
      public var bg_mc:MovieClip;
      
      public var listContainer_mc:empty;
      
      public var title_txt:TextField;
      
      public var isOpen:Boolean;
      
      public var texty:Number;
      
      public function StatCategory()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(!!this.isOpen?5:2);
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(!!this.isOpen?4:1);
         this.bg_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.title_txt.y = this.texty;
         this.amount_txt.y = this.texty;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(!!this.isOpen?6:3);
         this.bg_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.title_txt.y = this.texty + 2;
         this.amount_txt.y = this.texty + 2;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         this.bg_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.isOpen = !this.isOpen;
         this.listContainer_mc.visible = this.isOpen;
         if(this.listContainer_mc.visible)
         {
            this.listContainer_mc.scaleY = 1;
            this.listContainer_mc.y = 26;
         }
         else
         {
            this.listContainer_mc.scaleY = 0;
            this.listContainer_mc.y = 18;
         }
         this.title_txt.y = this.texty;
         this.amount_txt.y = this.texty;
         this.bg_mc.gotoAndStop(!!this.isOpen?5:2);
         if(this.mainList)
         {
            this.mainList.positionElements();
         }
      }
      
      function frame1() : *
      {
         this.isOpen = true;
         this.texty = 0;
         this.title_txt.mouseEnabled = false;
         this.amount_txt.mouseEnabled = false;
      }
   }
}
