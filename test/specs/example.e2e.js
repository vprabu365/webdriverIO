const LoginPage = require('../pageobjects/login.page');
const SecurePage = require('../pageobjects/secure.page');

describe('My Login application', () => {
    it('should login with valid credentials', () => {
        LoginPage.open();

        LoginPage.login('studentm@dev-edu-peardeck.com', 'howdy235');
        expect(SecurePage.flashAlert).toBeExisting();
    });
});


