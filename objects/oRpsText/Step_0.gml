//Update Timer
timer += .005;

//Move Top Text
x = (cos(timer*7)*2)+xstart;
y = (sin(timer*4)*2.5)+ystart;

//Move Middle Text
middleTextX = (cos(timer*5)*2)+xstart;
middleTextY = (sin(timer*3)*2.5)+ystart;

//Move Bottom Text
bottomTextX = (cos(timer*3)*2)+xstart;
bottomTextY = (sin(timer*2)*2.5)+ystart;

//Ease Scale
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);

//Fade
if fade
{
	image_alpha = lerp(image_alpha,0,.1);
	
	if image_alpha <= 0.5 then instance_destroy();
}