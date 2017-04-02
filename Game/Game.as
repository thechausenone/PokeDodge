
package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.geom.ColorTransform;
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	import fl.controls.CheckBox;
	import fl.controls.Label;

	public class Game8 extends MovieClip {
		var rbgPokemon:RadioButtonGroup=new RadioButtonGroup("Pokemon");
		var rbgControls:RadioButtonGroup=new RadioButtonGroup("Controls");
		var rbgMode:RadioButtonGroup=new RadioButtonGroup("Mode");
		var rbgDifficulty:RadioButtonGroup=new RadioButtonGroup("Difficulty");
		var rbgPlayers:RadioButtonGroup=new RadioButtonGroup("Number of Players");
		var rbPikachu:RadioButton = new RadioButton();
		var rbOnix:RadioButton = new RadioButton();
		var rbTogepi:RadioButton = new RadioButton();
		var rbSingle:RadioButton = new RadioButton();
		var rbTwo:RadioButton = new RadioButton();
		var rbArrowKeys:RadioButton = new RadioButton();
		var rbMouse:RadioButton = new RadioButton();
		var rbClassic:RadioButton = new RadioButton();
		var rbSurvival:RadioButton = new RadioButton();
		var rbNormal:RadioButton = new RadioButton();
		var rbHard:RadioButton = new RadioButton();
		var rbInsane:RadioButton = new RadioButton();
		var lblPokemon:Label = new Label();
		var lblControls:Label = new Label();
		var lblMode:Label = new Label();
		var lblDifficulty:Label = new Label();
		var lblPlayers:Label = new Label();
		var profOak:ProfOak = new ProfOak();
		var btnStart:BtnStart = new BtnStart();
		var btnNext:BtnNext = new BtnNext();
		var btnBack:BtnBack = new BtnBack();
		var btnBack2:BtnBack2 = new BtnBack2();
		var btnPlay:BtnPlay = new BtnPlay();
		var btnAgain:BtnAgain = new BtnAgain();
		var btnMain:BtnMain = new BtnMain();
		var dAnimVelX:Number=4;
		var dAnimVelY:Number=4;
		var tmrAnimMove:Timer=new Timer(25);
		var tmrSpawn:Timer=new Timer(50);
		//var tmrInterval:Timer=new Timer(1000);
		var titleScreen:TitleScreen = new TitleScreen();
		var imgInstruction:ImgInstruction = new ImgInstruction();
		var imgPokeBall:ImgPokeBall;
		var imgMasterBall:ImgMasterBall;
		var animPokeBall:AnimPokeBall=new AnimPokeBall  ;
		var imgCursor:ImgCursor = new ImgCursor();
		var imgPikachu:ImgPikachu = new ImgPikachu();
		var imgOnix:ImgOnix = new ImgOnix();
		var imgTogepi:ImgTogepi = new ImgTogepi();
		var imgMouse:ImgMouse = new ImgMouse();
		var imgKeys:ImgKeys = new ImgKeys();
		var arBalls:Array = new Array();
		var i:int;
		var nNumBalls:int=0;
		var nX:int;
		var nY:int;
		var dVelX:Number;
		var dVelY:Number;
		var nRemainderX:int;
		var nRemainderY:int;
		var mouseBorder:Sprite = new Sprite();
		var tmrClock:Timer=new Timer(1000);
		var nSec:int;
		var txtTimeRemaining:TextField = new TextField();
		var txtNumBalls:TextField = new TextField();
		var txtHealth:TextField = new TextField();
		var txtFormat:TextFormat = new TextFormat();
		var newFont = new Font1();
		var gameBackground:GameBackground = new GameBackground();
		var loseScreen:LoseScreen = new LoseScreen();
		var nHealth:int;


		public function Game8() {
			loseScreen.x=600;
			loseScreen.y=600;
			loseScreen.width=550;
			loseScreen.height=400;
			addChild(loseScreen);

			gameBackground.x=600;
			gameBackground.y=600;
			gameBackground.height=400;
			gameBackground.width=550;
			gameBackground.alpha=0.65;
			addChild(gameBackground);


			mouseBorder.graphics.lineStyle(1, 0x000000);
			mouseBorder.graphics.drawCircle(0,0,15);
			addChild(mouseBorder);
			mouseBorder.x=600;
			mouseBorder.y=600;

			rbPikachu.move(600, 600);
			rbPikachu.label="Pikachu";
			rbPikachu.group=rbgPokemon;
			addChild(rbPikachu);

			rbOnix.move(600, 600);
			rbOnix.label="Onix";
			rbOnix.group=rbgPokemon;
			addChild(rbOnix);

			rbTogepi.move(600, 600);
			rbTogepi.label="Togepi";
			rbTogepi.group=rbgPokemon;
			addChild(rbTogepi);

			rbSingle.move(600, 600);
			rbSingle.label="Single Player";
			rbSingle.group=rbgPlayers;
			addChild(rbSingle);

			rbTwo.move(600, 600);
			rbTwo.label="Two Player";
			rbTwo.group=rbgPlayers;
			addChild(rbTwo);

			rbArrowKeys.move(600, 600);
			rbArrowKeys.label="";
			rbArrowKeys.group=rbgControls;
			addChild(rbArrowKeys);

			rbMouse.move(600, 600);
			rbMouse.label="";
			rbMouse.group=rbgControls;
			addChild(rbMouse);

			rbClassic.move(600, 600);
			rbClassic.label="Classic Mode";
			rbClassic.group=rbgMode;
			addChild(rbClassic);

			rbSurvival.move(600, 600);
			rbSurvival.label="Survival Mode";
			rbSurvival.group=rbgMode;
			addChild(rbSurvival);

			rbNormal.move(600, 600);
			rbNormal.label="Normal";
			rbNormal.group=rbgDifficulty;
			addChild(rbNormal);

			rbHard.move(600, 600);
			rbHard.label="Hard";
			rbHard.group=rbgDifficulty;
			addChild(rbHard);

			rbInsane.move(600, 600);
			rbInsane.label="Insane";
			rbInsane.group=rbgDifficulty;
			addChild(rbInsane);

			lblPokemon.move(600,600);
			lblPokemon.text="Choose Your Pokemon!";
			lblPokemon.width=150;
			addChild(lblPokemon);

			lblControls.move(600,600);
			lblControls.text="Keyboard or Mouse?";
			lblControls.width=150;
			addChild(lblControls);

			lblMode.move(600,600);
			lblMode.text="Mode";
			addChild(lblMode);

			lblDifficulty.move(600,600);
			lblDifficulty.text="Difficulty";
			addChild(lblDifficulty);

			lblPlayers.move(600,600);
			lblPlayers.text="# of Players";
			addChild(lblPlayers);

			imgOnix.x=600;
			imgOnix.y=600;
			addChild(imgOnix);

			imgTogepi.x=600;
			imgTogepi.y=600;
			addChild(imgTogepi);

			imgPikachu.x=600;
			imgPikachu.y=600;
			addChild(imgPikachu);

			imgInstruction.x=600;
			imgInstruction.y=600;
			addChild(imgInstruction);

			addChild(titleScreen);

			profOak.x=600;
			profOak.y=600;
			addChild(profOak);

			btnStart.x=175;
			btnStart.y=350;
			addChild(btnStart);

			btnNext.x=600;
			btnNext.y=600;
			addChild(btnNext);

			btnBack.x=600;
			btnBack.y=600;
			addChild(btnBack);

			btnBack2.x=600;
			btnBack2.y=600;
			addChild(btnBack2);

			btnPlay.x=600;
			btnPlay.y=600;
			addChild(btnPlay);

			btnAgain.x=600;
			btnAgain.y=600;
			addChild(btnAgain);

			btnMain.x=600;
			btnMain.y=600;
			addChild(btnMain);

			imgCursor.x=600;
			imgCursor.y=600;
			imgCursor.width=40;
			imgCursor.height=35;
			addChild(imgCursor);

			imgMouse.x=600;
			imgMouse.y=600;

			addChild(imgMouse);

			imgKeys.x=600;
			imgKeys.y=600;
			addChild(imgKeys);

			animPokeBall.x=600;
			animPokeBall.y=600;
			animPokeBall.width=40;
			animPokeBall.height=40;
			addChild(animPokeBall);

			txtFormat.size=10;
			txtFormat.font=newFont.fontName;
			txtTimeRemaining.defaultTextFormat=txtFormat;
			txtTimeRemaining.embedFonts=true;
			txtTimeRemaining.antiAliasType=AntiAliasType.ADVANCED;
			txtTimeRemaining.x=600;
			txtTimeRemaining.y=600;
			txtTimeRemaining.width=300;
			txtTimeRemaining.textColor=0x0000FF;
			addChild(txtTimeRemaining);

			txtNumBalls.defaultTextFormat=txtFormat;
			txtNumBalls.embedFonts=true;
			txtNumBalls.antiAliasType=AntiAliasType.ADVANCED;
			txtNumBalls.x=600;
			txtNumBalls.y=600;
			txtNumBalls.width=300;
			txtNumBalls.textColor=0x0000FF;
			addChild(txtNumBalls);

			txtHealth.defaultTextFormat=txtFormat;
			txtHealth.embedFonts=true;
			txtHealth.antiAliasType=AntiAliasType.ADVANCED;
			txtHealth.x=600;
			txtHealth.y=600;
			txtHealth.width=100;
			txtHealth.textColor=0x00FF00;
			addChild(txtHealth);



			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);//These event listeners make the button light up
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnStart.addEventListener(MouseEvent.CLICK, Instructions);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnNext.addEventListener(MouseEvent.CLICK, Options);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnBack.addEventListener(MouseEvent.CLICK, Main);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnBack2.addEventListener(MouseEvent.CLICK, Instructions);
			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnPlay.addEventListener(MouseEvent.CLICK, Game);
			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnAgain.addEventListener(MouseEvent.CLICK, Game);
			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnMain.addEventListener(MouseEvent.CLICK, Main);
			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);

		}
		function Instructions(e:MouseEvent):void {

			titleScreen.x=600;
			titleScreen.y=600;

			btnStart.x=600;
			btnStart.y=600;

			btnBack2.x=600;
			btnBack2.y=600;

			btnPlay.x=600;
			btnPlay.y=600;

			imgPikachu.x=600;
			imgPikachu.y=600;

			imgOnix.x=600;
			imgOnix.y=600;

			imgTogepi.x=600;
			imgTogepi.y=600;

			imgMouse.x=600;
			imgMouse.y=600;

			imgKeys.x=600;
			imgKeys.y=600;

			rbPikachu.move(600,600);
			rbOnix.move(600,600);
			rbTogepi.move(600,600);
			rbSingle.move(600,600);
			rbTwo.move(600,600);
			rbClassic.move(600,600);
			rbSurvival.move(600,600);
			rbNormal.move(600,600);
			rbHard.move(600,600);
			rbInsane.move(600,600);
			rbMouse.move(600,600);
			rbArrowKeys.move(600,600);

			lblPokemon.move(600,600);
			lblPlayers.move(600,600);
			lblMode.move(600,600);
			lblDifficulty.move(600,600);
			lblControls.move(600,600);


			imgInstruction.x=10;
			imgInstruction.y=10;

			btnNext.x=325;
			btnNext.y=360;

			animPokeBall.x=450;
			animPokeBall.y=45;

			imgCursor.x=400;
			imgCursor.y=100;

			btnBack.x=25;
			btnBack.y=360;

			profOak.x=375;
			profOak.y=225;

			dAnimVelX=4;
			dAnimVelY=4;
			tmrAnimMove.reset();
			tmrAnimMove.start();
			tmrAnimMove.addEventListener("timer", animationTimer);

		}
		function Main(e:MouseEvent):void {

			stage.removeEventListener(Event.ENTER_FRAME, followmouse);
			

			loseScreen.x=600;
			loseScreen.y=600;

			imgInstruction.x=600;
			imgInstruction.y=600;

			btnNext.x=600;
			btnNext.y=600;

			btnBack.x=600;
			btnBack.y=600;

			btnMain.x=600;
			btnMain.y=600;

			btnAgain.x=600;
			btnAgain.y=600;

			titleScreen.x=0;
			titleScreen.y=0;

			imgCursor.x=600;
			imgCursor.y=600;

			animPokeBall.x=600;
			animPokeBall.y=600;

			btnStart.x=175;
			btnStart.y=350;

			profOak.x=600;
			profOak.y=600;

			tmrAnimMove.removeEventListener("timer", animationTimer);


		}
		function Options(e:MouseEvent):void {
			imgInstruction.x=600;
			imgInstruction.y=600;

			btnNext.x=600;
			btnNext.y=600;

			imgCursor.x=600;
			imgCursor.y=600;

			animPokeBall.x=600;
			animPokeBall.y=600;

			btnBack.x=600;
			btnBack.y=600;

			profOak.x=600;
			profOak.y=600;

			imgPikachu.x=60;
			imgPikachu.y=160;
			imgPikachu.width=43.6;
			imgPikachu.height=49.5;

			imgOnix.x=60;
			imgOnix.y=220;
			imgOnix.width=48.1;
			imgOnix.height=53.0;

			imgTogepi.x=60;
			imgTogepi.y=280;
			imgTogepi.width=41.5;
			imgTogepi.height=49.7;

			imgMouse.x=275;
			imgMouse.y=155;

			imgKeys.x=375;
			imgKeys.y=155;

			btnBack2.x=25;
			btnBack2.y=360;

			btnPlay.x=325;
			btnPlay.y=360;

			lblPokemon.move(40,110);
			lblPlayers.move(60,20);
			lblMode.move(260,20);
			lblDifficulty.move(385,20);
			lblControls.move(320, 130);

			rbPikachu.move(100, 150);
			rbOnix.move(100, 210);
			rbTogepi.move(100, 270);
			rbSingle.move(40, 40);
			rbTwo.move(40, 60);
			rbClassic.move(230, 40);
			rbSurvival.move(230,60);
			rbNormal.move(375, 40);
			rbHard.move(375,60);
			rbInsane.move(375,80);
			rbArrowKeys.move(355,155);
			rbMouse.move(240,155);

			tmrAnimMove.removeEventListener("timer", animationTimer);
		}
		function Game(e:MouseEvent):void {

			nHealth=100;

			btnAgain.x=600;
			btnAgain.y=600;

			btnMain.x=600;
			btnMain.y=600;

			loseScreen.x=600;
			loseScreen.y=600;

			gameBackground.x=0;
			gameBackground.y=0;

			txtTimeRemaining.x=20;
			txtTimeRemaining.y=20;

			txtNumBalls.x=350;
			txtNumBalls.y=20;

			txtHealth.x=235;
			txtHealth.y=20;

			imgPikachu.x=600;
			imgPikachu.y=600;
			imgPikachu.width=23.6;
			imgPikachu.height=29.5;

			imgOnix.x=600;
			imgOnix.y=600;
			imgOnix.width=25.1;
			imgOnix.height=30;

			imgTogepi.x=600;
			imgTogepi.y=600;
			imgTogepi.width=21.5;
			imgTogepi.height=29.7;

			imgMouse.x=600;
			imgMouse.y=600;

			imgKeys.x=600;
			imgKeys.y=600;

			btnBack2.x=600;
			btnBack2.y=600;

			btnPlay.x=600;
			btnPlay.y=600;

			lblPokemon.move(600,600);
			lblPlayers.move(600,600);
			lblMode.move(600,600);
			lblDifficulty.move(600,600);
			lblControls.move(600, 600);

			rbPikachu.move(600, 600);
			rbOnix.move(600, 600);
			rbTogepi.move(600, 600);
			rbSingle.move(600, 600);
			rbTwo.move(600, 600);
			rbClassic.move(600, 600);
			rbSurvival.move(600,600);
			rbNormal.move(600, 600);
			rbHard.move(600,600);
			rbInsane.move(600,600);
			rbArrowKeys.move(600,600);
			rbMouse.move(600,600);

			nSec=20;

			stage.addEventListener(Event.ENTER_FRAME, followmouse);

			tmrClock.addEventListener("timer", timerClock);
			tmrClock.start();


			tmrSpawn.addEventListener("timer", spawningTimer);
			tmrSpawn.start();


		}
		function changeOver(e:MouseEvent):void {

			e.target.transform.colorTransform=new ColorTransform(0,0,0,1,79,91,255,-1);//Ben taught us aboout e.target

		}
		function changeOut(e:MouseEvent):void {
			e.target.transform.colorTransform=new ColorTransform(0,0,0,1,0,0,255,-1);

		}
		function animationTimer(event:TimerEvent):void {//A timer to move the objects in the instruction page
			animPokeBall.x-=1.5;
			animPokeBall.y+=1.5;

			imgCursor.x-=dAnimVelX;
			imgCursor.y-=dAnimVelY;

			if (tmrAnimMove.currentCount==15) {
				dAnimVelX=0;
				dAnimVelY=0;

			} else if (tmrAnimMove.currentCount == 60) {
				animPokeBall.x=450;
				animPokeBall.y=45;

				imgCursor.x=400;
				imgCursor.y=100;

				dAnimVelX=4;
				dAnimVelY=4;

				tmrAnimMove.reset();
				tmrAnimMove.start();
			}
		}
		public function spawningTimer(e:TimerEvent):void {//A timer to create the pokeballs
			//trace(tmrSpawn.currentCount);
			i=0;

			if (nNumBalls<9) {
				if (tmrSpawn.currentCount==1) {
					nX=Math.random()*460+10;
					nY=Math.random()*360+10;
					imgPokeBall = new ImgPokeBall();

					imgPokeBall.height=30;
					imgPokeBall.width=30;
					imgPokeBall.x=nX;
					imgPokeBall.y=nY;
					addChild(imgPokeBall);

					arBalls.push(imgPokeBall);


					nNumBalls++;
					addChild(arBalls[i]);//Do we even need?
					i++;


				}

			}
			if (nNumBalls==9) {

				if (tmrClock.currentCount==20) {// The 10th ball will spawn the "Master Ball"

					nX=Math.random()*460+10;
					nY=Math.random()*360+10;
					imgMasterBall = new ImgMasterBall();
					imgMasterBall.width=30;
					imgMasterBall.height=30;
					imgMasterBall.x=nX;
					imgMasterBall.y=nY;
					addChild(imgMasterBall);
					arBalls.push(imgMasterBall);
					nNumBalls++;
					trace(nNumBalls);
					addChild(arBalls[i]);
					i++;
				}
			}
			if (tmrClock.currentCount==20) {//For an exact 20 seconds, since working with the 50 milliseconds doesn't work well

				tmrSpawn.reset();
				tmrSpawn.start();
				tmrClock.reset();
				tmrClock.start();

			}

		}
		public function timerClock(e:TimerEvent):void {//Shows the time until the next ball spawns, also shows how many balls are on the stage
			trace(tmrClock.currentCount);
			txtNumBalls.text="# of balls spawned: "+String(nNumBalls);
			txtHealth.text="Health: "+String(nHealth);
			nSec--;
			if (nNumBalls<10) {
				txtTimeRemaining.text="Time until next ball: "+String(nSec);
				if (nSec==0) {
					nSec=20;
				}
			} else if (nNumBalls==10) {
				txtTimeRemaining.text="Time until win: "+String(nSec);
			}
		}
		function followmouse(e:Event):void {//images follow mouse, hit test
			imgPikachu.x=mouseX;
			imgPikachu.y=mouseY;
			mouseBorder.x=mouseX;
			mouseBorder.y=mouseY;
			Mouse.hide();
			for (i=0; i<nNumBalls; i++) {
				if (mouseBorder.hitTestObject(arBalls[i])) {
					if (imgPokeBall.pokeBall.alpha>0.99) {//So that you can't die while the ball is fading in
						nHealth-=5;
						txtHealth.textColor=0xFF0000;
					}


				} else {
					txtHealth.textColor=0x006600;
				}
			}
			if (nHealth<1) {
				for (i=0; i<nNumBalls; i++) {
					removeChild(arBalls[i]);
				}
				arBalls.splice(0, 10);
				nNumBalls=0;
				loseScreen.x=0;
				loseScreen.y=0;
				imgPikachu.x=600;
				imgPikachu.y=600;
				mouseBorder.x=600;
				mouseBorder.y=600;
				txtTimeRemaining.x=600;
				txtTimeRemaining.y=600;
				txtNumBalls.x=600;
				txtNumBalls.y=600;
				txtHealth.x=600;
				txtHealth.y=600;
				gameBackground.x=600;
				gameBackground.y=600;
				btnAgain.x=25;
				btnAgain.y=360;
				btnMain.x=325;
				btnMain.y=360;
				Mouse.show();

				tmrClock.reset();
				tmrSpawn.reset();
				tmrClock.removeEventListener("timer", timerClock);
				tmrSpawn.removeEventListener("timer", spawningTimer);
			}

		}
	}

}