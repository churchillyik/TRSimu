<?php

class multiSort
{
	function sorte($array)
	{
		for($i = 1; $i < func_num_args(); $i += 3)
		{
			$key = func_get_arg($i);
			$order = true;
			if ($i + 1 < func_num_args())
			{
				$order = func_get_arg($i + 1);
			}
		   
			$type = 0;
			if ($i + 2 < func_num_args())
			{
				$type = func_get_arg($i + 2);
			}
	
			switch ($type)
			{
				// Case insensitive natural.
				case 1:
					$t = 'strcasenatcmp($a['.$key.'], $b['.$key.'])';
					break;
				// Numeric.
				case 2:
					$t = '$a['.$key.'] - $b['.$key.']';
					break;
				// Case sensitive string.
				case 3:
					$t = 'strcmp($a['.$key.'], $b['.$key.'])';
					break;
				// Case insensitive string.
				case 4:
					$t = 'strcasecmp($a['.$key.'], $b['.$key.'])';
					break;
				// Case sensitive natural.
				default:
					$t = 'strnatcmp($a['.$key.'], $b['.$key.'])';
					break;
			}
			usort($array, create_function('$a, $b', 'return '.($order? '' : '-').'('.$t.');'));
		}
		return $array;
	}
};

$multisort = new multiSort;
?>