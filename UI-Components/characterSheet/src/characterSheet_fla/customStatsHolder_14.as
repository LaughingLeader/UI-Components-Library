package characterSheet_fla
{
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class customStatsHolder_14 extends MovieClip
   {
       
      
      public var create_mc:btnCreateCustomStat;
      
      public var listHolder_mc:empty;
      
      public var list:scrollList;
      
      public const elemOffset:int = 3;
      
      public function customStatsHolder_14()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.list = new scrollList("down_id","up_id","handle_id","scrollBgBig_id");
         this.list.EL_SPACING = 0;
         this.list.setFrame(328,735);
         this.listHolder_mc.addChild(this.list);
         this.list.TOP_SPACING = 40;
         this.list.m_scrollbar_mc.m_hideWhenDisabled = false;
         this.list.m_scrollbar_mc.setLength(667);
         this.list.m_scrollbar_mc.x = -1;
         this.list.m_scrollbar_mc.y = -17;
         (parent as MovieClip).scrollbarHolder_mc.addChild(this.list.m_scrollbar_mc);
         this.create_mc.init(this.onCreateBtnClicked);
      }
      
      public function onCreateBtnClicked() : *
      {
         ExternalInterface.call("createCustomStat");
      }
      
      public function positionElements() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:Number = 0;
         while(_loc1_ < this.list.size)
         {
            _loc2_ = this.list.getAt(_loc1_);
            _loc2_.heightOverride = _loc2_.label_txt.textHeight;
            _loc2_.hl_mc.height = _loc2_.label_txt.textHeight - this.elemOffset * 2;
            _loc2_.line_mc.y = _loc2_.label_txt.textHeight - Math.round(_loc2_.line_mc.height * 0.5) - this.elemOffset;
            _loc1_++;
         }
         this.list.positionElements();
      }
      
      public function setGameMasterMode(param1:Boolean) : *
      {
         this.list.setFrame(328,!!param1?Number(this.create_mc.y):Number(735));
         this.create_mc.visible = param1;
      }
      
      function frame1() : *
      {
      }
   }
}
