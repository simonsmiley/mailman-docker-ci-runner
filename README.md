## How to use
install gitlab-ci-multi-runner from https://gitlab.com/gitlab-org/gitlab-ci-multi-runner

run `gitlab-ci-multi-runner register` as root

When asked about the gitlab-ci coordinator url use:
`https://gitlab.com/ci`

The token can be found here: `https://gitlab.com/<username>/<project name>/runners`

enter some description, in case you want to use different runners, make sure you use something so you can differentiate them later on

You will have to add all tags that the mailman projects require. the list is as follows:  

| Project | Requirements |
| :-----: | :----------: |
| Postorius | sqlite |
| Hyperkitty | sqlite, gcc |
| Mailman core | sqlite, postgres|

When prompted for an executor use `docker`

The Docker image name you need is `thelinuxguy/mailman-docker-ci-runner:master`

Continue pressing Return until the process finishes.

You are now set up, make sure that gitlab-ci-multi-runner is in fact running and issue a build through the gitlab ui

# Changelog

## 0.1

* Initial release capable of running tests for postorius hyperkitty and Mailman
* Has built in support for sqlite
* Include client libraries for postgresql

## 0.2

* Add mysql client libraries
