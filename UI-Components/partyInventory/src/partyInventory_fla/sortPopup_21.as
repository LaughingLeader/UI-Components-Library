package partyInventory_fla
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class sortPopup_21 extends MovieClip
   {
       
      
      public var cancelBtn_mc:cancelBtn;
      
      public var container_mc:empty;
      
      public var okBtn_mc:okBtn;
      
      public var title_txt:TextField;
      
      public var list:listDisplay;
      
      public function sortPopup_21()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.list = new listDisplay();
         this.list.TOP_SPACING = 25;
         this.container_mc.addChild(this.list);
         this.okBtn_mc.initialize("",this.okPressed);
         this.cancelBtn_mc.initialize("",this.cancelPressed);
         visible = false;
      }
      
      public function okPressed() : *
      {
         var _loc3_:MovieClip = null;
         (parent as MovieClip).setSortPanelVisible(false,false);
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.list.length)
         {
            _loc3_ = this.list.getAt(_loc2_);
            if(_loc3_)
            {
               if(_loc3_.check_mc.visible)
               {
                  ExternalInterface.call("setSortFilter",_loc3_.id,_loc3_.check_mc.visible);
                  _loc3_.oldChecked = _loc3_.check_mc.visible;
                  _loc1_++;
               }
            }
            _loc2_++;
         }
         if(_loc1_ > 0)
         {
            ExternalInterface.call("applySortFilters");
         }
      }
      
      public function cancelPressed() : *
      {
         (parent as MovieClip).setSortPanelVisible(false);
      }
      
      public function resetOptions() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.list.length)
         {
            _loc2_ = this.list.getAt(_loc1_);
            if(_loc2_ && _loc2_.oldChecked)
            {
               this.list.select(_loc2_.list_pos);
            }
            _loc1_++;
         }
      }
      
      public function addSort(param1:Number, param2:String, param3:Boolean) : *
      {
         var _loc4_:MovieClip = this.list.getElementByNumber("id",param1);
         if(!_loc4_)
         {
            _loc4_ = new SortEntry();
            _loc4_.id = param1;
            _loc4_.list = this.list;
            this.list.addElement(_loc4_);
            _loc4_.hl_mc.visible = false;
         }
         _loc4_.text_txt.htmlText = param2;
         _loc4_.oldChecked = param3;
         _loc4_.setCheck(param3);
      }
      
      public function clearSort() : *
      {
         this.list.clearElements();
      }
      
      function frame1() : *
      {
      }
   }
}
