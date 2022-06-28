<?php
function is_data_null_or_empty($data) 
{
    return !isset($data) or empty($data);
}