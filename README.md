# is-boolean

[![GitHub License](https://img.shields.io/github/license/inat-get/is-boolean)](LICENSE)
[![Gem Version](https://badge.fury.io/rb/is-boolean.svg?icon=si%3Arubygems)](https://badge.fury.io/rb/is-boolean)
[![Ruby](https://github.com/inat-get/is-boolean/actions/workflows/ruby.yml/badge.svg)](https://github.com/inat-get/is-boolean/actions/workflows/ruby.yml) 
![Coverage](coverage-badge.svg)

Small boolean utils

```ruby
false < true
false.to_i == 0
true.to_i == 1
false.is_a?(Boolean) == true
true.is_a?(Boolean) == true
```

Also you can use `===` operator and `case when` clause.
```ruby
case value
when Boolean
  "Boolean"
else
  "Other"
end
```
