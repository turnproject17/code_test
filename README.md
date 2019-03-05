# README

# Interview Questions

1. What's the difference between `include` and `extend`?

2. What's the difference between `clone` and `dup`?

3. What's the difference between `Proc` and `lambda`?

4. What's a good example for using `yield` in ruby?

5. You need to integrate with several REST APIs that often change over time. What design pattern would you use so that it limits  the effect of these changes on your code base?

6. If you were to give a junior dev 3 programming books, what would they be?

7. You've been tasked with adding a new screen that shows an index page of Recent Articles, briefly describe the steps you would take when adding this new feature

# Coding Test

Attached is some base code for the previous question. Use this to answer the following questions. As you work through the problem commit your code referencing each question. e.g. `test-1`, `test-2`.

You can seed some data using `rake db:seed` and navigate to http://127.0.0.1/articles to see how it looks.

When finished, you can package up your code including the .git directory or share via Github.

## Instructions

1. Write a feature test for the articles index page that checks that an article is displayed correctly `spec/features/recent_articles_spec.rb`

2. Write a feature test to ensure filtering by publishing status is correct

3. Based on the search parameters in ArticlesController#index, add a migration to add some indexes

4. Update the model/migrations so that the User is unique by e-mail address and add a test to `spec/models/user_spec.rb`

5. Refactor the ArticlesController#index method so that it is more readable and uses scopes.

6. Remove all N+1 queries from the controller and views

7. The views have a lot of code in it, refactor using view helpers or decorators.

8. Complete the rake task: `lib/tasks/report.rake` that uses an SQL query to extract the following data as a CSV file:
``` csv
Author,Day,Total Drafts,Total Published
Clara Oswald,2019-01-01,20,35
```

9. Complete the rake task: `lib/tasks/import.rake` that imports the file articles.csv into the database efficiently.
