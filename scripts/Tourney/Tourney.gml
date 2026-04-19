


function Tourney(_name = "Tourney Name",_art = sTourneyArtBorder,_enemies = [enemyInfo.dog]) constructor {
    
    name = _name;
    sprite = _art;
    enemies = _enemies;
    placement = global._tourneyPlacement;
    global._tourneyPlacement ++;
}


function initTourney(){
    
    
    globalvar tourneyInfo;
    global._tourneyPlacement = 0;
    
    tourneyInfo = {
        
        debut : new Tourney("Debut Tournament", sTourneyArt1, [
            enemyInfo.dog, enemyInfo.angel, enemyInfo.cock,
            enemyInfo.alien, enemyInfo.beer
        ]),
        
        retro : new Tourney("Retro Tournament", sTourneyArt2, [
            enemyInfo.handsy, enemyInfo.chud,
        ]),
        
        spooky : new Tourney("Spooky Tournament", sTourneyArt3, [
            enemyInfo.bones, enemyInfo.fungi,
        ]),
        
        cameos : new Tourney("Extras", sTourneyArt4, [
            enemyInfo.jsg, enemyInfo.pug, enemyInfo.fungi,
            enemyInfo.teto,
        ]),
        
    }
    
    
}