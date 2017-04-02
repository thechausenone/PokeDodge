package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
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
			
			
		}
		function changeAlpha(e:TimerEvent):void {
			if (masterBall.alpha<1) {
				masterBall.alpha+=0.05;

			}

		}

		

	}
}