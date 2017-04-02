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
	
	public class Game2 extends MovieClip {
		var titleScreen:TitleScreen = new TitleScreen();
		var imgInstruction:ImgInstruction = new ImgInstruction();
		var pokeBall:PokeBall = new PokeBall();
		var profOak:ProfOak = new ProfOak();
		var imgCursor:ImgCursor = new ImgCursor();
		var btnStart:BtnStart = new BtnStart();
		var btnNext:BtnNext = new BtnNext();
		var btnBack:BtnBack = new BtnBack();
		var dAnimVelX:Number=4;
		var dAnimVelY:Number=4;
		var tmrAnimMove:Timer = new Timer(25);
		
		public function Game2() {
			
						
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
			
			imgCursor.x = 600;
			imgCursor.y = 600;
			imgCursor.width = 40;
			imgCursor.height = 35;
			addChild(imgCursor);
			
			pokeBall.x=600;
			pokeBall.y=600;
			pokeBall.width=40;
			pokeBall.height=40;
			addChild(pokeBall);
			
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnStart.addEventListener(MouseEvent.CLICK, MainToInstruct);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);
			
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnNext.addEventListener(MouseEvent.CLICK, InstructToOptions);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnNext.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);
			
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnBack.addEventListener(MouseEvent.CLICK, InstructToMain);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnBack.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);
		
		}
		function MainToInstruct(e:MouseEvent):void {
			
			titleScreen.x=600;
			titleScreen.y=600;
			
			btnStart.x=600;
			btnStart.y=600;
			
			imgInstruction.x=10;
			imgInstruction.y=10;
			
			btnNext.x=325;
			btnNext.y=360;
			
			pokeBall.x=450;
			pokeBall.y=45;
			
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
			tmrAnimMove.addEventListener("timer", timerFunction);
			
		} function InstructToMain (e:MouseEvent):void {
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
			
			pokeBall.x=600;
			pokeBall.y=600;
			
			btnStart.x=175;
			btnStart.y=350;
			
			profOak.x=600;
			profOak.y=600;

			tmrAnimMove.removeEventListener("timer", timerFunction);
			
			
		}
		function InstructToOptions (e:MouseEvent):void {
			imgInstruction.x=600;
			imgInstruction.y=600;
			
			btnNext.x=600;
			btnNext.y=600;
			
			imgCursor.x=600;
			imgCursor.y=600;
			
			pokeBall.x=600;
			pokeBall.y=600;
			
			btnBack.x=600;
			btnBack.y=600;
			
			profOak.x=600;
			profOak.y=600;
			
			tmrAnimMove.removeEventListener("timer", timerFunction);
		}
		
		
		function changeOver(e:MouseEvent):void {
			trace(e.target);
				e.target.transform.colorTransform=new ColorTransform(0,0,0,1,79,91,255,-1);
			
		}
		function changeOut(e:MouseEvent):void {
				e.target.transform.colorTransform=new ColorTransform(0,0,0,1,0,0,255,-1);
			
		}function timerFunction(event:TimerEvent):void {
			pokeBall.x -=  1.5;
			pokeBall.y +=  1.5;
			
			imgCursor.x-= dAnimVelX;
			imgCursor.y-= dAnimVelY;
			
			if(tmrAnimMove.currentCount == 15) {
				dAnimVelX=0;
				dAnimVelY=0;
				
			} else if (tmrAnimMove.currentCount == 60) {
				pokeBall.x=450;
				pokeBall.y=45;
				
				imgCursor.x=400;
				imgCursor.y=100;
				
				dAnimVelX=4;
				dAnimVelY=4;
				
				tmrAnimMove.reset();
				tmrAnimMove.start();
			}
			}
	}
}