Feature: Javascript Evaluation
Scenario: A function which doesn't return, returns null
    When the following Javascript is run
        """
        (function (){})()
        """
    Then the Javascript result should be nil

Scenario: A function which returns "abc", returns "abc"
    When the following Javascript is run
        """
        (function (){ return 'abc'; })()
        """
    Then the Javascript result should be "abc"

Scenario: When we load JQuery, we can use its functions
    Given the Javascript file "jquery-1.4.2.min.js" is loaded
    When the following Javascript is run
        """
        $.map([1,2,3], function(i){ return i * 10; })
        """
    Then the Javascript result should be [10, 20, 30]

Scenario: When we load JQuery, we can manipulate the DOM
    Given the following HTML is loaded
        """
        <html>
            <head><title>Example</title></head>
            <body>
                <div class="stuff">
                    <h1>Important Heading</h1>
                    <p>Neato!</p>
                </div>
            </body>
        </html>
        """
    And the Javascript file "jquery-1.4.2.min.js" is loaded
    When the following Javascript is run
        """
        $('.stuff h1').text('OMG!')
        """
    Then the content of "h1" should match "OMG!"
