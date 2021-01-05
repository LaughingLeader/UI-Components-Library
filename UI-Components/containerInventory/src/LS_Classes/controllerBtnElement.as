package LS_Classes
{
   import flash.display.MovieClip;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   
   public dynamic class controllerBtnElement extends MovieClip
   {
       
      
      public var icon_mc:controllerBtnHint;
      
      public var text_txt:TextField;
      
      public const strokeW:Number = 2.5;
      
      public var iconY:Number;
      
      public var iconId:Number;
      
      public var id:Number;
      
      public var list_pos:Number;
      
      public var list_id:Number;
      
      public var selectable:Boolean;
      
      public var m_filteredObject:Boolean;
      
      public var ownerList:MovieClip;
      
      public function controllerBtnElement()
      {
         super();
         this.icon_mc = new controllerBtnHint();
         addChild(this.icon_mc);
         this.text_txt = new TextField();
         addChild(this.text_txt);
         var _loc1_:Class = getDefinitionByName("$Title") as Class;
         var _loc2_:Font = new _loc1_();
         var _loc3_:TextFormat = this.text_txt.getTextFormat();
         _loc3_.font = _loc2_.fontName;
         _loc3_.color = 16777215;
         _loc3_.size = 24;
         _loc3_.leading = -10;
         _loc3_.align = "left";
         this.text_txt.defaultTextFormat = _loc3_;
         this.text_txt.x = 50;
         this.text_txt.autoSize = TextFieldAutoSize.LEFT;
         this.text_txt.filters = textEffect.createStrokeFilter(1050888,this.strokeW,1,1,9);
      }
      
      public function setBtnHintState(param1:Boolean) : *
      {
         this.alpha = !!param1?Number(1):Number(0.7);
      }
      
      public function setBtnHint(param1:String, param2:Number, param3:Number = 200, param4:Boolean = true) : *
      {
         this.iconId = param2;
         this.icon_mc.setHintIcon(this.iconId);
         this.text_txt.htmlText = param1;
         var _loc5_:Number = this.text_txt.textWidth;
         var _loc6_:Number = textHelpers.getLongestWordLength(this.text_txt);
         if(this.text_txt.textWidth > param3)
         {
            _loc5_ = _loc6_ > param3?Number(_loc6_):Number(param3);
            this.text_txt.multiline = true;
            this.text_txt.wordWrap = true;
         }
         else
         {
            this.text_txt.multiline = false;
            this.text_txt.wordWrap = false;
         }
         var _loc7_:Number = Math.round(this.strokeW) * 2;
         this.text_txt.width = Math.ceil(_loc5_ + _loc7_);
         this.text_txt.y = -Math.round(this.text_txt.textHeight * 0.5) - 2;
         this.iconY = this.icon_mc.y = -Math.round(this.icon_mc.height * 0.5);
         this.text_txt.x = this.icon_mc.x + this.icon_mc.width + 3;
         this.setBtnHintState(param4);
      }
      
      public function selectElement() : *
      {
      }
      
      public function deselectElement() : *
      {
      }
   }
}
