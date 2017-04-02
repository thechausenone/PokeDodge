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
	
	public class Game1 extends MovieClip {
		var imgInstruction:ImgInstruction = new ImgInstruction();
		var profOak:ProfOak = new ProfOak();
		var titleScreen:TitleScreen = new TitleScreen();
		var btnStart:BtnStart = new BtnStart();
		var btnNext:BtnNext = new BtnNext();
		var btnBack:BtnBack = new BtnBack();
		public function Game1() {
			
			profOak.x=600;
			profOak.y=600;
			addChild(profOak);
			
			imgInstruction.x=600;
			imgInstruction.y=600;
			addChild(imgInstruction);
			addChild(titleScreen);
			btnStart.x=175;
			btnStart.y=350;
			addChild(btnStart);
			
			btnNext.x=600;
			btnNext.y=600;
			addChild(btnNext);
			
			btnBack.x=600;
			btnBack.y=600;
			addChild(btnBack);


			
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
			btnBack.x=25;
			btnBack.y=360;
			profOak.x=375;
			profOak.y=225;
		}
		function InstructToMain (e:MouseEvent):void {
			imgInstruction.x=600;
			imgInstruction.y=600;
			btnNext.x=600;
			btnNext.y=600;
			btnBack.x=600;
			btnBack.y=600;
			titleScreen.x=0;
			titleScreen.y=0;
			btnStart.x=175;
			btnStart.y=350;
			profOak.x=600;
			profOak.y=600;
		}
		function InstructToOptions (e:MouseEvent):void {
			imgInstruction.x=600;
			imgInstruction.y=600;
			btnNext.x=600;
			btnNext.y=600;
			btnBack.x=600;
			btnBack.y=600;
			profOak.x=600;
			profOak.y=600;
		}
		
		
		function changeOver(e:MouseEvent):void {
			
				e.target.transform.colorTransform=new ColorTransform(0,0,0,1,79,91,255,-1);
			
		}
		function changeOut(e:MouseEvent):void {
			
				e.target.transform.colorTransform=new ColorTransform(0,0,0,1,0,0,255,-1);
			
		
			}
	}
}