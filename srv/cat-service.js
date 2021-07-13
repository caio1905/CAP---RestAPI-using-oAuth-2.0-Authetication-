
module.exports = cds.service.impl(async (cds)=>{
    cds.on('userInfo', req=>{
        let results = {};
        results.user = req.user.id;
        if (req.user.hasOwnProperty('locale')) {
            results.locale = req.user.locale;
        }
        results.scopes = {};
        results.scopes.identified = req.user.is('identified-user');
        results.scopes.authenticated = req.user.is('authenticated-user');
        results.scopes.User = req.user.is('uaa.user');
        results.scopes.Admin = req.user.is('admin');
        return results;
    });
});