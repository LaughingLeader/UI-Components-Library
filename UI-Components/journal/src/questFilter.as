package
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class questFilter extends MovieClip
   {
       
      
      public var container_mc:empty;
      
      public var hit_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var questList:listDisplay;
      
      public var filterName:String;
      
      public var heightOverride:Number;
      
      public var lineHeight:Number;
      
      public var parentList:MovieClip;
      
      public var isOpened:Boolean;
      
      public var priority:int;
      
      public var root_mc:MovieClip;
      
      public function questFilter()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init(param1:String, param2:MovieClip, param3:* = true) : *
      {
         var _loc4_:int = 0;
         if(param2)
         {
            this.questList = new listDisplay();
            this.questList.EL_SPACING = 0;
            this.questList.sortOn(["isPostponed","priority","qName"],[Array.NUMERIC,Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
            this.container_mc.addChild(this.questList);
            this.container_mc.visible = param3;
            this.isOpened = true;
            this.root_mc = root as MovieClip;
            this.parentList = param2;
            this.filterName = param1;
            this.title_txt.htmlText = param1;
            this.title_txt.autoSize = TextFieldAutoSize.LEFT;
            this.title_txt.textColor = 7346462;
            _loc4_ = 0;
            this.container_mc.y = this.title_txt.y + this.title_txt.height + _loc4_;
            this.calculateHeight();
         }
      }
      
      public function setHeightOverride() : *
      {
         this.calculateHeight();
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function expand(param1:Boolean) : *
      {
      }
      
      public function calculateHeight() : *
      {
         if(this.isOpened)
         {
            this.container_mc.visible = true;
            this.heightOverride = Math.ceil((this.container_mc.y + this.container_mc.height) / this.lineHeight) * this.lineHeight - this.lineHeight;
         }
         else
         {
            this.container_mc.visible = false;
            this.heightOverride = Math.round((this.title_txt.y + this.title_txt.textHeight) / this.lineHeight) * this.lineHeight;
         }
         this.parentList.positionElements();
      }
      
      function frame1() : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.hit_mc.addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
      }
   }
}
