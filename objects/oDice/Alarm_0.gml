///@desc Finish Roll

//Stop Animation
d_image_speed = 0;
image_index = 0;

//Animation Stuf
diceJuice();

//Dice Number
diceNum = irandom_range(diceType.range.min, diceType.range.max);

//Set All Dice To Be Done (with a lil delay)
if diceId == 3 {
    with oDice {
        timeSourceCreate(.5,function(){
            state = DICE_STATES.DONE;
        });
    }
    
    //Stop Sound
    stopSound = true;
}
