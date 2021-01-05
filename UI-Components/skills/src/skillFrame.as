package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   import flash.utils.getDefinitionByName;
   
   public dynamic class skillFrame extends MovieClip
   {
       
      
      public var m_CellClass:Class;
      
      public var m_CellWidth:Number;
      
      public var m_LeftArrowClass:Class;
      
      public var m_LeftArrowWidth:Number;
      
      public var m_LeftBorderClass:Class;
      
      public var m_LeftBorderWidth:Number;
      
      public var m_LeftOpenBorderClass:Class;
      
      public var m_LeftOpenBorderWidth:Number;
      
      public var m_RightArrowClass:Class;
      
      public var m_RightArrowWidth:Number;
      
      public var m_RightBorderClass:Class;
      
      public var m_RightBorderWidth:Number;
      
      public var m_RightOpenBorderClass:Class;
      
      public var m_RightOpenBorderWidth:Number;
      
      public var m_SeparatorClass:Class;
      
      public var m_SeparatorWidth:Number;
      
      public var m_CursorX:Number;
      
      public var m_CursorY:Number;
      
      public var m_CurrentColor:String;
      
      public var m_CurrentColumn:int;
      
      public var m_NumColumns:uint;
      
      public var m_ElementSpacing:Number;
      
      public var m_RowSpacing:Number;
      
      public var m_ElementAlpha:Number;
      
      public function skillFrame()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init(param1:uint, param2:Number, param3:Number, param4:String, param5:String, param6:String, param7:String, param8:String, param9:String, param10:String, param11:String) : void
      {
         this.m_ElementAlpha = 0.75;
         this.m_NumColumns = param1;
         this.m_ElementSpacing = param2;
         this.m_RowSpacing = param3;
         this.m_CellClass = getDefinitionByName(param4) as Class;
         this.m_CellWidth = new this.m_CellClass().width;
         this.m_LeftArrowClass = getDefinitionByName(param5) as Class;
         this.m_LeftArrowWidth = new this.m_LeftArrowClass().width;
         this.m_LeftBorderClass = getDefinitionByName(param6) as Class;
         this.m_LeftBorderWidth = new this.m_LeftBorderClass().width;
         this.m_LeftOpenBorderClass = getDefinitionByName(param7) as Class;
         this.m_LeftOpenBorderWidth = new this.m_LeftOpenBorderClass().width;
         this.m_RightArrowClass = getDefinitionByName(param8) as Class;
         this.m_RightArrowWidth = new this.m_RightArrowClass().width;
         this.m_RightBorderClass = getDefinitionByName(param9) as Class;
         this.m_RightBorderWidth = new this.m_RightBorderClass().width;
         this.m_RightOpenBorderClass = getDefinitionByName(param10) as Class;
         this.m_RightOpenBorderWidth = new this.m_RightOpenBorderClass().width;
         this.m_SeparatorClass = getDefinitionByName(param11) as Class;
         this.m_SeparatorWidth = new this.m_SeparatorClass().width;
      }
      
      public function setNumColumns(param1:int) : void
      {
         this.m_NumColumns = param1;
      }
      
      public function clearFrame() : void
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         this.m_CursorX = 0;
         this.m_CursorY = 0;
         this.m_CurrentColumn = 0;
      }
      
      public function setColor(param1:String) : *
      {
         this.m_CurrentColor = param1;
      }
      
      public function addFrameCells(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.m_NumColumns == 0 || param1 == 0)
         {
            return;
         }
         var _loc3_:int = param1;
         while(_loc3_ > 0)
         {
            _loc4_ = Math.min(this.m_NumColumns - this.m_CurrentColumn,_loc3_);
            if(_loc4_)
            {
               if(_loc3_ != param1)
               {
                  if(!param2)
                  {
                     this.placeElement(new this.m_LeftArrowClass());
                  }
                  this.m_CursorX = this.m_CursorX + (!!param2?this.m_LeftOpenBorderWidth:this.addElement(new this.m_LeftOpenBorderClass()));
               }
               else
               {
                  this.m_CursorX = this.m_CursorX + (!!param2?this.m_LeftBorderWidth:this.addElement(new this.m_LeftBorderClass()));
               }
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  if(_loc5_ != 0)
                  {
                     this.m_CursorX = this.m_CursorX + (!!param2?this.m_SeparatorWidth:this.addElement(new this.m_SeparatorClass()));
                  }
                  this.m_CursorX = this.m_CursorX + (!!param2?this.m_CellWidth:this.addElement(new this.m_CellClass()));
                  _loc5_++;
               }
               if(_loc3_ - _loc4_ > 0)
               {
                  if(!param2)
                  {
                     this.placeElement(new this.m_RightArrowClass());
                  }
                  this.m_CursorX = this.m_CursorX + (!!param2?this.m_RightOpenBorderWidth:this.addElement(new this.m_RightOpenBorderClass()));
               }
               else
               {
                  this.m_CursorX = this.m_CursorX + (!!param2?this.m_RightBorderWidth:this.addElement(new this.m_RightBorderClass()));
               }
               this.m_CurrentColumn = this.m_CurrentColumn + _loc4_;
            }
            _loc3_ = _loc3_ - _loc4_;
            if(_loc3_ > 0)
            {
               this.nextLine();
            }
         }
         this.m_CursorX = this.m_CursorX + this.m_ElementSpacing;
      }
      
      public function addElement(param1:MovieClip) : Number
      {
         var _loc2_:* = new ColorTransform();
         _loc2_.color = int("0xff" + this.m_CurrentColor);
         param1.transform.colorTransform = _loc2_;
         param1.mouseEnabled = false;
         param1.alpha = this.m_ElementAlpha;
         param1.x = this.m_CursorX;
         param1.y = this.m_CursorY;
         this.addChild(param1);
         return param1.width;
      }
      
      public function placeElement(param1:MovieClip) : void
      {
         param1.alpha = this.m_ElementAlpha;
         param1.mouseEnabled = false;
         param1.x = this.m_CursorX;
         param1.y = this.m_CursorY;
         this.addChild(param1);
      }
      
      public function nextLine() : void
      {
         this.m_CurrentColumn = 0;
         this.m_CursorX = 0;
         this.m_CursorY = this.m_CursorY + this.m_RowSpacing;
      }
      
      function frame1() : *
      {
         this.m_CurrentColor = "000000";
         this.m_CurrentColumn = 0;
      }
   }
}
