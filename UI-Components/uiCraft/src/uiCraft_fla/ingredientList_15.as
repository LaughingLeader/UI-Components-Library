package uiCraft_fla
{
   import LS_Classes.horizontalList;
   import flash.display.MovieClip;
   
   public dynamic class ingredientList_15 extends MovieClip
   {
       
      
      public var container_mc:MovieClip;
      
      public var ingrList:horizontalList;
      
      public var isRecipePanel:Boolean;
      
      public const defaultCellAmountColour:uint = 16777215;
      
      public const depletedCellAmountColour:uint = 10354688;
      
      public function ingredientList_15()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init(param1:Boolean = false) : *
      {
         this.isRecipePanel = param1;
         this.ingrList = new horizontalList();
         if(param1)
         {
            this.ingrList.EL_SPACING = 7;
         }
         else
         {
            this.ingrList.EL_SPACING = 12;
         }
         this.container_mc.addChild(this.ingrList);
      }
      
      public function addIngredient() : *
      {
         var _loc1_:MovieClip = new CraftCell();
         _loc1_.objHandle = -1;
         _loc1_.amount = 0;
         _loc1_.objEmpty = true;
         _loc1_.objStation = false;
         _loc1_.id = this.ingrList.length;
         _loc1_.initExperiment(this.isRecipePanel);
         _loc1_.iconMC.name = "Iggy_Ingr" + _loc1_.id;
         _loc1_.iconMC.visible = false;
         this.ingrList.addElement(_loc1_);
      }
      
      public function showAlerts() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.ingrList.length)
         {
            _loc2_ = this.ingrList.getAt(_loc1_);
            if(_loc2_.objEmpty || _loc2_.amount == 0)
            {
               _loc2_.alert_mc.gotoAndPlay(1);
            }
            _loc1_++;
         }
      }
      
      public function setRecipeIngredient(param1:Number, param2:Number, param3:String, param4:Number, param5:Boolean) : *
      {
         var _loc6_:MovieClip = this.getSlot(param1);
         if(_loc6_)
         {
            _loc6_.objHandle = param2;
            if(param4 == 0)
            {
               _loc6_.amount_txt.textColor = this.depletedCellAmountColour;
            }
            else
            {
               _loc6_.amount_txt.textColor = this.defaultCellAmountColour;
            }
            _loc6_.amount = param4;
            _loc6_.objEmpty = param5;
            _loc6_.iconMC.visible = true;
            if(!param5)
            {
               _loc6_.objName = param3;
            }
            else
            {
               _loc6_.objName = "";
            }
         }
      }
      
      public function setIngredient(param1:Number, param2:Number, param3:String, param4:Number, param5:Boolean, param6:Boolean) : *
      {
         var _loc7_:Boolean = false;
         var _loc8_:MovieClip = this.getSlot(param1);
         if(_loc8_)
         {
            if(_loc8_.objHandle != param2)
            {
               _loc7_ = true;
            }
            _loc8_.objHandle = param2;
            _loc8_.amount = param4;
            if(param5 && !_loc8_.objEmpty)
            {
               _loc7_ = true;
            }
            _loc8_.objEmpty = param5;
            _loc8_.iconMC.visible = !param5;
            _loc8_.objStation = param6;
         }
         return _loc7_;
      }
      
      public function getSlot(param1:Number) : MovieClip
      {
         var _loc2_:MovieClip = this.ingrList.getAt(param1);
         return _loc2_;
      }
      
      public function getCount() : Number
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Number = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.ingrList.length)
         {
            _loc3_ = this.ingrList.getAt(_loc2_);
            if(!_loc3_.objEmpty && _loc3_.amount > 0)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function setMax(param1:Number) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:MovieClip = null;
         if(param1 != this.ingrList.length)
         {
            this.ingrList.clearElements();
            _loc2_ = 0;
            while(_loc2_ < param1)
            {
               this.addIngredient();
               _loc2_++;
            }
         }
         if(!this.isRecipePanel)
         {
            this.container_mc.x = -Math.round(this.container_mc.width * 0.5);
         }
         else
         {
            _loc3_ = parent as MovieClip;
            if(_loc3_ && _loc3_.updateDecoration != null)
            {
               _loc3_.updateDecoration();
            }
         }
      }
      
      function frame1() : *
      {
         this.ingrList = null;
      }
   }
}
