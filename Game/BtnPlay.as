package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.ui.Mouse;
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import fl.controls.Label;
	
	
	public class BtnPlay extends MovieClip {
		var btnOuter:Sprite = new Sprite();
		var btnInner:Sprite = new Sprite();
		var lblBtn:Label = new Label();
		public function BtnPlay() {
			
			
		btnOuter.graphics.beginFill(0x0000FF);
		btnOuter.graphics.drawRect(0,0,200,40);
		addChild(btnOuter);
		btnInner.graphics.beginFill(0xFFCC00);
		btnInner.graphics.drawRect(25,10,150,20);
		addChild(btnInner);
			lblBtn.text="Play";
			lblBtn.x=85;
			lblBtn.y=10;
			lblBtn.width=40;
			addChild(lblBtn);
			 
			}
			
	}
}