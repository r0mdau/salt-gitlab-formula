# https://about.gitlab.com/install/#debian

gitlab_prerequisites:
  pkgrepo.installed:
    - pkgs:
      - curl 
      - openssh-server
      - ca-certificates
      - perl

gitlab_repository:
  pkgrepo.managed:
    - humanname: Gitlab
    - name: deb https://packages.gitlab.com/gitlab/gitlab-ee/debian/ buster main
    - file: /etc/apt/sources.list.d/gitlab_gitlab-ee.list
    - gpgcheck: 1
    - key_url: https://packages.gitlab.com/gitlab/gitlab-ee/gpgkey

gitlab_install:
  pkg.installed:
    - name: gitlab-ee
    - require:
      - pkgrepo: gitlab_repository
