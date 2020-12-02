package
{
   import LS_Classes.listDisplay;
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class teamMC extends MovieClip
   {
       
      
      public var bg_center_mc:MovieClip;
      
      public var bg_footer_mc:MovieClip;
      
      public var holder_mc:MovieClip;
      
      public var scoreLabel_txt:TextField;
      
      public var score_txt:TextField;
      
      public var star_mc:MovieClip;
      
      public var winner_mc:MovieClip;
      
      public var list:listDisplay;
      
      public var parentList:scrollList;
      
      public var _isWinner:Boolean;
      
      public function teamMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.list = new listDisplay();
         this.list.EL_SPACING = -3;
         this.holder_mc.addChild(this.list);
         this.updateBG();
         this.setWinner(false);
      }
      
      public function updateBG() : *
      {
         var _loc5_:MovieClip = null;
         this.list.positionElements();
         var _loc1_:Number = this.bg_center_mc.y;
         var _loc2_:Number = this.list.TOP_SPACING;
         var _loc3_:uint = 0;
         while(_loc3_ < this.list.length)
         {
            _loc5_ = this.list.getAt(_loc3_);
            if(_loc5_)
            {
               _loc2_ = _loc2_ + (this.list.getElementHeight(_loc5_) + this.list.EL_SPACING);
            }
            _loc3_++;
         }
         var _loc4_:Number = 22;
         this.bg_center_mc.height = _loc2_ + _loc4_;
         this.bg_footer_mc.y = _loc2_ + _loc4_;
         this.heightOverride = _loc2_ + this.holder_mc.y + _loc4_;
         this.parentList.positionElements();
      }
      
      public function setWinner(param1:Boolean) : *
      {
         this._isWinner = param1;
         this.winner_mc.visible = this._isWinner;
         this.star_mc.visible = this._isWinner;
         this.scoreLabel_txt.textColor = !!this._isWinner?uint(11506255):uint(16777215);
         this.score_txt.textColor = !!this._isWinner?uint(11506255):uint(16777215);
      }
      
      function frame1() : *
      {
      }
   }
}
