package journal_fla
{
   import LS_Classes.listDisplay;
   import LS_Classes.textEffect;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class legendHolder_13 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var expander_mc:LegendExpander;
      
      public var legend_mc:empty;
      
      public var title_txt:TextField;
      
      public const animTime:Number = 0.5;
      
      public var legend:listDisplay;
      
      public function legendHolder_13()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function maskLegend() : *
      {
         this.legend_mc.scrollRect = new Rectangle(0,0,this.legend_mc.width,this.bg_mc.height - this.legend_mc.y);
      }
      
      public function init() : *
      {
         this.expander_mc.init(this.onPressed,null,true);
         this.moveExpanderDown();
      }
      
      public function moveExpanderDown() : *
      {
         this.expander_mc.y = 467;
      }
      
      public function moveExpanderUp() : *
      {
         this.expander_mc.y = 124;
      }
      
      public function onPressed() : *
      {
         if(this.expander_mc.isActive)
         {
            this.legend.visible = true;
            this.bg_mc.gotoAndStop(1);
            this.expander_mc.gotoAndStop(1);
            this.moveExpanderDown();
         }
         else
         {
            this.legend.visible = false;
            this.bg_mc.gotoAndStop(2);
            this.expander_mc.gotoAndStop(2);
            this.moveExpanderUp();
         }
      }
      
      public function addIcon(param1:Number, param2:String) : *
      {
         var _loc3_:MovieClip = new LegendMC();
         _loc3_.icon_mc.gotoAndStop(param1);
         if(param1 == 4)
         {
            _loc3_.icon_mc.y = _loc3_.icon_mc.y - 11;
         }
         _loc3_.icon_mc.sel_mc.visible = false;
         _loc3_.icon_mc.sel_mc.bg_mc.stop();
         _loc3_.label_mc.text_txt.autoSize = TextFieldAutoSize.CENTER;
         _loc3_.label_mc.text_txt.htmlText = param2;
         _loc3_.label_mc.filters = textEffect.createStrokeFilter(0,1.2,0.8,1,3);
         this.legend.addElement(_loc3_);
      }
      
      function frame1() : *
      {
         this.legend = new listDisplay();
         this.legend_mc.addChild(this.legend);
         this.legend.x = 30;
      }
   }
}
