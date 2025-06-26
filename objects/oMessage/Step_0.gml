
if alpha > 0
{
    alpha -= .01;
} else instance_destroy();

shake = lerp(shake,0,.2);