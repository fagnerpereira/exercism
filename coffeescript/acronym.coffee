class Acronym
  @abbreviate: (phrase) ->
    words = phrase.split(/[\s_-]+/)
    abbreviation = words.map((word) -> word[0].toUpperCase())
    abbreviation.join("")

result = Acronym.abbreviate "Complementary metal-oxide semiconductor"
console.log result
