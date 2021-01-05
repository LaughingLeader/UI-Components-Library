package
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class QuestEntry extends MovieClip
   {
       
      
      public var flag_mc:MovieClip;
      
      public var subQuestIcon_mc:MovieClip;
      
      public var title_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var list:MovieClip;
      
      public var infolist:listDisplay;
      
      public var priority:int;
      
      public var entryHeight:Number;
      
      public var subQuests:listDisplay;
      
      public var _postponed:Boolean;
      
      public function QuestEntry()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onInit() : *
      {
         this.infolist = new listDisplay();
         this.infolist.EL_SPACING = 0;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.base.openedQuest.questId != this.questId)
         {
            ExternalInterface.call("PlaySound","UI_Game_Journal_Click");
            this.title_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.base.toggleQuest(this,true);
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.title_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.title_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.base.setCursorPositionMC(null);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Journal_Over");
         this.base.setCursorPositionMC(this);
      }
      
      public function deselectElement(param1:*) : *
      {
         this.title_mc.hl_mc.visible = false;
      }
      
      public function selectElement(param1:*) : *
      {
         this.title_mc.hl_mc.visible = true;
      }
      
      public function set isPostponed(param1:Boolean) : *
      {
         this._postponed = param1;
         this.title_mc.alpha = !!this._postponed?Number(0.55):Number(1);
      }
      
      public function get isPostponed() : Boolean
      {
         return this._postponed;
      }
      
      public function refreshLocationIcon() : *
      {
         if(this.isCompleted)
         {
            this.flag_mc.visible = false;
         }
         else
         {
            this.flag_mc.visible = Boolean(this.getCurrentMarker() != "");
         }
      }
      
      public function getCurrentMarker() : String
      {
         var _loc1_:String = "";
         var _loc2_:MovieClip = this.infolist.getFirstElement();
         if(_loc2_)
         {
            if(_loc2_.markerList && _loc2_.markerList.length > 0)
            {
               _loc1_ = _loc2_.markerList[0];
            }
         }
         return _loc1_;
      }
      
      public function startAnim() : *
      {
      }
      
      public function INTUpd4PosEl() : *
      {
         if(this.subQuests && this.subQuests.length > 0)
         {
            this.subQuests.positionElements();
            this.heightOverride = Math.round((this.subQuests.y + this.subQuests.height) / this.entryHeight) * this.entryHeight;
         }
         else
         {
            this.heightOverride = Math.round(this.title_mc.name_txt.textHeight / this.entryHeight) * this.entryHeight;
         }
         this.title_mc.hl_mc.height = Math.ceil(this.title_mc.name_txt.textHeight / this.entryHeight) * this.entryHeight;
         if(this.grpMc)
         {
            this.grpMc.setHeightOverride();
         }
      }
      
      function frame1() : *
      {
         this.title_mc.hl_mc.visible = false;
         this.title_mc.hl_mc.mouseEnabled = false;
         this.title_mc.img_mc.mouseEnabled = false;
         this.title_mc.name_txt.mouseEnabled = false;
         this.title_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.title_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.title_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.base = (root as MovieClip).journal_mc;
         this.list = parent.parent.parent as MovieClip;
      }
   }
}
