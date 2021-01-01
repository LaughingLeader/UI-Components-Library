package contextMenu_fla
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class windowsMenu_1 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var list:listDisplay;
      
      public function windowsMenu_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setTitle(param1:String) : *
      {
         this.bg_mc.title_txt.htmlText = param1;
      }
      
      public function addEntry(param1:Number, param2:Number, param3:Boolean, param4:String, param5:Boolean, param6:Boolean) : *
      {
         var _loc7_:MovieClip = this.list.getElementByNumber("id",param1);
         if(_loc7_ == null)
         {
            _loc7_ = new WEntry();
            this.list.addElement(_loc7_,false);
            _loc7_.mouseChildren = false;
            _loc7_.id = param1;
            _loc7_.actionID = param2;
            _loc7_.handle = 0;
            _loc7_.arrow_mc.visible = false;
            _loc7_.hl_mc.alpha = 0;
            _loc7_.isButton = true;
            _loc7_.legal = param6;
            _loc7_.text_txt.autoSize = TextFieldAutoSize.LEFT;
         }
         _loc7_.text_txt.alpha = !!param5?0.5:1;
         _loc7_.arrow_mc.alpha = !!param5?0.5:1;
         _loc7_.clickSound = param3;
         if(!param6)
         {
            _loc7_.text_txt.textColor = 10354688;
            _loc7_.selectedColor = 10354688;
            _loc7_.deSelectedColor = 10354688;
         }
         else
         {
            _loc7_.text_txt.textColor = 12103073;
            _loc7_.selectedColor = 16777215;
            _loc7_.deSelectedColor = 12103073;
         }
         _loc7_.text = param4;
         _loc7_.disabled = param5;
         _loc7_.text_txt.htmlText = param4;
         _loc7_.hl_mc.height = Math.floor(_loc7_.text_txt.textHeight) + 2;
      }
      
      public function updateDone() : *
      {
         this.list.positionElements();
         this.bg_mc.setHeight(this.bg_mc.container_mc.height,this.list);
         this.list.scrollRect = new Rectangle(0,0,this.bg_mc.width,this.bg_mc.height);
         this.bg_mc.bottom_mc.y = this.bg_mc.mid_mc.y + this.bg_mc.mid_mc.height - this.bg_mc.bottomOffset;
         this.list.alpha = 1;
         ExternalInterface.call("setMcSize",this.x + this.bg_mc.x + this.bg_mc.width,this.y + this.bg_mc.y + this.bg_mc.container_mc.y + this.bg_mc.container_mc.height + this.bg_mc.bottom_mc.height);
      }
      
      function frame1() : *
      {
         this.list = new listDisplay();
         this.list.EL_SPACING = 0;
         this.list.m_cyclic = true;
         this.bg_mc.container_mc.addChild(this.list);
         this.bg_mc.container_mc.y = 15;
         this.bg_mc.title_txt.visible = this.bg_mc.firstLine_mc.visible = false;
      }
   }
}
