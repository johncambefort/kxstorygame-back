# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
me = User.create(email: 'me@example.com', confirmed_at: DateTime.now, password_digest: 'blah', unconfirmed_email: nil)
Poem.create(users: [me], lines: 'the orange fox jumped over the moon')
