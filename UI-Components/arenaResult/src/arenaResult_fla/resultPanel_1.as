package arenaResult_fla
{
   import LS_Classes.controllerBtnHint;
   import LS_Classes.controllerHelper;
   import LS_Classes.scrollList;
   import LS_Classes.textHelpers;
   import fl.motion.easing.Quartic;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class resultPanel_1 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var header_mc:MovieClip;
      
      public var holder_mc:MovieClip;
      
      public var rematch_mc:MovieClip;
      
      public var rematch_txt_c_mc:TextField;
      
      public var scrollMask_mc:MovieClip;
      
      public var subTitle_txt:TextField;
      
      public var title_txt:TextField;
      
      public var toLobby_mc:MovieClip;
      
      public var toLobby_txt_c_mc:TextField;
      
      public var toMainMenu_mc:MovieClip;
      
      public var toMainMenu_txt_c_mc:TextField;
      
      public var list:scrollList;
      
      public var currentPlayerID:Number;
      
      public var _isController:Boolean;
      
      public var players:Array;
      
      public var playerArray:Array;
      
      public var selectedPlayer:int;
      
      public var toLobby_c_mc:MovieClip;
      
      public var rematch_c_mc:MovieClip;
      
      public var toMainMenu_c_mc:MovieClip;
      
      public var tw:IggyTween;
      
      public function resultPanel_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function set isController(param1:Boolean) : void
      {
         this._isController = param1;
         if(param1)
         {
            this.playerArray.sortOn(["teamId","id"],Array.NUMERIC);
            this.list.sortOn("id");
            this.refreshSelection();
         }
      }
      
      public function get isController() : Boolean
      {
         return this._isController;
      }
      
      public function init() : *
      {
         this.currentPlayerID = 0;
         this.list = new scrollList();
         this.list.EL_SPACING = -10;
         this.list.TOP_SPACING = 0;
         this.list.scrollbarSpacing = 0;
         this.list.m_scrollbar_mc.m_SCROLLSPEED = 50;
         this.list.mouseWheelWhenOverEnabled = true;
         this.holder_mc.addChild(this.list);
         this.list.setFrame(990,708);
         this.list.containerBG_mc.addChild(this.scrollMask_mc);
         this.scrollMask_mc.x = 0;
         this.scrollMask_mc.y = 0;
         this.playerArray = new Array();
         this.selectedPlayer = 0;
         this.toMainMenu_c_mc = new controllerBtnHint();
         this.rematch_c_mc = new controllerBtnHint();
         this.toLobby_c_mc = new controllerBtnHint();
         addChild(this.toMainMenu_c_mc);
         addChild(this.rematch_c_mc);
         addChild(this.toLobby_c_mc);
         this.toMainMenu_c_mc.setHintIcon(controllerHelper.BTN_B);
         this.rematch_c_mc.setHintIcon(controllerHelper.BTN_Y);
         this.toLobby_c_mc.setHintIcon(controllerHelper.BTN_A);
         var _loc1_:Number = 892;
         this.toLobby_c_mc.y = _loc1_;
         this.toLobby_c_mc.x = 548;
         this.rematch_c_mc.y = _loc1_;
         this.rematch_c_mc.x = 770;
         this.toMainMenu_c_mc.y = _loc1_;
         this.toMainMenu_c_mc.x = 288;
      }
      
      public function setPlayerID(param1:Number) : *
      {
         var _loc3_:MovieClip = null;
         var _loc4_:uint = 0;
         var _loc5_:MovieClip = null;
         this.currentPlayerID = param1;
         var _loc2_:uint = 0;
         while(_loc2_ < this.list.length)
         {
            _loc3_ = this.list.getAt(_loc2_);
            if(_loc3_)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.list.length)
               {
                  _loc5_ = _loc3_.list.getAt(_loc4_);
                  if(_loc5_)
                  {
                     _loc5_.frame_mc.gotoAndStop(_loc5_.id == param1?1:3);
                  }
                  _loc4_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function refreshPlayerButtons() : *
      {
         var _loc1_:MovieClip = null;
         for each(_loc1_ in this.players)
         {
            _loc1_.collapse_Btn.visible = !this.isController;
         }
      }
      
      public function addPlayer(param1:Number, param2:Number, param3:Number, param4:String, param5:Boolean) : *
      {
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc6_:MovieClip = this.list.getElementByNumber("id",param2);
         if(_loc6_)
         {
            _loc7_ = _loc6_.list.getElementByNumber("id",param1);
            if(_loc7_ == null)
            {
               _loc7_ = new playerMC();
               this.players.push(_loc7_);
               _loc7_.collapse_Btn.visible = !this.isController;
               _loc7_.id = param1;
               _loc7_.init(param2);
               _loc6_.list.addElement(_loc7_);
               this.list.positionElements();
               _loc7_.frame_mc.gotoAndStop(_loc7_.id == this.currentPlayerID?1:3);
               _loc8_ = root as MovieClip;
               _loc7_.less_text = _loc8_.string_array[2];
               _loc7_.more_text = _loc8_.string_array[1];
               _loc7_.kills_txt.htmlText = _loc8_.string_array[3];
               _loc7_.damage_txt.htmlText = _loc8_.string_array[4];
               _loc7_.healing_txt.htmlText = _loc8_.string_array[5];
            }
            _loc7_.team = _loc6_;
            _loc7_.teamId = param2;
            _loc7_.img_mc.name = "iggy_p" + param3;
            _loc7_.name_txt.htmlText = param4;
            textHelpers.smallCaps(_loc7_.name_txt,7,true);
            _loc7_.open = false;
            this.playerArray.push(_loc7_);
            _loc7_.selected = false;
            if(this.isController)
            {
               this.playerArray.sortOn(["teamId","id"],Array.NUMERIC);
               this.refreshSelection();
            }
            if(param5)
            {
               _loc6_.setWinner(true);
            }
         }
      }
      
      public function updateDone() : *
      {
         this.list.m_scrollbar_mc.scrollbarVisible();
      }
      
      public function addTeam(param1:Number, param2:Number) : *
      {
         var _loc4_:MovieClip = null;
         var _loc3_:MovieClip = this.list.getElementByNumber("id",param1);
         if(_loc3_ == null)
         {
            _loc4_ = root as MovieClip;
            _loc3_ = new teamMC();
            _loc3_.id = param1;
            _loc3_.parentList = this.list;
            _loc3_.init();
            _loc3_.scoreLabel_txt.htmlText = _loc4_.string_array[0];
            textHelpers.smallCaps(_loc3_.scoreLabel_txt,7,true);
            _loc3_.score_txt.htmlText = param2;
            _loc3_.setWinner(false);
            this.list.addElement(_loc3_);
         }
      }
      
      public function addHero(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : *
      {
         var _loc9_:MovieClip = null;
         var _loc8_:MovieClip = this.list.getElementByNumber("id",param1);
         if(_loc8_)
         {
            _loc9_ = _loc8_.list.getElementByNumber("id",param2);
            if(_loc9_)
            {
               _loc9_.addHero(param3,param4,param5,param6,param7);
            }
         }
      }
      
      public function showRematch() : *
      {
         this.rematch_mc.alpha = 0;
         this.rematch_mc.visible = true;
         this.rematch_c_mc.visible = true;
         this.rematch_txt_c_mc.visible = true;
         this.tw = new IggyTween(this.rematch_mc,"alpha",Quartic.easeIn,this.rematch_mc.alpha,1,0.1,true);
      }
      
      public function hideRematch() : *
      {
         if(this.tw)
         {
            this.tw.stop();
         }
         this.rematch_mc.alpha = 0;
         this.rematch_mc.visible = false;
         this.rematch_c_mc.visible = false;
         this.rematch_txt_c_mc.visible = false;
      }
      
      public function clearList() : *
      {
         this.list.clearElements();
         this.playerArray = new Array();
         this.selectedPlayer = 0;
      }
      
      public function refreshSelection() : void
      {
         var _loc2_:int = 0;
         var _loc3_:playerMC = null;
         if(!this.isController)
         {
            return;
         }
         var _loc1_:int = this.playerArray == null?0:int(this.playerArray.length);
         if(this.selectedPlayer >= 0 && this.selectedPlayer < _loc1_)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.playerArray[_loc2_] as playerMC;
               if(_loc3_)
               {
                  _loc3_.selected = this.isController && _loc2_ == this.selectedPlayer;
               }
               _loc2_++;
            }
         }
      }
      
      public function selectPrevPlayer() : void
      {
         if(!this.isController)
         {
            return;
         }
         if(this.selectedPlayer - 1 >= 0)
         {
            this.selectedPlayer--;
            this.refreshSelection();
            ExternalInterface.call("PlaySound","UI_Gen_CursorMove");
         }
      }
      
      public function selectNextPlayer() : void
      {
         if(!this.isController)
         {
            return;
         }
         var _loc1_:int = this.playerArray == null?0:int(this.playerArray.length);
         if(this.selectedPlayer + 1 < _loc1_)
         {
            this.selectedPlayer++;
            this.refreshSelection();
            ExternalInterface.call("PlaySound","UI_Gen_CursorMove");
         }
      }
      
      public function toggleInfo() : void
      {
         var _loc2_:playerMC = null;
         if(!this.isController)
         {
            return;
         }
         var _loc1_:int = this.playerArray == null?0:int(this.playerArray.length);
         if(this.selectedPlayer >= 0 && this.selectedPlayer < _loc1_)
         {
            _loc2_ = this.playerArray[this.selectedPlayer] as playerMC;
            if(_loc2_)
            {
               _loc2_.open = !_loc2_.open;
            }
            if(_loc2_.open)
            {
               ExternalInterface.call("PlaySound","UI_MainMenu_MenuDrop_Open");
            }
            else
            {
               ExternalInterface.call("PlaySound","UI_MainMenu_MenuDrop_Close");
            }
         }
      }
      
      function frame1() : *
      {
      }
   }
}
