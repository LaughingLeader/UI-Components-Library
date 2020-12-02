package pyramid_fla
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var popup_mc:MovieClip;
      public const iconHeight = 54;
      public const iconWidth = 54;
      public var events:Array;
      public var layout:String;
      public const anchorId:String = "pyramid";
      public const anchorPos:String = "center";
      public const anchorTPos:String = "center";
      public const anchorTarget:String = "screen";
      public var text_array:Array;
      public var pyramid_array:Array;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventInit() : *
      {
         this.popup_mc.alpha = 0;
         this.popup_mc.init();
         ExternalInterface.call("registerAnchorId","pyramid");
         ExternalInterface.call("setAnchor","center","screen","center");
      }
      
      public function onEventResize() : *
      {
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UIAccept":
               _loc2_ = true;
               break;
            case "IE ToggleInGameMenu":
            case "IE UICancel":
               this.close();
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onEventDown(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UIAccept":
               _loc2_ = true;
               break;
            case "IE ToggleInGameMenu":
            case "IE UICancel":
               _loc2_ = true;
               break;
            case "IE UILeft":
               this.popup_mc.pyramidsList.previous();
               _loc2_ = true;
               break;
            case "IE UIRight":
               this.popup_mc.pyramidsList.next();
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function open() : *
      {
         this.popup_mc.alpha = 1;
      }
      
      public function close() : *
      {
         this.popup_mc.alpha = 0;
         this.closeAnimDone();
      }
      
      public function closeAnimDone() : *
      {
         ExternalInterface.call("hideUI");
      }
      
      public function setPyramid(elementID:Number,  iggyIconName:String, param3:String, isVisible:Boolean) : *
      {
         this.popup_mc.setPyramid(elementID, iggyIconName, isVisible);
      }
      
      public function setTitle(param1:String) : *
      {
         this.popup_mc.setTitle(param1);
      }
      
      public function updatePyramids() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.pyramid_array.length)
         {
            this.setPyramid(this.pyramid_array[_loc1_++],this.pyramid_array[_loc1_++],this.pyramid_array[_loc1_++],this.pyramid_array[_loc1_++]);
         }
         this.popup_mc.cleanupObsolete();
         this.pyramid_array = new Array();
      }
      
      public function clearPyramids() : *
      {
         this.popup_mc.pyramidsList.clearElements();
      }
      
      public function selectClickedTab(param1:MovieClip) : *
      {
         ExternalInterface.call("tabClicked",param1.id);
      }
      
      public function addBtnHint(param1:Number, param2:String, param3:Number) : *
      {
      }
      
      public function hideWin() : void
      {
         this.popup_mc.visible = false;
      }
      
      public function showWin() : void
      {
         this.popup_mc.visible = true;
      }
      
      public function getHeight() : Number
      {
         return this.popup_mc.height;
      }
      
      public function getWidth() : Number
      {
         return this.popup_mc.width;
      }
      
      public function setX(param1:Number) : void
      {
         this.popup_mc.x = param1;
      }
      
      public function setY(param1:Number) : void
      {
         this.popup_mc.y = param1;
      }
      
      public function setPos(param1:Number, param2:Number) : void
      {
         this.popup_mc.x = param1;
         this.popup_mc.y = param2;
      }
      
      public function getX() : Number
      {
         return this.popup_mc.x;
      }
      
      public function getY() : Number
      {
         return this.popup_mc.y;
      }
      
      public function setText(param1:Number, param2:String) : *
      {
         if(param1 >= 0 && param1 < this.text_array.length)
         {
            this.text_array[param1].htmlText = param2.toUpperCase();
         }
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UILeft","IE UIRight","IE UIAccept","IE UICancel","IE ToggleInGameMenu");
         this.layout = "fixed";
         this.text_array = new Array();
         this.pyramid_array = new Array();
      }
   }
}
