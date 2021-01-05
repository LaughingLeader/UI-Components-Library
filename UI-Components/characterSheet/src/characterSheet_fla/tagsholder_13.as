package characterSheet_fla
{
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class tagsholder_13 extends MovieClip
   {
       
      
      public var bgGlow_mc:MovieClip;
      
      public var list:scrollList;
      
      public function tagsholder_13()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.list = new scrollList("down_id","up_id","handle_id","scrollBgBig_id");
         addChild(this.list);
         this.list.y = 5;
         this.list.EL_SPACING = 11;
         this.list.setFrame(328,735);
         this.list.TOP_SPACING = 40;
         this.list.setTileableBG = "scrollBGmc";
         this.list.containerBG_mc.addChild(this.bgGlow_mc);
         this.list.mouseWheelWhenOverEnabled = true;
         this.list.m_scrollbar_mc.setLength(663 + 42);
         this.list.m_scrollbar_mc.ScaleBG = true;
         var _loc1_:MovieClip = parent as MovieClip;
         _loc1_.scrollbarHolder_mc.addChild(this.list.m_scrollbar_mc);
         this.list.m_scrollbar_mc.x = -1;
         this.list.m_scrollbar_mc.y = -17;
         _loc1_.scrollbarHolder_mc.addEventListener(MouseEvent.ROLL_OVER,this.enableMouse);
         _loc1_.scrollbarHolder_mc.addEventListener(MouseEvent.ROLL_OUT,this.disableMouse);
      }
      
      public function enableMouse(param1:MouseEvent) : *
      {
         this.list.m_scrollbar_mc.mouseWheelEnabled = true;
      }
      
      public function disableMouse(param1:MouseEvent) : *
      {
         this.list.m_scrollbar_mc.mouseWheelEnabled = false;
      }
      
      function frame1() : *
      {
      }
   }
}
