//Change Button Text
if buttonVer != "Values" {
    text = "Start";
    infoText = "Press when you are ready to start the round";
}

//Set Can Hover
if buttonVer == "Values" and !buttonUsed {
    with oDice
    {
        if diceId == 3 then other.canHover = state == DICE_STATES.DONE;
    }
}