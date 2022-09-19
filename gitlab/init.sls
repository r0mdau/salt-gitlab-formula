# https://about.gitlab.com/install/#debian

gitlab_prerequisites:
  pkg.installed:
    - pkgs:
      - curl
      - openssh-server
      - ca-certificates
      - perl

gitlab_repository:
  pkgrepo.managed:
    - humanname: Gitlab
    - name: deb https://packages.gitlab.com/gitlab/gitlab-ee/debian/ bullseye main
    - file: /etc/apt/sources.list.d/gitlab_gitlab-ee.list
    - gpgcheck: 1
    - key_url: https://packages.gitlab.com/gitlab/gitlab-ee/gpgkey

url_string_env:
   environ.setenv:
     - name: EXTERNAL_URL
     - value: {{ pillar['gitlab_url'] }}
     - update_minion: True

gitlab_install:
  pkg.installed:
    - name: gitlab-ee
    - require:
      - pkgrepo: gitlab_repository
