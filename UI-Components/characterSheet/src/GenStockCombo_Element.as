package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public dynamic class GenStockCombo_Element extends MovieClip
   {
       
      
      public var text_txt:TextField;
      
      public var selected:Boolean;
      
      public var _text:String;
      
      public function GenStockCombo_Element()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : void
      {
         this.selected = false;
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOverEl);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOutEl);
      }
      
      public function onRollOverEl(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      public function onRollOutEl(param1:MouseEvent) : void
      {
         gotoAndStop(!!this.selected?3:1);
      }
      
      public function selectElement() : void
      {
         this.selected = true;
         gotoAndStop(3);
      }
      
      public function deselectElement() : void
      {
         this.selected = false;
         gotoAndStop(1);
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
         this.text_txt.htmlText = param1;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      function frame1() : *
      {
         gotoAndStop(1);
      }
   }
}
