$scheme_post_user_email = {
    'type' => 'object',
    'properties' => {
        '_id': {'type' =>'String'},
        'name': {'type' =>'String'},
        'primaryEmail': {'type' =>'String'},
        'password': {'type' =>'String'},
        'birthDate': {'type' =>'String'},
        'validated': {'type' =>'String'},
        'city': {'type' =>'Boolean'},
        'country': {'type' =>'String'},
        'gender': {'type' =>'String'},
        'role': {'type' =>'String'},
        '__v': {'type' =>'Integer'},
        '_id': {'type' =>'String'},
    },
    'secondaryEmails' => {
        'email': {'type' =>'String'},
        'validated': {'type' =>'String'},
        '_id': {'type' =>'String'}
    }
}
