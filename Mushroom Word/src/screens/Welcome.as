package screens
{
	//import com.greensock.TweenLite;
	
	import flash.media.SoundMixer;
	
	import events.NavigationEvent;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
 
    import objects.Mushroom;
	
	public class Welcome extends Sprite
	{
		
		private var bg:Image;
		private var welcomeImage:Image;
		private var  screenInGame:InGame;
		private var splash:Image;
		private var startSplash:Image;
		private var startButton:Button;
		private var blueButton:Image;
		private var blueMushroom:MovieClip;
		public var loadMushrooms:Mushroom;
		private var loadingImage:Image;
		
		
		public function Welcome()
		{
		
			
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			//
		}
		
		private function onAddedToStage(event:Event):void
		{	
			
			drawScreen();
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function drawScreen():void
		{	//if (!Sounds.muted) Sounds. sndLevelMainTheme.play(0, 999);
			 
			welcomeImage = new Image(Assests.getAtlas().getTexture("welcome"));
			this.addChild(welcomeImage);
			
			blueButton = new Image(Assests.getAtlas().getTexture("startButton_blue"));
			this.addChild(blueButton);
			
			startButton = new Button(Assests.getAtlas().getTexture("startButton"));
			this.addChild(startButton);
			
			
			blueButton.x = 250;
			blueButton.y = 350;
			startButton.x = 257;
			startButton.y = 360;
			
			
			this.addEventListener(Event.TRIGGERED , onMenuClick);
			
		}
		
	 
		
		private function onMenuClick(event:Event):void
		{
			 
			
			
			loadingImage = new Image(Assests.getAtlas().getTexture("loading"));
			loadingImage.visible = true;
			loadingImage.x = 300;
			loadingImage.y = 300;
			loadingImage.addEventListener(Event.ENTER_FRAME,MushroomLoader);
			
			this.addChild(loadingImage);
			
			
		}
		
		private function MushroomLoader(event:Event):void
		{
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			var  buttonClicked:Button  = event.target as Button;
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"logo"} ,true))
			loadingImage.removeEventListener(Event.ENTER_FRAME,MushroomLoader);
			 
			
			   loadMushrooms = new Mushroom();
				this.addChild(loadMushrooms);
				
			
				
			 
			
		}
		
		public function intialize():void
		{
			this.visible = true;
			
			
		}
		
		
		public function DisposeTemp():void
		{
			this.visible = false;
			
		}
	}
	
	
}