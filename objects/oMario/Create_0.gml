hspd = 0;
vspd = 0;
grounded = false;
collidecode = false;
global.stars = 0 
bubble = 60;
combo = 0
mycapeative = false;
firedraw = false;

char = global.player;

my_id = global.clientid
dancechance = random(100)
retrochance = random(100)

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
		title
	} 
state = ps.normal


if room = rmTitle
{state = ps.title;}

powerup = "s"
if instance_exists(oGame)
{powerup = oGame.savedpowerup;}


palindex = global.paletteindex

spr = -1
spr =  ms("sMario_{}_idle")
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
firepal = false

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
flytimer = 0
fly = false
flymoved = false
pmach = 0;
pmet = 0

pind = 0;

carried = false;

insidecar = false;

if !place_meeting(x,y+1,oCol)
{spr = ms("sMario_{}_walk");}

if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true && distance_to_object(instance_nearest(x,y,oBeanstalk)) <= 32
{state = ps.emerge; depth = instance_nearest(x,y,oBeanstalk).depth-10; x = instance_nearest(x,y,oBeanstalk).x+8; y = room_height+16; }

