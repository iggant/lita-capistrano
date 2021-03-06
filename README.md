# lita-capistrano

[![Gem Version](https://badge.fury.io/rb/lita-capistrano.png)](http://badge.fury.io/rb/lita-capistrano)

**lita-capistrano** is a handler for [Lita](https://www.lita.io/) that allows you to make deploys through your robot.

## Features

* Deploy and rollback.

* Permission groups and allowed rooms for deploy based on apps.

* Set reminders to deploy to environments after a sucessful deploy.

## Requirements

In order to **lita-capistrano** to identify a good deploy from a failed one, your capistrano script should always end with a message.

## Installation

Add lita-capistrano to your Lita instance's Gemfile:

``` ruby
gem "lita-capistrano"
```

## Configuration

### Required attributes

* `server` (String) – The deploy server host.

* `server_user` (String) – The deploy server host ssh user.

* `server_password` (String) – The deploy server host ssh password.

* `deploy_tree` (String) – A json configuration of how deploys work.

### Optional attributes

* `slack_api_token` (String) – The slack api token. Only necessary if using Slack reminders

### Example

``` ruby
Lita.configure do |config|
  config.handlers.capistrano.server = "capistrano-deploy.com"
  config.handlers.capistrano.server_user = "lita"
  config.handlers.capistrano.server_password = "secret"
  config.handlers.capistrano.slack_api_token = "super-long-token-for-slack-api"  # not required, if not using Slack reminders

end

config.handlers.capistrano.deploy_tree = {
  first_app: {
    qa: {
      dir: "/capistrano/first_app/qa",
      auth_group: "first_app_qa", # auth_group required to be able to deploy
      channel: "first_app_channel", # not required, if configured limits deploys to this channel
      envs: [
        "qa1",
        "qa2"
      ]
    },
    staging: {
      dir: "/capistrano/fist_app/staging",
      auth_group: "first_app_staging",
      envs: [
        "stagin1",
        "staging2",
        "staging3"
      ]
    }
  },
  second_app: {
    prod: {
      dir: "/capistrano/second_app/production",
      auth_group: "second_app_staging",
      channel: "second_app_prod_channel",
      envs: [
        "dc1",
        "dc2"
      ],
      reminders: {
        dc1: {
          dc2: "2 hours" # Set a reminder to deploy to dc2 after 2 hours from the dc1 deploy success.
          }  
      }
    }
  }
```

## Usage

List available apps for deploy:

```
Lita: deploy list
```

List available app areas for deploy:

```
Lita: deploy list [APP]
```

List required auth groups to deploy:

```
Lita: deploy auth list [APP]
```

Deploy a tag or branch:

```
Lita: deploy [APP] [AREA] [ENV] [TAG]
```

Rollback last tag or branch:

```
Lita: deploy [APP] [AREA] [ENV] rollback
```

## License

[MIT](http://opensource.org/licenses/MIT)
