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
    import flash.net.navigateToURL;
    import objects.Mushroom;
	import objects.GameFont;
	
	import flash.media.SoundMixer;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	 
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

    import flash.net.URLRequest;
	
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
		private var fbFindUs:Button;
		private var aboutBtn:Button;
 
		private var fontRegular:GameFont;
		private var aboutText:TextField;
		private var screenMode:String;
		private var aboutBtnBlue:Image;
		private var aboutBox:Image;
		
		
		public function Welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			//
		}
		
		private function onAddedToStage(event:Event):void
		{	
			if (!Sounds.muted) Sounds. sndLevelMainTheme.play();
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
			
			fbFindUs = new Button(Assests.getAtlas().getTexture("fundUsFB"));
			fbFindUs.x = 720;
			fbFindUs.y = 395;
			this.addChild(fbFindUs);
			
			fbFindUs.addEventListener(Event.TRIGGERED, fbFindUsClick);
			  
			blueButton.x = 250;
			blueButton.y = 350;
			startButton.x = 257;
			startButton.y = 360;
			
			startButton.addEventListener(Event.TRIGGERED , onMenuClick);
			
			aboutBtnBlue = new Image(Assests.getAtlas().getTexture("aboutButtonBlue"));
			aboutBtnBlue.x = 620;
			aboutBtnBlue.y = 290;
			this.addChild(aboutBtnBlue);
			
			aboutBtn = new Button(Assests.getAtlas().getTexture("aboutButton"));
			aboutBtn.x = 628;
			aboutBtn.y = 293;
			aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
			this.addChild(aboutBtn);
			
			// ABOUT ELEMENTS
			fontRegular  = Fonts.getFont("ScoreValue");
			
			aboutBox = new Image(Assests.getAtlas().getTexture("aboutBox"));
			aboutBox.x = 460;
			aboutBox.y = 480;
			aboutBox.visible = false;
			this.addChild(aboutBox);
			
			aboutText = new TextField(480, 600, "", fontRegular.fontName, 30, 0xffffff);
			aboutText.text = "HELP THE MUSHROOMS TO LIVE BY SPELLING WORDS CORRECTLY"
			aboutText.x = 460;
			aboutText.y = 480;
			 
			aboutText.visible = false
			aboutText.height = aboutText.textBounds.height + 30;
			this.addChild(aboutText);
			 
			
		}	
		
		
		private function onAboutClick(event:Event):void
		{
			if (!Sounds.muted) Sounds.sndLevelSelect.play();
			showAbout();
		}
		
		public function showAbout():void
		{
			 
		 if(aboutText.visible==false ){
			aboutText.visible = true;aboutBox.visible = true;}
		 else {aboutText.visible = false;aboutBox.visible=false;}
		 
		}

		private function fbFindUsClick(event:Event):void
		{
			navigateToURL(new URLRequest("http://www.Facebook.com/"), "_blank");
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