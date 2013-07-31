package objects
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public final class Health extends Sprite
	{
		private static var health:Image;
		private static var increase:int;
		public static var _Xsize:Number;
		public function Health(  )
		{
		
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		
		private function onAddedToStage():void
		{
			
			health = new Image(Assests.getAtlas().getTexture("health"));
			health.x = _Xsize + increase;
			trace("Health.x SET()");
			health.y = 607;
			health.visible = true;
			this.addChild(health);
			increase+=8;
			trace(increase);
		}
		
	
		public static function setSize(xSize:int,increaseSize:int):void
		{
			
			_Xsize = xSize;	
			increase = increaseSize;
			
		}
		
		public static function disposeTemp():void
		{
			health.visible = false;
			
		}
	}
}