package hotBar_fla
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   
   public dynamic class actionSkillHolder_31 extends MovieClip
   {
       
      
      public var actionListHolder_mc:MovieClip;
      
      public var bottom_mc:MovieClip;
      
      public var iggy_actions:MovieClip;
      
      public var midHolder_mc:MovieClip;
      
      public const topHeight:uint = 72;
      
      public const midPieceHeight:uint = 56;
      
      public const originalPosY:int = 66;
      
      public const defaultSlotCount:uint = 2;
      
      public const skillSize:uint = 50;
      
      public var midH:Number;
      
      public var root_mc:MovieClip;
      
      public var actionList:listDisplay;
      
      public function actionSkillHolder_31()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function update(param1:Array) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         var _loc5_:MovieClip = null;
         if(param1.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               _loc3_ = param1[_loc2_++];
               _loc4_ = param1[_loc2_++];
               _loc5_ = this.actionList.getElementByString("actionID",_loc3_);
               if(!_loc5_)
               {
                  _loc5_ = new action();
                  _loc5_.actionID = _loc3_;
                  _loc5_.root_mc = this.root_mc;
                  _loc5_.disabled_mc.alpha = 0.6;
                  _loc5_.hit_mc.alpha = 0;
                  _loc5_.preview_mc.visible = false;
                  _loc5_.preview_mc.gotoAndStop(1);
                  _loc5_.heightOverride = this.skillSize;
                  this.actionList.addElement(_loc5_,false);
               }
               _loc5_.disabled_mc.visible = !_loc4_;
               _loc5_.isUpdated = true;
            }
            this.actionList.cleanUpElements();
            this.positionElements();
            this.root_mc.actionSkillArray = new Array();
         }
      }
      
      public function setActionPreview(param1:String, param2:Boolean) : *
      {
         var _loc3_:MovieClip = this.actionList.getElementByString("actionID",param1);
         if(_loc3_)
         {
            _loc3_.preview_mc.visible = param2;
            if(param2)
            {
               _loc3_.preview_mc.gotoAndPlay(1);
            }
            else
            {
               _loc3_.preview_mc.gotoAndStop(1);
            }
         }
      }
      
      public function updateCells() : *
      {
         var _loc1_:Number = this.actionList.length - this.defaultSlotCount;
         this.midH = Math.round(_loc1_ * this.midPieceHeight);
         this.midHolder_mc.visible = this.midH >= 0;
         if(this.midH < 0)
         {
            this.midH = 0;
         }
         if(this.midHolder_mc.visible)
         {
            this.midHolder_mc.scrollRect = new Rectangle(0,0,88,this.midH);
         }
      }
      
      public function positionElements() : *
      {
         this.actionList.positionElements();
         this.updateCells();
         this.midHolder_mc.y = this.topHeight;
         this.bottom_mc.y = this.topHeight + this.midH;
         this.y = this.originalPosY - (this.bottom_mc.y + this.bottom_mc.height) + this.root_mc.hotbar_mc.y;
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OUT,function():*
         {
            ExternalInterface.call("hideTooltip");
         });
         this.midH = 0;
         this.root_mc = root as MovieClip;
         this.actionList = new listDisplay();
         this.actionListHolder_mc.addChild(this.actionList);
         this.actionList.EL_SPACING = this.root_mc.iconSpacing;
         this.actionList.canPositionInvisibleElements = true;
      }
   }
}