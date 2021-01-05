package journal_fla
{
   import LS_Classes.textEffect;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public dynamic class map_2 extends MovieClip
   {
       
      
      public var info_mc:TextField;
      
      public var legend_mc:MovieClip;
      
      public var mapContentHolder_mc:MovieClip;
      
      public var zoomInBtn:MovieClip;
      
      public var zoomOutBtn:MovieClip;
      
      public var player_array:Array;
      
      public var icon_array:Array;
      
      public var scaleStep:Number;
      
      public var currScale:Number;
      
      public var maxScale:Number;
      
      public var minScale:Number;
      
      public var defaultMaxScale:Number;
      
      public var hoverIcon:MovieClip;
      
      public var mapX:Number;
      
      public var mapY:Number;
      
      public var mapVisibleW:Number;
      
      public var mapVisibleH:Number;
      
      public var mapW:Number;
      
      public var mapH:Number;
      
      public var mapMouseX:Number;
      
      public var mapMouseY:Number;
      
      public var mapBeforeMoveX:Number;
      
      public var mapBeforeMoveY:Number;
      
      public var base:MovieClip;
      
      public var mapClickable:Boolean;
      
      public var dragOffset:Number;
      
      public var currentTracked:MovieClip;
      
      public var rectMousePosX:Number;
      
      public var rectMousePosY:Number;
      
      public var cachedX:Number;
      
      public var cachedY:Number;
      
      public var origX:Number;
      
      public var origY:Number;
      
      public var cachedMarkerID:String;
      
      public function map_2()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseWheelEvent(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            this.zoomIn();
         }
         else
         {
            this.zoomOut();
         }
      }
      
      public function setMapSize(param1:Number, param2:Number) : *
      {
         this.mapW = param1;
         this.mapH = param2;
         var _loc3_:Number = this.mapVisibleW / this.mapW;
         var _loc4_:Number = this.mapVisibleH / this.mapH;
         this.zoomInBtn.disabled_mc.visible = false;
         this.zoomOutBtn.disabled_mc.visible = false;
         this.maxScale = this.defaultMaxScale;
         if(_loc3_ > _loc4_)
         {
            this.minScale = _loc3_;
         }
         else
         {
            this.minScale = _loc4_;
         }
         if(this.maxScale < this.minScale)
         {
            this.maxScale = this.minScale;
            this.zoomInBtn.disabled_mc.visible = true;
            this.zoomOutBtn.disabled_mc.visible = true;
         }
         if(this.currScale < this.minScale)
         {
            this.currScale = this.minScale;
            this.zoomOutBtn.disabled_mc.visible = true;
         }
         if(this.currScale > this.maxScale)
         {
            this.currScale = this.maxScale;
            this.zoomInBtn.disabled_mc.visible = true;
         }
         this.mapContentHolder_mc.mapContent_mc.iggy_map.bg_mc.width = param1;
         this.mapContentHolder_mc.mapContent_mc.iggy_map.bg_mc.height = param2;
         this.setMapScale(this.currScale);
      }
      
      public function addLegend(param1:Number, param2:String) : *
      {
         this.legend_mc.addIcon(param1,param2);
      }
      
      public function clearLegend() : *
      {
         this.legend_mc.clearElements();
      }
      
      public function init() : *
      {
         this.zoomInBtn.pressedFunc = this.zoomIn;
         this.zoomOutBtn.pressedFunc = this.zoomOut;
         this.setMapScale(this.currScale);
         this.legend_mc.init();
         this.info_mc.mouseEnabled = false;
         this.info_mc.filters = textEffect.createStrokeFilter(0,1.2,0.8,1,3);
      }
      
      public function onMapDown(param1:MouseEvent) : *
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMapUp);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMapMove);
         this.mapMouseX = stage.mouseX;
         this.mapMouseY = stage.mouseY;
         this.mapClickable = true;
         ExternalInterface.call("inputFocus");
      }
      
      public function onMapMove(param1:MouseEvent) : *
      {
         if(stage.mouseX > this.mapMouseX + this.dragOffset || stage.mouseX < this.mapMouseX - this.dragOffset || stage.mouseY > this.mapMouseX + this.dragOffset || stage.mouseY < this.mapMouseY - this.dragOffset)
         {
            this.mapClickable = false;
            stage.addEventListener(Event.ENTER_FRAME,this.onTick);
         }
      }
      
      public function onTick(param1:Event) : *
      {
         var _loc2_:Number = this.mapMouseX - stage.mouseX;
         var _loc3_:Number = this.mapMouseY - stage.mouseY;
         if(_loc2_ != 0 || _loc3_ != 0)
         {
            ExternalInterface.call("mapOffset",this.mapX + _loc2_ / this.currScale,this.mapY + _loc3_ / this.currScale);
            this.mapMouseX = stage.mouseX;
            this.mapMouseY = stage.mouseY;
         }
      }
      
      public function onMapUp(param1:MouseEvent) : *
      {
         if(this.mapClickable && !this.hoverIcon)
         {
            ExternalInterface.call("addFlag",this.mapContentHolder_mc.mapContent_mc.iggy_map.mouseX,this.mapContentHolder_mc.mapContent_mc.iggy_map.mouseY);
         }
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMapMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMapUp);
         stage.removeEventListener(Event.ENTER_FRAME,this.onTick);
         ExternalInterface.call("inputFocusLost");
         this.mapClickable = false;
      }
      
      public function zoomIn() : *
      {
         this.setMousePosInRect();
         this.currScale = this.currScale + this.scaleStep;
         if(this.currScale >= this.maxScale)
         {
            this.currScale = this.maxScale;
            this.zoomInBtn.disabled_mc.visible = true;
         }
         this.zoomOutBtn.disabled_mc.visible = false;
         this.setMapScale(this.currScale,false);
      }
      
      public function zoomOut() : *
      {
         this.setMousePosInRect();
         this.currScale = this.currScale - this.scaleStep;
         if(this.currScale <= this.minScale)
         {
            this.currScale = this.minScale;
            this.zoomOutBtn.disabled_mc.visible = true;
         }
         this.zoomInBtn.disabled_mc.visible = false;
         this.setMapScale(this.currScale,false);
      }
      
      public function setPlayer(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:String) : *
      {
         var _loc7_:MovieClip = this.getPlayer(param1);
         if(!_loc7_)
         {
            _loc7_ = new PlayerMarker();
            _loc7_.id = param1;
            this.mapContentHolder_mc.mapContent_mc.container_mc.addChild(_loc7_);
            this.player_array.push(_loc7_);
            _loc7_.addEventListener(MouseEvent.ROLL_OUT,this.onFlagOut);
            _loc7_.addEventListener(MouseEvent.ROLL_OVER,this.onFlagOver);
         }
         if(_loc7_)
         {
            _loc7_.tooltip = param6;
            _loc7_.gotoAndStop(param2);
            _loc7_.rotation = param5;
            _loc7_.myX = param3;
            _loc7_.myY = param4;
            _loc7_.x = _loc7_.myX * this.currScale;
            _loc7_.y = _loc7_.myY * this.currScale;
         }
      }
      
      public function removePlayer(param1:Number) : *
      {
         var _loc2_:MovieClip = this.getPlayer(param1);
         if(_loc2_)
         {
            this.mapContentHolder_mc.mapContent_mc.container_mc.removeChild(_loc2_);
            this.player_array.splice(_loc2_.pos,1);
         }
      }
      
      public function getPlayer(param1:Number) : MovieClip
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.player_array.length)
         {
            if(this.player_array[_loc2_].id == param1)
            {
               this.player_array[_loc2_].pos = _loc2_;
               return this.player_array[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function clearIcons() : *
      {
         this.icon_array = new Array();
         this.removeChildrenOf(this.mapContentHolder_mc.mapContent_mc.container_mc);
      }
      
      public function removeChildrenOf(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         if(param1.numChildren != 0)
         {
            _loc2_ = param1.numChildren;
            while(_loc2_ > 0)
            {
               _loc2_--;
               param1.removeChildAt(_loc2_);
            }
         }
      }
      
      public function trackIcon(param1:Number) : *
      {
         var _loc2_:MovieClip = this.getIcon(param1);
         this.trackIconMC(_loc2_);
      }
      
      public function trackIconMC(param1:MovieClip) : *
      {
         if(this.currentTracked != param1)
         {
            if(this.currentTracked)
            {
               this.currentTracked.sel_mc.visible = false;
               this.currentTracked.sel_mc.bg_mc.stop();
            }
            this.currentTracked = param1;
            if(this.currentTracked)
            {
               this.currentTracked.sel_mc.visible = true;
               this.currentTracked.sel_mc.bg_mc.gotoAndPlay(1);
            }
         }
      }
      
      public function onFlagDown(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.onFlagUp);
         }
      }
      
      public function onFlagUp(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            if(this.mapClickable)
            {
               ExternalInterface.call("PlaySound","UI_Game_Map_Click");
               if(_loc2_.type == 1)
               {
                  ExternalInterface.call("useWaypoint",this.hoverIcon.handle);
               }
               else if(this.currentTracked && this.currentTracked.id == _loc2_.id)
               {
                  this.trackIconMC(null);
                  ExternalInterface.call("cancelTrackingIcon",_loc2_.id,_loc2_.type,_loc2_.handle,_loc2_.markerId);
               }
               else
               {
                  this.trackIconMC(_loc2_);
                  ExternalInterface.call("trackIcon",_loc2_.id,_loc2_.type,_loc2_.handle,_loc2_.markerId);
               }
            }
            _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.onFlagUp);
         }
      }
      
      public function onFlagDelete(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            ExternalInterface.call("removeFlag",_loc2_.myX,_loc2_.myY);
            this.hoverIcon = null;
         }
      }
      
      public function onFlagDoubleClick(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            if(this.currentTracked && this.currentTracked.id == _loc2_.id)
            {
               this.trackIconMC(null);
               ExternalInterface.call("cancelTrackingIcon",_loc2_.id,_loc2_.type,_loc2_.handle,_loc2_.markerId);
            }
            ExternalInterface.call("doubleClickFlag",_loc2_.handle);
         }
      }
      
      public function onFlagOver(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            this.hoverIcon = _loc2_;
            if(_loc2_.iconHL_mc)
            {
               _loc2_.iconHL_mc.visible = true;
            }
            if(_loc2_.tooltip && _loc2_.tooltip != "")
            {
               this.base.curTooltip = _loc2_.tooltip;
               this.base.hasTooltip = true;
               ExternalInterface.call("showTooltip",_loc2_.tooltip);
            }
         }
      }
      
      public function onFlagOut(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_)
         {
            if(_loc2_.iconHL_mc)
            {
               _loc2_.iconHL_mc.visible = false;
            }
            ExternalInterface.call("hideTooltip");
            this.base.curTooltip = "";
            this.base.hasTooltip = false;
            _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.onFlagUp);
         }
         this.hoverIcon = null;
      }
      
      public function setObjectIcon(param1:Number, param2:Number, param3:Number, param4:String, param5:Number, param6:Number, param7:Number, param8:String) : *
      {
         var _loc9_:MovieClip = this.getIcon(param1);
         if(_loc9_ == null)
         {
            _loc9_ = new MapIcon();
            _loc9_.iconId = 0;
            _loc9_.sel_mc.visible = false;
            _loc9_.id = param1;
            _loc9_.iconHL_mc.visible = false;
            _loc9_.focusHL_mc.alpha = 0;
            this.mapContentHolder_mc.mapContent_mc.container_mc.addChild(_loc9_);
            this.icon_array.push(_loc9_);
            _loc9_.mouseChildren = false;
            _loc9_.addEventListener(MouseEvent.MOUSE_DOWN,this.onFlagDown);
            _loc9_.addEventListener(MouseEvent.ROLL_OUT,this.onFlagOut);
            _loc9_.addEventListener(MouseEvent.ROLL_OVER,this.onFlagOver);
         }
         if(_loc9_.iconId != param5)
         {
            if(param5 == 3)
            {
               _loc9_.doubleClickEnabled = true;
               _loc9_.addEventListener("rightClick",this.onFlagDelete);
               _loc9_.addEventListener("doubleClick",this.onFlagDoubleClick);
            }
            _loc9_.iconId = param5;
            _loc9_.gotoAndStop(param5);
            _loc9_.iconHL_mc.gotoAndStop(param5);
            _loc9_.focusHL_mc.gotoAndStop(param5);
         }
         _loc9_.handle = param3;
         _loc9_.type = param2;
         _loc9_.markerId = param4;
         _loc9_.tooltip = param8;
         _loc9_.myX = param6;
         _loc9_.myY = param7;
         _loc9_.x = _loc9_.myX * this.currScale;
         _loc9_.y = _loc9_.myY * this.currScale;
         _loc9_.updated = true;
      }
      
      public function getIconByMarkerID(param1:String) : MovieClip
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.icon_array.length)
         {
            if(this.icon_array[_loc2_].markerId == param1)
            {
               return this.icon_array[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getIcon(param1:Number) : MovieClip
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.icon_array.length)
         {
            if(this.icon_array[_loc2_].id == param1)
            {
               return this.icon_array[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         return Math.max(param2,Math.min(param3,param1));
      }
      
      public function cleanupOfUnused() : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Boolean = false;
         var _loc1_:uint = 0;
         while(_loc1_ < this.icon_array.length)
         {
            _loc2_ = this.icon_array[_loc1_];
            _loc3_ = true;
            if(_loc2_)
            {
               if(_loc2_.updated)
               {
                  _loc3_ = false;
                  _loc2_.updated = false;
               }
               else
               {
                  if(this.base.hasTooltip && _loc2_.tooltip == this.base.curTooltip)
                  {
                     ExternalInterface.call("hideTooltip");
                     this.base.curTooltip = "";
                     this.base.hasTooltip = false;
                  }
                  this.mapContentHolder_mc.mapContent_mc.container_mc.removeChild(_loc2_);
               }
            }
            if(_loc3_)
            {
               this.icon_array.splice(_loc1_,1);
               _loc1_--;
            }
            _loc1_++;
         }
      }
      
      public function resetMapObjectsPos() : *
      {
         var _loc1_:MovieClip = null;
         var _loc2_:* = 0;
         while(_loc2_ < this.icon_array.length)
         {
            _loc1_ = this.icon_array[_loc2_];
            _loc1_.x = _loc1_.myX * this.currScale;
            _loc1_.y = _loc1_.myY * this.currScale;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.player_array.length)
         {
            _loc1_ = this.player_array[_loc2_];
            _loc1_.x = _loc1_.myX * this.currScale;
            _loc1_.y = _loc1_.myY * this.currScale;
            _loc2_++;
         }
      }
      
      public function setMousePosInRect() : *
      {
         this.cachedX = this.mapContentHolder_mc.mapContent_mc.iggy_map.mouseX;
         this.cachedY = this.mapContentHolder_mc.mapContent_mc.iggy_map.mouseY;
         var _loc1_:Number = this.mapX - this.mapVisibleW / 2;
         var _loc2_:Number = this.mapY - this.mapVisibleH / 2;
         this.rectMousePosX = this.cachedX - _loc1_;
         this.rectMousePosY = this.cachedY - _loc2_;
         this.origX = this.cachedX / this.currScale;
         this.origY = this.cachedY / this.currScale;
      }
      
      public function setMapOffset(param1:Number, param2:Number, param3:String = "", param4:Boolean = false) : *
      {
         this.mapX = param1;
         this.mapY = param2;
         var _loc5_:Number = -(this.mapVisibleW * 0.5 - this.mapX * this.currScale);
         var _loc6_:Number = -(this.mapVisibleH * 0.5 - this.mapY * this.currScale);
         this.mapContentHolder_mc.scrollRect = new Rectangle(_loc5_,_loc6_,this.mapVisibleW,this.mapVisibleH);
         if(param4)
         {
            this.highlightMarker(param3);
         }
      }
      
      public function highlightMarker(param1:String) : *
      {
         var _loc2_:MovieClip = null;
         if(this.cachedMarkerID != "" && this.cachedMarkerID != param1)
         {
            _loc2_ = this.getIconByMarkerID(this.cachedMarkerID);
            if(_loc2_)
            {
               _loc2_.stopGlow();
            }
         }
         if(param1 != "")
         {
            _loc2_ = this.getIconByMarkerID(param1);
            if(_loc2_)
            {
               _loc2_.glow();
            }
            this.cachedMarkerID = param1;
         }
      }
      
      public function setMapScale(param1:Number, param2:Boolean = true) : *
      {
         this.mapContentHolder_mc.mapContent_mc.iggy_map.scaleX = this.mapContentHolder_mc.mapContent_mc.iggy_map.scaleY = param1;
         this.resetMapObjectsPos();
         this.setMapOffset(this.mapX,this.mapY);
      }
      
      function frame1() : *
      {
         this.player_array = new Array();
         this.icon_array = new Array();
         this.scaleStep = 0.1;
         this.currScale = 1;
         this.maxScale = 1;
         this.minScale = 0.1;
         this.defaultMaxScale = 1;
         this.hoverIcon = null;
         this.mapX = 1;
         this.mapY = 1;
         this.mapVisibleW = 1331;
         this.mapVisibleH = 861;
         this.mapW = 1000;
         this.mapH = 500;
         this.mapMouseX = 0;
         this.mapMouseY = 0;
         this.mapBeforeMoveX = 0;
         this.mapBeforeMoveY = 0;
         this.base = root as MovieClip;
         this.zoomInBtn.disabled_mc.visible = false;
         this.zoomOutBtn.disabled_mc.visible = false;
         this.mapContentHolder_mc.scrollRect = new Rectangle(0,0,this.mapVisibleW,this.mapVisibleH);
         this.mapContentHolder_mc.mapContent_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onMapDown);
         stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheelEvent);
         this.mapClickable = false;
         this.dragOffset = 5;
         this.currentTracked = null;
         this.rectMousePosX = 0;
         this.rectMousePosY = 0;
         this.cachedX = 0;
         this.cachedY = 0;
         this.origX = 0;
         this.origY = 0;
         this.cachedMarkerID = "";
      }
   }
}
