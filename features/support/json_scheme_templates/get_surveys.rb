$scheme_get_surveys = {type: 'object',
                      properties: {_id: {type: 'String'},
                                   title: {type: 'String'},
                                   description: {type: 'String'},
                                   audience: {type: 'Integer'},
                                   state: {type: 'Integer'},
                                   releaseDate: {type: 'String'},
                                   creationDate: {type: 'String'},
                                   expirationDate: {type: 'String'},
                                   responseQuantity: {type: 'Integer'},
                                   domains: {type: []}}}