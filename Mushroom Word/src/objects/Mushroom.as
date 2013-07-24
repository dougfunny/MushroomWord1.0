package objects
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class Mushroom   extends Sprite
	{
		public var blueMushroom:MovieClip;
		public var purpleMushroom:MovieClip;
		private var redMushroom:MovieClip;
		private var greenMushroom:MovieClip;
		private var menuFly:MovieClip;
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
			
			redMushroom = new MovieClip(Assests.getAtlasRed().getTextures("red"), 20);
			redMushroom.x = -25;
			redMushroom.y = 100;
			Starling.juggler.add(redMushroom);
			this.addChild(redMushroom);
			greenMushroom = new MovieClip(Assests.getAtlasGreen().getTextures("green"), 20);
			greenMushroom.x = 700;
			greenMushroom.y = 550;
			Starling.juggler.add(greenMushroom);
			this.addChild(greenMushroom);
		
			
			
		} 
		
	}
}