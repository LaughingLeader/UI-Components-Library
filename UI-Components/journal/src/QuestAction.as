package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class QuestAction extends MovieClip
   {
       
      
      public var icon_mc:MovieClip;
      
      public var mysteryIcon_mc:MovieClip;
      
      public var name_txt:TextField;
      
      public var objective_txt:TextField;
      
      public var isSeen:Boolean;
      
      public const qNewCol:uint = 25665;
      
      public function QuestAction()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function startAnim() : *
      {
      }
      
      public function set isNew(param1:Boolean) : void
      {
         this.objective_txt.textColor = !!param1?uint(this.qNewCol):uint(0);
         this.name_txt.textColor = !!param1?uint(this.qNewCol):uint(0);
         this.isSeen = !param1;
      }
      
      public function get isNew() : Boolean
      {
         return !this.isSeen;
      }
      
      public function setObjectiveStr(param1:String, param2:Boolean = true) : *
      {
         if(param2)
         {
            this.objectiveStr = param1;
         }
         this.objective_txt.htmlText = param1;
         if(param1 == "")
         {
            this.icon_mc.visible = false;
            this.name_txt.y = this.objective_txt.y;
         }
         else
         {
            this.icon_mc.visible = true;
            this.name_txt.y = this.fixOffset(this.objective_txt.y + this.objective_txt.textHeight,this.cLineHeight);
         }
      }
      
      public function fixOffset(param1:Number, param2:Number) : Number
      {
         return Math.ceil(param1 / param2) * param2;
      }
      
      function frame1() : *
      {
         this.name_txt.autoSize = TextFieldAutoSize.LEFT;
         this.isSeen = false;
      }
   }
}
