using my.bookshop as my from '../db/data-model';

service CatalogService @(requires : 'authenticated-user') {
    entity Books @(restrict : [{
        grant : [
            'READ',
            'CREATE',
            'DELETE',
            'UPDATE'
        ],
        to    : 'authenticated-user'
    }]) as projection on my.Books;

    type userScopes {
        identified    : Boolean;
        authenticated : Boolean;
        User          : Boolean;
        Admin         : Boolean;
    };

    type user {
        user   : String;
        locale : String;
        scopes : userScopes;
    };

    function userInfo() returns user;
}
