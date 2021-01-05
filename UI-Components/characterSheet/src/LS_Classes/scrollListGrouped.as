package LS_Classes
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   
   public class scrollListGrouped extends listDisplay
   {
       
      
      public var m_scrollbar_mc:scrollbar;
      
      public var m_bottomAligned:Boolean = false;
      
      public var m_allowAutoScroll:Boolean = true;
      
      private var m_SBSpacing:Number = 10;
      
      public var m_HideEmptyGroups:Boolean = false;
      
      private var m_mouseWheelWhenOverEnabled:Boolean = false;
      
      private var m_mouseWheelEnabled:Boolean = false;
      
      private var m_ScrollHeight:Number = 0;
      
      private var m_FixedSelectionPosition:Number = -1;
      
      public var m_GroupHeaderHeight:Number = 52;
      
      public var m_SelectGroups:Boolean = true;
      
      public var m_CustomGroupElementHeight:Boolean = false;
      
      public var m_ScrollOverShoot:Number = 0;
      
      public var m_ScrollUnderShoot:Number = 0;
      
      public var m_allowKeepIntoView:Boolean = true;
      
      private var m_ElSortOnFieldName:Object = null;
      
      private var m_ElSortOnOptions:Object = null;
      
      private var groupClass:Class;
      
      private var gIdCounter:Number = 0;
      
      private var m_groupedScroll:Boolean = true;
      
      private var m_preventScrollUpdate:Boolean = false;
      
      private var m_frameHit_mc:MovieClip;
      
      private var m_SubElementSpacing:Number = -1;
      
      public var m_ToggleSelections:Boolean = false;
      
      public var m_ClearClosedGroups:Boolean = false;
      
      public function scrollListGrouped(param1:String = "down_id", param2:String = "up_id", param3:String = "handle_id", param4:String = "scrollBg_id", param5:String = "", param6:String = "")
      {
         this.groupClass = MovieClip;
         this.m_frameHit_mc = new MovieClip();
         var _loc7_:Sprite = new Sprite();
         _loc7_.graphics.lineStyle(0,16777215);
         _loc7_.graphics.beginFill(16777215);
         _loc7_.graphics.drawRect(0,0,1,1);
         _loc7_.graphics.endFill();
         this.m_frameHit_mc.addChild(_loc7_);
         _loc7_.alpha = 0;
         this.addChild(this.m_frameHit_mc);
         this.m_scrollbar_mc = new scrollbar(param1,param2,param3,param4,param5,param6);
         super();
         this.m_scrollbar_mc.visible = false;
         this.addChild(this.m_scrollbar_mc);
         this.m_scrollbar_mc.addEventListener(Event.CHANGE,this.updateBGPos);
         OnSelectionChanged = this.selectionChangedFunc;
      }
      
      public function set fixedSelectionPosition(param1:Number) : *
      {
         this.m_FixedSelectionPosition = param1;
         this.m_scrollbar_mc.noContent();
         this.m_scrollbar_mc.visible = true;
      }
      
      public function get fixedSelectionPosition() : Number
      {
         return this.m_FixedSelectionPosition;
      }
      
      public function selectionChangedFunc() : *
      {
         this.updateScroll();
      }
      
      public function set overShoot(param1:Number) : *
      {
         this.m_ScrollOverShoot = param1;
         this.m_scrollbar_mc.m_scrollOverShoot = param1;
      }
      
      public function get groupedScroll() : Boolean
      {
         return this.m_groupedScroll;
      }
      
      public function set groupedScroll(param1:Boolean) : *
      {
         this.m_groupedScroll = param1;
      }
      
      public function set SUBEL_SPACING(param1:Number) : *
      {
         this.m_SubElementSpacing = param1;
         var _loc2_:uint = 0;
         while(_loc2_ < content_array.length)
         {
            if(content_array[_loc2_].list)
            {
               content_array[_loc2_].list.EL_SPACING = this.m_SubElementSpacing == -1?EL_SPACING:this.m_SubElementSpacing;
            }
            _loc2_++;
         }
      }
      
      public function get SUBEL_SPACING() : Number
      {
         return this.m_SubElementSpacing;
      }
      
      public function setGroupMC(param1:String) : *
      {
         this.groupClass = getDefinitionByName(param1) as Class;
      }
      
      override public function set canPositionInvisibleElements(param1:Boolean) : *
      {
         var _loc2_:MovieClip = null;
         if(super.canPositionInvisibleElements != param1)
         {
            super.canPositionInvisibleElements = param1;
            for each(_loc2_ in content_array)
            {
               _loc2_.list.canPositionInvisibleElements = param1;
            }
            this.positionElements();
         }
      }
      
      public function addGroup(param1:Number, param2:String, param3:Boolean = true) : MovieClip
      {
         var _loc4_:MovieClip = getElementByNumber("groupId",param1);
         if(_loc4_ == null)
         {
            _loc4_ = new this.groupClass();
            _loc4_.list = new listDisplay();
            _loc4_.list.m_cyclic = false;
            _loc4_.list.EL_SPACING = this.m_SubElementSpacing == -1?EL_SPACING:this.m_SubElementSpacing;
            if(_loc4_.listContainer_mc == null)
            {
               _loc4_.listContainer_mc = new MovieClip();
               _loc4_.addChild(_loc4_.listContainer_mc);
            }
            _loc4_.listContainer_mc.addChild(_loc4_.list);
            addElement(_loc4_,param3);
            _loc4_._isOpen = false;
            _loc4_.groupId = param1;
            _loc4_.mainList = this;
            _loc4_.isNew = true;
            if(this.m_ElSortOnFieldName)
            {
               _loc4_.list.sortOn(this.m_ElSortOnFieldName,this.m_ElSortOnOptions);
            }
         }
         else
         {
            _loc4_.isNew = false;
         }
         if(_loc4_ && _loc4_.title_txt != null)
         {
            _loc4_.title_txt.htmlText = param2;
         }
         return _loc4_;
      }
      
      public function addGroupElement(param1:Number, param2:MovieClip, param3:Boolean = true) : MovieClip
      {
         var _loc4_:MovieClip = getElementByNumber("groupId",param1);
         if(_loc4_)
         {
            param2.gId = this.gIdCounter++;
            param2.groupId = param1;
            param2.mainList = this;
            param2.grpMc = _loc4_;
            _loc4_.list.addElement(param2,param3);
            if(param3)
            {
               this.positionElements();
            }
            if(_loc4_.onElementAdded)
            {
               _loc4_.onElementAdded(param2);
            }
         }
         else
         {
            ExternalInterface.call("UIAssert","scrollListGrouped::addGroupElement groupId:" + param1 + " GROUP NOT FOUND");
         }
         return _loc4_;
      }
      
      public function elementsSortOn(param1:Object, param2:Object = null) : *
      {
         this.m_ElSortOnFieldName = param1;
         this.m_ElSortOnOptions = param2;
         var _loc3_:uint = 0;
         while(_loc3_ < content_array.length)
         {
            if(content_array[_loc3_].list)
            {
               content_array[_loc3_].list.sortOn(param1,param2);
            }
            _loc3_++;
         }
      }
      
      public function clearGroup(param1:Number, param2:Boolean = false) : *
      {
         var _loc3_:MovieClip = getElementByNumber("groupId",param1);
         if(_loc3_)
         {
            this.clearElementsOfList(_loc3_.list);
            if(param2)
            {
               this.positionElements();
            }
         }
      }
      
      public function clearGroupElements() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < content_array.length)
         {
            if(content_array[_loc1_].list)
            {
               this.clearElementsOfList(content_array[_loc1_].list);
            }
            _loc1_++;
         }
      }
      
      public function clearElementsOfList(param1:listDisplay) : *
      {
         var _loc2_:uint = 0;
         while(_loc2_ < param1.content_array.length)
         {
            if(param1.content_array[_loc2_])
            {
               if(param1.content_array[_loc2_].tweening)
               {
                  stopElementMCTweens(param1.content_array[_loc2_]);
               }
               param1.containerContent_mc.removeChild(param1.content_array[_loc2_]);
               param1.content_array[_loc2_] = null;
            }
            _loc2_++;
         }
         param1.content_array = new Array();
         param1.idInc = 0;
         param1.m_CurrentSelection = null;
      }
      
      override public function cleanUpElements() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < content_array.length)
         {
            content_array[_loc1_].list.cleanUpElements();
            if(this.m_HideEmptyGroups)
            {
               content_array[_loc1_].visible = content_array[_loc1_].list.visibleLength > 0;
            }
            _loc1_++;
         }
         this.positionElements2();
      }
      
      override public function positionElements() : *
      {
         if(content_array.length < 1)
         {
            return;
         }
         var _loc1_:uint = 0;
         while(_loc1_ < content_array.length)
         {
            content_array[_loc1_].list.positionElements();
            if(content_array[_loc1_].setGroupAmount)
            {
               content_array[_loc1_].setGroupAmount(content_array[_loc1_].list.visibleLength);
            }
            _loc1_++;
         }
         this.positionElements2();
      }
      
      public function positionElements2() : *
      {
         if(content_array.length == 0)
         {
            return;
         }
         if(m_NeedsSorting && m_SortOnFieldName && content_array && content_array.length > 1)
         {
            content_array.sortOn(m_SortOnFieldName,m_SortOnOptions);
         }
         var _loc1_:Number = TOP_SPACING;
         var _loc2_:uint = 0;
         while(_loc2_ < content_array.length)
         {
            content_array[_loc2_].list_pos = _loc2_;
            content_array[_loc2_].y = _loc1_;
            content_array[_loc2_].x = SIDE_SPACING;
            if(canPositionInvisibleElements || content_array[_loc2_].visible)
            {
               _loc1_ = _loc1_ + (this.getElementHeight(content_array[_loc2_]) + EL_SPACING);
            }
            _loc2_++;
         }
         this.checkScrollBar();
         if(this.m_bottomAligned && this.m_allowKeepIntoView)
         {
            this.m_scrollbar_mc.alignContentToBottom();
         }
      }
      
      override public function next() : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:MovieClip = null;
         var _loc1_:MovieClip = this.getCurrentGroup();
         if(_loc1_ && _loc1_.visible && _loc1_._isOpen && _loc1_.list.visibleLength > 0)
         {
            _loc2_ = _loc1_.list.getCurrentMovieClip();
            if(_loc2_)
            {
               if(_loc2_.list_pos > _loc1_.list.getLastVisible().list_pos - 1)
               {
                  if(!this.m_SelectGroups)
                  {
                     if(_loc2_.INTSelectNext == null || !_loc2_.INTSelectNext())
                     {
                        if(getLastVisible() == _loc1_ && m_cyclic)
                        {
                           this.selectFirstVisible();
                        }
                        else
                        {
                           _loc3_ = _loc1_.list_pos + 1;
                           while(_loc3_ < content_array.length)
                           {
                              _loc4_ = content_array[_loc3_];
                              if(_loc4_ && _loc4_.visible && _loc4_._isOpen && _loc4_.list.visibleLength > 0)
                              {
                                 _loc1_.list.selectMC(null);
                                 select(_loc3_);
                                 if(_loc4_.deselectElement)
                                 {
                                    _loc4_.deselectElement();
                                 }
                                 _loc4_.list.select(0);
                                 break;
                              }
                              _loc3_++;
                           }
                        }
                     }
                     else if(_loc2_.deselectElement)
                     {
                        _loc2_.deselectElement();
                     }
                  }
                  else if(getLastVisible() == _loc1_ && m_cyclic)
                  {
                     this.selectFirstVisible();
                  }
                  else if(_loc1_.list_pos < content_array.length - 1)
                  {
                     _loc5_ = content_array[_loc1_.list_pos + 1];
                     _loc6_ = _loc1_.list_pos + 2;
                     while(_loc6_ < content_array.length && (!_loc5_ || !_loc5_.visible))
                     {
                        _loc5_ = content_array[_loc6_];
                        _loc6_++;
                     }
                     if(_loc5_ && _loc5_.visible)
                     {
                        _loc1_.list.selectMC(null);
                        this.selectMC(_loc5_);
                     }
                  }
               }
               else
               {
                  _loc1_.list.next();
               }
            }
            else
            {
               if(_loc1_.deselectElement)
               {
                  _loc1_.deselectElement();
               }
               _loc1_.list.select(0);
            }
         }
         else if(!this.m_SelectGroups)
         {
            _loc7_ = 0;
            while(_loc7_ < content_array.length)
            {
               _loc8_ = content_array[_loc7_];
               if(_loc8_ && _loc8_.visible && _loc8_._isOpen && _loc8_.list.length > 0)
               {
                  select(_loc7_);
                  if(_loc8_.deselectElement)
                  {
                     _loc8_.deselectElement();
                  }
                  _loc8_.list.select(0);
                  break;
               }
               _loc7_++;
            }
         }
         else
         {
            super.next();
         }
         this.updateScroll();
      }
      
      override public function previous() : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:MovieClip = null;
         var _loc10_:Boolean = false;
         var _loc1_:Boolean = false;
         var _loc2_:MovieClip = this.getCurrentGroup();
         if(_loc2_ && _loc2_._isOpen && _loc2_.visible && _loc2_.list.length > 0)
         {
            _loc3_ = _loc2_.list.getCurrentMovieClip();
            if(_loc3_)
            {
               if(!_loc3_.INTSelectPrevious || !_loc3_.INTSelectPrevious())
               {
                  if(_loc3_.list_pos == 0 || _loc3_ == _loc2_.list.getFirstVisible())
                  {
                     if(this.m_SelectGroups)
                     {
                        _loc2_.list.selectMC(null);
                        this.selectMC(_loc2_,true);
                     }
                     else
                     {
                        _loc1_ = true;
                     }
                  }
                  else
                  {
                     _loc2_.list.previous();
                  }
               }
            }
            else
            {
               _loc1_ = true;
            }
         }
         else
         {
            _loc1_ = true;
         }
         if(_loc1_ && _loc2_)
         {
            if(this.m_SelectGroups)
            {
               _loc2_.list.selectMC(null);
               if(_loc2_.list_pos > 0)
               {
                  _loc4_ = content_array[_loc2_.list_pos - 1];
                  _loc5_ = _loc2_.list_pos - 2;
                  while(_loc5_ >= 0 && (!_loc4_ || !_loc4_.visible))
                  {
                     _loc4_ = content_array[_loc5_];
                     _loc5_--;
                  }
                  if(_loc4_ && _loc4_.visible)
                  {
                     this.m_preventScrollUpdate = true;
                     this.selectMC(_loc4_);
                     this.m_preventScrollUpdate = false;
                     if(_loc4_._isOpen && _loc4_.visible && _loc4_.list.length > 0)
                     {
                        if(_loc4_.deselectElement)
                        {
                           _loc4_.deselectElement();
                        }
                        _loc4_.list.select(_loc4_.list.length - 1);
                     }
                  }
               }
               else if(m_cyclic)
               {
                  _loc4_ = getLastVisible();
                  if(_loc4_)
                  {
                     this.selectMC(_loc4_);
                     this.m_preventScrollUpdate = false;
                     if(_loc4_._isOpen && _loc4_.visible && _loc4_.list.length > 0)
                     {
                        if(_loc4_.deselectElement)
                        {
                           _loc4_.deselectElement();
                        }
                        _loc4_.list.selectLastElement();
                     }
                  }
               }
            }
            else if(_loc2_.list_pos > 0)
            {
               _loc6_ = _loc2_.list_pos - 1;
               while(_loc6_ >= 0)
               {
                  _loc7_ = content_array[_loc6_];
                  if(_loc7_ && _loc7_.visible && _loc7_._isOpen && _loc7_.list.length > 0)
                  {
                     _loc2_.list.selectMC(null);
                     select(_loc6_);
                     if(_loc7_.deselectElement)
                     {
                        _loc7_.deselectElement();
                     }
                     _loc8_ = _loc7_.list.getLastVisible();
                     _loc7_.list.selectMC(_loc8_);
                     _loc3_ = _loc7_.list.getCurrentMovieClip();
                     if(_loc3_ && _loc3_.INTSelectLast != null && _loc3_.INTSelectLast() && _loc8_.deselectElement)
                     {
                        _loc8_.deselectElement();
                     }
                     break;
                  }
                  _loc6_--;
               }
            }
            else
            {
               _loc9_ = _loc3_;
               _loc3_ = _loc2_.list.getCurrentMovieClip();
               if(_loc9_ && _loc3_)
               {
                  if(_loc3_ != _loc9_)
                  {
                     if(_loc3_.INTSelectLast == null || !_loc3_.INTSelectLast())
                     {
                        this.selectFirstVisible();
                     }
                  }
                  else if(_loc3_.INTSelectPrevious != null && !_loc3_.INTSelectPrevious())
                  {
                     _loc10_ = false;
                     if(_loc2_ == getFirstVisible() && m_cyclic)
                     {
                        selectLastElement();
                        _loc2_ = this.getCurrentGroup();
                        if(_loc2_)
                        {
                           _loc2_.list.selectLastElement();
                           _loc3_ = _loc2_.list.getCurrentMovieClip();
                           if(_loc3_.INTSelectLast != null)
                           {
                              _loc10_ = _loc3_.INTSelectLast();
                           }
                        }
                     }
                     if(!_loc10_ && _loc3_.INTDeselect && _loc3_.INTDeselect() && _loc3_.selectElement)
                     {
                        _loc3_.selectElement();
                     }
                  }
               }
            }
         }
         this.updateScroll();
      }
      
      override public function getCurrentMovieClip() : MovieClip
      {
         var _loc2_:MovieClip = null;
         var _loc1_:MovieClip = this.getCurrentGroup();
         if(_loc1_)
         {
            if(_loc1_.list)
            {
               _loc2_ = _loc1_.list.getCurrentMovieClip();
               if(_loc2_)
               {
                  return _loc2_;
               }
            }
         }
         return m_CurrentSelection;
      }
      
      public function getCurrentGroup() : MovieClip
      {
         return m_CurrentSelection;
      }
      
      public function isFirstElementSelected() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:MovieClip = this.getCurrentMovieClip();
         var _loc3_:MovieClip = this.getCurrentGroup();
         if(_loc3_ == getFirstVisible() && _loc2_ == _loc3_.list.getFirstVisible())
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function updateScroll() : *
      {
         var _loc1_:MovieClip = null;
         var _loc2_:MovieClip = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:MovieClip = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:MovieClip = null;
         if(!this.m_preventScrollUpdate && this.m_allowKeepIntoView && this.m_FixedSelectionPosition == -1)
         {
            _loc1_ = this.getCurrentMovieClip();
            _loc2_ = this.getCurrentGroup();
            if(_loc2_)
            {
               if(_loc1_ && _loc1_ != _loc2_)
               {
                  _loc3_ = _loc2_.list.getElementHeight(_loc1_);
                  if(this.isFirstElementSelected())
                  {
                     this.m_scrollbar_mc.scrollIntoView(0,_loc3_ + this.m_ScrollOverShoot);
                  }
                  else
                  {
                     _loc4_ = _loc1_.y + _loc2_.y - TOP_SPACING - this.m_ScrollUnderShoot;
                     if(this.m_CustomGroupElementHeight)
                     {
                        if(!_loc2_.m_GroupElementHeight)
                        {
                           ExternalInterface.call("UIAssert","Group element height is undefined (groupClass.m_GroupElementHeight)");
                        }
                        _loc4_ = _loc4_ + _loc2_.m_GroupElementHeight;
                     }
                     else
                     {
                        _loc4_ = _loc4_ + _loc2_.listContainer_mc.y;
                     }
                     this.m_scrollbar_mc.scrollIntoView(_loc4_,_loc3_ + (this.m_ScrollOverShoot + this.m_ScrollUnderShoot));
                  }
               }
               else
               {
                  _loc5_ = _loc2_.y - TOP_SPACING - this.m_ScrollUnderShoot;
                  if(this.m_groupedScroll)
                  {
                     this.m_scrollbar_mc.scrollIntoView(_loc5_,this.getElementHeight(_loc2_) + this.m_ScrollOverShoot + this.m_ScrollUnderShoot);
                  }
                  else
                  {
                     this.m_scrollbar_mc.scrollIntoView(_loc5_,this.m_GroupHeaderHeight + this.m_ScrollOverShoot + this.m_ScrollUnderShoot);
                  }
               }
            }
         }
         else if(this.m_FixedSelectionPosition != -1)
         {
            _loc6_ = this.getCurrentMovieClip();
            if(_loc6_)
            {
               _loc7_ = LSDisplayObjectHelpers.getRelativePosition(_loc6_,containerContent_mc);
               _loc8_ = 0;
               if(_loc6_.INTGetSelectOffset)
               {
                  _loc8_ = _loc6_.INTGetSelectOffset();
               }
               _loc9_ = _loc7_.y + _loc8_ - this.m_FixedSelectionPosition;
               _loc10_ = 0;
               if(!this.m_SelectGroups)
               {
                  _loc11_ = getFirstVisible();
                  if(_loc11_)
                  {
                     _loc10_ = _loc11_.listContainer_mc.y;
                  }
               }
               this.m_scrollbar_mc.scrollToPercent(Math.round(_loc7_.y + _loc8_ - _loc10_ + this.getElementHeight(_loc6_) * 0.5) / containerContent_mc.height,false);
               containerContent_mc.scrollRect = new Rectangle(0,_loc9_,width,height);
            }
         }
      }
      
      public function getGroupInView(param1:MovieClip) : *
      {
         if(this.m_allowKeepIntoView)
         {
            this.m_scrollbar_mc.scrollIntoView(param1.y,this.getElementHeight(param1) + this.m_ScrollOverShoot);
         }
      }
      
      public function checkScrollbarBottom() : *
      {
         if(this.m_allowKeepIntoView)
         {
            this.m_scrollbar_mc.scrollToFit();
         }
      }
      
      public function ResetSelection() : *
      {
         var _loc1_:MovieClip = this.getCurrentGroup();
         if(_loc1_)
         {
            _loc1_.list.selectMC(null);
         }
         this.selectMC(null);
      }
      
      override public function selectFirstVisible(param1:Boolean = true) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:MovieClip = null;
         this.ResetSelection();
         if(this.m_SelectGroups)
         {
            super.selectFirstVisible(param1);
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < content_array.length)
            {
               _loc3_ = content_array[_loc2_];
               if(_loc3_ && _loc3_.visible && _loc3_._isOpen && _loc3_.list.length > 0)
               {
                  select(_loc2_,param1);
                  _loc3_.list.selectFirstVisible(param1);
                  break;
               }
               _loc2_++;
            }
         }
         this.updateScroll();
      }
      
      override public function selectByOffset(param1:Number, param2:Boolean = false) : Boolean
      {
         var _loc4_:uint = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc3_:Boolean = false;
         if(param2)
         {
            return super.selectByOffset(param1,param2);
         }
         param1 = param1 + TOP_SPACING;
         param1 = param1 + this.m_scrollbar_mc.scrolledY;
         _loc4_ = 0;
         while(_loc4_ < content_array.length)
         {
            _loc5_ = content_array[_loc4_];
            if(_loc5_ && _loc5_.visible)
            {
               _loc6_ = this.getElementHeight(_loc5_);
               if(_loc5_.y <= param1 && _loc5_.y + _loc6_ > param1)
               {
                  _loc3_ = true;
                  _loc7_ = false;
                  this.selectMC(_loc5_);
                  if(_loc5_._isOpen)
                  {
                     _loc7_ = _loc5_.list.selectByOffset(param1 - (_loc5_.y + _loc5_.listContainer_mc.y));
                  }
                  break;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function selectFirst() : *
      {
         var _loc1_:MovieClip = null;
         this.ResetSelection();
         if(this.m_SelectGroups)
         {
            select(0,true);
         }
         else
         {
            _loc1_ = content_array[0];
            if(_loc1_ && _loc1_._isOpen && _loc1_.list.length > 0)
            {
               select(0,true);
               _loc1_.list.select(0);
            }
         }
         this.updateScroll();
      }
      
      public function checkScrollBar() : *
      {
         if(this.m_allowAutoScroll && this.m_allowKeepIntoView)
         {
            this.m_scrollbar_mc.scrollTo(this.m_scrollbar_mc.m_scrolledY);
         }
         this.m_scrollbar_mc.m_contentFrameHeight = height;
         var _loc1_:Number = 0;
         var _loc2_:MovieClip = getLastVisible();
         if(_loc2_)
         {
            _loc1_ = _loc2_.y + this.getElementHeight(_loc2_);
         }
         this.m_ScrollHeight = this.m_scrollbar_mc.m_contentHeight = _loc1_;
         this.m_scrollbar_mc.scrollbarVisible();
      }
      
      override public function set TOP_SPACING(param1:Number) : *
      {
         this.m_scrollbar_mc.m_extraSpacing = param1 * 2;
         super.TOP_SPACING = param1;
      }
      
      private function updateBGPos(param1:Event) : *
      {
         containerBG_mc.scrollRect = containerContent_mc.scrollRect;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get mouseWheelWhenOverEnabled() : Boolean
      {
         return this.m_mouseWheelWhenOverEnabled;
      }
      
      public function get scrolledY() : Number
      {
         return this.m_scrollbar_mc.scrolledY;
      }
      
      public function set mouseWheelWhenOverEnabled(param1:Boolean) : *
      {
         if(this.m_mouseWheelWhenOverEnabled != param1)
         {
            this.m_mouseWheelWhenOverEnabled = param1;
            if(this.m_mouseWheelWhenOverEnabled)
            {
               this.addEventListener(MouseEvent.ROLL_OUT,this.disableMouseWheelOnOut);
               this.addEventListener(MouseEvent.ROLL_OVER,this.enableMouseWheelOnOver);
            }
            else
            {
               this.removeEventListener(MouseEvent.ROLL_OUT,this.disableMouseWheelOnOut);
               this.removeEventListener(MouseEvent.ROLL_OVER,this.enableMouseWheelOnOver);
            }
         }
      }
      
      override public function selectMC(param1:MovieClip, param2:Boolean = false) : *
      {
         var _loc3_:Boolean = true;
         if(param1 && m_CurrentSelection && param1.list_pos < m_CurrentSelection.list_pos)
         {
            _loc3_ = false;
         }
         if(param1 && param1.grpMc != null)
         {
            if(m_CurrentSelection && m_CurrentSelection != param1.grpMc)
            {
               m_CurrentSelection.list.clearSelection();
            }
            super.selectMC(param1.grpMc,param2);
            param1.grpMc.list.selectMC(param1,param2);
            dispatchEvent(new Event(Event.CHANGE));
         }
         else
         {
            if(m_CurrentSelection && m_CurrentSelection != param1)
            {
               m_CurrentSelection.list.clearSelection();
            }
            super.selectMC(param1,param2);
            dispatchEvent(new Event(Event.CHANGE));
         }
         if(this.m_scrollbar_mc.visible && this.m_allowAutoScroll)
         {
            this.updateScroll();
         }
      }
      
      override public function clearSelection() : *
      {
         if(m_CurrentSelection)
         {
            m_CurrentSelection.list.clearSelection();
            super.clearSelection();
         }
      }
      
      public function get mouseWheelEnabled() : Boolean
      {
         return this.m_mouseWheelEnabled;
      }
      
      public function set mouseWheelEnabled(param1:Boolean) : *
      {
         if(this.m_mouseWheelEnabled != param1)
         {
            this.m_mouseWheelEnabled = param1;
            this.m_scrollbar_mc.mouseWheelEnabled = param1;
         }
      }
      
      private function disableMouseWheelOnOut(param1:MouseEvent) : *
      {
         this.m_scrollbar_mc.mouseWheelEnabled = false;
      }
      
      private function enableMouseWheelOnOver(param1:MouseEvent) : *
      {
         this.m_scrollbar_mc.mouseWheelEnabled = true;
      }
      
      override public function setFrameWidth(param1:Number) : *
      {
         width = param1;
         containerContent_mc.scrollRect = new Rectangle(0,0,param1,height);
         this.m_scrollbar_mc.x = this.m_SBSpacing + param1;
         if(this.m_FixedSelectionPosition == -1)
         {
            this.m_scrollbar_mc.addContent(containerContent_mc);
         }
         this.m_frameHit_mc.width = param1;
      }
      
      override public function setFrame(param1:Number, param2:Number) : *
      {
         width = param1;
         height = param2;
         containerContent_mc.scrollRect = new Rectangle(0,0,param1,param2);
         this.m_scrollbar_mc.x = this.m_SBSpacing + param1;
         if(this.m_FixedSelectionPosition == -1)
         {
            this.m_scrollbar_mc.addContent(containerContent_mc);
         }
         this.checkScrollBar();
         this.m_frameHit_mc.width = param1;
         this.m_frameHit_mc.height = param2;
      }
      
      public function set scrollbarSpacing(param1:Number) : *
      {
         this.m_SBSpacing = param1;
         this.m_scrollbar_mc.x = width + this.m_SBSpacing + this.m_scrollbar_mc.width;
      }
      
      public function set SB_SPACING(param1:Number) : *
      {
         this.m_SBSpacing = param1;
         this.m_scrollbar_mc.x = width + this.m_SBSpacing + this.m_scrollbar_mc.width;
      }
      
      public function get SB_SPACING() : Number
      {
         return this.m_SBSpacing;
      }
      
      public function get scrollbarSpacing() : Number
      {
         return this.SB_SPACING;
      }
      
      public function onAction() : void
      {
         var _loc1_:MovieClip = this.getCurrentMovieClip();
         if(_loc1_)
         {
            if(_loc1_.list)
            {
               if(_loc1_._isOpen && this.m_ClearClosedGroups)
               {
                  this.clearElementsOfList(_loc1_.list);
               }
               if(this.m_ToggleSelections && !_loc1_._isOpen)
               {
                  this.collapseAll();
               }
            }
            if(_loc1_.onAction)
            {
               _loc1_.onAction();
            }
         }
      }
      
      public function collapseAll(param1:Boolean = true) : void
      {
         var _loc2_:uint = 0;
         while(_loc2_ < content_array.length)
         {
            if(content_array[_loc2_].list && content_array[_loc2_]._isOpen)
            {
               if(content_array[_loc2_].closeEntry)
               {
                  content_array[_loc2_].closeEntry(param1);
               }
               if(this.m_ClearClosedGroups)
               {
                  this.clearElementsOfList(content_array[_loc2_].list);
               }
            }
            _loc2_++;
         }
         if(param1)
         {
            this.positionElements();
         }
      }
      
      public function unCollapseAll(param1:Boolean = true) : void
      {
         var _loc2_:uint = 0;
         while(_loc2_ < content_array.length)
         {
            if(content_array[_loc2_].list && !content_array[_loc2_]._isOpen && content_array[_loc2_].openEntry)
            {
               content_array[_loc2_].openEntry(param1);
            }
            _loc2_++;
         }
         if(param1)
         {
            this.positionElements();
         }
      }
      
      override public function getElementHeight(param1:MovieClip) : Number
      {
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         var _loc2_:Number = param1.height;
         if(param1.heightOverride != undefined && !isNaN(param1.heightOverride))
         {
            _loc2_ = param1.heightOverride;
         }
         else if(m_customElementHeight != -1)
         {
            _loc2_ = m_customElementHeight;
         }
         else
         {
            _loc3_ = null;
            if(param1.list)
            {
               _loc3_ = param1.list.getLastVisible();
               if(_loc3_)
               {
                  _loc2_ = _loc3_.height + _loc3_.y + param1.listContainer_mc.y;
               }
            }
            else
            {
               _loc4_ = getElementByNumber("groupId",param1.groupId);
               if(_loc4_)
               {
                  _loc3_ = _loc4_.list.getLastVisible();
                  if(_loc3_)
                  {
                     _loc2_ = _loc3_.height + _loc3_.y;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function getGroupElementByNumber(param1:String, param2:Number) : MovieClip
      {
         var _loc4_:MovieClip = null;
         var _loc3_:MovieClip = null;
         for each(_loc4_ in content_array)
         {
            _loc3_ = _loc4_.list.getElementByNumber(param1,param2);
            if(_loc3_)
            {
               break;
            }
         }
         return _loc3_;
      }
      
      public function getGroupElementByString(param1:String, param2:String) : MovieClip
      {
         var _loc4_:MovieClip = null;
         var _loc3_:MovieClip = null;
         for each(_loc4_ in content_array)
         {
            _loc3_ = _loc4_.list.getElementByString(param1,param2);
            if(_loc3_)
            {
               break;
            }
         }
         return _loc3_;
      }
   }
}
