package containerInventory_fla
{
   import LS_Classes.larTween;
   import LS_Classes.scrollbar;
   import LS_Classes.tooltipHelper;
   import fl.motion.easing.Quartic;
   import fl.motion.easing.Sine;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public dynamic class inventory_1 extends MovieClip
   {
       
      
      public var barsBg_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public var close_mc:MovieClip;
      
      public var container_mc:MovieClip;
      
      public var hitArea_mc:hitareaBG;
      
      public var multiSelect_mc:MovieClip;
      
      public var pickpocketFrame_mc:MovieClip;
      
      public var takeAll_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var valueBar_mc:MovieClip;
      
      public var weightBar_mc:MovieClip;
      
      public var weightValue_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var bgBitm:Bitmap;
      
      public var minRows:Number;
      
      public var maxRows:Number;
      
      public var rows:Number;
      
      public var cols:Number;
      
      public var cellHeight:Number;
      
      public var cellWidth:Number;
      
      public var cellSpacing:Number;
      
      public var bgDiscrap:Number;
      
      public var overContainer:Boolean;
      
      public var frameCounterHack:int;
      
      public var paintMode:Boolean;
      
      public var paintValue:Boolean;
      
      public var mousePosX:Number;
      
      public var mousePosY:Number;
      
      public const startDragItemDiff:Number = 6;
      
      public var _sb:scrollbar;
      
      public var invWidth:Number;
      
      public var invHeight:Number;
      
      public const startDragDiff:uint = 20;
      
      public var dragStartMP:Point;
      
      public var windowDragStarted:Boolean;
      
      public var scrollRectWidth:Number;
      
      public var currentHLSlot:Number;
      
      public var slot_array:Array;
      
      public var item_array:Array;
      
      public var selectedTab:Number;
      
      public var tabAmount:Number;
      
      public var gridRefresh:Boolean;
      
      public var ContainerInfo:Object;
      
      public var clickMP:Point;
      
      public var draggingHandle:Number;
      
      public var charIconSize:Number;
      
      public function inventory_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function get sb() : scrollbar
      {
         if(this._sb == null)
         {
            if(this.base != null && this.base.controllerMode)
            {
               this._sb = new scrollbar("down_id_c","up_id_c","handle_id_c","scrollBg_id_c");
            }
            else
            {
               this._sb = new scrollbar("down_id","up_id","handle_id","scrollBg_id");
            }
         }
         this._sb.m_hideWhenDisabled = true;
         this._sb.m_animateScrolling = true;
         this._sb.m_SCROLLSPEED = this.cellHeight + this.cellSpacing;
         addChild(this._sb);
         this._sb.addEventListener(Event.CHANGE,this.onScroll);
         this._sb.m_contentSizeDisc = 6;
         this._sb.addContent(this.container_mc);
         this._sb.y = this.container_mc.y;
         this._sb.x = this.container_mc.x + this.container_mc.width;
         this._sb.scrollbarVisible();
         return this._sb;
      }
      
      public function setMultiSelection(param1:Boolean) : *
      {
         var _loc2_:uint = 0;
         ExternalInterface.call("setMultiselection",param1);
         if(param1)
         {
            this.multiSelect_mc.gotoAndPlay(2);
         }
         else
         {
            this.multiSelect_mc.gotoAndPlay(20);
            _loc2_ = 0;
            while(_loc2_ < this.item_array.length)
            {
               if(this.item_array[_loc2_] != null && this.item_array[_loc2_] is MovieClip)
               {
                  (this.item_array[_loc2_] as MovieClip).multi_mc.visible = false;
               }
               _loc2_++;
            }
         }
      }
      
      public function onScroll(param1:Event) : *
      {
         ExternalInterface.call("hideTooltip");
         ExternalInterface.call("cancelContextMenu");
      }
      
      public function dragInv(param1:MouseEvent) : *
      {
         this.windowDragStarted = false;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.dragInvMove);
         this.dragStartMP.y = stage.mouseY;
         this.dragStartMP.x = stage.mouseX;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragInv);
      }
      
      public function dragInvMove(param1:MouseEvent) : *
      {
         if(this.dragStartMP.x + this.startDragDiff > stage.mouseX || this.dragStartMP.y + this.startDragDiff > stage.mouseY || this.dragStartMP.x - this.startDragDiff < stage.mouseX || this.dragStartMP.y - this.startDragDiff < stage.mouseY)
         {
            ExternalInterface.call("hideTooltip");
            ExternalInterface.call("startMoveWindow");
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragInvMove);
            this.windowDragStarted = true;
         }
      }
      
      public function stopDragInv(param1:MouseEvent) : *
      {
         if(this.windowDragStarted)
         {
            ExternalInterface.call("cancelMoveWindow");
         }
         else
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragInvMove);
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragInv);
         this.windowDragStarted = false;
      }
      
      public function closeUIOnClick(param1:MouseEvent) : *
      {
      }
      
      public function closeUI() : *
      {
         if(this.base.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
         }
         ExternalInterface.call("hideUI");
      }
      
      public function BGUP(param1:MouseEvent) : *
      {
         if(this.base.isDragging)
         {
            ExternalInterface.call("cancelDragging");
         }
      }
      
      public function updateRows() : *
      {
         this.container_mc.iggy_bg_mc.bg_mc.height = this.rows * (this.cellHeight + this.cellSpacing) - this.cellSpacing;
         ExternalInterface.call("rowsChanged",this.rows);
      }
      
      public function setBgTexture(param1:String) : *
      {
         var _loc2_:larTween = null;
         if(param1 && param1 != "")
         {
            IggyFunctions.setTextureForBitmap(this.bgBitm,param1);
            _loc2_ = new larTween(this.bg_mc,"alpha",Quartic.easeOut,NaN,1,0.6);
            if(this.bgBitm && this.ContainerInfo)
            {
               this.bgBitm.x = this.ContainerInfo.x;
               this.bgBitm.y = this.ContainerInfo.y;
            }
         }
      }
      
      public function setContainerType(param1:Number) : *
      {
         var _loc2_:larTween = new larTween(this,"alpha",Sine.easeOut,NaN,1,0.05,this.fadedIn,null,0.1);
         this.ContainerInfo = this.hitArea_mc.setContainerType(param1);
         if(this.bgBitm && this.ContainerInfo)
         {
            this.bgBitm.x = this.ContainerInfo.x;
            this.bgBitm.y = this.ContainerInfo.y;
         }
      }
      
      public function fadedIn() : *
      {
         var _loc1_:MovieClip = null;
         if(this.currentHLSlot != -1 && this.base.controllerMode)
         {
            _loc1_ = this.getSlot(this.currentHLSlot);
            if(_loc1_)
            {
               _loc1_.onMouseOver();
            }
         }
      }
      
      public function addItem(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean = false) : *
      {
         var _loc6_:Number = Math.ceil((param1 + 1) / this.cols);
         if(_loc6_ > this.rows && _loc6_ <= this.maxRows)
         {
            this.extendGrid(_loc6_ - this.rows + 1);
         }
         var _loc7_:MovieClip = this.getSlot(param1);
         if(_loc7_ != null)
         {
            _loc7_.itemHandle = param2;
            _loc7_.amount = param3;
            _loc7_.disable_mc.visible = param5;
            _loc7_.showSelected(param4);
            if(param3 == 1)
            {
               _loc7_.amount_mc.amount_txt.htmlText = "";
               _loc7_.amount_mc.visible = false;
            }
            else
            {
               _loc7_.amount_mc.amount_txt.htmlText = param3;
               _loc7_.amount_mc.visible = true;
            }
            this.item_array.push(_loc7_);
            if(this.gridRefresh)
            {
               this.refreshGridSize();
            }
         }
      }
      
      public function onDoubleClick(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = null;
         if(this.base.playerInventory)
         {
            _loc2_ = this.getSlot(this.currentHLSlot);
            if(_loc2_ && _loc2_.amount > 0)
            {
               ExternalInterface.call("doubleClickItem",_loc2_.itemHandle);
            }
         }
      }
      
      public function onContainerRightDown(param1:MouseEvent) : *
      {
         this.container_mc.addEventListener("rightMouseUp",this.onContainerRightUp);
         var _loc2_:MovieClip = this.getSlot(this.currentHLSlot);
         if(!this.base.isDragging && _loc2_ && _loc2_.amount > 0)
         {
            this.clickMP.x = _loc2_.mouseX;
            this.clickMP.y = _loc2_.mouseY;
         }
      }
      
      public function onContainerRightUp(param1:MouseEvent) : *
      {
         this.container_mc.removeEventListener("rightMouseUp",this.onContainerRightUp);
         var _loc2_:MovieClip = this.getSlot(this.currentHLSlot);
         if(!this.base.isDragging && _loc2_ && _loc2_.amount > 0)
         {
            ExternalInterface.call("rightClickItem",_loc2_.itemHandle);
         }
      }
      
      public function onContextMenuInputDown() : *
      {
         return false;
      }
      
      public function onContextMenuInputUp() : *
      {
         var _loc1_:MovieClip = null;
         var _loc2_:Point = null;
         if(this.overContainer && !this.base.isDragging)
         {
            _loc1_ = this.getSlot(this.currentHLSlot);
            if(_loc1_ && _loc1_.itemHandle != null)
            {
               _loc2_ = new Point(0,0);
               _loc2_ = _loc1_.localToGlobal(_loc2_);
               ExternalInterface.call("openContextMenu",_loc1_.itemHandle,-root.x + _loc2_.x + _loc1_.width * 0.5,-root.y + _loc2_.y + _loc1_.height * 0.5);
               return true;
            }
         }
         return false;
      }
      
      public function onContainerMiddleClick(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = this.getSlot(this.currentHLSlot);
         if(this.overContainer && _loc2_ && _loc2_.amount > 0)
         {
            ExternalInterface.call("middleClickItem",_loc2_.itemHandle);
         }
      }
      
      public function onContainerOver(param1:MouseEvent) : *
      {
         this.overContainer = true;
         this.container_mc.addEventListener(MouseEvent.ROLL_OUT,this.onContainerOut);
         this.container_mc.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckSlotsOver);
         this.container_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onContainerDown);
         this.container_mc.addEventListener("rightMouseDown",this.onContainerRightDown);
         this.container_mc.addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClick,false,0,true);
         this.sb.mouseWheelEnabled = true;
      }
      
      public function onContainerOut(param1:MouseEvent) : *
      {
         this.overContainer = false;
         this.clearCurrentHL();
         this.currentHLSlot = -1;
         this.container_mc.removeEventListener(MouseEvent.ROLL_OUT,this.onContainerOut);
         this.container_mc.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckSlotsOver);
         this.container_mc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onContainerDown);
         this.container_mc.removeEventListener("rightMouseDown",this.onContainerRightDown);
         this.container_mc.removeEventListener("rightMouseUp",this.onContainerRightUp);
         this.container_mc.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClick);
         this.sb.mouseWheelEnabled = false;
         ExternalInterface.call("slotUp");
      }
      
      public function onContainerUp(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = this.getSlot(this.currentHLSlot);
         if(this.base.isDragging)
         {
            if(this.currentHLSlot != -1)
            {
               ExternalInterface.call("stopDragging",this.currentHLSlot);
            }
            else
            {
               ExternalInterface.call("cancelDragging");
            }
         }
         else if(!this.base.playerInventory)
         {
            if(_loc2_ && _loc2_.amount > 0)
            {
               ExternalInterface.call("doubleClickItem",_loc2_.itemHandle);
            }
         }
         ExternalInterface.call("slotUp");
         removeEventListener(MouseEvent.MOUSE_MOVE,this.dragging);
      }
      
      public function onContainerDown(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = this.getSlot(this.currentHLSlot);
         if(_loc2_ && _loc2_.amount > 0)
         {
            this.clickMP.x = _loc2_.mouseX;
            this.clickMP.y = _loc2_.mouseY;
            this.draggingHandle = _loc2_.itemHandle;
            if(!(root as MovieClip).isDragging)
            {
               addEventListener(MouseEvent.MOUSE_MOVE,this.dragging);
               this.mousePosX = stage.mouseX;
               this.mousePosY = stage.mouseY;
            }
            ExternalInterface.call("slotDown",this.currentHLSlot);
         }
      }
      
      public function dragging(param1:MouseEvent) : *
      {
         if(this.mousePosX + this.startDragItemDiff < stage.mouseX || this.mousePosX - this.startDragItemDiff > stage.mouseX || this.mousePosY + this.startDragItemDiff < stage.mouseY || this.mousePosY - this.startDragItemDiff > stage.mouseY)
         {
            ExternalInterface.call("startDragging",this.draggingHandle);
            removeEventListener(MouseEvent.MOUSE_MOVE,this.dragging);
         }
      }
      
      public function onCheckSlotsOver(param1:MouseEvent) : *
      {
         var _loc2_:Number = this.getSlotOnXY(this.container_mc.mouseX,this.container_mc.mouseY + this.container_mc.scrollRect.y);
         this.selectSlot(_loc2_);
      }
      
      public function selectSlot(param1:Number) : *
      {
         var _loc2_:MovieClip = null;
         if(this.currentHLSlot != param1)
         {
            this.clearCurrentHL();
            this.currentHLSlot = param1;
            _loc2_ = this.getSlot(this.currentHLSlot);
            if(_loc2_)
            {
               _loc2_.onMouseOver();
               if(this.base.controllerMode)
               {
                  this.sb.scrollIntoView(_loc2_.y,_loc2_.height);
               }
            }
         }
         this.multiselectSlot();
      }
      
      public function multiselectSlot() : *
      {
         var _loc1_:MovieClip = null;
         var _loc2_:Boolean = false;
         if(this.paintMode && this.currentHLSlot != -1)
         {
            _loc1_ = this.getSlot(this.currentHLSlot);
            if(_loc1_ && _loc1_.itemHandle != 0)
            {
               _loc2_ = _loc1_.multi_mc.visible;
               if(this.paintValue != _loc2_)
               {
                  _loc1_.multi_mc.visible = this.paintValue;
                  ExternalInterface.call("setItemSelected",_loc1_.itemHandle,this.paintValue);
               }
            }
         }
      }
      
      public function clearMultiselection() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.slot_array.length)
         {
            this.slot_array[_loc1_].multi_mc.visible = false;
            _loc1_++;
         }
      }
      
      public function clearCurrentHL() : *
      {
         var _loc1_:MovieClip = null;
         if(this.currentHLSlot != -1)
         {
            _loc1_ = this.getSlot(this.currentHLSlot);
            if(_loc1_)
            {
               _loc1_.onMouseOut();
            }
         }
      }
      
      public function getSlotOnXY(param1:Number, param2:Number) : Number
      {
         var _loc3_:int = int(param1 / (this.cellWidth + this.cellSpacing));
         var _loc4_:int = param2 / (this.cellHeight + this.cellSpacing);
         return Math.floor(_loc4_ * this.cols + _loc3_);
      }
      
      public function cellLeft() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         ExternalInterface.call("PlaySound","UI_Gen_CursorMove");
         if(this.currentHLSlot == -1)
         {
            this.selectSlot(0);
         }
         else
         {
            _loc1_ = this.currentHLSlot - 1;
            _loc2_ = this.getRow(this.currentHLSlot);
            _loc3_ = this.getRow(_loc1_);
            if(_loc1_ >= 0 && _loc2_ == _loc3_)
            {
               this.selectSlot(_loc1_);
            }
         }
      }
      
      public function cellRight() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         ExternalInterface.call("PlaySound","UI_Gen_CursorMove");
         if(this.currentHLSlot == -1)
         {
            this.selectSlot(0);
         }
         else
         {
            _loc1_ = this.getRow(this.currentHLSlot);
            _loc2_ = this.getRow(this.currentHLSlot + 1);
            if(_loc1_ == _loc2_)
            {
               this.selectSlot(this.currentHLSlot + 1);
            }
         }
      }
      
      public function getRow(param1:Number) : *
      {
         return Math.ceil((param1 + 1) / this.cols);
      }
      
      public function cellUp() : *
      {
         var _loc1_:Number = NaN;
         ExternalInterface.call("PlaySound","UI_Gen_CursorMove");
         if(this.currentHLSlot == -1)
         {
            this.selectSlot(0);
         }
         else
         {
            _loc1_ = this.currentHLSlot - this.cols;
            if(_loc1_ >= 0)
            {
               this.selectSlot(_loc1_);
            }
         }
      }
      
      public function cellBottom() : *
      {
         var _loc1_:Number = NaN;
         ExternalInterface.call("PlaySound","UI_Gen_CursorMove");
         if(this.currentHLSlot == -1)
         {
            this.selectSlot(0);
         }
         else
         {
            _loc1_ = this.currentHLSlot + this.cols;
            if(_loc1_ < this.slot_array.length)
            {
               this.selectSlot(_loc1_);
            }
         }
      }
      
      public function cellAccept() : *
      {
         var _loc1_:* = undefined;
         if(this.currentHLSlot != -1)
         {
            _loc1_ = this.getSlot(this.currentHLSlot);
            if(_loc1_)
            {
               ExternalInterface.call("useItem");
            }
         }
      }
      
      public function setPaintMode(param1:Boolean) : *
      {
         var _loc2_:* = undefined;
         if(this.paintMode != param1)
         {
            this.paintMode = param1;
            if(this.currentHLSlot != -1)
            {
               _loc2_ = this.getSlot(this.currentHLSlot);
               if(_loc2_)
               {
                  this.paintValue = !_loc2_.multi_mc.visible;
                  this.multiselectSlot();
               }
            }
         }
      }
      
      public function cellShowActionMenu() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:Point = null;
         ExternalInterface.call("PlaySound","UI_Generic_Click");
         if(this.currentHLSlot != -1)
         {
            _loc1_ = this.getSlot(this.currentHLSlot);
            if(_loc1_)
            {
               _loc2_ = tooltipHelper.getGlobalPositionOfMC(_loc1_,root);
               if(_loc1_.itemHandle != -1 && _loc1_.amount != -1)
               {
                  ExternalInterface.call("showActionMenu",_loc1_.itemHandle,this.currentHLSlot,_loc2_.x + this.cellWidth,_loc2_.y);
               }
               else
               {
                  ExternalInterface.call("showActionMenu",Number(0),this.currentHLSlot,_loc2_.x + this.cellWidth,_loc2_.y);
               }
            }
         }
      }
      
      public function removeAsignItem(param1:Number) : *
      {
         var _loc2_:uint = 0;
         while(_loc2_ < this.item_array.length)
         {
            if(this.item_array[_loc2_].pos == param1)
            {
               this.item_array.splice(_loc2_,1);
               return;
            }
            _loc2_++;
         }
      }
      
      public function getLastUsedRow() : *
      {
         var _loc1_:Number = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.item_array.length)
         {
            if(this.item_array[_loc2_].pos > _loc1_)
            {
               _loc1_ = this.item_array[_loc2_].pos;
            }
            _loc2_++;
         }
         return Math.ceil((_loc1_ + 1) / this.cols);
      }
      
      public function removeItem(param1:Number) : *
      {
         var _loc2_:MovieClip = this.getSlot(param1);
         if(_loc2_ != null)
         {
            _loc2_.amount = -1;
            _loc2_.itemHandle = 0;
            _loc2_.amount_mc.amount_txt.htmlText = "";
            _loc2_.amount_mc.visible = false;
            _loc2_.hl_mc.visible = false;
            if(this.base.curTooltip == param1)
            {
               this.base.curTooltip = -1;
               this.base.hideTooltip();
            }
            this.removeAsignItem(param1);
         }
      }
      
      public function clearSlots() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.slot_array.length)
         {
            _loc2_ = this.slot_array[_loc1_];
            _loc2_.amount = -1;
            _loc2_.itemHandle = 0;
            _loc2_.amount_mc.amount_txt.htmlText = "";
            _loc2_.amount_mc.visible = false;
            _loc2_.hl_mc.visible = false;
            _loc2_.disable_mc.visible = false;
            if(this.base.curTooltip == _loc2_.pos)
            {
               ExternalInterface.call("hideTooltip");
               this.base.curTooltip = -1;
            }
            _loc1_++;
         }
         this.item_array = new Array();
      }
      
      public function updateItems() : *
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         this.gridRefresh = false;
         var _loc1_:Array = (root as MovieClip).itemsUpdateList;
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(_loc1_[_loc2_] != undefined)
            {
               _loc4_ = Number(_loc1_[_loc2_]);
               _loc5_ = Number(_loc1_[_loc2_ + 1]);
               _loc6_ = Number(_loc1_[_loc2_ + 2]);
               _loc7_ = Boolean(_loc1_[_loc2_ + 3]);
               _loc8_ = Boolean(_loc1_[_loc2_ + 4]);
               if(_loc6_ > 0)
               {
                  this.addItem(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
               }
               else
               {
                  this.removeItem(_loc4_);
               }
            }
            _loc2_ = _loc2_ + 5;
         }
         ExternalInterface.call("slotOut");
         var _loc3_:MovieClip = this.getSlot(this.currentHLSlot);
         if(_loc3_)
         {
            _loc3_.onMouseOver();
         }
         this.refreshGridSize();
         this.gridRefresh = true;
         this.base.itemsUpdateList = new Array();
      }
      
      public function refreshGridSize() : *
      {
         var _loc1_:Number = this.getLastUsedRow();
         var _loc2_:Number = _loc1_ + 1;
         if(_loc2_ > this.rows)
         {
            if(_loc2_ <= this.maxRows)
            {
               this.extendGrid(1);
            }
         }
         else if(_loc2_ < this.rows)
         {
            _loc2_ = Math.max(_loc2_,this.minRows);
            this.shortenGrid(this.rows - _loc2_);
         }
      }
      
      public function charIconResize(param1:Bitmap) : *
      {
      }
      
      public function init() : *
      {
         this.bgBitm = new Bitmap(new bitmapPlaceholder(100,100));
         this.bgBitm.smoothing = true;
         this.bg_mc.addChild(this.bgBitm);
         this.hitArea_mc.init();
         this.setupGrid();
         ExternalInterface.call("getItemList",0);
         this.container_mc.scrollRect = new Rectangle(0,0,this.scrollRectWidth,this.invHeight);
         this.container_mc.addEventListener(MouseEvent.MOUSE_UP,this.onContainerUp);
         this.weightValue_mc.visible = false;
         this.valueBar_mc.visible = false;
         this.barsBg_mc.visible = false;
         this.weightBar_mc.visible = false;
         this.pickpocketFrame_mc.visible = false;
         this.alpha = 0;
         this.multiSelect_mc.visible = false;
         this.updateRows();
      }
      
      public function getSlot(param1:Number) : MovieClip
      {
         var _loc2_:uint = 0;
         while(_loc2_ < this.slot_array.length)
         {
            if(this.slot_array[_loc2_].pos == param1)
            {
               this.slot_array[_loc2_].i = _loc2_;
               return this.slot_array[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function setupGrid() : *
      {
         var _loc2_:uint = 0;
         var _loc3_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.rows)
         {
            _loc2_ = 0;
            while(_loc2_ < this.cols)
            {
               _loc3_ = new Cell();
               _loc3_.width = this.cellWidth;
               _loc3_.height = this.cellHeight;
               _loc3_.pos = this.slot_array.length;
               _loc3_.hl_mc.visible = false;
               _loc3_.disable_mc.visible = false;
               _loc3_.amount = -1;
               _loc3_.itemHandle = 0;
               _loc3_.x = (this.cellWidth + this.cellSpacing) * _loc2_ - this.bgDiscrap;
               _loc3_.y = (this.cellHeight + this.cellSpacing) * _loc1_ - this.bgDiscrap;
               _loc3_.name = "c" + _loc1_ + "_" + _loc2_;
               this.container_mc.addChild(_loc3_);
               this.slot_array.push(_loc3_);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function shortenGrid(param1:Number) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1 > 0)
         {
            _loc2_ = this.slot_array.length - 1;
            _loc3_ = _loc2_ - param1 * this.cols;
            _loc4_ = _loc2_;
            while(_loc4_ > _loc3_)
            {
               if(this.slot_array[_loc4_] != null)
               {
                  this.slot_array[_loc4_].stopTweens();
                  this.container_mc.removeChild(this.slot_array[_loc4_]);
               }
               _loc4_--;
            }
            this.slot_array.splice(_loc3_ + 1,param1 * this.cols);
            this.rows = this.rows - param1;
            this.updateRows();
            this.sb.scrollToFit();
            this.sb.scrollbarVisible();
         }
      }
      
      public function extendGrid(param1:Number) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:MovieClip = null;
         if(param1 > 0)
         {
            param1 = param1 + this.rows;
            _loc2_ = this.rows;
            while(_loc2_ < param1)
            {
               _loc3_ = 0;
               while(_loc3_ < this.cols)
               {
                  _loc4_ = new Cell();
                  _loc4_.width = this.cellWidth;
                  _loc4_.height = this.cellHeight;
                  _loc4_.pos = this.slot_array.length;
                  _loc4_.hl_mc.visible = false;
                  _loc4_.disable_mc.visible = false;
                  _loc4_.amount = -1;
                  _loc4_.itemHandle = 0;
                  _loc4_.x = (this.cellWidth + this.cellSpacing) * _loc3_;
                  _loc4_.y = (this.cellHeight + this.cellSpacing) * _loc2_;
                  _loc4_.name = "c" + _loc2_ + "_" + _loc3_;
                  this.container_mc.addChild(_loc4_);
                  this.slot_array.push(_loc4_);
                  _loc3_++;
               }
               _loc2_++;
            }
            this.rows = param1;
            this.updateRows();
            this.resetScrollbar();
         }
      }
      
      public function resetScrollbar() : *
      {
         this.sb.addContent(this.container_mc);
         this.sb.scrollbarVisible();
      }
      
      function frame1() : *
      {
         this.base = parent as MovieClip;
         this.minRows = 4;
         this.maxRows = 1000;
         this.rows = 4;
         this.cols = 5;
         this.cellHeight = 55;
         this.cellWidth = 55;
         this.cellSpacing = 2;
         this.bgDiscrap = -1;
         this.overContainer = false;
         this.frameCounterHack = 1;
         this.paintMode = false;
         this.paintValue = false;
         this.mousePosX = 0;
         this.mousePosY = 0;
         this.title_txt.visible = false;
         this.title_txt.mouseEnabled = false;
         this.invWidth = 288;
         this.invHeight = 228;
         this.container_mc.scrollRect = new Rectangle(0,0,this.invWidth,this.invHeight);
         this.bg_mc.mouseChildren = false;
         this.bg_mc.hitArea = this.hitArea_mc;
         this.hitArea_mc.visible = false;
         this.bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.dragInv);
         this.bg_mc.addEventListener(MouseEvent.MOUSE_UP,this.BGUP);
         this.dragStartMP = new Point();
         this.bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.dragInv);
         this.windowDragStarted = false;
         this.scrollRectWidth = this.cols * (this.cellWidth + this.cellSpacing);
         this.currentHLSlot = -1;
         this.slot_array = new Array();
         this.item_array = new Array();
         this.selectedTab = -1;
         this.tabAmount = 4;
         this.gridRefresh = true;
         this.container_mc.addEventListener(MouseEvent.ROLL_OVER,this.onContainerOver);
         this.container_mc.doubleClickEnabled = true;
         this.container_mc.mouseChildren = false;
         this.clickMP = new Point(0,0);
         this.draggingHandle = 0;
         this.charIconSize = 98;
      }
   }
}
