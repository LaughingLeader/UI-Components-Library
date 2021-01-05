package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class TutCategory extends MovieClip
   {
       
      
      public var amount_txt:TextField;
      
      public var expandContract_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var listContainer_mc:empty;
      
      public var title_txt:TextField;
      
      public var _isOpen:Boolean;
      
      public var texty:Number;
      
      public var entryHeight:Number;
      
      public var listOffset:Number;
      
      public function TutCategory()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.hit_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.hit_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.listContainer_mc.visible = false;
         this.listContainer_mc.scaleY = 0;
         this.texty = 12;
         this._isOpen = false;
      }
      
      public function selectElement() : *
      {
         this.setTextColor(this.selectColour);
      }
      
      public function deselectElement() : *
      {
         this.setTextColor(this.deselectColour);
      }
      
      public function onAction() : *
      {
         this.toggleOpenClose();
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.toggleOpenClose();
      }
      
      public function toggleOpenClose() : *
      {
         this.setOpen(!this._isOpen);
      }
      
      public function setOpen(param1:Boolean) : *
      {
         this._isOpen = param1;
         this.listContainer_mc.visible = this._isOpen;
         if(this._isOpen)
         {
            this.expandContract_mc.gotoAndStop(2);
         }
         else
         {
            this.expandContract_mc.gotoAndStop(1);
         }
         this.refreshHeight();
         if(this.mainList)
         {
            this.mainList.positionElements();
            if(this._isOpen)
            {
               this.mainList.getGroupInView(this);
            }
         }
      }
      
      public function onElementAdded(param1:MovieClip) : *
      {
         this.refreshHeight();
      }
      
      public function refreshHeight() : *
      {
         if(this._isOpen)
         {
            this.listContainer_mc.scaleY = 1;
            this.listContainer_mc.y = this.entryHeight;
            this.list.positionElements();
            this.heightOverride = this.entryHeight * Math.round(this.list.height / this.entryHeight) + this.entryHeight;
         }
         else
         {
            this.listContainer_mc.scaleY = 0;
            this.heightOverride = this.entryHeight;
         }
         if(this.mainList && !this._isOpen)
         {
            this.mainList.checkScrollbarBottom();
         }
      }
      
      public function setTextColor(param1:uint) : *
      {
         this.title_txt.textColor = param1;
      }
      
      function frame1() : *
      {
      }
   }
}
