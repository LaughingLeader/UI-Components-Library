package pyramid_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public dynamic class popup_1 extends MovieClip
   {
       
      
      public var close_mc:closeBtn;
      
      public var holder_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var pyramidsList:horizontalList;
      
      public function popup_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.close_mc.initialize("",this.closePressed);
         this.close_mc.SND_Click = "Items_Objects_UNI_Teleport_Pyramid_Stop";
      }
      
      public function closePressed() : *
      {
         (root as MovieClip).close();
      }
      
      public function setTitle(param1:String) : *
      {
         this.title_txt.htmlText = param1.toUpperCase();
      }
      
      public function cleanupObsolete() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.pyramidsList.length)
         {
            _loc2_ = this.pyramidsList.getAt(_loc1_);
            if(_loc2_)
            {
               if(_loc2_.isUpdated)
               {
                  _loc1_++;
                  _loc2_.isUpdated = false;
               }
               else
               {
                  this.pyramidsList.removeElement(_loc1_,false);
               }
            }
         }
         this.pyramidsList.positionElements();
      }
      
      public function setPyramid(param1:Number, param2:String, param3:Boolean) : *
      {
         var _loc4_:MovieClip = this.pyramidsList.getElementByNumber("id",param1);
         if(_loc4_ == null)
         {
            _loc4_ = new Pyramid();
            _loc4_.id = param1;
            _loc4_.iconMc = new IggyIcon();
            _loc4_.icon_mc.addChild(_loc4_.iconMc);
            this.pyramidsList.addElement(_loc4_,false);
            _loc4_.initialize("",this.pyramidPressed,_loc4_);
            _loc4_.onOverFunc = this.onPyramidOver;
            _loc4_.onOutFunc = this.onPyramidOut;
            _loc4_.onOverParams = _loc4_;
         }
         _loc4_.disabled_mc.visible = !param3;
         _loc4_.isUpdated = true;
         _loc4_.iconMc.name = "iggy_" + param2;
      }
      
      public function onPyramidOver(param1:MovieClip) : *
      {
         var _loc2_:Point = tooltipHelper.getGlobalPositionOfMC(param1,root);
         ExternalInterface.call("pyramidOver",param1.id,_loc2_.x,_loc2_.y,param1.width,param1.height,"bottom");
      }
      
      public function onPyramidOut() : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      public function pyramidPressed(param1:MovieClip) : *
      {
         if(!param1.disabled_mc.visible)
         {
            ExternalInterface.call("pyramidPressed",param1.id);
            (root as MovieClip).close();
         }
      }
      
      function frame1() : *
      {
         this.pyramidsList = new horizontalList();
         this.pyramidsList.EL_SPACING = 35;
         this.pyramidsList.m_forceDepthReorder = true;
         this.holder_mc.addChild(this.pyramidsList);
      }
   }
}
