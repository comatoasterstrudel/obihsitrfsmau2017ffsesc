package;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	var thesprites:Array<FlxSprite> = [];
	
	var progress:Int = 1;
	
	override public function create()
	{
		super.create();
		
		FlxG.sound.cache('assets/music/yay.mp3');
		FlxG.sound.cache('assets/music/liar.mp3');
		FlxG.sound.cache('assets/music/kevin durant.mp3');
		FlxG.sound.cache('assets/sounds/hell.mp3');
		FlxG.sound.cache('assets/sounds/elephant.mp3');

		for(i in 1...17){
			trace('make sprite $i');
			var sprite = new FlxSprite();
			
			if(i == 1 || i == 16){
				sprite.frames = FlxAtlasFrames.fromSparrow('assets/images/$i.png', 'assets/images/$i.xml');
				sprite.animation.addByPrefix('idle', 'idle', 5);
				sprite.animation.play('idle');
			} else {
				sprite.loadGraphic('assets/images/$i.png');
			}
			
			sprite.screenCenter();
			sprite.antialiasing = true;
			sprite.ID = i;
			add(sprite);
			thesprites.push(sprite);
		}
	}

	override public function update(elapsed:Float)
	{
		FlxG.mouse.visible = false;

		super.update(elapsed);
		
		if(FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed){
			progress ++;
			if(progress > 16) progress = 16; else updatething(progress);
		}
		
		for(i in thesprites){
			i.visible = (i.ID == progress);
		}
		
	}
	
	function updatething(id:Int):Void{
		switch(id){
			case 2:
				FlxG.sound.playMusic('assets/music/liar.mp3', .4);
			case 4:
				FlxG.sound.play('assets/sounds/elephant.mp3', .3);
			case 12:
				FlxG.sound.playMusic('assets/music/kevin durant.mp3', .4);
			case 14:
				FlxG.camera.shake();
				FlxG.sound.play('assets/sounds/hell.mp3', .3);
			case 16:
				FlxG.sound.playMusic('assets/music/yay.mp3', .3);
		}
	}
}
