# JEEP
JEEP is a small command line utility for processing JSON text.
It provides, filtering, sorting, plucking fields, etc. It was created to be
used when making API calls with `curl` that return JSON.

Quick examples:

```bash
# Get all tag names for rails repository
curl https://api.github.com/repos/rails/rails/tags | jeep -p "name"

# Get count of tag names for rails repository
curl https://api.github.com/repos/rails/rails/tags | jeep -c

# Get all open pull requests
curl https://api.github.com/repos/rails/rails/pulls | jeep -w '{state: "Open"}'

# Get count of all open pull requests
curl https://api.github.com/repos/rails/rails/pulls | jeep -w '{state: "Open"}' -c
```

## Installation
```bash
npm install -g jeep
```

## Documentation
Most arguments can be combined. For example you can filter, sort and
return the first item remaining. Or filter the data and get the count of the
remaining items.

### Count items in array (-c or --count)
```bash
echo '["John","Steve"]' | jeep -c # returns 2
```

### Return first item in array (-f or --first)
```bash
echo '["John,"Steve"]' | jeep -f # returns "John"
```

### Returns keys for an object (k or --keys)
```bash
# Returns ["id","name","email"]
echo '{"id": 1, "name": "John", email: "john@email.com"}' | jeep -k
```

### Return last item in array (-l or --last)
```bash
echo '["John,"Steve"]' | jeep -l # returns "Steve"
```

### Pluck property names from array (-p or --pluck)
Pluck can be be a single property or a comma separated list of properties

```bash
# returns ["john","steve"]
echo '[{"name":"john","id":1},{"name":"steve","id":2}]' | jeep -p "name" 

# returns title and status of all pull requests
curl https://api.github.com/repos/rails/rails/pulls | jeep -p "title,status"
```

### Sort by property name (-s --sortBy)
```bash
# Returns array sorted by id in ascending order
echo '[{id:5},{id:7},{id:3}]' | jeep -s "id"
```

### Sort by property name descending (-S --sortByDesc)
```bash
# Returns array sorted by id in descending order
echo '[{id:5},{id:7},{id:3}]' | jeep -S "id"
```

### Simple filter by property values (-w --where)
```bash
# Filters records by 'Open' state
curl https://api.github.com/repos/rails/rails/pulls | jeep -w '{state:"Open"}'
```

### Other

```bash
jeep -h # View help (-h or --help)
jeep -v # View version (-V or --version)
```

## Formatted and colourful JSON output
Right now I just use the awesome [pjson](https://github.com/igorgue/pjson) tool for this.

```bash
curl https://api.github.com/repos/rails/rails/pulls | jeep  -s "title" | pjson
```

## The name JEEP?
Json Eliminater, Editor and Processor...ok that's not really true. I just wanted a three or four letter name that started with J. And all the good ones are taken of course...

## License

Copyright (c) Craig MacGregor 2015 under [MIT LICENSE](/LICENSE)
