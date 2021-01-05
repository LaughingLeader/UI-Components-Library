package LS_Classes
{
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class horizontalScrollList extends listDisplay
   {
       
      
      public var SB_SPACING:Number = 10;
      
      public var m_scrollbar_mc:scrollbarH;
      
      public var m_added_mouseEvent:Boolean = false;
      
      public var m_MouseWheelEnabled:Boolean = true;
      
      private var m_containerHeight:Number = 10;
      
      private var m_containerWidth:Number = 10;
      
      private var m_listDisplacement:Number = 0;
      
      public var m_autoCenter:Boolean = true;
      
      public function horizontalScrollList(param1:String = "left_id", param2:String = "right_id", param3:String = "handleH_id", param4:String = "scrollBg_id")
      {
         this.m_scrollbar_mc = new scrollbarH(param1,param2,param3,param4);
         addChild(this.m_scrollbar_mc);
         super();
         this.m_scrollbar_mc.visible = false;
         this.m_containerHeight = 0;
         this.m_containerWidth = 0;
         this.m_listDisplacement;
      }
      
      public function checkScrollBar() : *
      {
         if(container_mc.transform.pixelBounds.width > container_mc.scrollRect.width)
         {
            this.m_scrollbar_mc.visible = true;
         }
         else
         {
            this.m_scrollbar_mc.visible = false;
         }
      }
      
      public function get listDisplacement() : Number
      {
         return this.m_listDisplacement;
      }
      
      public function set listDisplacement(param1:Number) : *
      {
         this.m_listDisplacement = param1;
         this.positionElements();
      }
      
      override public function setFrame(param1:Number, param2:Number) : *
      {
         container_mc.scrollRect = new Rectangle(0,0,param1,param2);
         this.m_scrollbar_mc.y = this.SB_SPACING + param2;
         this.m_containerHeight = param2;
         this.m_containerWidth = param1;
         this.m_scrollbar_mc.addContent(container_mc);
         this.checkScrollBar();
      }
      
      override public function positionElements() : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:uint = 0;
         if(content_array.length == 0)
         {
            return;
         }
         if(!this.m_added_mouseEvent && this.m_MouseWheelEnabled)
         {
            this.addMouseEvent(this);
            this.m_added_mouseEvent = true;
         }
         var _loc1_:Number = this.m_listDisplacement;
         if(this.m_autoCenter)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < content_array.length)
            {
               _loc3_ = _loc3_ + (getElementWidth(content_array[_loc4_]) + EL_SPACING);
               _loc4_++;
            }
            if(_loc3_ < this.m_containerWidth)
            {
               _loc1_ = _loc1_ + (this.m_containerWidth - _loc3_);
            }
         }
         var _loc2_:uint = 0;
         while(_loc2_ < content_array.length)
         {
            content_array[_loc2_].x = _loc1_;
            _loc1_ = _loc1_ + (getElementWidth(content_array[_loc2_]) + EL_SPACING);
            _loc2_++;
         }
         this.checkScrollBar();
      }
      
      public function addMouseEvent(param1:MovieClip) : *
      {
         this.m_scrollbar_mc.addMouseEvent(param1);
      }
      
      public function set scrollbarSpacing(param1:Number) : *
      {
         this.SB_SPACING = param1;
         this.m_scrollbar_mc.y = this.SB_SPACING + this.m_containerHeight;
      }
      
      public function get scrollbarSpacing() : Number
      {
         return this.SB_SPACING;
      }
      
      override public function selectMC(param1:MovieClip, param2:Boolean = false) : *
      {
         super.selectMC(param1,param2);
         if(m_CurrentSelection)
         {
            if(m_CurrentSelection.x < this.m_scrollbar_mc.m_scrolledX)
            {
               this.m_scrollbar_mc.scrollTo(m_CurrentSelection.x);
            }
            else if(m_CurrentSelection.x + getElementWidth(m_CurrentSelection) > container_mc.scrollRect.width)
            {
               this.m_scrollbar_mc.scrollTo(m_CurrentSelection.x + getElementWidth(m_CurrentSelection) - container_mc.scrollRect.width);
            }
         }
      }
   }
}
