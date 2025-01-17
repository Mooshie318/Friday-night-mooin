package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;
	public var iconColor:String = 'FFFF0000'; // for healthbar shit

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByPrefix('space', 'GF press space', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset("space", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				iconColor = 'FFD5007C';

				playAnim('danceRight');

			case 'gf-airship':
				tex = Paths.getSparrowAtlas('airship/gf', 'shared');
				frames = tex;
				animation.addByIndices('danceLeft',  'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('singLEFT',    'GF left note',    24, false);
				animation.addByPrefix('singRIGHT',   'GF Right Note',   24, false);
				animation.addByPrefix('singUP',      'GF Up Note',      24, false);
				animation.addByPrefix('singDOWN',    'GF Down Note',    24, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP",    -9, 11);
				addOffset("singRIGHT", -2, -12);
				addOffset("singLEFT",  0, -10);
				addOffset("singDOWN",  -12, -9);

				iconColor = 'FFD5007C';

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('christmas/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				iconColor = 'FFD5007C';

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				iconColor = 'FFD5007C';

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('weeb/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

				iconColor = 'FFD5007C';
			
			case 'grilfen':
				tex = Paths.getSparrowAtlas('grilfen', 'shared');
				frames = tex;
				animation.addByIndices('danceLeft', 'dance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'dance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				iconColor = 'FFD5007C';

				playAnim('danceRight');

			case 'slime':
				tex = Paths.getSparrowAtlas('slime_crew');
				frames = tex;
				animation.addByPrefix('idle', 'slime idle', 24);
				animation.addByPrefix('singUP', 'slime up', 24);
				animation.addByPrefix('singRIGHT', 'slime right', 24);
				animation.addByPrefix('singDOWN', 'slime down', 24);
				animation.addByPrefix('singLEFT', 'slime left', 24);

				addOffset('idle');
				addOffset("singUP", 23, 18);
				addOffset("singRIGHT", 0, 22);
				addOffset("singLEFT", 85, 11);
				addOffset("singDOWN", 0, -18);

				iconColor = 'FF0000FF';

				playAnim('idle');

			case 'james':
				tex = Paths.getSparrowAtlas('james', 'week2');
				frames = tex;
				animation.addByPrefix('idle', 'James idle', 24);
				animation.addByPrefix('singUP', 'James up', 24, false);
				animation.addByPrefix('singDOWN', 'James down', 24, false);
				animation.addByPrefix('singLEFT', 'James left', 24, false);
				animation.addByPrefix('singRIGHT', 'James right', 24, false);

				addOffset('idle');
				addOffset("singUP", -5, 32);
				addOffset("singRIGHT", -60, 30);
				addOffset("singLEFT", 20, 20);
				addOffset("singDOWN");

				iconColor = 'FFFFFFFF';

				playAnim('idle');

			case 'sheary':
				tex = Paths.getSparrowAtlas('sheary', 'week4');
				frames = tex;

				animation.addByPrefix('idle', "idle", 24, false);
				animation.addByPrefix('singUP', "up", 24, false);
				animation.addByPrefix('singDOWN', "down", 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
				addOffset("singUP", 37, 140);
				addOffset("singRIGHT", 0, -6);
				addOffset("singLEFT", 16, 1);
				addOffset("singDOWN", 4, -30);

				iconColor = 'FFFFFFFF';

				playAnim('idle');

			case 'madcloud':
				tex = Paths.getSparrowAtlas('madCloud', 'week4');
				frames = tex;

				animation.addByPrefix('idle', "c idle", 24, false);
				animation.addByPrefix('singUP', "c up", 24, false);
				animation.addByPrefix('singDOWN', "c down", 24, false);
				animation.addByPrefix('singLEFT', 'c left', 24, false);
				animation.addByPrefix('singRIGHT', 'c right', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");

				iconColor = 'FF666666';

				playAnim('idle');

				case 'ghost':
					tex = Paths.getSparrowAtlas('ghost-with-a-fucking-gun');
					frames = tex;
					animation.addByPrefix('idle', "ghost idle", 24);
					animation.addByPrefix('singUP', 'ghost up', 24, false);
					animation.addByPrefix('singDOWN', 'ghost down', 24, false);
					animation.addByPrefix('singLEFT', 'ghost left', 24, false);
					animation.addByPrefix('singRIGHT', 'ghost right', 24, false);
	
					addOffset('idle');
					addOffset("singUP");
					addOffset("singRIGHT");
					addOffset("singLEFT");
					addOffset("singDOWN");
	
					setGraphicSize(Std.int(width * 2));
					updateHitbox();

					iconColor = 'FFFFFFFF';
	
					playAnim('idle');
	
					width -= 100;
					height -= 100;
	
					antialiasing = false;

			case 'bf':
				var tex = Paths.getSparrowAtlas('BOYFRIEND','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking', 24);				

				animation.addByPrefix('hit', 'BF hit', 24, false);
				animation.addByPrefix('dodge', 'boyfriend dodge', 24, false);
				animation.addByPrefix('preattack', 'bf pre attack', 24, false);
				animation.addByPrefix('attack', 'boyfriend attack', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('frozen', 'BF frozen', 24, true);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				addOffset('hit', 30, 25);
				addOffset('dodge', 0, -8);
				addOffset('preattack', -25, -37);
				addOffset('attack', 300, 274);
				addOffset('frozen', 68, 171);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-opponent':
				var tex = Paths.getSparrowAtlas('BF Opponent','shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", 3, 30);
				addOffset("singRIGHT", -25, 4);
				addOffset("singLEFT", 16, -2);
				addOffset("singDOWN", -22, -50);

				iconColor = 'FF009BFF';

				playAnim('idle');

			case 'bf-opponent-f':
				var tex = Paths.getSparrowAtlas('BF Opponent','shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", 3, 30);
				addOffset("singRIGHT", -2, -2);
				addOffset("singLEFT", 5, 4);
				addOffset("singDOWN", -2, -50);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-flipped':
				var tex = Paths.getSparrowAtlas('BF flipped','shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", 3, 30);
				addOffset("singRIGHT", -25, 4);
				addOffset("singLEFT", 16, -2);
				addOffset("singDOWN", -22, -50);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-neon':
				var tex = Paths.getSparrowAtlas('BF_assets_2');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'miss up reg color', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left miss reg color', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf right miss reg color', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down miss reg color', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking', 24);
	
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -18, -56);
				addOffset("singUPmiss", -42, 17);
				addOffset("singRIGHTmiss", -44, -14);
				addOffset("singLEFTmiss", -13, -21);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('scared', -4);

				iconColor = 'FF00E500';
	
				playAnim('idle');
	
				flipX = true;

			case 'bf-battle':
				var tex = Paths.getSparrowAtlas('battle/bf-battle', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUPmiss', 'up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down', 24, false);

				animation.addByPrefix('hit', 'hit', 24, false);
				animation.addByPrefix('dodge', 'dodge', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 31);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, -26);
				addOffset("singUPmiss", 0, 31);
				addOffset("singRIGHTmiss", 0, 0);
				addOffset("singLEFTmiss", 0, 0);
				addOffset("singDOWNmiss", 0, -26);
				addOffset('hit', 17, 0);
				addOffset('dodge', 160, 12);
				addOffset('attack', 0, 200);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;
			
			case 'bf-bDiagonal':
				var tex = Paths.getSparrowAtlas('aay/characters/bf-bDIagonal', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUPmiss', 'up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", -23, 3);
				addOffset("singRIGHT", -19, -3);
				addOffset("singLEFT", 5, -3);
				addOffset("singDOWN", 3, -9);
				addOffset("singUPmiss", -23, 3);
				addOffset("singRIGHTmiss", -19, -3);
				addOffset("singLEFTmiss", 5, -3);
				addOffset("singDOWNmiss", 3, -9);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-bDiagonal-f':
				var tex = Paths.getSparrowAtlas('aay/characters/bf-bDIagonal-f', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUPmiss', 'up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", 1, 7);
				addOffset("singRIGHT", -7, -4);
				addOffset("singLEFT", 12, -4);
				addOffset("singDOWN", -7, -3);
				addOffset("singUPmiss", 1, 7);
				addOffset("singRIGHTmiss", -7, -4);
				addOffset("singLEFTmiss", 12, -4);
				addOffset("singDOWNmiss", -7, -3);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-frDiagonal':
				var tex = Paths.getSparrowAtlas('aay/characters/bf-frDiagonal', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUPmiss', 'up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", -33, 11);
				addOffset("singRIGHT", -36, 0);
				addOffset("singLEFT", -20, 0);
				addOffset("singDOWN", -34, -24);
				addOffset("singUPmiss", -33, 11);
				addOffset("singRIGHTmiss", -36, 0);
				addOffset("singLEFTmiss", -20, 0);
				addOffset("singDOWNmiss", -34, -24);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-frDiagonal-f':
				var tex = Paths.getSparrowAtlas('aay/characters/bf-frDiagonal-f', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUPmiss', 'up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", -30, 10);
				addOffset("singRIGHT", -35, 2);
				addOffset("singLEFT", -30, 1);
				addOffset("singDOWN", -34, -24);
				addOffset("singUPmiss", -30, 10);
				addOffset("singRIGHTmiss", -35, 2);
				addOffset("singLEFTmiss", -30, 1);
				addOffset("singDOWNmiss", -34, -24);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-front':
				var tex = Paths.getSparrowAtlas('aay/characters/bf-front', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUPmiss', 'up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", -30, 10);
				addOffset("singRIGHT", -35, 2);
				addOffset("singLEFT", -27, 3);
				addOffset("singDOWN", -34, -24);
				addOffset("singUPmiss", -30, 10);
				addOffset("singRIGHTmiss", -35, 2);
				addOffset("singLEFTmiss", -27, 3);
				addOffset("singDOWNmiss", -34, -24);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'bf-car':
				var tex = Paths.getSparrowAtlas('bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;
			
			case 'bofen':
				var tex = Paths.getSparrowAtlas('bofen','shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, true);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);

				addOffset('idle');
				addOffset("singUP", -40, 4);
				addOffset("singRIGHT", -120, 0);
				addOffset("singLEFT", -94, 0);
				addOffset("singDOWN", -98, 0);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;

			case 'trooper':
				frames = Paths.getSparrowAtlas('trooper/trooper', 'week6');
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);

				addOffset('idle');
				addOffset("singUP", -3, 37);
				addOffset("singRIGHT", 50, -100);
				addOffset("singLEFT", 123, 0);
				addOffset("singDOWN", -20, -100);
				addOffset('attack');

				iconColor = 'FFFFFF00';

				playAnim('idle');

			case 'cluckington':
				frames = Paths.getSparrowAtlas('cluck/cluckington', 'week5');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle'); 
				addOffset("singUP", 20, 170);
				addOffset("singRIGHT", -20, -20);
				addOffset("singLEFT", 23, -12);
				addOffset("singDOWN", 40, 80);

				iconColor = 'FFFFFFFF';

				playAnim('idle');

			case 'clooshie':
				frames = Paths.getSparrowAtlas('cluck/clooshie', 'week5');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle'); 
				addOffset("singUP", 10, 170);
				addOffset("singRIGHT", -24, 0);
				addOffset("singLEFT", 23, -1);
				addOffset("singDOWN", 50, 100);

				iconColor = 'FFFF0000';

				playAnim('idle');

			case 'gooey':
				frames = Paths.getSparrowAtlas('airship/gooey', 'shared');

				animation.addByPrefix('idle', 'gooey idle', 24, false);
				animation.addByPrefix('singUP', 'gooey up', 24, false);
				animation.addByPrefix('singDOWN', 'gooey down', 24, false);
				animation.addByPrefix('singLEFT', 'gooey left', 24, false);
				animation.addByPrefix('singRIGHT', 'gooey right', 24, false);
				animation.addByPrefix('attack', 'attack 5', 24, false);

				addOffset('idle');
				addOffset("singUP", 173, -7);
				addOffset("singRIGHT", 0, -79);
				addOffset("singLEFT", 230, -34);
				addOffset("singDOWN", 0, -12);
				addOffset("attack", 0, 30);

				iconColor = 'FF936122';

				playAnim('idle');

			case 'gooey-4':
				frames = Paths.getSparrowAtlas('airship/gooey 4', 'shared');

				animation.addByPrefix('idle', 'gooey idle', 24, false);
				animation.addByPrefix('singUP', 'gooey up', 24, false);
				animation.addByPrefix('singDOWN', 'gooey down', 24, false);
				animation.addByPrefix('singLEFT', 'gooey left', 24, false);
				animation.addByPrefix('singRIGHT', 'gooey right', 24, false);
				animation.addByPrefix('attack', 'attack 4', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 54);
				addOffset("singRIGHT", -2, -5);
				addOffset("singLEFT", 193, -6);
				addOffset("singDOWN", 0, -32);
				addOffset("attack", -4, 36);

				iconColor = 'FF936122';

				playAnim('idle');

			case 'gooey-3':
				frames = Paths.getSparrowAtlas('airship/gooey 3', 'shared');

				animation.addByPrefix('idle', 'gooey idle', 24, false);
				animation.addByPrefix('singUP', 'gooey up', 24, false);
				animation.addByPrefix('singDOWN', 'gooey down', 24, false);
				animation.addByPrefix('singLEFT', 'gooey left', 24, false);
				animation.addByPrefix('singRIGHT', 'gooey right', 24, false);
				animation.addByPrefix('attack', 'attack 3', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 78);
				addOffset("singRIGHT", 0, 3);
				addOffset("singLEFT", 160, 2);
				addOffset("singDOWN", -4, -16);
				addOffset("attack", -2, 34);

				iconColor = 'FF936122';

				playAnim('idle');
		
			case 'gooey-2':
				frames = Paths.getSparrowAtlas('airship/gooey 2', 'shared');

				animation.addByPrefix('idle', 'gooey idle', 24, false);
				animation.addByPrefix('singUP', 'gooey up', 24, false);
				animation.addByPrefix('singDOWN', 'gooey down', 24, false);
				animation.addByPrefix('singLEFT', 'gooey left', 24, false);
				animation.addByPrefix('singRIGHT', 'gooey right', 24, false);
				animation.addByPrefix('attack', 'attack 2', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 54);
				addOffset("singRIGHT", 0, 12);
				addOffset("singLEFT", 30, -3);
				addOffset("singDOWN", 0, -25);
				addOffset("attack", -2, 30);

				iconColor = 'FF936122';

				playAnim('idle');
			
			case 'gooey-1':
				frames = Paths.getSparrowAtlas('airship/gooey 1', 'shared');

				animation.addByPrefix('idle', 'gooey idle', 24, false);
				animation.addByPrefix('singUP', 'gooey up', 24, false);
				animation.addByPrefix('singDOWN', 'gooey down', 24, false);
				animation.addByPrefix('singLEFT', 'gooey left', 24, false);
				animation.addByPrefix('singRIGHT', 'gooey right', 24, false);

				addOffset('idle');
				addOffset("singUP", 3, 17);
				addOffset("singRIGHT", -10, 4);
				addOffset("singLEFT", 30, 6);
				addOffset("singDOWN", 0, -49);

				iconColor = 'FF936122';

				playAnim('idle');

			case 'gooey-squished':
				frames = Paths.getSparrowAtlas('airship/squished-Gooey', 'shared');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
				addOffset("singUP", -1, 15);
				addOffset("singRIGHT", -6, 8);
				addOffset("singLEFT", 2, 15);
				addOffset("singDOWN", -3, -10);

				iconColor = 'FF936122';

				playAnim('idle');

			case 'gooey-battle':
				frames = Paths.getSparrowAtlas('battle/gooey-battle', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('attackHIT', 'attack hit', 24, false);
				animation.addByPrefix('attackMISS', 'attack miss', 24, false);
				animation.addByPrefix('hit', 'hit', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -4, 0);
				addOffset("singLEFT", 6, 3);
				addOffset("singDOWN", -2, -26);
				addOffset("attackHIT", 45, 19);
				addOffset("attackMISS", 46, 88);
				addOffset("hit", 10, 6);

				iconColor = 'FF936122';
	
				playAnim('idle');

			case 'mooshie':
				frames = Paths.getSparrowAtlas('mooshie/Mooshie_assets', 'shared');

				animation.addByPrefix('idle', 'Mooshie idle', 24, false);
				animation.addByPrefix('singUP', 'Mooshie up', 24, false);
				animation.addByPrefix('singDOWN', 'Mooshie down', 24, false);
				animation.addByPrefix('singLEFT', 'Mooshie left', 24, false);
				animation.addByPrefix('singRIGHT', 'Mooshie right', 24, false);

				addOffset('idle'); 
				addOffset("singUP", 3, -1);
				addOffset("singRIGHT", -12, -6);
				addOffset("singLEFT", 6, -9);
				addOffset("singDOWN", -1, -14);

				iconColor = 'FFFFFFFF';

				playAnim('idle');

			case 'supermooshie':
				frames = Paths.getSparrowAtlas('supermooshie', 'shared');
	
				animation.addByPrefix('idle', 'supermooshie idle', 24, false);
				animation.addByPrefix('singUP', 'supermooshie up', 24, false);
				animation.addByPrefix('singDOWN', 'supermooshie down', 24, false);
				animation.addByPrefix('singLEFT', 'supermooshie left', 24, false);
				animation.addByPrefix('singRIGHT', 'supermooshie right', 24, false);
				animation.addByPrefix('mad', 'supermooshie mad', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 13);
				addOffset("singRIGHT", -4, 0);
				addOffset("singLEFT", 14, 0);
				addOffset("singDOWN", 0, 5);
				addOffset("mad", 0, 69);

				iconColor = 'FFFF0000';
	
				playAnim('idle');

			case 'supermooshie-mad':
				frames = Paths.getSparrowAtlas('supermooshie-mad', 'shared');
		
				animation.addByPrefix('idle', 'supermooshie idle mad', 24, false);
				animation.addByPrefix('singUP', 'supermooshie up mad', 24, false);
				animation.addByPrefix('singDOWN', 'supermooshie down mad', 24, false);
				animation.addByPrefix('singLEFT', 'supermooshie left mad', 24, false);
				animation.addByPrefix('singRIGHT', 'supermooshie right mad', 24, false);
				animation.addByPrefix('singUP-alt', 'supermooshie up laser', 24, false);
				animation.addByPrefix('singDOWN-alt', 'supermooshie down laser', 24, false);
				animation.addByPrefix('singLEFT-alt', 'supermooshie left laser', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'supermooshie right laser', 24, false);
	
				if (PlayState.SONG.song.toLowerCase() != 'plane')
				{
					addOffset('idle'); 
					addOffset("singUP", 0, 24);
					addOffset("singRIGHT", -12, -11);
					addOffset("singLEFT", 21, -19);
					addOffset("singDOWN", 0, -15);
					addOffset("singUP-alt", 0, 200);
					addOffset("singRIGHT-alt", 0, -80);
					addOffset("singLEFT-alt", 0, -80);
					addOffset("singDOWN-alt", 0, -83);
				}
				else
				{
					addOffset('idle'); 
					addOffset("singUP", 0, 11);
					addOffset("singRIGHT", -1, -14);
					addOffset("singLEFT", 15, -14);
					addOffset("singDOWN", 0, -6);
					addOffset("singUP-alt", 0, 278);
					addOffset("singRIGHT-alt", 0, -14);
					addOffset("singLEFT-alt", 12, -14);
					addOffset("singDOWN-alt", 0, -12);
				}
				
				iconColor = 'FFFF0000';

				playAnim('idle');

			case 'supermooshie-battle':
				frames = Paths.getSparrowAtlas('battle/supermooshie-battle', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);
				animation.addByPrefix('hit', 'hit', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -10, 0);
				addOffset("singRIGHT", -30, 5);
				addOffset("singLEFT", 50, 6);
				addOffset("singDOWN", 7, -100);
				addOffset("attack", 10, -30);
				addOffset("hit", 10, 0);

				iconColor = 'FFFF0000';
	
				playAnim('idle');

			case 'bf-dodge':
				var tex = Paths.getSparrowAtlas('BF_assets_3','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'bf dodge up', 24, false);
				animation.addByPrefix('singLEFT', 'bf dodge left', 24, false);
				animation.addByPrefix('singRIGHT', 'bf dodge right', 24, false);
				animation.addByPrefix('singDOWN', 'bf dodge down', 24, false);
				animation.addByPrefix('singUPmiss', 'bf dodge up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf dodge left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf dodge right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf dodge down', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 100);
				addOffset("singRIGHT");
				addOffset("singLEFT", -10, -55);
				addOffset("singDOWN", 10, -30);
				addOffset("singUPmiss", 0, 100);
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss", -10, -55);
				addOffset("singDOWNmiss", 10, -30);

				iconColor = 'FF009BFF';

				playAnim('idle');

				flipX = true;
			
			case 'bf-gf':
				var tex = Paths.getSparrowAtlas('bf-gf','shared');
				frames = tex;
				animation.addByPrefix('idle', 'idle mic', 24, false);
				animation.addByPrefix('singUP', 'up mic0', 24, false);
				animation.addByPrefix('singLEFT', 'left mic0', 24, false);
				animation.addByPrefix('singRIGHT', 'right mic0', 24, false);
				animation.addByPrefix('singDOWN', 'down mic0', 24, false);
				animation.addByPrefix('singUPmiss', 'up mic miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'left mic miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'right mic miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'down mic miss', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				addOffset('idle');
				addOffset("singUP", 70, 0);
				addOffset("singRIGHT", 0, -3);
				addOffset("singLEFT", 83, -3);
				addOffset("singDOWN");
				addOffset("singUPmiss", 90, 0);
				addOffset("singRIGHTmiss", 20, -7);
				addOffset("singLEFTmiss", 110, 0);
				addOffset("singDOWNmiss");

				addOffset('firstDeath', 0, 3);
				addOffset('deathLoop', 0, -10);
				addOffset('deathConfirm', 0, 17);

				iconColor = 'FF969BFF';

				playAnim('idle');

				flipX = true;

			case 'fire':
				frames = Paths.getSparrowAtlas('fire', 'shared');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle'); 
				addOffset("singUP", 20, 20);
				addOffset("singRIGHT", 0, 10);
				addOffset("singLEFT", 39, 9);
				addOffset("singDOWN", 1, -15);

				iconColor = 'FFFF0000';

				playAnim('idle');

			case 'lemony':
				frames = Paths.getSparrowAtlas('lemony', 'shared');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle'); 
				addOffset("singUP", 9, 27);
				addOffset("singRIGHT", -1, 12);
				addOffset("singLEFT", 34, 11);
				addOffset("singDOWN", 0, -14);

				iconColor = 'FFFFFF00';

				playAnim('idle');

			case 'icy':
				frames = Paths.getSparrowAtlas('icy', 'shared');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle'); 
				addOffset("singUP", 20, 93);
				addOffset("singRIGHT", -2, 18);
				addOffset("singLEFT", 73, 10);
				addOffset("singDOWN", 0, -23);

				iconColor = 'FF54EBFF';

				playAnim('idle');

			case 'slimy':
				frames = Paths.getSparrowAtlas('slimy', 'shared');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
				addOffset("singUP", 23, 18);
				addOffset("singRIGHT", -1, 16);
				addOffset("singLEFT", 50, 15);
				addOffset("singDOWN", 0, -17);

				iconColor = 'FF00E500';

				playAnim('idle');

			case 'fire-battle':
				frames = Paths.getSparrowAtlas('battle/fire-battle', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);
				animation.addByPrefix('hit', 'hit', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 16, 24);
				addOffset("singRIGHT", -2, 7);
				addOffset("singLEFT", 20, 10);
				addOffset("singDOWN", 0, -5);
				addOffset("attack", 0, 0);
				addOffset("hit", 19, 12);

				iconColor = 'FFFF0000';
	
				playAnim('idle');

			case 'ghost-front':
				frames = Paths.getSparrowAtlas('aay/characters/ghost-front', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 20);
				addOffset("singRIGHT", -10, 0);
				addOffset("singLEFT", 10, 0);
				addOffset("singDOWN", 0, -20);

				setGraphicSize(Std.int(width * 2));
				updateHitbox();

				iconColor = 'FFFFFFFF';

				playAnim('idle');

				width -= 100;
				height -= 100;

			case 'sheary-diagonal':
				frames = Paths.getSparrowAtlas('aay/characters/sheary-diagonal', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -33, 31);
				addOffset("singRIGHT", -34, 0);
				addOffset("singLEFT", 3, 0);
				addOffset("singDOWN", -14, 9);

				iconColor = 'FFFFFFFF';
	
				playAnim('idle');

			case 'cluckington-f':
				frames = Paths.getSparrowAtlas('cluck/cluckington', 'week5');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle');
				addOffset("singUP", -60, 140);
				addOffset("singRIGHT", 34, -14);
				addOffset("singLEFT", -19, -12);
				addOffset("singDOWN", 0, 0);

				iconColor = 'FFFFFFFF';
	
				playAnim('idle');

				flipX = true;

			case 'clooshie-diagonal':
				frames = Paths.getSparrowAtlas('aay/characters/clooshie-diagonal', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle');
				addOffset("singUP", -44, 47);
				addOffset("singRIGHT", -55, 0);
				addOffset("singLEFT", 43, 0);
				addOffset("singDOWN", 5, -29);

				iconColor = 'FFFF0000';
	
				playAnim('idle');

			case 'trooper-back':
				frames = Paths.getSparrowAtlas('aay/characters/trooper-back', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 0, 50);
				addOffset("singRIGHT", -70, 6);
				addOffset("singLEFT", 30, 10);
				addOffset("singDOWN", -40, -110);

				iconColor = 'FFFFFF00';
	
				playAnim('idle');

			case 'gooey-back':
				frames = Paths.getSparrowAtlas('aay/characters/gooey-back', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -4, 0);
				addOffset("singLEFT", 6, 3);
				addOffset("singDOWN", -2, -26);

				iconColor = 'FF936122';
	
				playAnim('idle');

			case 'supermooshie-diagonal':
				frames = Paths.getSparrowAtlas('aay/characters/supermooshie-diagonal', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -1, 96);
				addOffset("singRIGHT", -2, -8);
				addOffset("singLEFT", 10, 19);
				addOffset("singDOWN", 0, -46);

				iconColor = 'FFFF0000';
	
				playAnim('idle');

			case 'sticko':
				frames = Paths.getSparrowAtlas('sticko', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 9, 25);
				addOffset("singRIGHT", 17, -26);
				addOffset("singLEFT", 9, 16);
				addOffset("singDOWN", 36, -21);
				addOffset('attack', 90, 0);

				iconColor = 'FF000000';
	
				playAnim('idle');

			case 'stickletto':
				frames = Paths.getSparrowAtlas('stickletto', 'shared');
	
				animation.addByPrefix('idle', 'idle0', 24, false);
				animation.addByPrefix('singUP', 'up0', 24, false);
				animation.addByPrefix('singDOWN', 'down0', 24, false);
				animation.addByPrefix('singLEFT', 'right0', 24, false);
				animation.addByPrefix('singRIGHT', 'left0', 24, false);
				animation.addByPrefix('dodge', 'dodge', 24, false);

				animation.addByPrefix('firstDeath', 'ded0', 24, false);
				animation.addByPrefix('deathLoop', 'ded loop', 24, true);
				animation.addByPrefix('deathConfirm', 'retry', 24, false);

				addOffset('idle'); 
				addOffset("singUP", -30, 11);
				addOffset("singRIGHT", -19, 8);
				addOffset("singLEFT", -15, 9);
				addOffset("singDOWN", -25, -11);
				addOffset('dodge', 36, 10);

				addOffset('firstDeath', 747, 40);
				addOffset('deathLoop', -12, -121);
				addOffset('deathConfirm', -12, -121);

				iconColor = 'FF000000';
	
				playAnim('idle');

				flipX = true;
				if (!isPlayer)
					flipX = false;

			case 'stickletto-f':
				frames = Paths.getSparrowAtlas('stickletto', 'shared');
	
				animation.addByPrefix('idle', 'idle0', 24, false);
				animation.addByPrefix('singUP', 'up0', 24, false);
				animation.addByPrefix('singDOWN', 'down0', 24, false);
				animation.addByPrefix('singLEFT', 'left0', 24, false);
				animation.addByPrefix('singRIGHT', 'right0', 24, false);
				animation.addByPrefix('dodge', 'dodge', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 11);
				addOffset("singRIGHT", -3, 9);
				addOffset("singLEFT", 16, 8);
				addOffset("singDOWN", 53, -11);
				addOffset('dodge', 69, 10); // nice

				iconColor = 'FF000000';
	
				playAnim('idle');

			case 'stickletto-i':
				frames = Paths.getSparrowAtlas('stickletto', 'shared');
	
				animation.addByPrefix('idle', 'idle i0', 24, false);
				animation.addByPrefix('singUP', 'up i0', 24, false);
				animation.addByPrefix('singDOWN', 'down i0', 24, false);
				animation.addByPrefix('singLEFT', 'left i0', 24, false);
				animation.addByPrefix('singRIGHT', 'right i0', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 13, 44);
				addOffset("singRIGHT", 40, 9);
				addOffset("singLEFT", -27, -7);
				addOffset("singDOWN", 79, -79);

				iconColor = 'FF000000';
	
				playAnim('idle');

				flipX = true;

			case 'stickletto-i-w':
				frames = Paths.getSparrowAtlas('stickletto', 'shared');
	
				animation.addByPrefix('idle', 'idle i in', 24, false);
				animation.addByPrefix('singUP', 'up i in', 24, false);
				animation.addByPrefix('singDOWN', 'down i in', 24, false);
				animation.addByPrefix('singLEFT', 'left i in', 24, false);
				animation.addByPrefix('singRIGHT', 'right i in', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 13, 44);
				addOffset("singRIGHT", -27, -7);
				addOffset("singLEFT", 40, 9);
				addOffset("singDOWN", 79, -79);

				iconColor = 'FF000000';
	
				playAnim('idle');

			case 'stickletto-i-w-f':
				frames = Paths.getSparrowAtlas('stickletto', 'shared');
	
				animation.addByPrefix('idle', 'idle i in', 24, false);
				animation.addByPrefix('singUP', 'up i in', 24, false);
				animation.addByPrefix('singDOWN', 'down i in', 24, false);
				animation.addByPrefix('singLEFT', 'left i in', 24, false);
				animation.addByPrefix('singRIGHT', 'right i in', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -24, 44);
				addOffset("singRIGHT", 96, -7);
				addOffset("singLEFT", -44, 9);
				addOffset("singDOWN", 21, -79);

				iconColor = 'FF000000';
	
				playAnim('idle');

				flipX = true;

			case 'stickletto-c':
				frames = Paths.getSparrowAtlas('stickletto-c', 'shared');
	
				animation.addByPrefix('idle', 'idle c', 24, false);
				animation.addByPrefix('singUP', 'up c', 24, false);
				animation.addByPrefix('singDOWN', 'down c', 24, false);
				animation.addByPrefix('singLEFT', 'right c', 24, false);
				animation.addByPrefix('singRIGHT', 'left c', 24, false);
				animation.addByPrefix('pushed', 'pushed', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -16, -1);
				addOffset("singRIGHT", -21, -3);
				addOffset("singLEFT", 14, -5);
				addOffset("singDOWN", -16, -7);
				addOffset('pushed', 120, 2);

				iconColor = 'FF000000';
	
				playAnim('idle');

				flipX = true;
			
			case 'stickletto-unc':
				frames = Paths.getSparrowAtlas('stickletto-c', 'shared');
	
				animation.addByPrefix('idle', 'idle0', 24, false);
				animation.addByPrefix('singUP', 'up0', 24, false);
				animation.addByPrefix('singDOWN', 'down0', 24, false);
				animation.addByPrefix('singLEFT', 'right0', 24, false);
				animation.addByPrefix('singRIGHT', 'left0', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -2, 0);
				addOffset("singRIGHT", -29, 0);
				addOffset("singLEFT", 38, 5);
				addOffset("singDOWN", 37, -9);

				iconColor = 'FF000000';
	
				playAnim('idle');

				flipX = true;

			case 'stickletto-unc-f':
				frames = Paths.getSparrowAtlas('stickletto-c', 'shared');
	
				animation.addByPrefix('idle', 'idle0', 24, false);
				animation.addByPrefix('singUP', 'up0', 24, false);
				animation.addByPrefix('singDOWN', 'down0', 24, false);
				animation.addByPrefix('singLEFT', 'left0', 24, false);
				animation.addByPrefix('singRIGHT', 'right0', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 33, 5);
				addOffset("singLEFT", 15, 0);
				addOffset("singDOWN", 64, -9);

				iconColor = 'FF000000';
	
				playAnim('idle');

			case 'stickletto-b':
				frames = Paths.getSparrowAtlas('stickletto back', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 7);
				addOffset("singRIGHT", 2, 3);
				addOffset("singLEFT", 22, 3);
				addOffset("singDOWN", 51, -10);

				iconColor = 'FF000000';
	
				playAnim('idle');

				flipX = true;

			case 'stickletto-dd':
				frames = Paths.getSparrowAtlas('Stickletto dd', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);

				iconColor = 'FF000000';
	
				playAnim('idle');

			case 'stickletta-f':
				frames = Paths.getSparrowAtlas('stickletta', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 1, -4);
				addOffset("singRIGHT", -16, 1);
				addOffset("singLEFT", 37, -2);
				addOffset("singDOWN", -6, -61);

				iconColor = 'FFFF00FF';
	
				playAnim('idle');

			case 'stickletta':
				frames = Paths.getSparrowAtlas('stickletta', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 35, -4);
				addOffset("singRIGHT", 13, -2);
				addOffset("singLEFT", 0, 1);
				addOffset("singDOWN", -4, -61);

				iconColor = 'FFFF00FF';
	
				playAnim('idle');

			case 'stickletta-c':
				frames = Paths.getSparrowAtlas('stickletta-c', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 35, -4);
				addOffset("singRIGHT", 13, -2);
				addOffset("singLEFT", 0, 1);
				addOffset("singDOWN", -4, -61);

				iconColor = 'FFFF00FF';
	
				playAnim('idle');

			case 'stickletta-c-f':
				frames = Paths.getSparrowAtlas('stickletta-c', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle');
				if (PlayState.SONG.song.toLowerCase() == 'sticklettabreaker')
				{
					addOffset("singUP", 35, -4);
					addOffset("singRIGHT", 13, -2);
					addOffset("singLEFT", 0, 1);
					addOffset("singDOWN", -6, -58);
				}
				else
				{
					addOffset("singUP", 1, -4);
					addOffset("singRIGHT", -16, 1);
					addOffset("singLEFT", 37, -2);
					addOffset("singDOWN", -6, -61);
				}

				iconColor = 'FFFF00FF';
	
				playAnim('idle');

				if (PlayState.SONG.song.toLowerCase() == 'sticklettabreaker')
					flipX = true;

			case 'stickletta-b':
				frames = Paths.getSparrowAtlas('stickletta back', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -15, 3);
				addOffset("singRIGHT", -35, 0);
				addOffset("singLEFT", 34, 0);
				addOffset("singDOWN", -28, -60);

				iconColor = 'FFFF00FF';
	
				playAnim('idle');
			
			case 'stickletta-gf':
				frames = Paths.getSparrowAtlas('stickletta dance', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
	
				addOffset('idle');

				iconColor = 'FFFF00FF';
	
				playAnim('idle');

			case 'stickletta-m':
				frames = Paths.getSparrowAtlas('stickletta marooned', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -1, 4);
				addOffset("singRIGHT", -13, -1);
				addOffset("singLEFT", 6, -2);
				addOffset("singDOWN", 4, 2);

				iconColor = 'FFFF00FF';
	
				playAnim('idle');

				flipX = true;

			case 'sticklettabow-b':
				frames = Paths.getSparrowAtlas('sticklettabow back', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 13, 11);
				addOffset("singRIGHT", 54, 4);
				addOffset("singLEFT", 78, 7);
				addOffset("singDOWN", 18, -50);

				iconColor = 'FF000000';
	
				playAnim('idle');
			
			case 'swordletto-b':
				frames = Paths.getSparrowAtlas('swordletto back', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -14, 83);
				addOffset("singRIGHT", 7, 6);
				addOffset("singLEFT", 50, 5);
				addOffset("singDOWN", -9, -5);

				iconColor = 'FF000000';
	
				playAnim('idle');
			case 'clonerman':
				frames = Paths.getSparrowAtlas('clonerman', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 64, 40);
				addOffset("singRIGHT", 47, -10);
				addOffset("singLEFT", 127, 2);
				addOffset("singDOWN", 91, -16);

				iconColor = 'FF00FFFF';
	
				playAnim('idle');

			case 'sticklettabow':
				frames = Paths.getSparrowAtlas('sticklettabow', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 164, 80);
				addOffset("singRIGHT", 0, 2);
				addOffset("singLEFT", 216, 7);
				addOffset("singDOWN", 76, -65);

				iconColor = 'FF000000';
	
				playAnim('idle');
			
			case 'swordletto':
				frames = Paths.getSparrowAtlas('swordletto', 'shared');

				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -45, 0);
				addOffset("singRIGHT", -52, -56);
				addOffset("singLEFT", 36, -52);
				addOffset("singDOWN", -53, -66);

				iconColor = 'FF000000';

				playAnim('idle');

			case 'striker':
				frames = Paths.getSparrowAtlas('striker', 'shared');

				animation.addByPrefix('idle2', 'idle2', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);
				animation.addByPrefix('idle', 'idle0', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle2');
				addOffset('attack');
				addOffset('idle'); 
				addOffset("singUP", 0, 31);
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");

				iconColor = 'FF000000';

				playAnim('idle2');
			
			case 'striker-fr':
				frames = Paths.getSparrowAtlas('striker front', 'shared');

				animation.addByPrefix('appear', 'appear', 24, false);
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('appear', 23, 2);
				addOffset('idle'); 
				addOffset("singUP", 0, 215);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 165, 0);
				addOffset("singDOWN", 114, 5);

				iconColor = 'FF000000';

				playAnim('idle');

			case 'yellow':
				frames = Paths.getSparrowAtlas('yellow dude', 'shared');
	
				animation.addByIndices('danceLeft', 'idle', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('danceLeft');
				addOffset('danceRight'); 
				addOffset("singUP", -115, -1);
				addOffset("singRIGHT", -112, -4);
				addOffset("singLEFT", -141, -8);
				addOffset("singDOWN", -151, -6);

				iconColor = 'FFFFFF00';
	
				playAnim('danceRight');

			case 'yellow-f':
				frames = Paths.getSparrowAtlas('yellow dude', 'shared');
	
				animation.addByIndices('danceLeft', 'idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('danceRight', 'idle', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
	
				addOffset('danceLeft');
				addOffset('danceRight'); 
				addOffset("singUP", -46, 0);
				addOffset("singRIGHT", -125, -8);
				addOffset("singLEFT", -55, -4);
				addOffset("singDOWN", -96, -5);

				iconColor = 'FFFFFF00';
	
				playAnim('danceRight');

				flipX = true;
			
			case 'red':
				frames = Paths.getSparrowAtlas('red dude', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 170);
				addOffset("singRIGHT", 120, -60);
				addOffset("singLEFT", 150, -20);
				addOffset("singDOWN", 90, -50);

				iconColor = 'FFFF0000';
	
				playAnim('idle');
			
			case 'red-f':
				frames = Paths.getSparrowAtlas('red dude', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 30, 170);
				addOffset("singRIGHT", -90, -20);
				addOffset("singLEFT", 170, -60);
				addOffset("singDOWN", 47, -50);

				iconColor = 'FFFF0000';
	
				playAnim('idle');

				flipX = true;

			case 'stiburn':
				frames = Paths.getSparrowAtlas('stiburn', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('infect', 'infection', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 0, 70);
				addOffset("singRIGHT", -54, -40);
				addOffset("singLEFT", 52, -46);
				addOffset("singDOWN", 20, -40);
				addOffset('infect', 320, -20);

				iconColor = 'FF000000';
	
				playAnim('idle');

			case 'stiburn-fr':
				frames = Paths.getSparrowAtlas('stiburn front', 'shared');

				animation.addByPrefix('appear', 'appear', 24, false);
				animation.addByPrefix('attack', 'attack', 24, false);
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('appear', 0, 68);
				addOffset('attack', 0, -16);
				addOffset('idle');
				addOffset("singUP", 0, 227);
				addOffset("singRIGHT", 0, -27);
				addOffset("singLEFT", 206, 6);
				addOffset("singDOWN", 0, -27);

				iconColor = 'FF000000';

				playAnim('idle');

			case 'stlaw':
				frames = Paths.getSparrowAtlas('other_stiburns', 'shared');
	
				animation.addByPrefix('idle', 'stlaw0', 24, false);
				animation.addByPrefix('attack', 'stlaw attack', 24, false);

				addOffset('idle');
				addOffset('attack', 194, 113);
			
			case 'stibow':
				frames = Paths.getSparrowAtlas('other_stiburns', 'shared');
	
				animation.addByPrefix('idle', 'stibow0', 24, false);
				animation.addByPrefix('attack', 'stibow attack', 24, false);

				addOffset('idle');
				addOffset('attack', -5, -6);

			case 'stickannon':
				frames = Paths.getSparrowAtlas('other_stiburns', 'shared');
	
				animation.addByPrefix('idle', 'stickannon0', 24, false);
				animation.addByPrefix('attack', 'stickannon attack', 24, false);

				addOffset('idle');
				addOffset('attack', 412, 38);

			case 'crocker':
				frames = Paths.getSparrowAtlas('crocker', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -12, 6);
				addOffset("singRIGHT", 16, 27);
				addOffset("singLEFT", 44, 27);
				addOffset("singDOWN", 220, -90);

				iconColor = 'FF00FF00';
	
				playAnim('idle');
			
			case 'ralph':
				frames = Paths.getSparrowAtlas('ralph', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, true);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('dodge', 'dodge', 24, false);
				animation.addByPrefix('attack', 'bite', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", 14, 157);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 137, 0);
				addOffset("singDOWN", 0, -188);
				addOffset("dodge", 110, 0);
				addOffset("attack", 0, 0);

				iconColor = 'FFB763CC';
	
				playAnim('idle');

			case 'maroon':
				frames = Paths.getSparrowAtlas('Maroon', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up0', 24, false);
				animation.addByPrefix('singDOWN', 'down0', 24, false);
				animation.addByPrefix('singLEFT', 'left0', 24, false);
				animation.addByPrefix('singRIGHT', 'right0', 24, false);
				animation.addByPrefix('singUP-alt', 'up alt', 24, false);
				animation.addByPrefix('singDOWN-alt', 'down alt', 24, false);
				animation.addByPrefix('singLEFT-alt', 'left alt', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'right alt', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -47, 7);
				addOffset("singRIGHT", -60, 0);
				addOffset("singLEFT", -20, 0);
				addOffset("singDOWN", -49, -19);

				addOffset("singUP-alt", -46, 7);
				addOffset("singRIGHT-alt", -60, 0);
				addOffset("singLEFT-alt", -21, 0);
				addOffset("singDOWN-alt", -49, -19);

				iconColor = 'FF860200';
	
				playAnim('idle');

			case 'blue':
				frames = Paths.getSparrowAtlas('Blue', 'shared');
	
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
	
				addOffset('idle'); 
				addOffset("singUP", -45, 18);
				addOffset("singRIGHT", -36, -7);
				addOffset("singLEFT", -26, 0);
				addOffset("singDOWN", -38, -46);

				iconColor = 'FF0000FF';
	
				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf' | 'gf-airship' | 'grilfen':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'yellow' | 'yellow-f':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
