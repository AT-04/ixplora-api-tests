$scheme_post_survey_state = {
    'type' => 'object',
    'properties' => {
        '_id': {'type' => 'String'},
        'audience': {'type' => 'Integer'},
        'creationDate': {'type' => 'Date'},
        'description': {'type' => 'String'},
        'expirationDate': {'type' => 'Date'},
        'releaseDate': {'type' => 'Date'},
        'responseQuantity': {'type' => 'Integer'},
        'state': {'type' => 'Integer'},
        'title': {'type' => 'String'},
        'owner': {'type' => 'String'},
        '__v': {'type' => 'String'},
        'questions': {'type' => []},
        'domains': {'type' => []}
    }
}
