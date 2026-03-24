///@desc Play Sound

//Play Voice
if global.voiceover
{
    switch count
    {
    	case 0: audioPlaySfx(voBrawlCount3); break;
    	case 1: audioPlaySfx(voBrawlCount2); break;
    	case 2: audioPlaySfx(voBrawlCount1); break;
    	case 3: audioPlaySfx(voBrawlCountFight); break;
    }
}

//Play Countdown
switch count
{
    case 0: audioPlaySfx(snBrawlCount3); break;
    case 1: audioPlaySfx(snBrawlCount2); break;
    case 2: audioPlaySfx(snBrawlCount1); break;
    case 3: audioPlaySfx(snBrawlCountFight); break;
}

