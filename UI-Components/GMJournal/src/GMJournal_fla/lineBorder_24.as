package GMJournal_fla
{
   import LS_Classes.LSDottedLine;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public dynamic class lineBorder_24 extends MovieClip
   {
       
      
      public var top:LSDottedLine;
      
      public var left:LSDottedLine;
      
      public var bottom:LSDottedLine;
      
      public var right:LSDottedLine;
      
      public function lineBorder_24()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function Init(param1:Number, param2:Number) : *
      {
         var _loc3_:* = new MovieClip();
         this.top = new LSDottedLine(1,3,2,16777215);
         this.left = new LSDottedLine(1,3,2,16777215);
         this.bottom = new LSDottedLine(1,3,2,16777215);
         this.right = new LSDottedLine(1,3,2,16777215);
         _loc3_.addChild(this.top);
         _loc3_.addChild(this.left);
         _loc3_.addChild(this.bottom);
         _loc3_.addChild(this.right);
         this.setFrame(param1 - 2,param2 - 2);
         addChild(_loc3_);
      }
      
      public function setFrame(param1:Number, param2:Number) : *
      {
         var _loc3_:* = new Point(1,1);
         var _loc4_:* = new Point(1,param2);
         var _loc5_:* = new Point(param1,param2);
         var _loc6_:* = new Point(param1,1);
         this.top.setEndpoints(_loc3_,_loc6_);
         this.top.x = 1;
         this.top.y = 1;
         this.left.setEndpoints(_loc3_,_loc4_);
         this.left.x = 1;
         this.left.y = 1;
         this.bottom.setEndpoints(_loc4_,_loc5_);
         this.bottom.x = 1;
         this.bottom.y = param2 + 1;
         this.right.setEndpoints(_loc6_,_loc5_);
         this.right.x = param1;
         this.right.y = 1 + 1;
      }
      
      function frame1() : *
      {
      }
   }
}
