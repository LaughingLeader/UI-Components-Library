package characterSheet_fla
{
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   
   public dynamic class visualsHolder_18 extends MovieClip
   {
       
      
      public var listHolder_mc:empty;
      
      public var list:scrollList;
      
      public function visualsHolder_18()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.list = new scrollList("down_id","up_id","handle_id","scrollBgBig_id");
         this.list.EL_SPACING = -5;
         this.list.setFrame(328,735);
         this.listHolder_mc.addChild(this.list);
         this.list.TOP_SPACING = 40;
         this.list.setTileableBG = "scrollBGmc";
         this.list.m_scrollbar_mc.m_hideWhenDisabled = false;
         this.list.m_scrollbar_mc.setLength(663 + 42);
         this.list.m_scrollbar_mc.ScaleBG = true;
         this.list.m_scrollbar_mc.x = -1;
         this.list.m_scrollbar_mc.y = -13 - 4;
         (parent as MovieClip).scrollbarHolder_mc.addChild(this.list.m_scrollbar_mc);
      }
      
      function frame1() : *
      {
      }
   }
}
