package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class heroStats extends MovieClip
   {
       
      
      public var damage_star_mc:MovieClip;
      
      public var damage_txt:TextField;
      
      public var heal_star_mc:MovieClip;
      
      public var heals_txt:TextField;
      
      public var imgHolder_mc:MovieClip;
      
      public var kills_star_mc:MovieClip;
      
      public var kills_txt:TextField;
      
      public var img_mc:MovieClip;
      
      public var kills:Number;
      
      public var health:Number;
      
      public var damage:Number;
      
      public function heroStats()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.img_mc = new heroImg();
         this.imgHolder_mc.addChild(this.img_mc);
         this.kills_star_mc.visible = false;
         this.damage_star_mc.visible = false;
         this.heal_star_mc.visible = false;
         this.kills = 0;
         this.health = 0;
         this.damage = 0;
      }
      
      public function highlihgt(param1:Number, param2:Boolean) : *
      {
         switch(param1)
         {
            case 0:
               this.kills_star_mc.visible = param2;
               this.kills_txt.textColor = !!param2?uint(16777215):uint(10261643);
               break;
            case 1:
               this.damage_star_mc.visible = param2;
               this.damage_txt.textColor = !!param2?uint(16777215):uint(10261643);
               break;
            case 2:
               this.heal_star_mc.visible = param2;
               this.heals_txt.textColor = !!param2?uint(16777215):uint(10261643);
         }
      }
      
      function frame1() : *
      {
      }
   }
}
