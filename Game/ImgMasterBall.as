package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;

	public class ImgMasterBall extends MovieClip {
		var masterBall:MasterBall = new MasterBall();
		var tmrAlpha:Timer=new Timer(50);
		var tmrInterval:Timer=new Timer(1000);
		var tmrMove:Timer=new Timer(35);


		public function ImgMasterBall() {



			addChild(masterBall);
			masterBall.alpha=0;
			tmrAlpha.start();
			tmrAlpha.addEventListener("timer", changeAlpha);
			tmrMove.addEventListener("timer", moveball);

			tmrMove.start();

		}
		function changeAlpha(e:TimerEvent):void {
			if (masterBall.alpha<1) {
				masterBall.alpha+=0.05;

			}

		}

		function moveball(e:TimerEvent):void {

			if (masterBall.alpha>0.99) {
				masterBall.x=0.9*(masterBall.x-mouseX)+mouseX-2.5;
				masterBall.y=0.9*(masterBall.y-mouseY)+mouseY-2.5;


			}

		}

	}
}