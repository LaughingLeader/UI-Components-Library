package
{
   import LS_Classes.larTween;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public dynamic class TagMC extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var borderBgFooter_mc:MovieClip;
      
      public var borderBgHeader_mc:MovieClip;
      
      public var borderBg_mc:MovieClip;
      
      public var desc_txt:TextField;
      
      public var empty_mc:MovieClip;
      
      public var fullBg_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public var icon_mc:MovieClip;
      
      public var label_txt:TextField;
      
      public var timeline:larTween;
      
      public var base:MovieClip;
      
      public function TagMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setEmpty() : *
      {
         this.hl_mc.x = 75;
         this.hl_mc.y = 0;
         this.bg_mc.x = 75;
         this.bg_mc.y = 0;
         this.label_txt.x = 106;
         this.label_txt.y = 0;
         this.bg_mc.visible = false;
         this.label_txt.visible = false;
         this.icon_mc.visible = false;
         this.empty_mc.visible = true;
         this.desc_txt.visible = false;
         this.bg_mc.width = 74;
         this.clearDescriptionSection();
      }
      
      public function clearDescriptionSection() : void
      {
         this.desc_txt.visible = false;
         this.desc_txt.scaleY = 0.001;
         this.desc_txt.y = 0;
         this.borderBgHeader_mc.visible = false;
         this.borderBgHeader_mc.scaleY = 0.001;
         this.borderBgHeader_mc.y = 0;
         this.borderBgFooter_mc.visible = false;
         this.borderBgFooter_mc.scaleY = 0.001;
         this.borderBgFooter_mc.y = 0;
         this.borderBg_mc.visible = false;
         this.borderBg_mc.scaleY = 0.001;
         this.borderBg_mc.y = 0;
         this.fullBg_mc.visible = false;
         this.fullBg_mc.scaleY = 0.001;
         this.fullBg_mc.y = 0;
         this.heightOverride = null;
      }
      
      public function setTag(param1:String, param2:Number, param3:String, param4:String) : *
      {
         var _loc7_:TextFormat = null;
         var _loc5_:Number = this.borderBgFooter_mc.width;
         this.label_txt.autoSize = TextFieldAutoSize.LEFT;
         if(param1 == "")
         {
            param1 = " ";
         }
         this.label_txt.htmlText = param1;
         this.hl_mc.width = this.bg_mc.width = this.label_txt.x + this.label_txt.textWidth + 10 - this.bg_mc.x;
         this.bg_mc.gotoAndStop(param2);
         this.bg_mc.visible = true;
         this.label_txt.visible = true;
         this.icon_mc.visible = true;
         this.empty_mc.visible = false;
         this.tooltip = param3;
         this.clearDescriptionSection();
         var _loc6_:Number = Math.round((_loc5_ - this.bg_mc.width) * 0.5 + 25);
         this.bg_mc.x = _loc6_;
         this.hl_mc.x = _loc6_;
         this.label_txt.x = Math.round(this.bg_mc.x + (this.bg_mc.width - this.label_txt.textWidth) * 0.5);
         if(param4.length > 0)
         {
            this.desc_txt.visible = true;
            this.borderBgHeader_mc.visible = true;
            this.borderBgFooter_mc.visible = true;
            this.borderBg_mc.visible = true;
            this.fullBg_mc.visible = true;
            this.desc_txt.scaleY = 1;
            this.borderBgHeader_mc.scaleY = 1;
            this.borderBgFooter_mc.scaleY = 1;
            this.borderBg_mc.scaleY = 1;
            this.fullBg_mc.scaleY = 1;
            _loc7_ = this.desc_txt.defaultTextFormat;
            _loc7_.size = 16;
            this.desc_txt.defaultTextFormat = _loc7_;
            this.desc_txt.border = false;
            this.desc_txt.multiline = true;
            this.desc_txt.wordWrap = true;
            this.desc_txt.useRichTextClipboard = true;
            this.desc_txt.x = 38;
            this.desc_txt.y = 34;
            this.desc_txt.visible = true;
            this.desc_txt.htmlText = param4;
            this.desc_txt.height = this.desc_txt.textHeight;
            this.borderBgHeader_mc.y = this.bg_mc.y + this.bg_mc.height * 0.5;
            this.borderBgHeader_mc.space = this.bg_mc.width + 32;
            this.borderBgFooter_mc.y = this.desc_txt.y + this.desc_txt.height;
            this.borderBg_mc.y = this.borderBgHeader_mc.y + this.borderBgHeader_mc.height;
            this.borderBg_mc.height = this.borderBgFooter_mc.y - this.borderBgHeader_mc.y - this.borderBgHeader_mc.height;
            this.fullBg_mc.y = 0;
            this.fullBg_mc.width = this.borderBg_mc.width;
            this.fullBg_mc.height = this.borderBgFooter_mc.y + this.borderBgFooter_mc.height - this.fullBg_mc.y + 10;
            this.heightOverride = this.fullBg_mc.height - 10;
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
      }
   }
}
