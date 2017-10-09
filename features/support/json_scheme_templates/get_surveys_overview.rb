$scheme_get_surveys_overview = { 'properties' => { '_id' => { 'type' => 'string' },
                                                   'expirationDate' => { 'type' => 'string' },
                                                   'numQuestions' => { 'type' => 'integer' },
                                                   'releaseDate' => { 'type' => 'string' } },
                                 'required' => ['releaseDate', 'numQuestions', '_id', 'expirationDate'],
                                 'type' => 'object' }
