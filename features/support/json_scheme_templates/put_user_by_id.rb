$scheme_put_user_by_id = {
    'type' => 'object',
    'properties'=> {
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
        '__v': {'type' => 'Integer'},
        'questions': {'type' => []},
        'domains': {'type' => []}
    }
}
