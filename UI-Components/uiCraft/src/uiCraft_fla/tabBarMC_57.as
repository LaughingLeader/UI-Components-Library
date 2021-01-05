package uiCraft_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.larTween;
   import fl.motion.easing.Linear;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class tabBarMC_57 extends MovieClip
   {
       
      
      public var container_mc:MovieClip;
      
      public var tabList:horizontalList;
      
      public var base:MovieClip;
      
      public var fonkelTween:larTween;
      
      public function tabBarMC_57()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.tabList = new horizontalList();
         this.tabList.EL_SPACING = 46;
         this.tabList.m_cyclic = true;
         this.container_mc.addChild(this.tabList);
      }
      
      public function addTab(param1:Number, param2:String, param3:Function) : *
      {
         var _loc4_:MovieClip = this.tabList.getElementByNumber("id",param1);
         if(!_loc4_)
         {
            _loc4_ = new Tab();
            _loc4_.textInActiveAlpha = 0.65;
            _loc4_.m_AllowToggleActive = false;
            _loc4_.textActiveAlpha = 1;
            _loc4_.SND_Click = "UI_Gen_BigButton_Click";
            _loc4_.fonkel_mc.alpha = 0;
            this.tabList.addElement(_loc4_,false);
            _loc4_.id = param1;
         }
         _loc4_.initialize(param2.toUpperCase(),param3,_loc4_,false);
         _loc4_.fonkel_mc.mouseEnabled = false;
         _loc4_.fonkel_mc.mouseChildren = false;
         _loc4_.onOverFunc = _loc4_.overFunc;
         _loc4_.onOutFunc = _loc4_.outFunc;
         _loc4_.onUpFunc = _loc4_.upFunc;
         _loc4_.onDownFunc = _loc4_.downFunc;
      }
      
      public function setTabEnabled(param1:Number, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.tabList.getElementByNumber("id",param1);
         if(_loc3_)
         {
            _loc3_.setEnabled(param2);
         }
      }
      
      public function setTitle(param1:String) : *
      {
      }
      
      public function removeTabs() : *
      {
         this.tabList.clearElements();
      }
      
      public function selectTab(param1:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc2_:MovieClip = this.tabList.getElementByNumber("id",param1);
         if(_loc2_)
         {
            this.base.allowSound = false;
            _loc3_ = this.tabList.currentSelection;
            if(param1 != _loc3_ && _loc3_ != -1)
            {
               this.tabList.getCurrentMovieClip().setActive(false);
               ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
            }
            this.tabList.selectMC(_loc2_);
            this.refreshPos();
            _loc2_.setActive(true);
            this.base.allowSound = true;
         }
      }
      
      public function refreshPos() : *
      {
         this.tabList.positionElements();
      }
      
      public function showBreadcrumb(param1:Number, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.tabList.getElementByNumber("id",param1);
         if(_loc3_)
         {
            if(this.fonkelTween)
            {
               this.fonkelTween.stop();
            }
            if(param2)
            {
               this.fonkelTween = new larTween(_loc3_.fonkel_mc,"alpha",Linear.easeNone,_loc3_.fonkel_mc.alpha,1,0.3);
            }
            else
            {
               this.fonkelTween = new larTween(_loc3_.fonkel_mc,"alpha",Linear.easeNone,_loc3_.fonkel_mc.alpha,0,0.5);
            }
         }
      }
      
      public function calculateContainerWidth() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.tabList.content_array.length)
         {
            if(this.tabList.content_array[_loc2_].visible)
            {
               _loc1_ = _loc1_ + (this.tabList.getElementWidth(this.tabList.content_array[_loc2_]) + this.tabList.EL_SPACING);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
      }
   }
}
