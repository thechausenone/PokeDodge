package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.geom.ColorTransform;

	public class Game extends MovieClip {
		
		var btnStart:BtnStart = new BtnStart();
		var titleScreen:TitleScreen = new TitleScreen();
		
		public function Game() {
			addChild(titleScreen);
			btnStart.x=175;
			btnStart.y=350;
			addChild(btnStart);


			
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OVER, changeOver);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_OUT, changeOut);
			btnStart.addEventListener(MouseEvent.CLICK, MainToInstruct);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_DOWN, changeOut);
			btnStart.btnOuter.addEventListener(MouseEvent.MOUSE_UP, changeOver);
			

		}
		function MainToInstruct(e:MouseEvent):void {
			btnStart.x=600;
			btnStart.y=600;
			titleScreen.x=600;
			titleScreen.y=600;
		}
		function changeOver(e:MouseEvent):void {
			
				e.target.transform.colorTransform=new ColorTransform(0,0,0,1,79,91,255,-1);
			
		}
		function changeOut(e:MouseEvent):void {
			
				e.target.transform.colorTransform=new ColorTransform(0,0,0,1,0,0,255,-1);
			
		}
	}
}