package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;

	public class ImgPokeBall extends MovieClip {
		var pokeBall:PokeBall = new PokeBall();
		var nRemainderX:int;
		var nRemainderY:int;
		var dVelX:Number;
		var dVelY:Number;
		var tmrAlpha:Timer=new Timer(50);
		var tmrInterval:Timer=new Timer(1000);

		public function ImgPokeBall() {

			nRemainderX=Math.random()*100%2;
			nRemainderY=Math.random()*100%2;
			addChild(pokeBall);
			pokeBall.alpha=0;
			pokeBall.addEventListener(Event.ENTER_FRAME, moveball);
			tmrAlpha.start();
			tmrAlpha.addEventListener("timer", changeAlpha);
			tmrInterval.addEventListener("timer",test);
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
		function changeAlpha(e:TimerEvent):void {
			if (pokeBall.alpha<1) {
				if (tmrAlpha.currentCount>15) {
					pokeBall.alpha+=0.05;
				}
			}
			if (tmrInterval.currentCount==20) {
				tmrAlpha.reset();
				tmrAlpha.start();
				tmrInterval.reset();
				tmrInterval.start();
			}
		}
		function test(e:TimerEvent):void {
		}
		function moveball(e:Event):void {

			if (pokeBall.alpha>0.99) {
				this.x+=dVelX;//Ben told us to use this.x or this.y when dealing with x and y coordinates of the pokeball
				this.y+=dVelY;
			}
			if (this.x>542.5) {
				dVelX*=-1;
			}
			if (this.x<7.5) {
				dVelX*=-1;
			}
			if (this.y>392.5) {
				dVelY*=-1;
			}
			if (this.y<7.5) {
				dVelY*=-1;
				

			}

		}

	}
}