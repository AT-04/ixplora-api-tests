$scheme_delete_survey = {
    'type' => 'object',
    'properties' => {
    '_id': { 'type' => 'String' },
    'title': { 'type' => 'String' },
    'description': { 'type' => 'String' },
    'audience': { 'type' => 'Integer' },
    'state': { 'type' => 'Integer' },
    'releaseDate': { 'type' => 'Date' },
    'creationDate': { 'type' => 'Date' },
    'expirationDate': { 'type' => 'Date' },
    'responseQuantity': { 'type' => 'Integer' },
    'owner': { 'type' => 'String' },
    'domains': { 'type' => '[]' },
    '__v': { 'type' => 'Integer' }
    },
      'questions' => {
        'sequence': { 'type' => 'Integer' },
        'required': { 'type' => 'Boolean' },
        'type': { 'type' => 'String' },
        'text': { 'type' => 'String' },
        '_id': { 'type' => 'String' }
      },
          'options' => {
              'sequence': { 'type' => 'Integer' },
              'default': { 'type' => 'Boolean' },
              'label': { 'type' => 'String' },
              '_id': { 'type' => 'String' }

          }
}
