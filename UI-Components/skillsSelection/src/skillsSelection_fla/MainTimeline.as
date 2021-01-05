package skillsSelection_fla
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var skills_mc:MovieClip;
      
      public const skillIconSize:uint = 50;
      
      public const listSpacing:uint = 29;
      
      public const iconSpacingH:uint = 10;
      
      public const iconSpacingV:uint = 10;
      
      public const numberOfCols:uint = 4;
      
      public const chosenListSpacing:uint = 24;
      
      public const numberOfSlots:uint = 3;
      
      public var events:Array;
      
      public var layout:String;
      
      public var isDragging:Boolean;
      
      public var characterHandle:Number;
      
      public var chosenSkillsList:Array;
      
      public var skillsUpdateList:Array;
      
      public var skillsCoolDownList:Array;
      
      public var skillSchoolString:Array;
      
      public var inUseStr:String;
      
      public var noSkills:String;
      
      public var topTitle:String;
      
      public var bottomTitle:String;
      
      public var hasTooltip:Boolean;
      
      public var curTooltip:Number;
      
      public var labels_array:Array;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UICancel":
               ExternalInterface.call("hideTooltip");
               ExternalInterface.call("hideUI");
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onEventDown(param1:Number) : *
      {
         return false;
      }
      
      public function onEventTerminate() : *
      {
         if(this.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
         }
         ExternalInterface.call("closeUI");
      }
      
      public function onEventInit() : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Skills_Open");
         ExternalInterface.call("setPosition","top","screen","top");
         this.skills_mc.onInit();
      }
      
      public function setLabels(param1:Number, param2:String) : *
      {
         if(param1 >= 0 && param1 < this.labels_array.length)
         {
            this.labels_array[param1] = param2;
         }
      }
      
      public function setBtnText(param1:Number, param2:String) : *
      {
         switch(param1)
         {
            case 0:
               this.skills_mc.close_mc.text_txt.htmlText = param2.toUpperCase();
               break;
            case 1:
               this.skills_mc.accept_mc.text_txt.htmlText = param2.toUpperCase();
         }
      }
      
      public function setInUseString(param1:String) : *
      {
         this.inUseStr = param1;
      }
      
      public function clearSkills() : *
      {
         this.skills_mc.clearSkills();
      }
      
      public function selectTab(param1:Number) : *
      {
         this.skills_mc.filterList(param1);
      }
      
      public function updateSkills() : *
      {
         this.skills_mc.updateSkills();
      }
      
      public function updateChosenSkills() : *
      {
         this.skills_mc.updateChosenSkills();
      }
      
      public function clearChosenSkills() : *
      {
         this.skills_mc.clearOldChosenSkills();
      }
      
      public function updateCooldowns() : *
      {
         this.skills_mc.updateCooldowns();
      }
      
      public function addTab(param1:Number, param2:String, param3:Number = 0) : *
      {
         this.skills_mc.addTab(param1,param2,param3);
      }
      
      public function setTabMaxAmount(param1:Number, param2:Number) : *
      {
         this.skills_mc.setTabMaxAmount(param1,param2);
      }
      
      public function useUnlearnButtons(param1:Boolean) : *
      {
         this.skills_mc.useUnlearnButtons(param1);
      }
      
      public function setCurrentAP(param1:Number) : *
      {
         this.skills_mc.setCurrentAP(param1);
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UICancel");
         this.layout = "fixed";
         this.isDragging = false;
         this.chosenSkillsList = new Array();
         this.skillsUpdateList = new Array();
         this.skillsCoolDownList = new Array();
         this.skillSchoolString = new Array();
         this.inUseStr = "";
         this.hasTooltip = false;
         this.curTooltip = -1;
         this.labels_array = new Array("AP","Select","Remove");
      }
   }
}
