package contextMenu_fla
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class MainTimeline extends MovieClip
   {
      public var windowsMenu_mc:MovieClip;  
      public var events:Array;
      public var layout:String;
      public var curTooltip:int;
      public var hasTooltip:Boolean;
      public var closing:Boolean;
      public const offsetX:Number = 0;
      public const offsetY:Number = 0;
      public var tweenTime:Number;
      public var text_array:Array;
      public var buttonArr:Array;

      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setTitle(param1:String, param2:Boolean = false) : *
      {
         this.windowsMenu_mc.setTitle(param1);
      }
      
      public function onEventInit() : *
      {
      }
      
      public function onEventResize() : *
      {
      }
      
      public function getList() : listDisplay
      {
         return this.windowsMenu_mc.list;
      }
      
      public function onEventUp(param1:Number) : Boolean
      {
         var _loc3_:MovieClip = null;
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UIAccept":
               _loc3_ = this.getList().getCurrentMovieClip();
               if(_loc3_)
               {
                  _loc3_.pressedButton();
               }
               _loc2_ = true;
               break;
            case "IE UIUp":
               this.previous();
               _loc2_ = true;
               break;
            case "IE UIDown":
               this.next();
               _loc2_ = true;
               break;
            case "IE UILeft":
               ExternalInterface.call("PreviousContext");
               _loc2_ = true;
               break;
            case "IE UIRight":
               ExternalInterface.call("NextContext");
               _loc2_ = true;
               break;
            case "IE UIBack":
            case "IE UICancel":
               this.close();
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onEventDown(param1:Number) : Boolean
      {
         return false;
      }
      
      public function resetSelection() : *
      {
      }
      
      public function updateButtons() : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         this.windowsMenu_mc.list.clearElements();
         var _loc1_:* = 0;
         while(_loc1_ < this.buttonArr.length)
         {
            if(this.buttonArr[_loc1_] != undefined)
            {
               _loc2_ = Number(this.buttonArr[_loc1_]);
               _loc3_ = Number(this.buttonArr[_loc1_ + 1]);
               _loc4_ = Boolean(this.buttonArr[_loc1_ + 2]);
               _loc5_ = String(this.buttonArr[_loc1_ + 3]);
               _loc6_ = String(this.buttonArr[_loc1_ + 4]);
               _loc7_ = Boolean(this.buttonArr[_loc1_ + 5]);
               _loc8_ = Boolean(this.buttonArr[_loc1_ + 6]);
               this.addButton(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
            }
            _loc1_ = _loc1_ + 7;
         }
         this.addButtonsDone();
         this.buttonArr = new Array();
      }
      
      public function addButton(ID:Number, actionID:Number, clickSound:Boolean, param4:String, text:String, param6:Boolean = false, param7:Boolean = false) : *
      {
         if(this.windowsMenu_mc.visible)
         {
            this.windowsMenu_mc.addEntry(ID,actionID,clickSound,text,param6,param7);
         }
      }
      
      public function addButtonsDone() : *
      {
         if(this.windowsMenu_mc.visible)
         {
            this.windowsMenu_mc.updateDone();
         }
      }
      
      public function setIggyImage(param1:MovieClip, param2:String) : *
      {
         var _loc3_:MovieClip = null;
         if(param1 && (!param1.texture || param1.texture != param2))
         {
            this.removeChildrenOf(param1.img_mc);
            if(param2 == "")
            {
               param1.img_mc.visible = false;
            }
            else
            {
               param1.img_mc.visible = true;
               _loc3_ = new IggyIcon();
               _loc3_.name = "iggy_" + param2;
               param1.img_mc.addChild(_loc3_);
            }
            param1.texture = param2;
         }
      }
      
      public function removeChildrenOf(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         if(param1 && param1.numChildren != 0)
         {
            _loc2_ = param1.numChildren;
            while(_loc2_ > 0)
            {
               _loc2_--;
               param1.removeChildAt(_loc2_);
            }
         }
      }
      
      public function clearButtons() : *
      {
         this.windowsMenu_mc.list.clearElements();
      }
      
      public function selectButton(param1:MovieClip) : *
      {
         this.getList().selectMC(param1);
      }
      
      public function open() : *
      {
         if(this.windowsMenu_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_GM_Generic_Slide_Open");
            this.windowsMenu_mc.alpha = 1;
         }
         stage.addEventListener(MouseEvent.CLICK,this.onCloseUI);
      }
      
      public function onCloseUI(param1:MouseEvent) : *
      {
         if(!param1.target.isButton)
         {
            this.close();
         }
      }
      
      public function onWheel(param1:MouseEvent) : *
      {
         if(param1.delta > 0)
         {
            ExternalInterface.call("PreviousContext");
         }
         else
         {
            ExternalInterface.call("NextContext");
         }
      }
      
      public function close() : *
      {
         stage.removeEventListener("rightMouseDown",this.onCloseUI);
         stage.removeEventListener(MouseEvent.CLICK,this.onCloseUI);
         if(this.windowsMenu_mc.visible)
         {
            this.windowsMenu_mc.alpha = 0;
            ExternalInterface.call("PlaySound","UI_GM_Generic_Slide_Close");
            ExternalInterface.call("menuClosed");
         }
      }
      
      public function next() : *
      {
         this.getList().next();
      }
      
      public function previous() : *
      {
         this.getList().previous();
      }
      
      public function setPos(param1:Number, param2:Number) : *
      {
      }
      
      public function setText(param1:Number, param2:String) : *
      {
         if(param1 >= 0 && param1 < this.text_array.length)
         {
            this.text_array[param1].htmlText = param2;
         }
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UILeft","IE UIRight","IE UIUp","IE UIDown","IE UIAccept","IE UIBack","IE UICancel");
         this.layout = "fixed";
         this.curTooltip = -1;
         this.hasTooltip = false;
         this.closing = false;
         this.tweenTime = 0.3;
         this.text_array = new Array();
         this.buttonArr = new Array();
      }
   }
}
