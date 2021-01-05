package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class Recipe extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var label_txt:TextField;
      
      public var line_mc:MovieClip;
      
      public var new_mc:Fonkel;
      
      public const selectedHlAlpha:Number = 0.6;
      
      public const onOverHlAlpha:Number = 0.3;
      
      public const onOverOutHlTweenTime:Number = 0.2;
      
      public var elemSpacing:Number;
      
      public var isActive:Boolean;
      
      public var isHover:Boolean;
      
      public var onActivate:Function;
      
      public var labelStr:String;
      
      public var val:Number;
      
      public var isNew:Boolean;
      
      public function Recipe()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.label_txt.mouseEnabled = false;
         this.label_txt.wordWrap = false;
         this.label_txt.multiline = false;
         this.label_txt.autoSize = TextFieldAutoSize.LEFT;
         this.label_txt.maxChars = 50;
         this.line_mc.mouseEnabled = false;
         this.line_mc.mouseChildren = false;
         this.bg_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onPressed);
         this.isHover = false;
         this.updateHighlight();
      }
      
      public function onOver(param1:* = null) : *
      {
         this.group.mainList.selectMC(this.group);
         this.group.deselectElement();
         this.group.list.selectMC(this,true);
      }
      
      public function onPressed(param1:* = null) : *
      {
         this.bg_mc.addEventListener(MouseEvent.MOUSE_UP,this.onReleased);
      }
      
      public function onReleased(param1:* = null) : *
      {
         this.bg_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onReleased);
         this.activate();
      }
      
      public function activate() : *
      {
         if(this.group.mainList.container_mc.currentActive != null)
         {
            this.group.mainList.container_mc.currentActive.deactivate();
         }
         this.group.mainList.container_mc.currentActive = this;
         this.onActivate();
         this.isActive = true;
         this.updateHighlight();
         if(this.isNew)
         {
            this.isNew = false;
            this.updateLabel();
         }
         ExternalInterface.call("PlaySound","UI_Game_Craft_Click");
         ExternalInterface.call("selectRecipe",this.id);
      }
      
      public function deactivate() : *
      {
         this.isActive = false;
         this.deselectElement();
      }
      
      public function selectElement() : *
      {
         this.isHover = true;
         this.updateHighlight();
         var _loc1_:MovieClip = root as MovieClip;
         if(_loc1_.allowSound)
         {
            ExternalInterface.call("PlaySound","UI_Game_Dialog_Over");
         }
      }
      
      public function deselectElement() : *
      {
         this.isHover = false;
         this.updateHighlight();
      }
      
      public function setName(param1:String) : *
      {
         this.labelStr = param1;
         this.updateLabel();
         this.isActive = false;
      }
      
      public function updateLabel() : *
      {
         var _loc1_:uint = 16777215;
         var _loc2_:uint = 9666937;
         var _loc3_:Number = _loc1_;
         if(this.val == 0)
         {
            _loc3_ = _loc2_;
         }
         this.label_txt.textColor = _loc3_;
         if(this.val == 0)
         {
            this.label_txt.htmlText = "[-] " + this.labelStr;
         }
         else
         {
            this.label_txt.htmlText = "[" + this.val + "] " + this.labelStr;
         }
         this.heightOverride = Math.ceil((this.label_txt.y + this.label_txt.textHeight + 4) / this.elemSpacing) * this.elemSpacing;
         this.line_mc.y = this.heightOverride - this.line_mc.height / 2;
         this.bg_mc.height = this.heightOverride;
         this.updateHighlight();
      }
      
      public function setIcon(param1:String) : *
      {
      }
      
      public function updateHighlight() : *
      {
         if(this.isActive)
         {
            this.bg_mc.gotoAndStop(4);
         }
         else if(this.isHover)
         {
            this.bg_mc.gotoAndStop(3);
         }
         else if(this.isNew)
         {
            this.bg_mc.gotoAndStop(2);
         }
         else
         {
            this.bg_mc.gotoAndStop(1);
         }
         this.new_mc.visible = this.isNew;
      }
      
      function frame1() : *
      {
      }
   }
}
