kr = -1
kl = -1
kd = -1
ku = -1

kj = -1
ka = -1
kh = -1

kjp = -1
kap = -1
khp = -1

kar = -1
khr = -1 

krp = -1
klp = -1
kup = -1
kdp = -1

enum ps
{
	normal,
	jump,
	pivot,
	die,
	enterpipedown,
	enterpiperight,
	exitpipeup,
	enterpipedown8_4,
	crouch,
	spindash,
	grow,
	shrink,
	flagpoledescend,
	flagpolefinish,
	firetransform,
	capetransform,
	castleending,
	swim,
	swimidle,
	shoulderbash,
	shoulderbashend,
	climb,
	emerge,
	fly,
	dance0,
	nah,
	sneeze,
	exploded,
	dancepep,
	taunt,
	title,
	jumpcut
} 

hspd = 0;
vspd = 0;
grounded = false;
collidecode = false;
bubble = 60;
combo = 0
mycapeative = false;
firedraw = false;
in_cutscene = false;
playDemo = 0;

dancechance = random(100)
retrochance = random(100)

swimmin = 0;
state = ps.normal

if string_pos("Title",room_get_name(room)) != 0 
{state = ps.title;}

powerup = "s"
if instance_exists(oGame)
{powerup = oGame.savedpowerup;}

char = global.player;

spr = -1
ind = 0;

scale = 1

yoff = 0;

holdjump = -1
jumpbuffer = 0;
releasedrunmidjump = false;
gethit = 0;
invincible = 0;
dietimer = 0;
flagpoletimer = 0;
crouch = false;
firetimer = 0;
starman = 0;
castleendingtrigger = false;
shoulderbash = 0;
climb = 0;

starman = 0;

jumps = 0

pipeinforoom = noone

finishedrace = false;

spinboost = 0;
spinclicks = 0;
spin = false
sdcheck = false;
sound = false;

spintimer = 0
fly = false
pmach = 0;
pmet = 0

taunttimer = 0
tauntstate = 0

pepdancin = 0

insidecar = false;

if !place_meeting(x,y+1,oCol)
{spr = ms("sMario_{}_walk");}

if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true && distance_to_object(instance_nearest(x,y,oBeanstalk)) <= 32
{state = ps.emerge; depth = instance_nearest(x,y,oBeanstalk).depth-10; x = instance_nearest(x,y,oBeanstalk).x+8; y = room_height+32; }