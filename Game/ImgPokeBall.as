package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
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
		var tmrMove:Timer = new Timer(35);
		var dSpeed:Number=0;

		public function ImgPokeBall(_dSpeed:int) {
			dSpeed=_dSpeed;
			nRemainderX=Math.random()*100%2;
			nRemainderY=Math.random()*100%2;

			addChild(pokeBall);
			pokeBall.alpha=0;
			
			
			tmrAlpha.start();
			tmrAlpha.addEventListener("timer", changeAlpha);
			tmrMove.addEventListener("timer", moveball);

			tmrMove.start();
			if (nRemainderX==0) {
				dVelX=dSpeed;
			} else {
				dVelX=-dSpeed;
			}
			if (nRemainderY==5) {
				dVelY=dSpeed;
			} else {
				dVelY=-dSpeed;


			}
		}
		function changeAlpha(e:TimerEvent):void {
			if (pokeBall.alpha<1) {
					pokeBall.alpha+=0.05;
				
			}
			
		}
		function moveball(e:TimerEvent):void {

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