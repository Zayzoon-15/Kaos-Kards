
///@self oEnemyAi
function enemyDecisionNode(_condition,_trueBranch,_falseBranch) constructor 
{
    condition = _condition;
    trueBranch = _trueBranch;
    falseBranch = _falseBranch;
    
    function evaluate()
    {
        if condition{ 
            return trueBranch.evaluate();
        } else return falseBranch.evaluate();
    }
    
}

///@self oEnemyAi
function enemyActionNode(_action) constructor 
{
    action = _action;
    function evaluate() {return action();}
}
