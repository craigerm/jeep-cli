utils =

  # Converts string to JSON and allows us to use a json like structure
  toJson: (str) ->
    try
      # From: http://stackoverflow.com/a/24462870/64897
      tmp = str.replace((/([\w]+)(:)/g), "\"$1\"$2")
      json = tmp.replace((/'/g), "\"")
      return JSON.parse(json)
    catch e
      # Fall back to regular parser without trying bad json.
      return JSON.parse(str)

  list: (val) ->
    return [] unless val
    val = val.replace(/\s/g, '')
    val.split(',')

module.exports = utils
