Feature: cookies

@javascript
Scenario: remembering users so they don't have to log in again for a while
  Given I am a site member
  When I go to the dashboard
  And I log in with the Remember Me option checked
  Then I should see "Welcome back"

  When I close my browser (clearing the session)
  And I return to the dashboard url
  Then I should see "Welcome back"

@rack_test
Scenario: don't remember users across browser restarts if they don't want it
  Given I am a site member
  When I go to the dashboard
  And I log in without the Remember Me option checked
  Then I should see "Welcome back"

  When I close my browser (clearing the session)
  And I return to the dashboard url
  Then I should see the log-in screen