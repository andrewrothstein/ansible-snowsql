andrewrothstein.snowsql
=========

![Build Status](https://github.com/andrewrothstein/ansible-snowsql/actions/workflows/build.yml/badge.svg)

Installs the [snowsql](https://docs.snowflake.com/en/user-guide/snowsql.html) cli.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.snowsql
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
