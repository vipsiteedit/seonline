<?php

namespace SE\CMS;

use SE\DB as DB;
use SE\Exception;

class CustomFieldGroup extends Base
{
    protected $tableName = "app_section_fieldsgroup";
    protected $sortBy = "sort";
    protected $sortOrder = "asc";

}
