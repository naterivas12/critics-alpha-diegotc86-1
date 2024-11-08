# Instructions

Accept the assignment, clone your repo, navigate to your directory and create a
brand new Rails app for this project:

```bash
$ rails new . --database=postgresql --skip-test
```

<aside>
💡 `.` → at the current directory
`--database=postgresql` → use postgresql as the DBMS
`--skip-test` → skip test framework (minitest by default). We will install and use Rspec later.
</aside>

Don’t forget to add and configure rubocop:

```ruby
# Gemfile

group :development do
	...
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
	 ...
end
```

```yaml
# rubocop.yml

require: rubocop-rails

AllCops:
  NewCops: enable
  Exclude:
    - "db/**/*"
    - "script/**/*"
    - "bin/**/*"
    - "node_modules/**/*"

Style/StringLiterals:
  EnforcedStyle: double_quotes

Style/FrozenStringLiteralComment:
  Enabled: false

Style/Documentation:
  Enabled: false

Metrics/MethodLength:
  Max: 20

Metrics/AbcSize:
  Max: 30

Style/GlobalVars:
  Enabled: false

Style/WordArray:
  MinSize: 10

Style/ClassVars:
  Enabled: false

HasAndBelongsToMany:
  Enabled: false

Layout/LineLength:
  Max: 100
  IgnoredPatterns: ['\s*#']

Metrics/BlockLength:
  Exclude:
    - config/**/*
    - spec/**/*

Lint/AmbiguousBlockAssociation:
  Exclude:
    - spec/**/*
```

Then add and commit your last changes:

```json
$ git add .
$ git commit -m "Initialize rails app"
```

- Finally, push your changes to your origin remote main branch

```json
$ git push -u origin main
```
