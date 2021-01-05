package characterSheet_fla
{
   import LS_Classes.listDisplay;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class optionSelection_104 extends MovieClip
   {
       
      
      public var LB_mc:selectorBtnLeft;
      
      public var RB_mc:selectorBtnRight;
      
      public var hit_mc:hit;
      
      public var text_txt:TextField;
      
      public var root_mc:MovieClip;
      
      public var optionsList:Array;
      
      public var currentIdx:Number;
      
      public function optionSelection_104()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onInit(param1:MovieClip) : *
      {
         this.root_mc = param1;
         this.optionsList = new Array();
         this.currentIdx = -1;
         this.text_txt.wordWrap = this.text_txt.multiline = false;
         this.text_txt.autoSize = TextFieldAutoSize.CENTER;
         this.LB_mc.init(this.previousEl);
         this.RB_mc.init(this.nextEl);
      }
      
      public function setEnabled(param1:Boolean) : *
      {
         this.LB_mc.setEnabled(param1 && this.optionsList.length > 1);
         this.RB_mc.setEnabled(param1 && this.optionsList.length > 1);
      }
      
      public function addOption(param1:Number, param2:String) : *
      {
         var _loc3_:Object = this.findOptionByID(param1);
         if(_loc3_ == null)
         {
            this.optionsList.push({
               "optionID":param1,
               "text":param2,
               "isUpdated":true,
               "optionContent":new MovieClip()
            });
         }
         else
         {
            _loc3_.text = param2;
            _loc3_.optionContent = new MovieClip();
            _loc3_.isUpdated = true;
         }
      }
      
      public function clearOptions() : *
      {
         this.currentIdx = -1;
         this.text_txt.htmlText = "";
         this.optionsList = new Array();
      }
      
      public function get currentElContent() : MovieClip
      {
         if(this.currentIdx >= 0 && this.optionsList[this.currentIdx] && this.optionsList[this.currentIdx].optionContent.numChildren > 0)
         {
            return this.optionsList[this.currentIdx].optionContent.getChildAt(0) as MovieClip;
         }
         return null;
      }
      
      public function get currentOptionID() : int
      {
         if(this.currentIdx >= 0)
         {
            return this.optionsList[this.currentIdx].optionID;
         }
         return -1;
      }
      
      public function cleanUpOptions() : *
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.optionsList.length)
         {
            if(this.optionsList[_loc1_].isUpdated)
            {
               this.optionsList[_loc1_++].isUpdated = false;
            }
            else
            {
               this.optionsList.splice(_loc1_,1);
            }
         }
      }
      
      public function findOptionByID(param1:Number) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:uint = 0;
         while(_loc3_ < this.optionsList.length)
         {
            if(this.optionsList[_loc3_].optionID == param1)
            {
               _loc2_ = this.optionsList[_loc3_];
               break;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function addContent(param1:uint, param2:MovieClip) : *
      {
         var _loc3_:Object = this.findOptionByID(param1);
         if(_loc3_ && _loc3_.optionContent != null)
         {
            if(_loc3_.optionContent.numChildren == 0)
            {
               _loc3_.optionContent.addChild(new listDisplay());
            }
            _loc3_.optionContent.getChildAt(0).addElement(param2);
         }
      }
      
      public function nextEl() : *
      {
         var _loc1_:uint = this.currentIdx + 1;
         if(_loc1_ >= this.optionsList.length)
         {
            _loc1_ = 0;
         }
         this.selectEl(_loc1_);
         (parent as MovieClip).setContent(this.currentElContent);
         ExternalInterface.call("selectOption",(parent as MovieClip).contentID,this.optionsList[this.currentIdx].optionID,true);
      }
      
      public function previousEl() : *
      {
         var _loc1_:int = this.currentIdx - 1;
         if(_loc1_ < 0)
         {
            _loc1_ = this.optionsList.length - 1;
         }
         this.selectEl(_loc1_);
         (parent as MovieClip).setContent(this.currentElContent);
         ExternalInterface.call("selectOption",(parent as MovieClip).contentID,this.optionsList[this.currentIdx].optionID,false);
      }
      
      public function selectOptionByID(param1:uint) : *
      {
         var _loc2_:uint = 0;
         while(_loc2_ < this.optionsList.length)
         {
            if(this.optionsList[_loc2_].optionID == param1)
            {
               this.selectEl(_loc2_);
               break;
            }
            _loc2_++;
         }
      }
      
      public function selectEl(param1:uint) : *
      {
         if(param1 < this.optionsList.length)
         {
            this.currentIdx = param1;
            this.text_txt.htmlText = this.optionsList[param1].text;
            if(this.optionsList[param1].tooltip != null)
            {
               this.hit_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
               this.hit_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
               this.tooltip = this.optionsList[param1].tooltip;
            }
            else
            {
               this.hit_mc.removeEventListener(MouseEvent.ROLL_OVER,this.onOver);
               this.hit_mc.removeEventListener(MouseEvent.ROLL_OUT,this.onOut);
            }
         }
      }
      
      public function addTooltip(param1:uint, param2:String) : *
      {
         if(param1 < this.optionsList.length)
         {
            this.optionsList[param1].tooltip = param2;
         }
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         tooltipHelper.ShowTooltipForMC(this,this.root_mc,"left");
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      function frame1() : *
      {
      }
   }
}
