$scheme_get_health = { 'type' => 'object',
                       'properties' => { 'Id' => { 'type' => 'string' },
                                         'Name' => { 'type' => 'string' },
                                         'Version' => { 'type' => 'string' } },
                       'required' => ['Version', 'Id', 'Name']
}
