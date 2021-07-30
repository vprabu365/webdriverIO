const Page = require('./page');

/**
 * sub page containing specific selectors and methods for a specific page
 */
class LoginPage extends Page {
    /**
     * define selectors using getter methods
     */
    get googleButton () { return $('[data-qa="googleButton"]') }
    get signInButton () { return $('.valet-masthead__signin-link-label') }
    get inputUsername () { return $('input[type="email"]') }
    get inputPassword () { return $('input[type="password"]') }
    get emailSubmit () { return $('[id="identifierNext"]') }
    get passwordSubmit () { return $('[id="passwordNext"]') }

    /**
     * a method to encapsule automation code to interact with the page
     * e.g. to login using username and password
     */
    login (username, password) {
        this.googleButton.click()
        this.signInButton.click()
        this.inputUsername.setValue(username);
        browser.keys("\uE007"); 
        this.inputPassword.setValue(password);
        browser.keys("\uE007"); 

    }

    /**
     * overwrite specifc options to adapt it to page object
     */
    open () {
        return super.open();
    }
}

module.exports = new LoginPage();
