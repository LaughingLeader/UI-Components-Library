package
{
   import LS_Classes.inventoryClass;
   import LS_Classes.textEffect;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class playerInventory extends MovieClip
   {
       
      
      public var bagIcon_mc:MovieClip;
      
      public var drop_mc:MovieClip;
      
      public var frame_mc:MovieClip;
      
      public var gold_txt:TextField;
      
      public var iconHolder_mc:empty;
      
      public var invBg_mc:MovieClip;
      
      public var lockBtn_mc:lockButton;
      
      public var name_txt:TextField;
      
      public var toggleInd_mc:MovieClip;
      
      public var weightAndGoldIcons_mc:MovieClip;
      
      public var weight_txt:TextField;
      
      public var invOpen:Boolean;
      
      public const containerBGDisc:Number = 0;
      
      public var inv:inventoryClass;
      
      public var base:MovieClip;
      
      public var textY:Number;
      
      public function playerInventory()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function updateTextColours() : *
      {
         var _loc1_:uint = 14799823;
         var _loc2_:uint = 10850957;
         if(this.disableActions)
         {
            this.gold_txt.textColor = this.weight_txt.textColor = this.name_txt.textColor = _loc1_;
         }
         else
         {
            this.gold_txt.textColor = this.weight_txt.textColor = this.name_txt.textColor = !!this.selected?uint(16777215):uint(_loc2_);
         }
      }
      
      public function setSelected(param1:Boolean) : *
      {
         this.selected = param1;
         this.updateTextColours();
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.base.isDragging)
         {
            this.drop_mc.visible = true;
            this.frame_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
         else
         {
            this.frame_mc.playerheader.gotoAndStop(2);
            this.frame_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.drop_mc.visible = false;
         this.frame_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.frame_mc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.frame_mc.playerheader.gotoAndStop(1);
         this.updateTextAndIconPoY(this.textY);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.frame_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.frame_mc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.frame_mc.playerheader.gotoAndStop(3);
         this.updateTextAndIconPoY(this.textY + 2);
      }
      
      public function updateTextAndIconPoY(param1:Number) : *
      {
         this.gold_txt.y = this.weight_txt.y = this.name_txt.y = param1;
         this.weightAndGoldIcons_mc.y = this.gold_txt.y + 6;
         this.toggleInd_mc.y = this.gold_txt.y + 15;
         this.bagIcon_mc.y = this.gold_txt.y - 4;
         this.lockBtn_mc.y = this.gold_txt.y;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.inv)
         {
            if(this.base.isDragging)
            {
               ExternalInterface.call("stopDragOnChar",this.id);
            }
            else
            {
               this.setOpenState(!this.invOpen);
            }
         }
         this.updateTextAndIconPoY(this.textY);
         this.frame_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.frame_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.frame_mc.playerheader.gotoAndStop(2);
      }
      
      public function setOpenState(param1:Boolean) : *
      {
         this.invOpen = param1;
         if(this.invOpen)
         {
            this.toggleInd_mc.scaleY = 1;
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Bag_Expand");
         }
         else
         {
            this.toggleInd_mc.scaleY = -1;
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Bag_Collapse");
         }
         this.updateBG();
         this.list.positionElements();
      }
      
      public function init() : *
      {
         this.name_txt.mouseEnabled = false;
         this.gold_txt.mouseEnabled = false;
         this.weight_txt.mouseEnabled = false;
         this.toggleInd_mc.mouseEnabled = false;
         this.toggleInd_mc.mouseChildren = false;
         this.drop_mc.mouseEnabled = false;
         this.drop_mc.mouseChildren = false;
         this.name_txt.filters = this.gold_txt.filters = this.weight_txt.filters = textEffect.createStrokeFilter(0,1.4,2,1.8,3);
         this.lockBtn_mc.init(this.lockInventory);
         this.lockBtn_mc.visible = false;
         this.lockBtn_mc.setActive(true);
      }
      
      public function setLockButtonVisible(param1:Boolean) : *
      {
         if(param1 != this.lockBtn_mc.visible)
         {
            this.lockBtn_mc.visible = param1;
            this.bagIcon_mc.visible = !param1;
         }
      }
      
      public function lockInventory() : *
      {
         ExternalInterface.call("lockInventory",this.id,this.lockBtn_mc.isActive);
      }
      
      public function updateBG() : *
      {
         if(this.invOpen)
         {
            this.inv.visible = true;
            this.invBg_mc.height = this.inv.height + this.inv.y + this.containerBGDisc;
         }
         else
         {
            this.inv.visible = false;
            this.invBg_mc.height = this.frame_mc.height + 2;
         }
         this.heightOverride = this.invBg_mc.height;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.frame_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.frame_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.bagIcon_mc.mouseChildren = false;
         this.bagIcon_mc.mouseEnabled = false;
         this.weightAndGoldIcons_mc.mouseChildren = false;
         this.weightAndGoldIcons_mc.mouseEnabled = false;
         this.iconHolder_mc.visible = false;
         this.textY = 14;
      }
   }
}
