//figure out 2 player
package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.geom.ColorTransform;
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	import fl.controls.Label;

	public class Game11 extends MovieClip {
		var rbgPokemon:RadioButtonGroup=new RadioButtonGroup("Pokemon");
		var rbgControls:RadioButtonGroup=new RadioButtonGroup("Controls");
		var rbgMode:RadioButtonGroup=new RadioButtonGroup("Mode");
		var rbgDifficulty:RadioButtonGroup=new RadioButtonGroup("Difficulty");
		var rbgPlayers:RadioButtonGroup=new RadioButtonGroup("Number of Players");
		var rbPikachu:RadioButton=new RadioButton  ;
		var rbOnix:RadioButton=new RadioButton  ;
		var rbTogepi:RadioButton=new RadioButton  ;
		var rbSingle:RadioButton=new RadioButton  ;
		var rbTwo:RadioButton=new RadioButton  ;
		var rbWASD:RadioButton=new RadioButton  ;
		var rbMouse:RadioButton=new RadioButton  ;
		var rbClassic:RadioButton=new RadioButton  ;
		var rbSurvival:RadioButton=new RadioButton  ;
		var rbNormal:RadioButton=new RadioButton  ;
		var rbHard:RadioButton=new RadioButton  ;
		var rbInsane:RadioButton=new RadioButton  ;
		var lblPokemon:Label=new Label  ;
		var lblControls:Label=new Label  ;
		var lblMode:Label=new Label  ;
		var lblDifficulty:Label=new Label  ;
		var lblPlayers:Label=new Label  ;
		var profOak:ProfOak=new ProfOak  ;
		var btnStart:BtnStart=new BtnStart  ;
		var btnNext:BtnNext=new BtnNext  ;
		var btnBack:BtnBack=new BtnBack  ;
		var btnBack2:BtnBack2=new BtnBack2  ;
		var btnPlay:BtnPlay=new BtnPlay  ;
		var btnAgain:BtnAgain=new BtnAgain  ;
		var btnMain:BtnMain=new BtnMain  ;
		var dAnimVelX:Number=4;
		var dAnimVelY:Number=4;
		var tmrAnimMove:Timer=new Timer(25);
		var tmrSpawn:Timer=new Timer(50);
		var titleScreen:TitleScreen=new TitleScreen  ;
		var imgInstruction:ImgInstruction=new ImgInstruction  ;
		var imgPokeBall:ImgPokeBall;
		var imgMasterBall:ImgMasterBall;
		var animPokeBall:AnimPokeBall=new AnimPokeBall  ;
		var imgCursor:ImgCursor=new ImgCursor  ;
		var imgPikachu:ImgPikachu=new ImgPikachu  ;
		var imgPikachu2:ImgPikachu = new ImgPikachu();
		var imgOnix:ImgOnix=new ImgOnix  ;
		var imgOnix2:ImgOnix = new ImgOnix();
		var imgTogepi:ImgTogepi=new ImgTogepi  ;
		var imgTogepi2:ImgTogepi = new ImgTogepi();
		var imgMouse:ImgMouse=new ImgMouse  ;
		var imgKeys:ImgKeys=new ImgKeys  ;
		var arBalls:Array=new Array  ;
		var i:int;
		var nNumBalls:int=0;
		var nMaxBalls:int;
		var nWinBalls:int;
		var nX:int;
		var nY:int;
		var dVelX:Number;
		var dVelY:Number;
		var nRemainderX:int;
		var nRemainderY:int;
		var pokeBorder:Sprite=new Sprite  ;
		var pokeBorder2:Sprite = new Sprite();
		var tmrClock:Timer=new Timer(1000);
		var tmrDetection:Timer=new Timer(5);
		var nSec:int;
		var txtTimeRemaining:TextField=new TextField  ;
		var txtNumBalls:TextField=new TextField  ;
		var txtHealth:TextField=new TextField  ;
		var txtFormat:TextFormat=new TextFormat  ;
		var newFont=new Font1  ;
		var gameBackground:GameBackground=new GameBackground  ;
		var loseScreen:LoseScreen=new LoseScreen  ;
		var winScreen:WinScreen=new WinScreen  ;
		var backGround2:BackGround2 = new BackGround2();
		var nHealth:int;
		var imgPokemon;
		var imgPokemon2;
		var moveRight:Boolean=false;
		var moveLeft:Boolean=false;
		var moveUp:Boolean=false;
		var moveDown:Boolean=false;
		var CoordX:int;
		var CoordY:int;
		var dRadius:Number=15;
		var dSpeedX:Number=0;
		var dSpeedY:Number=0;
		var nMaxSpeed:int=10;
		var dAccel:Number=0.5;
		var nSpawnInterval:int;
		

		public function Game11() {//main screen, everything is created in this function and moved out of the screen)
			loseScreen.x=600;
			loseScreen.y=600;
			loseScreen.width=550;
			loseScreen.height=400;
			addChild(loseScreen);

			winScreen.x=600;
			winScreen.y=600;
			winScreen.width=550;
			winScreen.height=400;
			addChild(winScreen);

			gameBackground.x=600;
			gameBackground.y=600;
			gameBackground.height=400;
			gameBackground.width=550;
			gameBackground.alpha=0.65;
			addChild(gameBackground);

			backGround2.x=600;
			backGround2.y=600;
			backGround2.height=400;
			backGround2.width=550;
			backGround2.alpha=0.65;
			addChild(backGround2);

			pokeBorder.graphics.lineStyle(1,0xFF0000);
			pokeBorder.graphics.drawCircle(0,0,15);
			addChild(pokeBorder);
			pokeBorder.x=600;
			pokeBorder.y=600;
			
			pokeBorder2.graphics.lineStyle(1,0x0000FF);
			pokeBorder2.graphics.drawCircle(0,0,15);
			addChild(pokeBorder2);
			pokeBorder2.x=600;
			pokeBorder2.y=600;

			rbPikachu.move(600,600);
			rbPikachu.label="Pikachu";
			rbPikachu.group=rbgPokemon;
			addChild(rbPikachu);

			rbOnix.move(600,600);
			rbOnix.label="Onix";
			rbOnix.group=rbgPokemon;
			addChild(rbOnix);

			rbTogepi.move(600,600);
			rbTogepi.label="Togepi";
			rbTogepi.group=rbgPokemon;
			addChild(rbTogepi);

			rbSingle.move(600,600);
			rbSingle.label="Single Player";
			rbSingle.group=rbgPlayers;
			addChild(rbSingle);

			rbTwo.move(600,600);
			rbTwo.label="Two Player";
			rbTwo.group=rbgPlayers;
			addChild(rbTwo);

			rbWASD.move(600,600);
			rbWASD.label="";
			rbWASD.group=rbgControls;
			addChild(rbWASD);

			rbMouse.move(600,600);
			rbMouse.label="";
			rbMouse.group=rbgControls;
			addChild(rbMouse);

			rbClassic.move(600,600);
			rbClassic.label="Classic Mode";
			rbClassic.group=rbgMode;
			addChild(rbClassic);

			rbSurvival.move(600,600);
			rbSurvival.label="Survival Mode";
			rbSurvival.group=rbgMode;
			addChild(rbSurvival);

			//rbClassic.enabled=false;//These are not implemented yet
			//rbSurvival.enabled=false;

			rbNormal.move(600,600);
			rbNormal.label="Normal";
			rbNormal.group=rbgDifficulty;
			addChild(rbNormal);

			rbHard.move(600,600);
			rbHard.label="Hard";
			rbHard.group=rbgDifficulty;
			addChild(rbHard);

			rbInsane.move(600,600);
			rbInsane.label="Insane";
			rbInsane.group=rbgDifficulty;
			addChild(rbInsane);

			rbNormal.selected=true;//pre-select the normal modes
			rbClassic.selected=true;
			rbSingle.selected=true;
			rbMouse.selected=true;
			rbPikachu.selected=true;

			lblPokemon.move(600,600);
			lblPokemon.text="Choose Your Pokemon!";
			lblPokemon.width=150;
			addChild(lblPokemon);

			lblControls.move(600,600);
			lblControls.text="Mouse or Keyboard?";
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

			imgOnix2.x=600;
			imgOnix2.y=600;
			imgOnix2.width=23.1;
			imgOnix2.height=28;
			addChild(imgOnix2);

			imgTogepi.x=600;
			imgTogepi.y=600;
			addChild(imgTogepi);

			imgTogepi2.x=600;
			imgTogepi2.y=600;
			imgTogepi2.width=21.5;
			imgTogepi2.height=29.7;
			addChild(imgTogepi2);

			imgPikachu.x=600;
			imgPikachu.y=600;
			addChild(imgPikachu);

			imgPikachu2.x=600;
			imgPikachu2.y=600;
			imgPikachu2.width=23.6;
			imgPikachu2.height=29.5;
			addChild(imgPikachu2);

			imgInstruction.x=600;
			imgInstruction.y=600;
			addChild(imgInstruction);
			
			addChild(titleScreen);

			profOak.x=600;
			profOak.y=600;
			profOak.height=145;
			profOak.width=145;
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

			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);//These event listeners make the button light up
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);//There's a way to simplify this
			btnStart.addEventListener(MouseEvent.CLICK,Instructions);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);
			btnNext.addEventListener(MouseEvent.CLICK,Options);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);
			btnBack.addEventListener(MouseEvent.CLICK,Main);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);
			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);
			btnBack2.addEventListener(MouseEvent.CLICK,Instructions);
			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnBack2.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);
			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);
			btnPlay.addEventListener(MouseEvent.CLICK,Game);
			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnPlay.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);
			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);
			btnAgain.addEventListener(MouseEvent.CLICK,Game);
			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnAgain.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_OVER,changeOver);
			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_OUT,changeOut);
			btnMain.addEventListener(MouseEvent.CLICK,Main);
			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN,changeOut);
			btnMain.btnOuter.addEventListener(MouseEvent.MOUSE_UP,changeOver);

		}
		function Instructions(e:MouseEvent):void {//Moving images and objects in and out for the instruction screen

			backGround2.x=0;
			backGround2.y=0;

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
			rbWASD.move(600,600);

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

			profOak.x=355;
			profOak.y=190;

			dAnimVelX=4;
			dAnimVelY=4;
			tmrAnimMove.reset();
			tmrAnimMove.start();
			tmrAnimMove.addEventListener("timer",animationTimer);

		}
		function Main(e:MouseEvent):void {//Moving objects and images in and out for the main menu

			backGround2.x=600;
			backGround2.y=600;

			winScreen.x=600;
			winScreen.y=600;

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

			tmrAnimMove.removeEventListener("timer",animationTimer);

		}
		function Options(e:MouseEvent):void {//Moving objects and images in and out for the options screen

			backGround2.x=0;
			backGround2.y=0;

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
			imgKeys.y=160;

			btnBack2.x=25;
			btnBack2.y=360;

			btnPlay.x=325;
			btnPlay.y=360;

			lblPokemon.move(40,110);
			lblPlayers.move(60,20);
			lblMode.move(260,20);
			lblDifficulty.move(385,20);
			lblControls.move(320,130);

			rbPikachu.move(100,150);
			rbOnix.move(100,210);
			rbTogepi.move(100,270);
			rbSingle.move(40,40);
			rbTwo.move(40,60);
			rbClassic.move(230,40);
			rbSurvival.move(230,60);
			rbNormal.move(375,40);
			rbHard.move(375,60);
			rbInsane.move(375,80);
			rbWASD.move(355,155);
			rbMouse.move(240,155);
			rbSingle.addEventListener(MouseEvent.CLICK,enableButtons);
			rbTwo.addEventListener(MouseEvent.CLICK,disableButtons);
			tmrAnimMove.removeEventListener("timer",animationTimer);
		}
		function disableButtons(e:MouseEvent):void {
			rbWASD.enabled=false;//disables the ability to choose mouse/keyboard as player 1=mouse & player 2=keyboard
			rbMouse.enabled=false;

		}
		function enableButtons(e:MouseEvent):void {
			rbWASD.enabled=true;//enables the ability to choose mouse/keyboard when the user clicks "Single Player"
			rbMouse.enabled=true;
		}
		function Game(e:MouseEvent):void {//start the game, move images and objects out and in
			if(rbClassic.selected) {
				nMaxBalls=9;
			}else if(rbSurvival.selected) {
				nMaxBalls=9999;
			}

			if(rbSingle.selected) {
			nHealth=100;
			}else if(rbTwo.selected){
				nHealth=200;
			}
			nWinBalls=nMaxBalls+1;

			backGround2.x=600;
			backGround2.y=600;

			btnAgain.x=600;
			btnAgain.y=600;

			btnMain.x=600;
			btnMain.y=600;

			loseScreen.x=600;
			loseScreen.y=600;

			winScreen.x=600;
			winScreen.y=600;

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
			imgOnix.width=23.1;
			imgOnix.height=28;

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
			lblControls.move(600,600);

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
			rbWASD.move(600,600);
			rbMouse.move(600,600);

			if (rbNormal.selected||rbSurvival.selected) {//Balls will spawn every 10 seconds
				nSpawnInterval=10;
			} else if (rbHard.selected) {//every 15
				nSpawnInterval=15;
			} else if (rbInsane.selected) {// every 20
				nSpawnInterval=20;
			}
			nSec=nSpawnInterval;
			if (rbPikachu.selected) {
				imgPokemon=imgPikachu;
				if (rbTwo.selected) {
					imgPokemon2=imgPikachu2;
				}
			} else if (rbOnix.selected) {
				imgPokemon=imgOnix;
				if (rbTwo.selected) {
					imgPokemon2=imgOnix2;
				}
			} else if (rbTogepi.selected) {
				imgPokemon=imgTogepi;
				if (rbTwo.selected) {
					imgPokemon2=imgTogepi2;
				}
			}
			imgPokemon.x=300;
			imgPokemon.y=300;
			if(rbTwo.selected) {
			imgPokemon2.x=300;
			imgPokemon2.y=300;
			}

			if (rbTwo.selected) {
				stage.addEventListener(Event.ENTER_FRAME,followmouse);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, downKeyp1);
				stage.addEventListener(KeyboardEvent.KEY_UP, upKeyp1);
				stage.addEventListener(Event.ENTER_FRAME, moveItp1);
			} else if (rbMouse.selected) {
				stage.addEventListener(Event.ENTER_FRAME,followmouse);
			} else if (rbWASD.selected&&rbSingle.selected) {
				stage.addEventListener(KeyboardEvent.KEY_DOWN,downKeyp1);
				stage.addEventListener(KeyboardEvent.KEY_UP,upKeyp1);
				stage.addEventListener(Event.ENTER_FRAME,moveItp1);
			}

			tmrClock.addEventListener("timer",timerClock);
			tmrClock.start();

			tmrSpawn.addEventListener("timer",spawningTimer);
			tmrSpawn.start();

			tmrDetection.addEventListener("timer",hitTest);
			tmrDetection.start();


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

			} else if (tmrAnimMove.currentCount==60) {
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
			i=0;
			
			if (nNumBalls<nMaxBalls) {//This allows a maximum of 9 normal pokeballs on classic mode
				if (tmrSpawn.currentCount==1) {
					nX=Math.random()*460+10;//To generate a random x and y coordinate for the ball when it spawns
					nY=Math.random()*360+10;
					if (rbNormal.selected) {
						imgPokeBall=new ImgPokeBall(5);//this makes the speed of the ball 5
					} else if (rbHard.selected) {
						imgPokeBall=new ImgPokeBall(6.5);//this makes the speed 6.5
					} else if (rbInsane.selected) {
						imgPokeBall=new ImgPokeBall(8);
					}//this makes it 8


					imgPokeBall.height=30;
					imgPokeBall.width=30;
					imgPokeBall.x=nX;
					imgPokeBall.y=nY;
					addChild(imgPokeBall);
					arBalls.push(imgPokeBall);

					nNumBalls++;
				}
			}
			if (nNumBalls==nMaxBalls) {
				if (tmrClock.currentCount==nSpawnInterval) {// The 10th ball will spawn the "Master Ball" if on classic mode
					nX=Math.random()*460+10;
					nY=Math.random()*360+10;
					imgMasterBall=new ImgMasterBall  ;
					imgMasterBall.width=30;
					imgMasterBall.height=30;
					imgMasterBall.x=nX;
					imgMasterBall.y=nY;
					addChild(imgMasterBall);
					arBalls.push(imgMasterBall);
					stage.addEventListener(Event.ENTER_FRAME, movemasterball);
					nNumBalls++;
				}
			}
			if (tmrClock.currentCount==nSpawnInterval) {//For an exact 20 seconds, since working with the 50 milliseconds doesn't work well

				tmrSpawn.reset();
				tmrSpawn.start();
				tmrClock.reset();
				tmrClock.start();
			}

		}
		public function timerClock(e:TimerEvent):void {//Shows the time until the next ball spawns, how many balls are on the stage, and health
			trace(tmrClock.currentCount);
			trace(nNumBalls+"balls");
			txtNumBalls.text="# of balls spawned: "+String(nNumBalls);
			txtHealth.text="Health: "+String(nHealth);
			nSec--;
			if (nSec==0) {
				nSec=nSpawnInterval;
			}
			if (nNumBalls<nMaxBalls) {
				txtTimeRemaining.text="Time until next ball: "+String(nSec);

			} else if (nNumBalls==nMaxBalls) {
				txtTimeRemaining.text="Time until win: "+String(nSec);

			}
		}
		function hitTest(e:TimerEvent):void {
			for (i=0; i<nNumBalls; i++) {
				if (pokeBorder.hitTestObject(arBalls[i])||pokeBorder2.hitTestObject(arBalls[i])) {
					if (imgPokeBall.pokeBall.alpha>0.99) {//So that you can't die while the ball is fading in
						nHealth-=1;
						txtHealth.textColor=0xFF0000;
						trace("test");
					}
				} else {
					txtHealth.textColor=0x006600;//health turns red when you're hit
				}
			}
			if (nHealth<1) {//losing condition
				for (i=0; i<nNumBalls; i++) {
					removeChild(arBalls[i]);
				}
				if (rbTwo.selected) {
				imgPokemon2.x=600;
				imgPokemon2.y=600;
				pokeBorder2.x=600;
				pokeBorder2.y=600;
				}
				arBalls.splice(0,nNumBalls);
				nNumBalls=0;
				loseScreen.x=0;
				loseScreen.y=0;
				imgPokemon.x=600;
				imgPokemon.y=600;
				
				pokeBorder.x=600;
				pokeBorder.y=600;
				
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
				moveUp=false;
				moveDown=false;
				moveRight=false;
				moveLeft=false;
				tmrClock.reset();
				tmrSpawn.reset();
				tmrClock.removeEventListener("timer",timerClock);
				tmrSpawn.removeEventListener("timer",spawningTimer);
				stage.removeEventListener(Event.ENTER_FRAME,followmouse);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN,downKeyp1);
				stage.removeEventListener(KeyboardEvent.KEY_UP,upKeyp1);
				stage.removeEventListener(Event.ENTER_FRAME,moveItp1);
				tmrDetection.stop();
			}
			if (nNumBalls==nWinBalls&&tmrClock.currentCount==nSpawnInterval) {//winning condition
				for (i=0; i<nNumBalls; i++) {
					removeChild(arBalls[i]);
				}
				if (rbTwo.selected) {
				imgPokemon2.x=600;
				imgPokemon2.y=600;
				pokeBorder2.x=600;
				pokeBorder2.y=600;
				}
				arBalls.splice(0,10);
				nNumBalls=0;
				winScreen.x=0;
				winScreen.y=0;
				imgPokemon.x=600;
				imgPokemon.y=600;
				
				pokeBorder.x=600;
				pokeBorder.y=600;
				
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
				tmrClock.removeEventListener("timer",timerClock);
				tmrSpawn.removeEventListener("timer",spawningTimer);
				stage.removeEventListener(Event.ENTER_FRAME,followmouse);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN,downKeyp1);
				stage.removeEventListener(KeyboardEvent.KEY_UP,upKeyp1);
				stage.removeEventListener(Event.ENTER_FRAME,moveItp1);
				tmrDetection.stop();
			}
		}
		function followmouse(e:Event):void {//images follow mouse, hit test
			imgPokemon.x=mouseX;
			imgPokemon.y=mouseY;
			pokeBorder.x=imgPokemon.x;
			pokeBorder.y=imgPokemon.y;
			Mouse.hide();

		}
		function movemasterball(e:Event):void {

			if (imgMasterBall.masterBall.alpha>0.99) {
				imgMasterBall.x=0.9*(imgMasterBall.x-imgPokemon.x)+imgPokemon.x-2.5;
				imgMasterBall.y=0.9*(imgMasterBall.y-imgPokemon.y)+imgPokemon.y-2.5;


			}

		}
		function downKeyp1(event:KeyboardEvent):void {//This is a smooth way of moving the ball
			//http://kirill-poletaev.blogspot.ca/2010/07/smooth-character-movement-using-as3.html
			//if an arrow key is pressed, boolean is true
			if (event.keyCode==87) {//up move
				moveUp=true;

			} else if (event.keyCode==83) {//down move
				moveDown=true;

			} else if (event.keyCode==65) {//left move
				moveLeft=true;

			} else if (event.keyCode==68) {//right move
				moveRight=true;
			}
		}


		function upKeyp1(event:KeyboardEvent):void {
			//if an arrow key is not pressed/released, boolean is false
			if (event.keyCode==87) {//up move
				moveUp=false;

			} else if (event.keyCode==83) {//down move
				moveDown=false;

			} else if (event.keyCode==65) {//left move
				moveLeft=false;

			} else if (event.keyCode==68) {//right 
				moveRight=false;
			}
		}
		function moveItp1(event:Event):void {
			//apply the speed to the object
			if (rbSingle.selected) {
				imgPokemon.x+=dSpeedX;
				imgPokemon.y+=dSpeedY;
				pokeBorder.x=imgPokemon.x;
				pokeBorder.y=imgPokemon.y;
			} else {
				imgPokemon2.x+=dSpeedX;
				imgPokemon2.y+=dSpeedY;
				pokeBorder2.x=imgPokemon2.x;
				pokeBorder2.y=imgPokemon2.y;

			}
			if (moveRight==true&&dSpeedX<nMaxSpeed) {
				dSpeedX+=2;
			}
			if (moveLeft==true&&dSpeedX>- nMaxSpeed) {
				dSpeedX-=2;
			}
			if (dSpeedX>0) {
				dSpeedX-=dAccel;
			}
			if (dSpeedX<0) {
				dSpeedX+=dAccel;
			}

			if (moveDown==true&&dSpeedY<nMaxSpeed) {
				dSpeedY+=2;
			}
			if (moveUp==true&&dSpeedY>- nMaxSpeed) {
				dSpeedY-=2;
			}
			if (dSpeedY>0) {
				dSpeedY-=dAccel;
			}
			if (dSpeedY<0) {
				dSpeedY+=dAccel;
			}

			if (rbSingle.selected) {
				CoordX=imgPokemon.x;
				CoordY=imgPokemon.y;// if the ball hits a wall, the ball will stop
				if (imgPokemon.x>stage.stageWidth) {
					pokeBorder.x=stage.stageWidth;
					imgPokemon.x=stage.stageWidth;
				} else if (imgPokemon.x<0) {
					imgPokemon.x=0;
				} else if (imgPokemon.y>stage.stageHeight) {
					pokeBorder.y=stage.stageHeight;
					imgPokemon.y=stage.stageHeight;
				} else if (imgPokemon.y<0) {
					imgPokemon.y=0;
				}
			} else {
				CoordX=imgPokemon2.x;
				CoordY=imgPokemon2.y;// if the ball hits a wall, the ball will stop
				if (imgPokemon2.x>stage.stageWidth) {
					pokeBorder2.x=stage.stageWidth;
					imgPokemon2.x=stage.stageWidth;
				} else if (imgPokemon2.x<0) {
					pokeBorder2.x=0;
					imgPokemon2.x=0;
				} else if (imgPokemon2.y>stage.stageHeight) {
					imgPokemon2.y=stage.stageHeight;
					pokeBorder2.y=stage.stageHeight;
				} else if (imgPokemon2.y<0) {
					pokeBorder2.y=0;
					imgPokemon2.y=0;

				}
			}
		}
	}
}