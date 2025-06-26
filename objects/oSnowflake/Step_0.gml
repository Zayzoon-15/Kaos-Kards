

if life > lifespan
{
    image_alpha -= .05;
} else life += 1;

if image_alpha < 0
{
    instance_destroy();
}