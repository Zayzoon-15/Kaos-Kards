if discards < maxDiscrads
{
    full = false;
} else full = true;


if full
{
    image_index = 1;
} else image_index = 0;

shake = lerp(shake,0,.2);