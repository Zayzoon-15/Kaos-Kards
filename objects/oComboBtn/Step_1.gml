//Set Text
text = toggle ? "Combo On" : "Combo Off";

//Destroy
if !oComboChecker.canCombo
{
    alpha = 0;
    if image_alpha <= 0.2 then instance_destroy();
} else alpha = 1;