<?php

declare(strict_types=1);

namespace App\Enum;

enum OrderStatus: int
{
    case New = 1;
    case Shipped = 2;
    case Waiting = 3;
    case Cancelled = 4;
    case Completed = 5;
}
