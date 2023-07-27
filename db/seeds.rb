# frozen_string_literal: true

puts 'Seeding the database with fake data...'
Rake::Task['generate_fake_data'].invoke
puts 'Database seeded successfully!'
