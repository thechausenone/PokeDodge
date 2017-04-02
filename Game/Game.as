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

	public class Game5 extends MovieClip {
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
		var rbEasy:RadioButton = new RadioButton();
		var rbMedium:RadioButton = new RadioButton();
		var rbHard:RadioButton = new RadioButton();
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
		var dAnimVelX:Number=4;
		var dAnimVelY:Number=4;
		var tmrAnimMove:Timer=new Timer(25);
		var tmrSpawn:Timer=new Timer(50);
		var tmrInterval:Timer=new Timer(1000);
		var titleScreen:TitleScreen = new TitleScreen();
		var imgInstruction:ImgInstruction = new ImgInstruction();
		var pokeBall:PokeBall = new PokeBall();
		var animPokeBall:AnimPokeBall=new AnimPokeBall  ;
		var imgCursor:ImgCursor = new ImgCursor();
		var imgPikachu:ImgPikachu = new ImgPikachu();
		var imgOnix:ImgOnix = new ImgOnix();
		var imgTogepi:ImgTogepi = new ImgTogepi();
		var imgMouse:ImgMouse = new ImgMouse();
		var imgKeys:ImgKeys = new ImgKeys();
		var arBalls:Array = new Array();
		var i:int;
		var nNumBalls:int;
		var nX:int;
		var nY:int;
		var dVelX:Number;
		var dVelY:Number;
		var nRemainderX:int;
		var nRemainderY:int;


		public function Game5() {

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

			rbEasy.move(600, 600);
			rbEasy.label="Easy";
			rbEasy.group=rbgDifficulty;
			addChild(rbEasy);

			rbMedium.move(600, 600);
			rbMedium.label="Medium";
			rbMedium.group=rbgDifficulty;
			addChild(rbMedium);

			rbHard.move(600, 600);
			rbHard.label="Hard";
			rbHard.group=rbgDifficulty;
			addChild(rbHard);

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
			btnBack.addEventListener(MouseEvent.CLICK, InstructToMain);
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
			rbEasy.move(600,600);
			rbMedium.move(600,600);
			rbHard.move(600,600);
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
		function InstructToMain(e:MouseEvent):void {
			imgInstruction.x=600;
			imgInstruction.y=600;

			btnNext.x=600;
			btnNext.y=600;

			btnBack.x=600;
			btnBack.y=600;

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

			imgOnix.x=60;
			imgOnix.y=220;

			imgTogepi.x=60;
			imgTogepi.y=280;

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
			rbEasy.move(375, 40);
			rbMedium.move(375,60);
			rbHard.move(375,80);
			rbArrowKeys.move(355,155);
			rbMouse.move(240,155);

			tmrAnimMove.removeEventListener("timer", animationTimer);
		}
		function Game(e:MouseEvent):void {
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
			rbEasy.move(600, 600);
			rbMedium.move(600,600);
			rbHard.move(600,600);
			rbArrowKeys.move(600,600);
			rbMouse.move(600,600);

			tmrSpawn.start();

			tmrSpawn.addEventListener("timer", timerFunction);
			tmrInterval.start();
			tmrInterval.addEventListener("timer", test);


		}
		function changeOver(e:MouseEvent):void {

			e.target.transform.colorTransform=new ColorTransform(0,0,0,1,79,91,255,-1);//Ben taught us aboout e.target

		}
		function changeOut(e:MouseEvent):void {
			e.target.transform.colorTransform=new ColorTransform(0,0,0,1,0,0,255,-1);

		}
		function animationTimer(event:TimerEvent):void {
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
		function test(e:TimerEvent):void {
			//trace(tmrInterval.currentCount);
		}
		public function timerFunction(e:TimerEvent):void {
			//trace(tmrSpawn.currentCount);
			i=0;
			nNumBalls=0;
			if (nNumBalls<10) {
				if (tmrSpawn.currentCount==1) {
					nX=Math.random()*460+10;
					nY=Math.random()*360+10;
					pokeBall = new PokeBall();
					pokeBall.height=30;
					pokeBall.width=30;
					pokeBall.x=nX;
					pokeBall.y=nY;
					pokeBall.alpha=0;
					addChild(pokeBall);

					arBalls.push(pokeBall);
					pokeBall.addEventListener(Event.ENTER_FRAME, moveball);

					nNumBalls++;
					addChild(arBalls[i]);
					i++;
					trace(nX);
					trace(nY);
					nRemainderX=Math.random()*100%2;
					nRemainderY=Math.random()*100%2;
					trace(nRemainderX);
					if (nRemainderX==0) {
						dVelX=5;
					} else {
						dVelX=-5;
					}
					if (nRemainderY==0) {
						dVelY=5;
					} else {
						dVelY=-5;
					}

				}
				if (tmrInterval.currentCount==20) {//For an exact 20 seconds, since working with the 50 milliseconds doesn't work well
					tmrSpawn.reset();
					tmrSpawn.start();
					tmrInterval.reset();
					tmrInterval.start();
				}
			}

			if (pokeBall.alpha<1) {
				if (tmrSpawn.currentCount>15) {
					pokeBall.alpha+=0.05;
				}
			}

		}
		function moveball(e:Event):void {
				if (pokeBall.alpha>0.99) {//We'll have to change the way we move the balls for future releases

					pokeBall.x+=dVelX;
					pokeBall.y+=dVelY;
				
			}
		}
	}
}