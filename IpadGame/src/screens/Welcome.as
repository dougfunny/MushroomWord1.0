package screens
{
	//import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	import flash.media.SoundMixer;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
  
	
	public class Welcome extends Sprite
	{
		
		private var bg:Image;
		private var welcomeImage:Image;
 
		private var splash:Image;
		private var startSplash:Image;
		private var startButton:Button;
		private var blueButton:Image;
		
		
		public function Welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			//
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Welcome screen Intialized!");
			drawScreen();
			
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
		
		public function DisposeTemp():void
		{
			this.visible = false;
			
		}
		
		private function onMenuClick(event:Event):void
		{
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			var  buttonClicked:Button  = event.target as Button;
			if((buttonClicked as Button) ==  startButton)
			{   
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"logo"} ,true))
			}
		}
		
		public function intialize():void
		{
			this.visible = true;
			
			
		}
		
		
	}
	
	
}