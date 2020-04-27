# Rails app

*Week three of the Craft Academy bootcamp*

[Deployed app](https://immense-lake-16610.herokuapp.com/)

This is a simple article app made with Ruby on Rails, where you can read, create, edit and delete articles. In order to do more than reading a user must have an account. There's no restriction for who can create an account and whoever is signed in can manage all articles.

*[This commit](https://github.com/erikbjoern/rails_app/commit/6517422f64ba87cb9d056554eab74815ed511fa8#commitcomment-38764550) should not have made it to the master branch and I don't know how to revert it neatly, since it's migrated to db.*

**To be improved**:
* A user should only be able to manage their own articles
* There should be an admin with special permission to manage all articles
* For signed-in users, the 'Sign up' and 'Sign in' should change to 'Sign out'
* The 'New Article' could be visible even when user isn't signed in, since it redirects to sign-in page
* The application should be styled
