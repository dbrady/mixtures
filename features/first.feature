In order to see that this thing works at all
As a developer
I want to mix up my datasets

Scenario: Short and Simple
  Given I have a dataset named 'foo' prepared with a 'users' table
  And the 'users' table in 'foo' has a row with id=1 and name='Alice'
  And I have a dataset named 'bar' prepared with a 'users' table
  And the 'users' table in 'bar' has a row with id=2 and name='Bob'
  
  When I create a mixture of foo and bar

  Then I should have a table called 'users'
  And the 'users' table should have 2 rows
  And row 1 from 'users' should have name='Alice'
  And row 2 from 'users' should have name='Bob'
  
@pending
Scenario: Conflicting Data
  Given I have a dataset named 'foo' prepared with a 'users' table
  And the 'users' table in 'foo' has a row with id=1 and name='Alice'
  And I have a dataset named 'bar' prepared with a 'users' table
  And the 'users' table in 'bar' has a row with id=1 and name='Bob'

  # last write wins  
  When I create a mixture of foo and bar

  Then I should have a table called 'users'
  And the 'users' table should have 1 rows
  And row 1 from 'users' should have name='Bob'

@pending
Scenario: Checking for Conflicting Data
  Given I have a dataset named 'foo' prepared with a 'users' table
  And the 'users' table in 'foo' has a row with id=1 and name='Alice'
  And I have a dataset named 'bar' prepared with a 'users' table
  And the 'users' table in 'bar' has a row with id=1 and name='Bob'

  # last write wins  
  When I check a mixture of foo and bar

  Then the mixture should fail with error 'conflicting users: foo.users and bar.users both have row with primary key id=1'
#  And the message should have some other crap in it showing the rows






