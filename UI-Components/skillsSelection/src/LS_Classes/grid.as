package LS_Classes
{
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class grid extends listDisplay
   {
       
      
      protected var m_row:uint = 3;
      
      protected var m_col:uint = 9;
      
      protected var m_maxPages:uint = 1;
      
      protected var m_currpage:uint = 1;
      
      public var ROW_SPACING:Number = 4;
      
      public var m_centered:Boolean = false;
      
      public var m_gridAlign:Number = 0;
      
      public function grid()
      {
         super();
         this.m_currpage = 1;
      }
      
      override public function positionElements() : *
      {
         if(content_array.length < 1)
         {
            return;
         }
         var _loc1_:Number = m_sideSpacing;
         var _loc2_:Number = 0;
         var _loc3_:uint = 0;
         if(m_NeedsSorting)
         {
            INTSort();
         }
         if(this.m_centered)
         {
            _loc2_ = Math.round(getElementWidth(content_array[0]) * 0.5);
         }
         var _loc4_:Boolean = true;
         var _loc5_:Number = m_topSpacing;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 1;
         if(this.m_gridAlign == 0)
         {
            _loc3_ = 0;
            while(_loc3_ < content_array.length)
            {
               this.m_maxPages = _loc8_;
               content_array[_loc3_].x = _loc2_ + _loc1_;
               content_array[_loc3_].y = _loc5_;
               _loc1_ = _loc1_ + Math.round(getElementWidth(content_array[_loc3_]) + EL_SPACING);
               if(!m_hasScrollRect)
               {
                  if(this.m_currpage == _loc8_)
                  {
                     if(_loc4_)
                     {
                        m_CurrentSelection = content_array[_loc3_];
                        _loc4_ = false;
                     }
                     content_array[_loc3_].visible = true;
                  }
                  else
                  {
                     content_array[_loc3_].visible = false;
                  }
               }
               _loc6_++;
               if(_loc6_ >= this.m_col)
               {
                  _loc6_ = 0;
                  _loc7_++;
                  _loc1_ = m_sideSpacing;
                  _loc5_ = _loc5_ + Math.round(getElementHeight(content_array[_loc3_]) + this.ROW_SPACING);
               }
               if(this.m_row != 0 && _loc7_ >= this.m_row)
               {
                  if(!m_hasScrollRect)
                  {
                     _loc2_ = 0;
                  }
                  else
                  {
                     _loc2_ = Math.round(content_array[_loc3_].x + getElementWidth(content_array[_loc3_]) + EL_SPACING);
                  }
                  _loc1_ = m_sideSpacing;
                  _loc5_ = m_topSpacing;
                  _loc8_++;
                  _loc7_ = 0;
                  _loc6_ = 0;
               }
               _loc3_++;
            }
         }
         else
         {
            if(this.m_col > content_array.length)
            {
               _loc1_ = Math.round((this.m_col - content_array.length) * (getElementWidth(content_array[0]) + EL_SPACING));
            }
            _loc3_ = 0;
            while(_loc3_ < content_array.length)
            {
               this.m_maxPages = _loc8_;
               content_array[_loc3_].x = _loc2_ + _loc1_;
               content_array[_loc3_].y = _loc5_;
               _loc1_ = _loc1_ + (getElementWidth(content_array[_loc3_]) + EL_SPACING);
               if(!m_hasScrollRect)
               {
                  if(this.m_currpage == _loc8_)
                  {
                     if(_loc4_)
                     {
                        m_CurrentSelection = content_array[_loc3_];
                        _loc4_ = false;
                     }
                     content_array[_loc3_].visible = true;
                  }
                  else
                  {
                     content_array[_loc3_].visible = false;
                  }
               }
               _loc6_++;
               if(_loc6_ >= this.m_col)
               {
                  if(this.m_col > content_array.length - _loc3_)
                  {
                     _loc1_ = Math.round((this.m_col + 1 - (content_array.length - _loc3_)) * (getElementWidth(content_array[_loc3_]) + EL_SPACING));
                  }
                  else
                  {
                     _loc1_ = m_sideSpacing;
                  }
                  _loc6_ = 0;
                  _loc7_++;
                  _loc5_ = _loc5_ + (Math.round(getElementHeight(content_array[_loc3_]) + this.ROW_SPACING) + m_topSpacing);
               }
               if(this.m_row != 0 && _loc7_ >= this.m_row)
               {
                  if(!m_hasScrollRect)
                  {
                     _loc2_ = 0;
                  }
                  else
                  {
                     _loc2_ = Math.round(content_array[_loc3_].x + getElementWidth(content_array[_loc3_]) + EL_SPACING);
                  }
                  _loc1_ = m_sideSpacing;
                  _loc5_ = m_topSpacing;
                  _loc8_++;
                  _loc7_ = 0;
                  _loc6_ = 0;
               }
               _loc3_++;
            }
         }
         if(m_NeedsSorting)
         {
            m_NeedsSorting = false;
            dispatchEvent(new Event("listSorted"));
         }
      }
      
      public function getCurrRow() : Number
      {
         if(m_CurrentSelection)
         {
            return this.getRowOfElement(m_CurrentSelection.list_pos);
         }
         return -1;
      }
      
      public function selectPos(param1:Number, param2:Number, param3:Boolean = false) : *
      {
         var _loc4_:Number = param1 * this.m_col + param2;
         if(_loc4_ >= 0 && _loc4_ < content_array.length)
         {
            select(_loc4_,param3);
         }
      }
      
      public function nextPage() : *
      {
         this.setPage(this.m_currpage + 1);
      }
      
      public function previousPage() : *
      {
         this.setPage(this.m_currpage - 1);
      }
      
      public function nextRow() : *
      {
         select(currentSelection + this.m_col);
      }
      
      public function previousRow() : *
      {
         var _loc1_:Number = this.getRowOfElement(currentSelection);
         if(_loc1_ != 0)
         {
            select(currentSelection - this.m_col);
         }
      }
      
      public function previousCol() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Number = this.getRowOfElement(currentSelection);
         var _loc3_:Number = this.getRowOfElement(currentSelection - 1);
         if(currentSelection != 0 && _loc2_ == _loc3_)
         {
            super.previous();
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function nextCol() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Number = this.getRowOfElement(currentSelection);
         var _loc3_:Number = this.getRowOfElement(currentSelection + 1);
         if(currentSelection != content_array.length - 1 && _loc2_ == _loc3_)
         {
            super.next();
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      private function getRowOfElement(param1:Number) : Number
      {
         var _loc2_:Number = Math.floor(param1 / this.m_col);
         return _loc2_;
      }
      
      private function getColOfElement(param1:Number) : Number
      {
         return Math.floor(param1 / this.m_row);
      }
      
      override public function clearElements() : *
      {
         this.m_currpage = 1;
         this.m_maxPages = 1;
         super.clearElements();
      }
      
      public function setPage(param1:Number) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Rectangle = null;
         if(param1 > 0 && this.m_currpage != param1 && content_array.length > 0)
         {
            if(param1 <= 1)
            {
               param1 = 1;
            }
            else if(param1 > this.m_maxPages)
            {
               param1 = this.m_maxPages;
            }
            this.m_currpage = param1;
            if(m_hasScrollRect)
            {
               _loc2_ = container_mc.scrollRect.width;
               _loc3_ = new Rectangle((param1 - 1) * _loc2_,0,_loc2_,container_mc.scrollRect.height);
               container_mc.scrollRect = _loc3_;
            }
            else
            {
               this.positionElements();
            }
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function refreshPage() : *
      {
         var _loc1_:uint = this.m_currpage;
         this.m_currpage = 1;
         this.setPage(_loc1_);
      }
      
      public function get col() : uint
      {
         return this.m_col;
      }
      
      public function set col(param1:uint) : void
      {
         this.m_col = param1;
         this.refreshPage();
      }
      
      public function get row() : uint
      {
         return this.m_row;
      }
      
      public function set row(param1:uint) : void
      {
         this.m_row = param1;
         this.refreshPage();
      }
      
      public function getRow(param1:uint) : uint
      {
         return Math.ceil((param1 + 1) / this.col);
      }
      
      public function getCol(param1:uint) : uint
      {
         var _loc2_:Number = this.getRow(param1);
         return Math.ceil(param1 - (_loc2_ - 1) * this.col);
      }
      
      public function get rowsUsed() : uint
      {
         return Math.ceil(content_array.length / this.m_col);
      }
      
      public function get maxPages() : uint
      {
         return this.m_maxPages;
      }
      
      public function get currPage() : uint
      {
         return this.m_currpage;
      }
      
      override public function cursorLeft() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(currentSelection == -1)
         {
            select(0);
         }
         else
         {
            _loc1_ = currentSelection - 1;
            _loc2_ = this.getRow(currentSelection);
            _loc3_ = this.getRow(_loc1_);
            if(_loc1_ >= 0 && _loc2_ == _loc3_)
            {
               select(_loc1_);
            }
         }
      }
      
      override public function cursorRight() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(currentSelection == -1)
         {
            select(0);
         }
         else
         {
            _loc1_ = this.getRow(currentSelection);
            _loc2_ = this.getRow(currentSelection + 1);
            if(_loc1_ == _loc2_)
            {
               select(currentSelection + 1);
            }
         }
      }
      
      override public function cursorUp() : *
      {
         var _loc1_:Number = NaN;
         if(currentSelection == -1)
         {
            select(0);
         }
         else
         {
            _loc1_ = currentSelection - this.col;
            if(_loc1_ >= 0)
            {
               select(_loc1_);
            }
         }
      }
      
      override public function cursorDown() : *
      {
         var _loc1_:Number = NaN;
         if(currentSelection == -1)
         {
            select(0);
         }
         else
         {
            _loc1_ = currentSelection + this.col;
            if(_loc1_ < content_array.length)
            {
               select(_loc1_);
            }
         }
      }
   }
}