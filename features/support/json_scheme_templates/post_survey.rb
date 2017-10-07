$scheme_post_survey = {
    'type' => 'object',
    'properties' => {
        '__v': {'type' => 'Integer'},
        'title': {'type' => 'String'},
        'description': {'type' => 'String'},
        'audience': {'type' => 'Integer'},
        'state': {'type' => 'Integer'},
        'releaseDate': {'type' => 'Date'},
        'creationDate': {'type' => 'Date'},
        'expirationDate': {'type' => 'Date'},
        'responseQuantity': {'type' => 'Integer'},
        'owner': {'type' => 'String'},
        '_id': {'type' => 'String'},
        'questions': {'type' => []},
        'domains': {'type' => []}
    }
}
