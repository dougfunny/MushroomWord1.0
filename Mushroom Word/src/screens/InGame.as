package screens
{ 
 
 
	import flash.events.TimerEvent;
	import flash.media.SoundMixer;
	import flash.utils.Timer;
	import objects.GameFont;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	import events.NavigationEvent;
	
	import objects.GameFont;
	import objects.GameWord;
	 
	import objects.Letters;
	
	import screens.Welcome;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.text.TextField;
	import starling.textures.Texture;
	 
	
	public class InGame extends Sprite
	{   private var unHide:Array = new Array();
		private var age:int = 0;
	    private var screenWelcome:Welcome;
 
		private var  WinterLevel:Number;
	 
		private var x:int = 0;
 
		private var loadScreen:MovieClip;
 
		private static var levelOne:Button;
		private var levelTwo:Button;
		private var levelThree:Button;
		private var levelFour:Button;
	 
		private var Submit:Button;
		private var BackSpace:Button;
		private var words:Button;
		private var words2:Button;
		private var words3:Button;
		private var words4:Button;
		private var words5:Button;
		private var words6:Button;
		private var words7:Button;
		private var words8:Button;
		private var words9:Button;
		private var words10:Button;
		private var words11:Button;
		 
		private var fallSpeed:Number;
		private var LevelBG:Image;
		private var LevelBGThree:Image;
		private var LevelBGFour:Image;
		private var paused:Image;
		private var str:String="";
		private var str2:String="";
		private var str3:String="";
		private var str4:String = ""; 
		private var str5:String = "";
		private var str6:String = "";
		private var str7:String = "";
		private var str8:String = "";
		private var str9:String = "";
		private var str10:String = "";
		private var str11:String = "";
		private var str12:String = "";
		private var bg:Image;
		private var LetterBox:Letters;
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elasped:Number;
		private var gameState:int;
		private var playerSpeed:Number;
		private var speed:Number;
	 
 
		private var levelBoolOne:Boolean =false;
		private var levelBoolTwo:Boolean =false;
		private var levelBoolThree:Boolean =false;
		private var levelBoolFour:Boolean =false;
		private var wordBool:Boolean =false;
		private var word2Bool:Boolean=false;
		private var word3Bool:Boolean=false;
		private var word4Bool:Boolean=false;
		private var word5Bool:Boolean=false;
		private var word6Bool:Boolean=false;
		private var word7Bool:Boolean =false;
		private var word8Bool:Boolean=false;
		private var word9Bool:Boolean=false;
		private var word10Bool:Boolean=false;
		private var word11Bool:Boolean=false;
		private var word12Bool:Boolean=false;
		private var wordNum:Array = new Array;
		private var MoreLetters:Array = new Array;
		private var LetterRate:int;
		private var tree:node;
		
		private var slangContent:String
		private var slangSplit:String;
		private var bgImg:Image;
		private var LetterObstacle:Image;
		private var HundredPoints:Image;
		private var twoHundredPoints:Image;
		private var fiveHundredPoints:Image;
		private var sevenFiftyPoints:Image;
		private var slangArray:Array = new Array();
		private var slangArrayTwo:Array = new Array();
		private var slangArrayThree:Array = new Array();
		private var slangArrayFour:Array = new Array();
		private var slangContentTwo:String
		private var slangSplitTwo:String;
		private var slangContentThree:String
		private var slangSplitThree:String;
		private var slangContentFour:String
		private var slangSplitFour:String;
		private var randSpot:Number;
		private var points:int =0;
		private var currentX:int;
		private var gamePaused:Boolean;
		private var pauseButton:Button;
		
		private var GameTime:Number;
		private var PointTime:Number;
		private var RoundTime:Number = 25;
		private var minuteTimer:Timer;
		private var PointTimer:Timer;
		private var words_Delete:Button;
		private var deleteLetter:Boolean;
		private var hide:Number;
		private var soundButton:SoundButton;
		private var gameOverContainer:GameOverContainer;
 
		private var board:Image;
		private var gameEnd:Boolean;
	 
		private var achievments:Image;
		private var particleSplash:PDParticleSystem;
 
		private var menuFly:MovieClip;
		private var showMenuBool:Boolean= false;
		private var backMenu:Image;
	    private var test:GameWord;
		private var continueButton:Button;
		private var SplashTime:int;
		private var SplashTimer:Timer;
		private var blueMushroom:MovieClip;
		private var redMushroom:MovieClip;
		private var greenMushroom:MovieClip;
		private var purpleMushroom:MovieClip;
		private var levelRoomSelect:Image;
	 
		 
		private var _answerString:String;
		private var _ScoreString:String;
		private var _TimeString:String;
		private var _TimeStringAmount:String;
		private var _PointString:String;
		
		private var answerStringLabel:TextField;
		private var answerStringText:TextField;		
		private var ScoreStringText:TextField;
		private var TimeStringText:TextField;
		private var PointStringText:TextField;
		
		private var AnswerValue:objects.GameFont;		
		private var Score:objects.GameFont;
		private var Time:objects.GameFont;
		private var TimeAmount:objects.GameFont;
		private var Point:objects.GameFont;
		
		
		private var ScoreText:TextField;
		private var TimeText:TextField;
		private var TimeTextAmount:TextField;
		private var PointText:TextField;
		private var welcomeImage:Image;
		private var loadingImage:Image;
		private var loading:Boolean;
		private var stopLoading:Boolean;
		public function InGame()
			
		{	
			
			test = new GameWord();
			stopLoading = false;
    		slangArrayFour = test.getNextWord(4);
			trace("slangArrayFour!!= test.getNextWord(4);");
		     slangArrayThree= test.getNextWord(3);
			trace("slangArrayThree!!= test.getNextWord(3);");
			 
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
	 
	 
		
		private function onSoundButtonClick(event:Event = null):void

			
		{
			if (Sounds.muted)
			{
				Sounds.muted = false;
				//if (levelBoolOne==true) Sounds.sndLevelOneMusic.play(0, 999);
				//if (levelBoolTwo==true) Sounds.sndLevelMusic.play(0, 999);
				
				soundButton.showUnmuteState();
			}
			else
			{
				Sounds.muted = true;
				SoundMixer.stopAll();
				soundButton.showMuteState();
			}
			
			
		}
		
		
		
		
		
		
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
		 slangArray = test.getNextWord(1);
		 trace("slangArray= test.getNextWord(1);");
		 slangArrayTwo =  test.getNextWord(2);
		 trace("slangArrayTwo= test.getNextWord(2);");

			SoundMixer.stopAll();
			
			drawGame();
			initialize();
			   
			
			this.addEventListener(Event.COMPLETE,
				createWords);
		} 
		
 
	 
		private function drawGame():void
		{   
			
		
			GameTime = 5;
			hide=-1;
			gameState =1;
			speed = 50;//how fast the letters fall
		 	
			 
			
			
			levelRoomSelect = new  Image(Assests.getAtlas().getTexture("levelSelectWallpaper"));
			
			this.addChild(levelRoomSelect);
			
			
			levelOne = new  Button(Assests.getAtlas().getTexture("levelButtonOrange"));
			levelOne.x = 410  ;
			levelOne.y = 175;
			
			this.addChild(levelOne);
				
			levelTwo = new  Button(Assests.getAtlas().getTexture("levelButtonOrange"));
			levelTwo.x = 410 ;
			levelTwo.y =230;
		 
			this.addChild(levelTwo);
			
			levelThree = new  Button(Assests.getAtlas().getTexture("levelButtonOrange"));
			levelThree.x = 410 ;
			levelThree.y = 300;
			
		 	this.addChild(levelThree);
			
			levelFour = new  Button(Assests.getAtlas().getTexture("levelButtonOrange"));
			levelFour.x = 410 ;
			levelFour.y = 350;
		 
			this.addChild(levelFour);
  
			
		
			
			// Time label
			continueButton = new  Button(Assests.getAtlas().getTexture("continueButton"));
			continueButton.x =300;
			continueButton.y =400;
			continueButton.visible = false;
		 
		 
			levelOne.addEventListener(Event.TRIGGERED, onlevelOneClick);
			levelThree.addEventListener(Event.TRIGGERED, onlevelThreeClick);
			levelTwo.addEventListener(Event.TRIGGERED, onlevelTwoClick);
			levelFour.addEventListener(Event.TRIGGERED, onlevelFourClick);
			loadingImage = new Image(Assests.getAtlas().getTexture("loading"));
			loadingImage.visible = true;
			loadingImage.x = 300;
			loadingImage.y = 300;
			loadingImage.addEventListener(Event.ENTER_FRAME,levelLoader);
		}
		
		private function onContinueButtonClick():void
		{	/*board.visible = false;
			menuFly.visible = false;
			blueMushroom,visible = false;
			redMushroom.visible = false;
			continueButton.visible = false;
			this.removeChild(bgQuad);
			SoundMixer.stopAll()*/
			gameOver();
			if (!Sounds.muted) Sounds. sndLevelSelect.play(); 
			loadingImage.addEventListener(Event.ENTER_FRAME,levelLoader);
			levelOne.addEventListener(Event.TRIGGERED, onlevelOneClick);
			levelThree.addEventListener(Event.TRIGGERED, onlevelThreeClick);
			levelTwo.addEventListener(Event.TRIGGERED, onlevelTwoClick);
			levelFour.addEventListener(Event.TRIGGERED, onlevelFourClick);
			initialize();
			drawGame();
		 
			
		}
		
		private function menuButtonClick():void
		{	this.removeChild(words);
			this.removeChild(words2);
			this.removeChild(words3);
			this.removeChild(words4);
			this.removeChild(words5);
			this.removeChild(words6);
			this.removeChild(words7);
			this.removeChild(words8);
			this.removeChild(words9);
			this.removeChild(words10);
			this.removeChild(words11);
			
			
			
			
			minuteTimer.stop();
			gameState = 3;
			
		}		
		
		private function onBackSpaceButtonClick():void
		{
			// trace(unHide.length-1);
			
			
 
			
			
			if(unHide[unHide.length-1]==11){
				trace(unHide[unHide.length-1]);
				trace("words11");
				words11.visible = true;}
			
			
			
			if(unHide[unHide.length-1]==10){
				trace(unHide[unHide.length-1]);
				trace("words10");
				words10.visible = true;}
			
			
			
			if(unHide[unHide.length-1]==9){
				trace(unHide[unHide.length-1]);
				trace("words9");
				words9.visible = true;}
			
			
			if(unHide[unHide.length-1]==8){
				trace(unHide[unHide.length-1]);
				trace("words8");
				words8.visible = true;}
			 
			
			
			if(unHide[unHide.length-1]==7){
				trace(unHide[unHide.length-1]);
				trace("words7");
				words7.visible = true;}
	
			
			if(unHide[unHide.length-1]==6){
				trace(unHide[unHide.length-1]);
				trace("words6");
				words6.visible = true;}
			
			if(unHide[unHide.length-1]==5){
				trace(unHide[unHide.length-1]);
				trace("words5");
				words5.visible = true;}
			
			if(unHide[unHide.length-1]==4){
				trace(unHide[unHide.length-1]);
				trace("words4");
				words4.visible = true;}
			
			if(unHide[unHide.length-1]==3){
				trace(unHide[unHide.length-1]);
				trace("words3");
				words3.visible = true;}
			
			if(unHide[unHide.length-1]==2){
				trace(unHide[unHide.length-1]);
				trace("words2");
				words2.visible = true;}
			
			if(unHide[unHide.length-1]==1){
				trace(unHide[unHide.length-1]);
				trace("words");
				words.visible = true;}
			
			
			unHide = unHide.slice(0,-1);
			
			
			str4 = 	str4.slice( 0, -1 );
			//trace(str4);
			
			answerStringText.text = answerStringText.text.slice(0,-1);
			
		}
		
		private function onSubmitButtonClick():void
		{
			//  points +=checkWord(str4);
			trace(str4);
			if(checkWord(str4)==100){
				points +=checkWord(str4)
				HundredPoints.visible = true;
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.start(); 
				PointSplashTime();
				var test:String = points.toString();
				PointText.text  = test;
			}
			
			if(checkWord(str4)==200){
				points +=checkWord(str4)
				twoHundredPoints.visible = true; 	
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.start(); ;
				PointSplashTime();
				
				  test = points.toString();
				PointText.text  = test;
			}
			
			if(checkWord(str4)==500){
				points +=checkWord(str4)
				fiveHundredPoints.visible = true;	 
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.start(); 
				PointSplashTime();
				
				  test  = points.toString();
				PointText.text  = test;
			}
			
			if(checkWord(str4)==750){	
				points +=checkWord(str4)
				sevenFiftyPoints.visible = true;	 
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.start(); 
				PointSplashTime(); 
				  test  = points.toString();
				PointText.text  = test;
			}
			answerStringText.text = " ";
			this.removeChild(words);
			this.removeChild(words2);
			this.removeChild(words3);
			this.removeChild(words4);
			this.removeChild(words5);
			this.removeChild(words6);
			this.removeChild(words7);
			this.removeChild(words8);
			this.removeChild(words9);
			this.removeChild(words10);
			this.removeChild(words11);
			createWords();
			 
			 
		}
	 
		
		private function getWords():String
		{
			if(levelBoolOne){
				tree = new node(7544);
				var arrayWordFour:Number = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			
			if(levelBoolTwo){ 
				
				tree = new node(7544);
				  arrayWordFour   = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			
			if(levelBoolThree){ 
				
				tree = new node(7544);
				 arrayWordFour  = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			
			
			if(levelBoolFour){ 
				
				tree = new node(7544);
				  arrayWordFour  = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			  
			return ""; 
		
			 
		}
		
		private function pointTime():void{
			
			//	HundredPoints.visible = true;
			// creates a new five-second Timer 
			PointTimer = new Timer(1000, 11);
			// designates listeners for the interval and completion events 
			PointTimer.addEventListener(TimerEvent.TIMER, onTickPoint); 
			//minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete); 
			// starts the timer ticking 
			PointTimer.start(); 
			//trace(PointTime);
			 
		}
		
		private function onTickPoint(event:TimerEvent):void  
		{  
			PointTime = -3+ event.target.currentCount;
			trace(PointTime);	
			if(showMenuBool){
			if(PointTime ==-2){trace("YES");menuFly.pause();}revealMenu();}
			//if(PointTime == -1)
				//blueMushroom.pause();
		}
		
		
		
		
		
		
		
		private function PointSplashTime():void{
			
			//	HundredPoints.visible = true;
			// creates a new five-second Timer 
			SplashTimer = new Timer(1000, 3);
			// designates listeners for the interval and completion events 
			SplashTimer.addEventListener(TimerEvent.TIMER, onTickPointSplash); 
			//minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete); 
			// starts the timer ticking 
			SplashTimer.start(); 
			//trace(PointTime);
			
		}
		
		private function onTickPointSplash(event:TimerEvent):void  
		{  
			SplashTime = -2 + event.target.currentCount;
			trace(SplashTime);
		 
			 
		}
		
		
		 
		
		
		private function revealMenu():void
		{
			this.removeEventListener(Event.ENTER_FRAME, onGameTick);
			this.removeEventListener(Event.ENTER_FRAME, playMenuSound);
			
		}
		
		private function createWords():void
		{ 	
			
			trace("createWords");
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
			answerStringText.text ="";
			var SlotArray:Array = new Array;
			
			var MoreSlots:Array = new Array;
			
			
			for(var A:int = 1;A<27;A++){
				MoreSlots[A] = A;
				
				MoreLetters[A] =A;
				trace(MoreLetters[A]);
			}
			for(var x:int = 1;x<27;)
			{  randSpot = ( Math.round(Math.random() *26));
				if(MoreSlots[randSpot] != null){
					trace(MoreLetters[x]);
					MoreLetters[x]    =  MoreSlots[randSpot];
					x++;
					MoreSlots[randSpot] = null;
				}
				
			}
			
			 
			speed =.02;
			var wordNumber:Number;
			var gameWord:String = getWords();
			trace(gameWord);
		 
			hide=0;
			unHide.length=0;
			str4="";
			if(gameWord!=null){
				var my_array:Array =gameWord.split("");
				for (var i:int = 0; i<my_array.length; i++) {
					
				} //end for loop
				
			}//end if
			 
			 
				for(var A:int = 0;A<6;A++){
					SlotArray[A] = A;				   
				}
				for(var x:int = 0;x<6;)
				{  randSpot = ( Math.round(Math.random() *6));
					if(SlotArray[randSpot] != null){
						trace(wordNum[x]);
						wordNum[x]    =  gameWord.charCodeAt(SlotArray[randSpot]) -64;
						x++;
						SlotArray[randSpot] = null;
					}
					
				}
		  
				
			 
			if(levelBoolFour){
				WinterLevel = 100;}
			else
			{
				WinterLevel = 0;
				
			}
			
			//trace(wordNum[9]);
			
			words= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel +  wordNum[0] )));
			words.x =  350;
			words.y = -words.height;
			//words.visible = false;
			
			
			wordBool = false ;
			this.addChild(words);
			
			
			words2= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel + wordNum[1] )));
			words2.x =  450;
			//words2.visible = false;
			word2Bool=false;
			this.addChild(words2);
			
			
			words3= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[2]) ));
			words3.x =  550;
			//words3.visible = false;
			word3Bool = false;
			this.addChild(words3);
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			words7= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel +MoreLetters[10] )));
			words7.x =  350;			
			words7.visible = false;
			wordBool = false ;
			//this.addChild(words7);
			
			
			words8= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + MoreLetters[1])));
			words8.x =  450;
			
			words8.visible = false;
			word8Bool=false;
			//	this.addChild(words8);
			
			
			words9= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel +MoreLetters[2] )));
			words9.x =  550;
			
			words9.visible = false;
			word9Bool = false;
			//	this.addChild(words9);
			
			words10= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel +MoreLetters[3])));
			words10.x =  200;
			
			words10.visible = false;
			word10Bool=false;
			//	this.addChild(words10);
			
			
			words11= new Button(Assests.getAtlas().getTexture("Letter_"  +( WinterLevel + MoreLetters[4] )));
			words11.x =  700;
			
			words11.visible = false;
			word11Bool = false;
			//	this.addChild(words11);
			this.addChild(words7);
			this.addChild(words8);
			this.addChild(words9);
			this.addChild(words10);
			this.addChild(words11);
			
			words7.y =100;
			words8.y =150;
			words9.y =150;
			words10.y=100;
			words11.y=100;
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
		 
			
			
			
			if(levelBoolOne){
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  +( WinterLevel + wordNum[3] )));
				words4.x =  220;//300
				
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[4] )));
				words5.x =  330;///400
				
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[5] )));
				words6.x = 430;//500
				
				word6Bool = false;
				this.addChild(words6);
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
			}
			
			if(levelBoolTwo){
				
				words.visible = true;
				words2.visible = true;
				words3.visible = true;
				
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  +( WinterLevel + wordNum[3] )));
				words4.x =  220;//300
				
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[4] )));
				words5.x =  330;///400
				
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[5] )));
				words6.x = 430;//500
				
				word6Bool = false;
				this.addChild(words6);
				
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
			}
			
			if(levelBoolThree){
				
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[3] )));
				words4.x =  220;//300
				
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel +wordNum[4] )));
				words5.x =  330;///400
				
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[5]) ));
				words6.x = 430;//500
				
				word6Bool = false;
				this.addChild(words6);
				
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
			}
			if(levelBoolFour){
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[3]) ));
				words4.x =  220;//300
				
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[4] )));
				words5.x =  330;///400
				
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel +wordNum[5] )));
				words6.x = 430;//500
				
				word6Bool = false;
				this.addChild(words6);
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
				
			}
			words.addEventListener(Event.TRIGGERED, onWordClick);	
			words2.addEventListener(Event.TRIGGERED, onWord2Click);	
			words3.addEventListener(Event.TRIGGERED, onWord3Click);
			BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			
			words4.addEventListener(Event.TRIGGERED, onWord4Click);
			words5.addEventListener(Event.TRIGGERED, onWord5Click);
			words6.addEventListener(Event.TRIGGERED, onWord6Click);
			
			
			words7.addEventListener(Event.TRIGGERED, onWord7Click);
			words8.addEventListener(Event.TRIGGERED, onWord8Click);
			words9.addEventListener(Event.TRIGGERED, onWord9Click);
			
			
			words10.addEventListener(Event.TRIGGERED, onWord10Click);
			words11.addEventListener(Event.TRIGGERED, onWord11Click);
		 
		}		

		
		
		public function DisposeTemp():void
		{
			this.visible = false;
		}
		
		public  function initialize():void
		{		 
			
			this.visible = true;
			gameState = 1;
	        
			gamePaused = false;
		
		}
		
		private function onlevelFourClick():void
		{		
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			if(stopLoading == false)
			this.addChild(loadingImage);
			else {this.addChild(loadingImage);loadingImage.visible = false;}
			loading =true;
			levelBoolFour=true;
		   
		}
		private function onlevelThreeClick():void
		{		
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			if(stopLoading == false)
			this.addChild(loadingImage);
			else{ this.addChild(loadingImage);loadingImage.visible = false;}
			loading =true;
			levelBoolThree=true;
		}
		
		private function onlevelTwoClick():void
		{		
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			if(stopLoading == false)
			this.addChild(loadingImage);
			else {this.addChild(loadingImage);loadingImage.visible = false;}
			loading =true;
			levelBoolTwo=true;
		}
		
		private function onlevelOneClick():void
		{		
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			if(stopLoading == false){
			this.addChild(loadingImage);}
			else {this.addChild(loadingImage);loadingImage.visible = false;}
			loading =true;
			levelBoolOne=true;
		}
		
		
		private function levelLoader():void
		{
			this.removeChild(loadingImage);
		
			
			// Pause button.
			pauseButton = new Button(Assests.getAtlas().getTexture("pauseMenu"));
			pauseButton.x = 500;
			pauseButton.y = 680;
			pauseButton.visible = false;
			pauseButton.addEventListener(Event.TRIGGERED, onPauseButtonClick);
			this.addChild(pauseButton);
			board = new Image(Assests.getAtlas().getTexture("scoreBox"));
			board.y = 400;
			board.x =-20;
			board.alpha = .75;
		 
			
			paused = new  Image (Assests.getAtlas().getTexture("paused"));
			paused.alpha = .7;
			paused.x  = 350 ;
			paused.y =  310 ;
			paused.visible = false;
			this.addChild(paused);
			AnswerValue = Fonts.getFont("ScoreValue");
			answerStringText = new TextField(250, 75, "", AnswerValue.fontName, AnswerValue.fontSize,0xFFFF00);
			answerStringText.x =400;
			answerStringText.y = 400;
			answerStringText.visible = true;
			answerStringText.text = "";
			
			// answer label
			
			
			
			Time = Fonts.getFont("ScoreValue");
			TimeText = new TextField(120, 100, "", Time.fontName, 35,0xE8E8E8   );
			TimeText.x =80;
			TimeText.y =440;
			
			// Time label
			
			
			
			
			Score = Fonts.getFont("ScoreValue");
			ScoreText = new TextField(120, 100, "", Score.fontName, 35,0xE8E8E8   );
			ScoreText.x =80;
			ScoreText.y =470;
			
			
			// Score label
			
			Point = Fonts.getFont("ScoreValue");
			PointText = new TextField(120, 100, "", Point.fontName, 35,0xE8E8E8   );
			PointText.x =180;
			PointText.y =470;
			
			
			
			TimeAmount = Fonts.getFont("ScoreValue");
			TimeTextAmount = new TextField(120, 100, "", TimeAmount.fontName, 35,0xE8E8E8   );
			TimeTextAmount.x =150;
			TimeTextAmount.y =440;
			TimeTextAmount.visible = true;
			
			levelFour.removeEventListener(Event.TRIGGERED, onlevelFourClick);	
			 
			loadingImage.removeEventListener(Event.ENTER_FRAME,levelLoader);
			
			if(loading == true){
				
				if(levelBoolFour==true){
					stopLoading = true ;
				LevelBGFour = new  Image (Assests.getTexture("LevelFour"));//Welcome Screen
				this.addChild(LevelBGFour);
				LevelBGFour.visible = true;
				
				}
				
				
				if(levelBoolTwo==true){
					stopLoading = true ;
				LevelBG = new  Image (Assests.getTexture("LevelTwo"));//Welcome Screen
				LevelBG.visible = true;
				this.addChild(LevelBG);
				}
				if(levelBoolThree==true){
					stopLoading = true ;
				LevelBGThree = new  Image (Assests.getTexture("LevelThree"));//Welcome Screen
				LevelBGThree.visible = true;
				this.addChild(LevelBGThree);}
				if(levelBoolOne==true){
					bg =  new  Image (Assests.getAtlas().getTexture("LetterFieldnew"));//Welcome Screen 
					this.addChild(bg); 
			     	bg.visible = true;stopLoading = true ;}
				 
			 
				this.removeEventListener(Event.TRIGGERED,onlevelFourClick);
				particleSplash = new PDParticleSystem(XML(new AssestsParticle.ParticleSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleSplashTexture));	
				Starling.juggler.add(particleSplash);
				particleSplash.x=200;
				particleSplash.y=200;
				particleSplash.alpha = .75;
				
				addGameElements();
				this.addChild(HundredPoints); this.addChild(sevenFiftyPoints);	this.addChild(fiveHundredPoints);this.addChild(twoHundredPoints);
				
				levelRoomSelect.visible = false;
				
				
				SoundMixer.stopAll();//achievments.visible = true;
				this.addChild(particleSplash); 
				this.addChild(BackSpace); 
				//this.addChild(achievments); 
				this.addChild(Submit);
				board.visible = true; 
				
				fallSpeed = .3;
				
				
				
				answerStringText.text = " ";
				
				soundButton = new SoundButton();
				soundButton.visible = true;soundButton.alpha = .5;
				
				soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
				this.addChild(soundButton)
				
				pauseButton.x = soundButton.x + 70;
				pauseButton.y = soundButton.y; pauseButton.alpha = .6;
				
				LetterBox = new Letters();
				this.addChild(LetterBox);
				LetterBox.alpha =.7;
				
				gameState =1;
				
				levelBoolFour = true;	
				levelOne.visible = false;
				levelTwo.visible = false;
				levelThree.visible = false;
				levelFour.visible = false;
				LetterBox.visible = true;
				LetterBox.alpha =.7;
				pauseButton.visible = true;
				////menuButton.visible = true;
				
				Submit.visible = true; BackSpace.visible = true;this.addChild(board);
				this.addChild(ScoreText);this.addChild(PointText);this.addChild(TimeText);	this.addChild(answerStringText);	
				this.addChild(TimeTextAmount);
				
				
			}
			
		}		
		
		private function addGameElements():void
		{
			
			
			
			trace("addElemnts");
			
			HundredPoints = new Image(Assests.getAtlas().getTexture("100points") );
			HundredPoints.visible = false;
			
			HundredPoints.x =  150;
			HundredPoints.y =  390 ;
			this.addChild( HundredPoints);
			
			sevenFiftyPoints = new Image(Assests.getAtlas().getTexture("sevenFifty") );
			sevenFiftyPoints.visible = false;
			
			sevenFiftyPoints.x =  150;
			sevenFiftyPoints.y =  390 ;
			this.addChild(sevenFiftyPoints );
			fiveHundredPoints = new Image(Assests.getAtlas().getTexture("fiveHundred") );
			fiveHundredPoints.visible = false;
			
			fiveHundredPoints.x =  150;
			fiveHundredPoints.y =  390 ;
			this.addChild(fiveHundredPoints );
			
			twoHundredPoints = new Image(Assests.getAtlas().getTexture("twoHundred") );
			twoHundredPoints.visible = false;
			
			twoHundredPoints.x =  150;
			twoHundredPoints.y =  390 ;
			
		 
			
			this.addChild(twoHundredPoints );
		
			
			
			Submit = new  Button(Assests.getAtlas().getTexture("submit"));
			Submit.x =80;
			Submit.y =275;
			Submit.visible = false;
			Submit.addEventListener(Event.TRIGGERED, onSubmitButtonClick);
			
			
			BackSpace = new  Button(Assests.getAtlas().getTexture("backSpace"));
			BackSpace.x =850;
			BackSpace.y =275;
			BackSpace.visible = false;
			BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			
			greenMushroom = new MovieClip(Assests.getAtlasGreen().getTextures("green"), 20);
			greenMushroom.x = 700;
			greenMushroom.y = 550;
			Starling.juggler.add(greenMushroom);
			
		}
		
		private function addGameOverElements():void
		{   board.visible = false;
		 
		}
		/*
		private function onlevelThreeClick(event:Event):void
		{   	
		
			this.addChild(ScoreText);this.addChild(PointText);this.addChild(TimeText);	this.addChild(answerStringText);	this.addChild(board);
			this.addChild(TimeTextAmount);
			
			
			
			particleSplash = new PDParticleSystem(XML(new AssestsParticle.ParticleSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleSplashTexture));	
			Starling.juggler.add(particleSplash);
			particleSplash.x=200;
			particleSplash.y=200;
			particleSplash.alpha = .75;
			this.removeEventListener(Event.TRIGGERED,onlevelThreeClick);
			this.removeEventListener(Event.TRIGGERED,onlevelTwoClick);
			this.removeEventListener(Event.TRIGGERED,onlevelOneClick);
			this.removeEventListener(Event.TRIGGERED,onlevelFourClick);
			addGameElements();
			levelRoomSelect.visible = false;
			
			
			SoundMixer.stopAll();this.addChild(particleSplash); 
			//achievments.visible = true;
			this.addChild(BackSpace); //this.addChild(achievments); 
			this.addChild(Submit);
			
			fallSpeed = .4;
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
			pauseButton.x = soundButton.x + 70;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
			
			////menuButton.x = soundButton.x + 100;
			////menuButton.y = soundButton.y;
			
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			
			//if (!Sounds.muted) Sounds. sndLevelMusic.play(0, 999);
			answerStringText.text = " ";
			
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			
			gameState =1;
			 
			levelBoolThree = true;
			createWords();
			levelOne.visible = false;
			levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			pauseButton.visible = true;
			////menuButton.visible = true;
			Submit.visible = true; BackSpace.visible = true;
			 
			LevelBGThree.visible= true;
			board.visible = true;
	 
		}				
		
		private function onlevelTwoClick():void
		{   
			
			
			this.addChild(ScoreText);this.addChild(PointText);this.addChild(TimeText);	this.addChild(answerStringText);	this.addChild(board);
			this.addChild(TimeTextAmount);
			
			
			particleSplash = new PDParticleSystem(XML(new AssestsParticle.ParticleSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleSplashTexture));	
			Starling.juggler.add(particleSplash);
			particleSplash.x=200;
			particleSplash.y=200;
			particleSplash.alpha = .75;
			this.removeEventListener(Event.TRIGGERED,onlevelThreeClick);
			this.removeEventListener(Event.TRIGGERED,onlevelTwoClick);
			this.removeEventListener(Event.TRIGGERED,onlevelOneClick);
			this.removeEventListener(Event.TRIGGERED,onlevelFourClick);
			
			addGameElements();
			levelRoomSelect.visible = false;
			
			 
			SoundMixer.stopAll();this.addChild(particleSplash); 
			//achievments.visible = true;
			this.addChild(BackSpace); //this.addChild(achievments); 
			this.addChild(Submit);
		
			fallSpeed = .4;
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
			pauseButton.x = soundButton.x + 70;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
			
			////menuButton.x = soundButton.x + 100;
			////menuButton.y = soundButton.y;
			
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			
			//if (!Sounds.muted) Sounds. sndLevelMusic.play(0, 999);
			answerStringText.text = " ";
			
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			 
			gameState =1;
			 
			levelBoolTwo = true;
			createWords();
			levelOne.visible = false;
			levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			pauseButton.visible = true;
			////menuButton.visible = true;
		    Submit.visible = true; BackSpace.visible = true;
		 
			LevelBG.visible= true;
			board.visible = true;
	 
		 
		}
		
		private function onlevelOneClick(event:Event):void
			
		{ 	
			
			this.addChild(ScoreText);this.addChild(PointText);this.addChild(TimeText);	this.addChild(answerStringText);	this.addChild(board);
			this.addChild(TimeTextAmount);
			
			
			particleSplash = new PDParticleSystem(XML(new AssestsParticle.ParticleSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleSplashTexture));	
			Starling.juggler.add(particleSplash);
			particleSplash.x=200;
			particleSplash.y=200;
			particleSplash.alpha = .75;
			this.removeEventListener(Event.TRIGGERED,onlevelThreeClick);
			this.removeEventListener(Event.TRIGGERED,onlevelTwoClick);
			this.removeEventListener(Event.TRIGGERED,onlevelOneClick);
			this.removeEventListener(Event.TRIGGERED,onlevelFourClick);
			 
			addGameElements();
		
			levelRoomSelect.visible = false;
			
			SoundMixer.stopAll();this.addChild(particleSplash); 
			this.addChild(BackSpace);  
			this.addChild(Submit);
			 
			board.visible = true; 
		 
			
			fallSpeed = .4;
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
			
			pauseButton.x = soundButton.x + 70;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
		
			answerStringText.text = " ";
			
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			
			gameState =1;
			 
			levelBoolOne = true;
			createWords();
			levelOne.visible = false;
			levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			LetterBox.alpha =.7;
			pauseButton.visible = true;
		 
			Submit.visible = true; BackSpace.visible = true;
		 
		}
		*/
		private function launchLetter():void
		{
			trace("inside of launch letter");
		
			
		}
		
		
		private function onPauseButtonClick(event:Event):void
		{
			
			
			if(paused.visible == false)
			{	if (!Sounds.muted) Sounds. sndPauseGame.play();
				
				paused.visible = true;
				
			}
			else{	
				if (!Sounds.muted)
					Sounds. sndPauseGame.play();				
				paused.visible = false;
				
			}
			 
			if (gamePaused){
				gamePaused= false; 	minuteTimer.start();}
			else {gamePaused = true;;}
			
			
		}
		
		private function gameOver():void
		{	
			trace("inside of GameOver()");
		   str4="";
			this.removeEventListener(Event.TRIGGERED,onlevelFourClick);
			this.removeChild(particleSplash); 
	        this.removeChild(welcomeImage);
			this.removeChild(loadingImage);
			this.levelBoolTwo =false;
			this.levelBoolOne =false;
			this.levelBoolThree =false;
			this.levelBoolFour =false;
			this.removeChild(LetterBox);
			this.removeChild(Submit);
			this.removeChild(BackSpace);
			this.removeChild(words);
			this.removeChild(words2);
			this.removeChild(words3);
			this.removeChild(words4);
			this.removeChild(words5);
			this.removeChild(words6);
			this.removeChild(words7);
			this.removeChild(words8);
			this.removeChild(words9);
			this.removeChild(words10);
			this.removeChild(words11);
			this.removeChild(twoHundredPoints);
			
			this.removeChild(sevenFiftyPoints);
			
			this.removeChild(HundredPoints);
			
			this.removeChild(fiveHundredPoints);
		  
			this.removeChild(soundButton);
			
			//this.removeChild(////menuButton);
		  
			this.removeChild(Submit);
			this.removeChild(BackSpace);
		    this.removeChild(levelRoomSelect);
		 
			this.removeChild(LevelBGThree);
			
		    this.removeChild(backMenu)
			this.removeChild(menuFly);
			this.removeChild(LevelBGFour);
			this.removeChild(blueMushroom);
			this.removeChild(purpleMushroom);
			this.removeChild(greenMushroom);
		    this.removeChild(redMushroom);
			this.removeChild(paused);
			this.removeChild(achievments);
			 
			this.removeChild(levelOne);
		 
			this.removeChild(levelTwo);
			
		 
			this.removeChild(levelThree);
	 
			this.removeChild(levelFour);
			
			this.removeChild(continueButton);
			
			
			//this.setChildIndex(gameOverContainer, this.numChildren-1);
			/*gameOverContainer.initialize(points, Math.round(points));
			tween_gameOverContainer = new Tween(gameOverContainer, 1);
			tween_gameOverContainer.fadeTo(1);
			Starling.juggler.add(tween_gameOverContainer);
			*/
			this.removeEventListener(Event.TRIGGERED, onWord2Click);	
			this.removeEventListener(Event.TRIGGERED, onWord3Click);
			this.removeEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			
			this.removeEventListener(Event.TRIGGERED, onWord4Click);
			this.removeEventListener(Event.TRIGGERED, onWord5Click);
			this.removeEventListener(Event.TRIGGERED, onWord6Click);
			this.removeEventListener(Event.TRIGGERED, onContinueButtonClick);
			
			this.removeEventListener(Event.TRIGGERED, onWord7Click);
			this.removeEventListener(Event.TRIGGERED, onWord8Click);
			this.removeEventListener(Event.TRIGGERED, onWord9Click);
			
			this.removeEventListener(Event.TRIGGERED, onWord10Click);
			this.removeEventListener(Event.TRIGGERED, onWord11Click);
			
			
			
			
			
		}
		private function onGameTick(event:Event):void
		{	
			
			switch(gameState)
			{
				case 1:
					
					ShortTimer();
					createWords();
					 ScoreText.text ="SCORE";
					TimeText.text ="TIME";
					trace("set SCORE AND TIME");
					showMenuBool=false;
					words.addEventListener(Event.TRIGGERED, onWordClick);	
					words2.addEventListener(Event.TRIGGERED, onWord2Click);	
					words3.addEventListener(Event.TRIGGERED, onWord3Click);
					BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
					continueButton.addEventListener(Event.TRIGGERED, onContinueButtonClick);
					words4.addEventListener(Event.TRIGGERED, onWord4Click);
					words5.addEventListener(Event.TRIGGERED, onWord5Click);
					words6.addEventListener(Event.TRIGGERED, onWord6Click);
					
					
					words7.addEventListener(Event.TRIGGERED, onWord7Click);
					words8.addEventListener(Event.TRIGGERED, onWord8Click);
					words9.addEventListener(Event.TRIGGERED, onWord9Click);
					
					PointTime=3;
					SplashTime=3
					words10.addEventListener(Event.TRIGGERED, onWord10Click);
					words11.addEventListener(Event.TRIGGERED, onWord11Click);
					//start the game
					gameState = 2;
				case 2:
					
					
					if(SplashTime==-1)	particleSplash.stop(); 
					if(SplashTime==-1){
						
				 
						HundredPoints.visible = false;
						twoHundredPoints.visible = false;
						fiveHundredPoints.visible = false;
						sevenFiftyPoints.visible = false;
						 
					}
					
					// trace(hide);
					if(!gamePaused &&GameTime >0){
						trace("initLetters");
						initLetters();	
						
				
						
					}
					 
					if(GameTime ==20)
					{ 
						
					
					 
					}
					if(GameTime ==0){ 
						pauseButton.visible = false;
						//LevelBG.visible = false;
						pointTime();
				 		gameState = 3;
						}
					
					break;
				case 3:
					
					gameState = 1;
					addGameOverElements();
					board.visible = false;
					levelBoolOne = false;
					levelBoolTwo = false;
					levelBoolThree = false;
					levelBoolFour= false;
					this.removeEventListener(Event.ENTER_FRAME, onGameTick);
					
				   gameOver();	
					showMenu();
					
					
				
					
					break;
				
				case 4:
					
					break;
			}
			
		}
		
		private function showMenu():void
		{   trace("inside of showMenu");
			
			welcomeImage = new Image(Assests.getAtlas().getTexture("welcome"));
			this.addChild(welcomeImage);
			menuFly = new MovieClip(Assests.getAtlasMenu().getTextures("flyMenu_"), 20);
			menuFly.x = 200;
			menuFly.y = 80;
			
			menuFly.addEventListener(Event.ADDED_TO_STAGE,playMenuSound);
			menuFly.visible = true;
			this.addChild(greenMushroom);
			
			purpleMushroom = new MovieClip(Assests.getAtlasPurple().getTextures("purple"), 20);
			purpleMushroom.x = 720;
			purpleMushroom.y = 140;
			Starling.juggler.add(purpleMushroom);
			
			this.addChild(purpleMushroom);
			blueMushroom = new MovieClip(Assests.getAtlasBlue().getTextures("blue"), 20);
			blueMushroom.x = 640;
			blueMushroom.y = 480;
			Starling.juggler.add(blueMushroom);
			this.addChild(blueMushroom);
			redMushroom = new MovieClip(Assests.getAtlasRed().getTextures("red"), 20);
			redMushroom.x = -25;
			redMushroom.y = 100;
			Starling.juggler.add(redMushroom);
			this.addChild(redMushroom);
			
			
			backMenu = new Image(Assests.getAtlasMenu().getTexture("menuBack"));
			backMenu.x = 150;
			backMenu.visible = true;		this.addChild(backMenu);
		
			
			
	
			this.addChild(continueButton);	
			Starling.juggler.add(menuFly);
			this.addChild(menuFly);
			
			 
			 
			//bgQuad.visible= true;
			continueButton.visible = true;
			 
			
		 
		
		
			this.removeEventListener(Event.ENTER_FRAME, onGameTick);
			showMenuBool = true;
		
			continueButton.visible = true;
			
	
			
			
			
		
	//showMushrooms();

			
		}		
		
		private function showMushrooms():void
		{
			
			this.addChild(greenMushroom);
		
			purpleMushroom = new MovieClip(Assests.getAtlasPurple().getTextures("purple"), 20);
			purpleMushroom.x = 720;
			purpleMushroom.y = 140;
			Starling.juggler.add(purpleMushroom);
			
			this.addChild(purpleMushroom);
			blueMushroom = new MovieClip(Assests.getAtlasBlue().getTextures("blue"), 20);
			blueMushroom.x = 640;
			blueMushroom.y = 480;
			Starling.juggler.add(blueMushroom);
			this.addChild(blueMushroom);
			redMushroom = new MovieClip(Assests.getAtlasRed().getTextures("red"), 20);
			redMushroom.x = -25;
			redMushroom.y = 100;
			Starling.juggler.add(redMushroom);
			this.addChild(redMushroom);
		 
			
	
			
		}
		
		private function playMenuSound():void
		{
			if (!Sounds.muted) Sounds.sndWinGame.play(); 
			
		}
	
		 
		private function drawGameOverScreen():void
		{
		/*	gameEnd = true;
			gameOverContainer = new GameOverContainer(gameEnd);
			gameOverContainer.addEventListener(NavigationEvent.CHANGE_SCREEN, playAgain);
			this.addChild(gameOverContainer);
			*/
			
		}
		
		
		private function playAgain(event:NavigationEvent):void
		{
			
			if (event.params.id == "playAgain") 
			{
			/*	tween_gameOverContainer = new Tween(gameOverContainer, 1);
				tween_gameOverContainer.fadeTo(0);
				tween_gameOverContainer.onComplete = gameOverFadedOut;
				Starling.juggler.add(tween_gameOverContainer);*/
			/*	initialize();
				drawGame();
				 */
			}
		}
		
		private function onInGameNavigation(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "mainMenu":
					screenWelcome.intialize()
					break;
				
			}
		}
		
		
		private function gameOverFadedOut():void
		{
			gameOverContainer.visible = false;
			initialize();
		}
		
		

		private function checkWord(string:String):int
		{var addPoint:int = 0;
			
			if(str4.length ==6){
				for(var x:int = 0;x<15787;x++){
					if(slangArrayFour[x] == string)
						addPoint =750;
				}
			}
			if(str4.length ==5){
				for(var x:int = 0;x<8938;x++){
					if(slangArrayThree[x] == string)
						addPoint =500;
				}
			}
			if(str4.length ==4){
				for(var x:int = 0;x<5252;x++){
					if(slangArrayTwo[x] == string)
						addPoint =200;
				}
			}
			if(str4.length ==3){
				for(var x:int = 0;x<593;x++){
					if(slangArray[x] == string)
						addPoint =100;
				}
			} 
			
			return addPoint;
		}
		
		
		private function ShortTimer() :void 
		{ trace("shortTimer");
		
			minuteTimer = new Timer(1000, 25); 
			minuteTimer.addEventListener(TimerEvent.TIMER, onTick); 
			minuteTimer.start(); 
			
		} 
		
		private function onTick(event:TimerEvent):void  
		{ 
			if(RoundTime - event.target.currentCount == 89) gameState=2;
			if(!gamePaused){
				
				GameTime = RoundTime - event.target.currentCount;
				var test:String =  GameTime.toString();
				TimeTextAmount.text = test;
				trace(test);
			}
			else{
				
				minuteTimer.stop();
				
			}
			
		} 
		
		 
		private function onWord7Click():void
		{    if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			words7.visible= false;
			str8 = String.fromCharCode(MoreLetters[10]+64);
			word7Bool = true;
			str4 = str4.concat(str8);
			answerStringText.text =  str4;
			unHide[hide] = 7;
			hide++;
			
		}		
		
		
		private function onWord8Click():void
		{    if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			words8.visible= false;
			str9 = String.fromCharCode(MoreLetters[1]+64);
			word8Bool = true;
			str4 = str4.concat(str9);
			answerStringText.text =  str4;
			
		}	
		
		
		private function onWord9Click():void
		{	if (!Sounds.muted) Sounds. sndPopLetter.play();
			words9.visible= false;
			str10 = String.fromCharCode(MoreLetters[2]+64);
			word9Bool = true;
			str4 = str4.concat(str10);
			answerStringText.text =  str4;
			
		}	
		
		private function onWord10Click():void
		{	if (!Sounds.muted) Sounds. sndPopLetter.play();
			words10.visible= false;
			str11 = String.fromCharCode(MoreLetters[3]+64);
			word10Bool = true;
			str4 = str4.concat(str11);
			answerStringText.text =  str4;
			
		}	
		
		
		private function onWord11Click():void
		{   if (!Sounds.muted) Sounds. sndPopLetter.play();
			words11.visible= false;
			str12 = String.fromCharCode(MoreLetters[4]+64);
			word11Bool = true;
			str4 = str4.concat(str12);
			answerStringText.text =  str4;
			
		}	
		
		
		private function onWord6Click():void
		{	if (!Sounds.muted) Sounds. sndPopLetter.play();
			words6.visible= false;
			str7 = String.fromCharCode(wordNum[5]+64);
			word6Bool = true;
			str4 = str4.concat(str7);
			answerStringText.text =  str4;
			unHide[hide] = 6;
			hide++;
		}
		
		private function onWord5Click():void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			words5.visible= false;
			str6 = String.fromCharCode(wordNum[4]+64);
			word6Bool = true;
			str4 = str4.concat(str6);
			answerStringText.text =  str4;
			unHide[hide] = 5;
			hide++;
			
		}
		
		private function onWord4Click():void
		{	
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			str5 = String.fromCharCode(wordNum[3]+64);
			str4 = str4.concat(str5);
			answerStringText.text =  str4;
			words4.visible = false;
			trace(hide);
			unHide[hide] = 4;
			hide++;
		}
		
		private function onWord3Click():void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			str3 = String.fromCharCode(wordNum[2]+64);
			str4 = str4.concat(str3);
			answerStringText.text =  str4;
			words3.visible = false;	 
			trace("words3");
			trace(hide);
			unHide[hide] = 3;
			hide++;
		}
		
		private function onWord2Click():void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			str2 =  String.fromCharCode(wordNum[1]+64);
			str4 = str4.concat(str2);
			answerStringText.text =  str4;
			words2.visible = false;
			trace("words2");
			trace(hide);
			unHide[hide] = 2;
			hide++;
			
		}
		
		private function onWordClick(event:Event):void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			str = String.fromCharCode(wordNum[0]+64)	
			str4 = str4.concat(str); 
			answerStringText.text=  str4;
			words.visible = false;
			trace("words");
			trace(hide);
			unHide[hide] = 1;
			hide++;	

		} 
		private function initLetters():void
		{   trace("inside of initLetters()");
			var count:Number;
			var count2:Number;
			count = words.y +=fallSpeed;
			words2.y +=fallSpeed;
			words3.y +=fallSpeed;
			words6.y +=fallSpeed;
			words4.y +=fallSpeed;
			words5.y +=fallSpeed;
			count2 = words7.y +=fallSpeed;
			words8.y +=fallSpeed;
			words9.y +=fallSpeed;
			words10.y +=fallSpeed;
			words11.y +=fallSpeed;
			if(count > 200){
				 
				words7.visible = true;
				words8.visible = true;
				words9.visible = true;
				 
			}
			if(count2 > 250)
			{
				
				words10.visible = true;
				words11.visible = true;
				 
			}
		 
			var switchIt:Boolean = false;
			if (words.y >700 )
			{
				this.removeChild(words);
				this.removeChild(words2);
				this.removeChild(words3);
				this.removeChild(words4);
				this.removeChild(words5);
				this.removeChild(words6);
				if (words7.y >700 )
				{
					this.removeChild(words7);
					this.removeChild(words8);
					this.removeChild(words9);
				}
				if (words10.y >700 )
				{
					this.removeChild(words10);
					this.removeChild(words11);
					switchIt = true;
				}
				if(switchIt){
					createWords();	
					
				}
				
				
				
			}
			
			
		}
		
		
	} 
	
}

