# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
stories = Story.create([
  {
    title: 'Great White',
    contents: "The biggest shark ever attacked me the other day. When he wasn't sinking his teeth into my armpit, he was the cutest."
  },
  {
    title: 'Just A Cookie',
    contents: "Can I have one cookie please mom? Just one? I promise I'll be a good little seahorse! Bark bark"
  },
  {
    title: 'Toodaloo',
    contents: "Gottem!"
  },
])

# Authors.create(name: 'Joshin Kx', stories: stories.first)


# Simple
# - users can read stories (index, show -> id, title, contents)
# - users can create Stories (post -> title, contents)
# - users can add sentences to the Story's contents (update -> title, contents)
# - users can give a Story a title (update -> title)

# Table: Stories
# | id | title | contents |

# Table: Authors
# | id | name | stories |

# Complex
# every row in a Story's contents is a Sentence
# we have a Sentences table

# Schema
# they can add to the stories (update) and potentially :delete from them down the road
