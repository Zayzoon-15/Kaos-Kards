function Enemy()
{
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
    /// @param {real} [_talk] The amount of frames the talk animation has (Default = 4)
    /// @returns {struct} The animation info
    static Anims = function(_idle = 2,_hurt = 2,_win = 2,_death = 2,_talk = 4,_extraAnims={}) {
        
        //Create Info
        var _info = { 
            idle : AnimClip(0,_idle),
            hurt : AnimClip(_idle,_hurt),
            win : AnimClip(_hurt+_idle,_win),
            death: AnimClip(_win+_hurt+_idle,_death),
            talk : AnimClip(_win+_hurt+_idle+_death,_talk),
        }
        
        //Return Animation Info
        return structMerge(_info,_extraAnims,false);
    }
    
    
    
    /// @desc Creates the enemy fighting strategy (1 is the base for all)
    /// @param {real} _aggression How much they attack
    /// @param {real} _defense How much they defend
    /// @param {real} _healBias How much would they rather heal
    /// @param {real} _blockBias How much would they rather block
    /// @param {real} _kaosLove How much they use kaos cards
    static Strat = function(_aggression = 1,_defense = 1,_healBias = 1,_blockBias = 1,_kaosLove = 1) 
    {
        return {
            aggression : _aggression,
            defense : _defense,
            healBias : _healBias,
            blockBias : _blockBias,
            kaosLove : _kaosLove,
        }
    }
    
    
    
    /// @desc Creates the difficulty for the enemies (1 is the base for all)
    /// @param {real} _overallSkill How smart they are
    /// @param {real} _gameskill How good are they at mini games
    /// @param {real} _maxHp Their Max Health
    /// @param {real} _defenedBuff How much less damage they take
    /// @param {real} _attackBuff How much more damage they deal
    static Difficulty = function(_overallSkill = 1,_gameskill = 1,_maxHp = 100,_defenedBuff = 1,_attackBuff = 1)
    {
        return {
            skill : _overallSkill,
            gameSkill : _gameskill,
            maxHp : _maxHp,
            defendBuff : _defenedBuff,
            attackBuff : _attackBuff,
        }
    }
    
    
    
    /// @desc Creates the dialouge for the enemies
    /// @param {real} _talkChance How much they talk
    /// @param {array<string>} _dialogue The enemies dialouge
    /// @param {array<string>} _dialougeWinning The enemies dialouge if they are winning
    /// @param {array<string>} _dialougeLosing The enemies dialouge if they are losing
    static Dialogue = function(_talkChance = -1,_dialogue = [],_dialougeWinning = [],_dialougeLosing = [])
    {
        return {
            talkChance : _talkChance,
            text : is_array(_dialogue) ? _dialogue : [_dialogue],
            textWin : is_array(_dialougeWinning) ? _dialougeWinning : [_dialougeWinning],
            textLose : is_array(_dialougeLosing) ? _dialougeLosing : [_dialougeLosing],
        }
    }
    
    
    
    /// @desc Creates the enemies information
    /// @param {string} _name The name of the enemy
    /// @param {Asset.GMSprite} _sprite The sprite of the enemy
    /// @param {struct.enemycreateanims} [_animInfo] The animation info for the enemies sprite
    /// @param {any} [_dialogue] The enemies dialogue
    /// @param {real} [_difficulty] The enemies difficulty which effects how much damage the enemy takes (The lower the number the more damage they take) (Base = 1)
    /// @param {real} [_gameDifficulty] The enemies difficulty when it comes to playing game cards like the brawl card (Base = 1)
    /// @param {real} [_maxHp] Max health of the enemy (Base = 100)
    /// @param {array} [_actionCards] The enemies action cards (Example: [actionCards.bread, actionCards.heal])
    /// @param {array} [_kaosCards] The enemies kaos cards (Example: [kaosCards.swoop])
    /// @param {struct.enemycreatestrat} [_strat] The enemies figthing strategy
    /// @param {any*} [_special] The enemies special move(leave as undefined if they don't use one)
    /// @param {array.string} _customSong The song the enemy plays (Example: ["Prepare","Kaos"])
    static Create = function(_name,_sprite,_animInfo = Anims(),_dialogue = Dialouge(),_difficulty = Difficulty(),_actionCards=[],_kaosCards=[],_strat = Strat(),_special = undefined,_customSong = ["Prepare","Kaos","Kaos"]) constructor
    {    
        //Info
        name = _name;
        sprite = _sprite;
        animInfo = _animInfo;
        dialogue = _dialogue;
        
        //Custom Song
        customSong = {
            prepare : _customSong[0],
            kaos : array_length(_customSong) > 1 ? _customSong[1] : "Kaos",
            minigame : array_length(_customSong) > 2 ? _customSong[2] : _customSong[1],
        }
        
        //Difficulty
        difficulty = _difficulty;
        
        //Cards
        cardsAct = _actionCards;
        cardsKaos = _kaosCards;
        
        //Combat
        strat = _strat;
        special = _special;
    }
    
    
    
    static PlayAnim = function(_anim,_ignoreTime = 0,_resetAnim = "",_targetObj = oEnemyPhoto)
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
}


/////@desc Plays the enemy animation
/////@param {string} _anim The animation to play
//function enemyPlayAnim(_anim,_ignoreTime = 0,_resetAnim = "",_targetObj = oEnemyPhoto)
//{
    ////Animation Does Not Exist
    //if !variable_struct_exists(global.currentEnemy.animInfo,_anim)
    //{
        //print($"'{_anim}' Does Not Exist");
        //exit;
    //}
    //
    ////Set clip
    //var _clip = variable_struct_get(global.currentEnemy.animInfo, _anim);
    //
    ////Switch Animation
    //with _targetObj
    //{
        //if _clip != undefined and currentAnim != _clip and ignoreTime <= 0
        //{
            //currentAnim = _clip;
            //frame = 0;
            //animationEnd = false;
            //ignoreTime = _ignoreTime;
            //resetAnim = _resetAnim;
        //}
    //}
//}
