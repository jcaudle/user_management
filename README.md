# User Management

This is just a simple Rails app. You should be able to get it configured like any other. To get started, install the bundle and setup the database with rake:

```
$ bundle install && rake db:setup
```

(No further database configuration should be necessary)

At that point, you should be able to run the server:

```
$ rails server
```

You should be able to log in as any of the users created in the seed step with their email address and using the password `password`. For good measure, the following users are created and configured by default:

```
someone@example.com
reader@example.com
creator@example.com
editor@example.com
destroyer@example.com
admin@example.com
```

There is also a sample Thing created which should be viewable in the index even if not logged in. Each user has different capabilities and the abilities can be modified by the admin user.
