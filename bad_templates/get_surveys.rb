$scheme_get_survey = {
    'type'=> 'object',
    'properties': {
        '_id': {'type' => 'String' },
        'title': {'type' => 'String' },
        'description': {'type' => 'String' },
        'audience': {'type' => 'Integer' },
        'state': {'type' => 'Integer' },
        'releaseDate': {'type' => 'Date' },
        'creationDate': {'type' => 'Date' },
        'expirationDate': {'type' => 'Date' },
        'responseQuantity': {'type' => 'Integer' },
        'domains': {'type' => [] },
    }
}
