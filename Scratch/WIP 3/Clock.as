package {
	import flash.display.MovieClip;
	import flash.utils.*;
	import flash.events.*;
	import flash.display.*;
	import flash.text.*;


	public class Clock extends MovieClip {
		var tmrClock:Timer=new Timer(1000);
		var nSec:int=20;
		var nNumBalls:int;
		var txtTimeRemaining:TextField = new TextField();
		var txtNumBalls:TextField = new TextField();
		var txtFormat:TextFormat = new TextFormat();
		var newFont = new Font1();

		public function Clock() {
			//http://www.republicofcode.com/tutorials/flash/as3text/
			txtFormat.size=10;
			txtFormat.font=newFont.fontName;
			txtTimeRemaining.defaultTextFormat=txtFormat;
			txtTimeRemaining.embedFonts=true;
			txtTimeRemaining.antiAliasType=AntiAliasType.ADVANCED;
			txtTimeRemaining.text="Time until next ball: 20";
			txtTimeRemaining.x=20;
			txtTimeRemaining.y=20;
			txtTimeRemaining.width =300 ;
			txtTimeRemaining.textColor=0x0000FF;
			addChild(txtTimeRemaining);
			
			txtNumBalls.defaultTextFormat=txtFormat;
			txtNumBalls.embedFonts=true;
			txtNumBalls.antiAliasType=AntiAliasType.ADVANCED;
			txtNumBalls.text="Number of balls spawned: 0";
			txtNumBalls.x=270;
			txtNumBalls.y=20;
			txtNumBalls.width =300 ;
			txtNumBalls.textColor=0x0000FF;
			addChild(txtNumBalls);

			tmrClock.addEventListener(TimerEvent.TIMER, timerClock);
			tmrClock.start();
		}
		public function timerClock(e:TimerEvent):void {
			txtNumBalls.text = "Number of balls spawned: " + String(nNumBalls);
			nSec--;
			txtTimeRemaining.text = "Time until next ball: " + String(nSec);
			if (nSec == 0) {
					nSec = 21;
	
			
		}
		}
	}
}