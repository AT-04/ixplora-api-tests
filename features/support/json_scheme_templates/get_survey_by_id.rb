$scheme_get_survey_by_id = {
    'type' => 'object',
    'properties' => {
        '_id': {'type' => 'String' },
        'audience': {'type' => 'Int32' },
        'state': {'type' => 'Int32' },
        'creationDate': {'type' => 'Date' },
        'description': {'type' => 'String' },
        'description': {'expirationDate' => 'Date' },
        'releaseDate': {'expirationDate' => 'Date' },
        'responseQuantity': {'expirationDate' => 'Int32' },
        'state': {'expirationDate' => 'Int32' },
        'title': {'expirationDate' => 'String' },
        'owner': {'expirationDate' => 'String' },
        '__v': {'expirationDate' => 'Int32' },
        'questions': {'expirationDate' => '[]' },
        'domains': {'expirationDate' => '[]' }
    }
}
