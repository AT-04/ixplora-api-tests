$scheme_get_surveys_results_json = {
    'type' => 'object',
    'properties' => {
        'results' => {
            'survey' => {
                'id': {'type' => 'String'},
                'title': {'type' => 'String'},
                'description': {'type' => 'String'},
                'creationDate': {'type' => 'Date'},
                'publishing': {'type' => 'Date'},
                'endDate': {'type' => 'Date'},
                'downloadDate': {'type' => 'Date'},
                'scope': {'type' => 'String'}
            },
            'questions' => {
                'label': {'type' => 'String'},
                'options': {'type' => 'String'},
                'type': {'type' => 'String'}
            },
            'answers': {'type' => []}
        }
    }
}
