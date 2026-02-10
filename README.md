# is-boolean

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
