function Enemy()
{
    
    /// @desc Creates the enemies information
    /// @param {string} _name The name of the enemy
    /// @param {Asset.GMSprite} _sprite The sprite of the enemy
    /// @param {real} [_difficulty] The enemies difficulty which effects how much damage the enemy takes (The lower the number the more damage they take) (Base = 1)
    /// @param {real} [_gameDifficulty] The enemies difficulty when it comes to playing game cards like the brawl card (Base = 1)
    /// @param {real} [_maxHp] Max health of the enemy (Base = 100)
    /// @param {struct.enemycreateanims} [_animInfo] The animation info for the enemies sprite
    /// @param {array} [_actionCards] The enemies action cards (Example: [actionCards.bread, actionCards.heal])
    /// @param {array} [_kaosCards] The enemies kaos cards (Example: [kaosCards.swoop])
    /// @param {struct.enemycreatestrat} [_strat] The enemies figthing strategy
    /// @param {any*} [_special] The enemies special move(leave as undefined if they don't use one)
    /// @param {array.string} _customSong The song the enemy plays (Example: ["Prepare","Kaos"])
    static Create = function(_name,_sprite,_animInfo = enemyCreateAnims(),_difficulty = 1,_gameDifficulty = 1,_maxHp = 100,_actionCards=[],_kaosCards=[],_strat = new enemyCreateStrat(),_special = undefined,_customSong = ["Prepare","Kaos"]) constructor
    {    
        //Info
        name = _name;
        sprite = _sprite;
        animInfo = _animInfo;
        special = _special;
        customSong = _customSong;
        
        //Difficulty
        difficulty = _difficulty;
        gameDifficulty = _gameDifficulty;
        maxHp = _maxHp;
        
        //Cards
        cardsAct = _actionCards;
        cardsKaos = _kaosCards;
        
        //Strat
        strat = _strat;
    }
    
    
    ///@desc Creates an animation clip for the enemies animations
    /// @param {real} _start The start of the animation
    /// @param {real} [_length] The length of the animation (Default = 2)
    /// @param {bool} [_loop] If the animation should loop or play once (Default = 2)
    /// @param {string} [_resetAnim] What animation should it reset to after playing
    static AnimClip = function(_start,_length = 2,_loop = true,_resetAnim = "")
    {
        return {
            start : _start,
            length : _length,
            loop : _loop,
            resetAnim : _resetAnim
        };
    }
    
    
    /// @desc Creates the enemies animation info
    /// @param {real} [_idle] The amount of frames the idle animation has (Default = 2)
    /// @param {real} [_hurt] The amount of frames the hurt animation has (Default = 2)
    /// @param {real} [_win] The amount of frames the win animation has (Default = 2)
    /// @param {real} [_death] The amount of frames the death animation has (Default = 2)
    /// @returns {struct} The animation info
    static Anims = function(_idle = 2,_hurt = 2,_win = 2,_death = 2,_extraAnims={}) {
        
        //Create Info
        var _info = { 
            idle : AnimClip(0,_idle),
            hurt : AnimClip(_idle,_hurt),
            win : AnimClip(_hurt+_idle,_win),
            death: AnimClip(_win+_hurt+_idle,_death),
        }
        
        //Return Animation Info
        return structMerge(_info,_extraAnims,false);
    }
    
    
    
    /// @desc Create the enemies fighting strategy
    /// @param {real} [_healWeight] How important healing is (Default = 80)
    /// @param {real} [_healVal] When should it consider healing (Default = 60)
    /// @param {real} [_defendWeight] How important defending is (Default = 50)
    /// @param {real} [_defendValue] When should it consider defending (Default = 50)
    /// @param {real} [_diceWeight] How important the dice are if low a kaos card will be placed (Default = 80)
    /// @param {real} [_diceVal] How many low dice before upgrading (Default = 2)
    /// @param {real} [_comboWeight] How important it is to combo (Default = 100)
    /// @param {real} [_specialWeight] How important it is to use the special move (Default = 40)
    /// @param {real} [_specialVal] How many rounds in before using special move (Default = 3)
    /// @param {real} [_specialUses] How many uses before they stop completely (Default = 2)
    static Strat = function(_healWeight = 80,_healVal = 60,_defendWeight = 50,_defendValue = 50,_diceWeight = 80,_diceVal = 2,_comboWeight = 100,_specialWeight = 40,_specialVal = 3,_specialUses = 2) 
    {
        return {
            //Weights
            healWeight : _healWeight,
            defendWeight : _defendWeight,
            diceWeight : _diceWeight,
            comboWeight : _comboWeight,
            specialWeight : _specialWeight,
            
            //Values
            healValue : _healVal,
            defendValue : _defendValue,
            diceValue : _diceVal,
            specialValue : _specialVal,
            specialUses : _specialUses,
        }
    }
    
}



///@self oEnemyAi
///@desc Adds an enemy card to the room
///@arg {real} _slotId The slot id
///@arg {struct} _info The cards info
///@arg {real} _value The cards value
///@arg {bool} _used If the slot is used
///@arg {bool} _disabled If the slot is disabled
function enemyAddCard(_slotId,_info,_value,_used = false,_disabled = false)
{
    //Get Inst
    var _slotInst = _slotId != 0 ? oActionSlot : oSpecialSlot;

    //Get Pos
    var _x, _y;
    switch (_slotId) {
    	case 0: _x = 160; _y = 512; break;
    	case 1: _x = 440; _y = 360; break;
    	case 2: _x = 640; _y = 360; break;
    	case 3: _x = 840; _y = 360; break;
    }
    
    //Skipped
    if !_used and !_disabled and _info == undefined
    {
        global.enemyComboMeter += irandom_range(3,4);
    }

    //Create Slot
    var _slot = instance_create_layer(_x,_y,"Slots",_slotInst,{slotId : _slotId,});
    _slot.used = _used; //Set Used
    _slot.disabled = _disabled; //Set Disabled
    
    //Create Card
    if !_used 
    {
        instance_create_layer(_x,_y,"Cards",oEnemyCard,{
            info : _info,
            value : _value,
            slotId : _slotId,
			slot : _slot
        });
    }
}



///@desc Plays the enemy animation
///@param {string} _anim The animation to play
function enemyPlayAnim(_anim,_ignoreTime = 0,_resetAnim = "",_targetObj = oEnemyPhoto)
{
    //Animation Does Not Exist
    if !variable_struct_exists(global.currentEnemy.animInfo,_anim)
    {
        print($"'{_anim}' Does Not Exist");
        exit;
    }
    
    //Set clip
    var _clip = variable_struct_get(global.currentEnemy.animInfo, _anim);
    
    //Switch Animation
    with _targetObj
    {
        if _clip != undefined and currentAnim != _clip and ignoreTime <= 0
        {
            currentAnim = _clip;
            frame = 0;
            animationEnd = false;
            ignoreTime = _ignoreTime;
            resetAnim = _resetAnim;
        }
    }
}