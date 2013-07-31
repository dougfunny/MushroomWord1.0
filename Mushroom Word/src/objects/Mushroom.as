package objects
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class Mushroom   extends Sprite
	{
		public var blueMushroom:MovieClip;
		public var redMushroom:MovieClip;
	
		private var menuFly:MovieClip;
		private var purpleMushroom:MovieClip;
		public function Mushroom()
		{
			
			blueMushroom = new MovieClip(Assests.getAtlasBlue().getTextures("blue"), 20);
			blueMushroom.x = 640;
			blueMushroom.y = 480;
			Starling.juggler.add(blueMushroom);
			this.addChild(blueMushroom);
		 	purpleMushroom = new MovieClip(Assests.getAtlasPurple().getTextures("purple"), 20);
			purpleMushroom.x = 720;
			purpleMushroom.y = 140;
			Starling.juggler.add(purpleMushroom);
			this.addChild(purpleMushroom);
		
			trace("Mushroom class");
			
			
		
			
			
		} 
		
	}
}