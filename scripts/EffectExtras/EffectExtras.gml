/////////////////////////
//// EFFECT EXTRAS ////
///////////////////////

//This is where all extra attack effects extra functions go
//Such as on add functions which play when the effect is applied for the first time

/* HOW TO
 * All functions should look like this
 * function action(_targetEnemy,_parent,_pos)
*/

function attackEffectOnAddFire(_targetEnemy = false, _parent = oGame, _pos = new Vector2(0,0))
{
    if irandom_range(1,3) == 1
    {
        repeat (irandom_range(4,6)) {
            instance_create_layer(_pos.x,_pos.y,"Effects",oFireEffectParticle,{
                targetEnemy : _targetEnemy
            });
        }
    }
}
