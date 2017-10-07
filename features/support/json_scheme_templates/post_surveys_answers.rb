$scheme_post_surveys_answers = {
    'type' => 'object',
    'properties' => {

        'info' => {
            'queriedHost': {'type' => 'String'},
            'columns': {'type' => null},
            'pageState': {'type' => null},
            'speculativeExecutions': {'type' => 'Integer'},
            'achievedConsistency': {'type' => 'Integer'}
        },
        'triedHosts' => {
            '127.0.0.1:9042': {'type' => null}
        }
    }
}
