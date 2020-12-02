package
{
   import LS_Classes.controllerBtnHint;
   import LS_Classes.controllerHelper;
   import LS_Classes.horizontalList;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public dynamic class playerMC extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var collapseLabel_txt:TextField;
      
      public var collapse_Btn:MovieClip;
      
      public var damage_txt:TextField;
      
      public var frame_mc:MovieClip;
      
      public var heal_line_bg:MovieClip;
      
      public var healing_txt:TextField;
      
      public var heroStatHolder_mc:MovieClip;
      
      public var imgHolder_mc:MovieClip;
      
      public var kills_line_bg:MovieClip;
      
      public var kills_txt:TextField;
      
      public var name_txt:TextField;
      
      public var stats_bg:MovieClip;
      
      public var list:horizontalList;
      
      public var img_mc:MovieClip;
      
      public var team:MovieClip;
      
      public var controllerCollapse_Btn:MovieClip;
      
      public var less_text:String;
      
      public var more_text:String;
      
      public var _open:Boolean;
      
      public var topKillsHero:MovieClip;
      
      public var topDamageHero:MovieClip;
      
      public var topHealHero:MovieClip;
      
      public function playerMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init(param1:Number) : *
      {
         this.list = new horizontalList();
         this.heroStatHolder_mc.addChild(this.list);
         this.img_mc = new playerImg();
         this.imgHolder_mc.addChild(this.img_mc);
         this.collapse_Btn.setDisabled(false);
         this.collapse_Btn.pressedFunc = this.onUp;
         this.bg_mc.gotoAndStop(param1 + 1);
         this.stats_bg.gotoAndStop(param1 + 1);
         this.controllerCollapse_Btn = new controllerBtnHint();
         addChild(this.controllerCollapse_Btn);
         this.controllerCollapse_Btn.setHintIcon(controllerHelper.BTN_Y);
         this.controllerCollapse_Btn.x = 717;
         this.controllerCollapse_Btn.y = 13;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         this.open = !this.open;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function set open(param1:Boolean) : *
      {
         this._open = param1;
         this.heroStatHolder_mc.visible = param1;
         this.stats_bg.visible = param1;
         this.kills_txt.visible = param1;
         this.kills_line_bg.visible = param1;
         this.damage_txt.visible = param1;
         this.healing_txt.visible = param1;
         this.heal_line_bg.visible = param1;
         this.updateBG();
         this.collapse_Btn.text_mc.text_txt.htmlText = !!this._open?this.less_text:this.more_text;
         this.collapseLabel_txt.htmlText = !!this.open?this.less_text:this.more_text;
         if(this.team)
         {
            this.team.updateBG();
         }
      }
      
      public function addHero(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : *
      {
         var _loc6_:MovieClip = this.list.getElementByNumber("id",param1);
         if(_loc6_ == null)
         {
            _loc6_ = new heroStats();
            _loc6_.init();
            _loc6_.id = param1;
            this.list.addElement(_loc6_);
         }
         _loc6_.img_mc.name = "iggy_h" + param2;
         _loc6_.img_mc.scrollRect = new Rectangle(0,30,80,36);
         _loc6_.kills_txt.htmlText = param3;
         _loc6_.kills = param3;
         _loc6_.heals_txt.htmlText = param4;
         _loc6_.heals = param4;
         _loc6_.damage_txt.htmlText = param5;
         _loc6_.damage = param5;
         if(this.team != null && this.team._isWinner)
         {
            if(this.topKillsHero == null)
            {
               this.topKillsHero = _loc6_;
            }
            if(_loc6_.kills > 0 && _loc6_.kills >= this.topKillsHero.kills)
            {
               this.topKillsHero.highlihgt(0,false);
               _loc6_.highlihgt(0,true);
               this.topKillsHero = _loc6_;
            }
            if(this.topHealHero == null)
            {
               this.topHealHero = _loc6_;
            }
            if(_loc6_.heals > 0 && _loc6_.heals >= this.topHealHero.heals)
            {
               this.topHealHero.highlihgt(2,false);
               _loc6_.highlihgt(2,true);
               this.topHealHero = _loc6_;
            }
            if(this.topDamageHero == null)
            {
               this.topDamageHero = _loc6_;
            }
            if(_loc6_.damage > 0 && _loc6_.damage >= this.topDamageHero.damage)
            {
               this.topDamageHero.highlihgt(1,false);
               _loc6_.highlihgt(1,true);
               this.topDamageHero = _loc6_;
            }
         }
      }
      
      public function clear() : *
      {
         this.list.clearElements();
      }
      
      public function updateBG() : *
      {
         this.heightOverride = 10 + (!!this.stats_bg.visible?this.stats_bg.height:this.bg_mc.height);
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.controllerCollapse_Btn.visible = param1;
         this.collapseLabel_txt.visible = param1;
         if(param1)
         {
            this.collapseLabel_txt.htmlText = !!this.open?this.less_text:this.more_text;
         }
      }
      
      function frame1() : *
      {
      }
   }
}
