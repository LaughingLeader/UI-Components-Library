package
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class CraftCategory extends MovieClip
   {
       
      
      public var collapse_mc:minusBtn;
      
      public var decollapse_mc:plusBtn;
      
      public var listContainer_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var elemSpacing:Number;
      
      public var _isOpen:Boolean;
      
      public const onOverHlAlpha:Number = 0.3;
      
      public const onOverOutHlTweenTime:Number = 0.2;
      
      public var closedHeight:Number;
      
      public function CraftCategory()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.title_txt.mouseEnabled = false;
         this.listContainer_mc.mouseEnabled = false;
         this.title_txt.autoSize = TextFieldAutoSize.LEFT;
         this.listContainer_mc.visible = false;
         this.title_txt.height = this.title_txt.textHeight;
         this.closedHeight = Math.ceil((this.title_txt.y + this.title_txt.height) / this.elemSpacing) * this.elemSpacing;
         this.listContainer_mc.scaleY = 0;
         this.listContainer_mc.y = 0;
         this.heightOverride = this.closedHeight;
         this.decollapse_mc.init(this.decollapse);
         this.collapse_mc.init(this.collapse);
         this.decollapse_mc.setEnabled(true);
         this.collapse_mc.setEnabled(true);
      }
      
      public function decollapse() : *
      {
         this.toggleOpenClose();
      }
      
      public function collapse() : *
      {
         this.toggleOpenClose();
      }
      
      public function onOver(param1:* = null) : *
      {
         this.mainList.selectMC(this,true);
      }
      
      public function setGroupAmount(param1:Number) : *
      {
         this.refreshHeight();
      }
      
      public function selectElement() : *
      {
         var _loc1_:MovieClip = root as MovieClip;
         if(_loc1_.allowSound)
         {
            ExternalInterface.call("PlaySound","UI_Game_Dialog_Over");
         }
         this.decollapse_mc.onMouseOver(null);
         this.collapse_mc.onMouseOver(null);
      }
      
      public function deselectElement() : *
      {
         this.decollapse_mc.onMouseOut(null);
         this.collapse_mc.onMouseOut(null);
         if(this.list.m_CurrentSelection)
         {
            this.list.m_CurrentSelection.deselectElement();
         }
      }
      
      public function refreshHeight() : *
      {
         if(this.listContainer_mc.visible)
         {
            this.heightOverride = this.listContainer_mc.y + this.calculateContainerHeight();
         }
         else
         {
            this.heightOverride = this.closedHeight;
         }
      }
      
      public function toggleOpenClose() : *
      {
         var _loc1_:MovieClip = root as MovieClip;
         if(_loc1_ && _loc1_.makeSound)
         {
            ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
         }
         this._isOpen = !this._isOpen;
         this.listContainer_mc.visible = this._isOpen;
         this.decollapse_mc.visible = !this._isOpen;
         this.collapse_mc.visible = this._isOpen;
         if(this.listContainer_mc.visible)
         {
            this.listContainer_mc.scaleY = 1;
            this.listContainer_mc.y = this.closedHeight;
            this.heightOverride = this.listContainer_mc.y + this.calculateContainerHeight();
         }
         else
         {
            this.listContainer_mc.scaleY = 0;
            this.listContainer_mc.y = 0;
            this.heightOverride = this.closedHeight;
         }
         if(this.mainList)
         {
            this.mainList.positionElements();
            if(this._isOpen)
            {
               this.mainList.getGroupInView(this);
            }
            else
            {
               this.mainList.checkScrollbarBottom();
            }
         }
      }
      
      public function openEntry(param1:Boolean) : *
      {
         if(!this._isOpen)
         {
            this.toggleOpenClose();
         }
      }
      
      public function closeEntry(param1:Boolean) : *
      {
         if(this._isOpen)
         {
            this.toggleOpenClose();
         }
      }
      
      public function calculateContainerHeight() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.list.content_array.length)
         {
            if(this.list.content_array[_loc2_].visible)
            {
               if(_loc1_ != 0)
               {
                  _loc1_ = _loc1_ + this.list.EL_SPACING;
               }
               _loc1_ = _loc1_ + this.list.getElementHeight(this.list.content_array[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      function frame1() : *
      {
         this._isOpen = false;
      }
   }
}
