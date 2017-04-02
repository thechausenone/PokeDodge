package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	
	
	public class alphatest1 extends MovieClip {
		var pokeball:PokeBall = new PokeBall();
		var tmrSpawn:Timer = new Timer(50);
		public function alphatest1() {
			
			pokeball.x=100;
			pokeball.y=100;
			pokeball.height=30;
			pokeball.width=30;
			pokeball.alpha=0;
		addChild(pokeball);
		
		tmrSpawn.start();
		
		tmrSpawn.addEventListener("timer", timerFunction);
		pokeball.addEventListener(Event.ENTER_FRAME, moveball);
			 
			}
			public function timerFunction(e:TimerEvent):void {
				trace(tmrSpawn.currentCount);
				if(pokeball.alpha<1) {
				if(tmrSpawn.currentCount>15) {
					pokeball.alpha+=0.05;
				}
				}
					
				} function moveball (e:Event):void {
					if(pokeball.alpha>0.99) {
						pokeball.x+=10;
						pokeball.y+=10;
					}
			}
	}
}