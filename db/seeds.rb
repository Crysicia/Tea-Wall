# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.delete_all
20.times do |i|
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  p "student #{i} : créé"
end

Teacher.delete_all
5.times do |i|
  Teacher.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    subject: Faker::Educator.subject
  )
  p "teacher #{i} : créé"
end

Skill.delete_all
5.times do |i|
  Skill.create(
    name: Faker::Educator.course_name
  )
  p "skill #{i} : créé"
end

# for the moment only 8slots of 55 minutes each.
WorkSession.delete_all
Slot.delete_all
start = 8
end_at = 9
8.times do |i|
  Slot.create!(
    start_time: DateTime.strptime("#{start + i}:00", "%H:%M"),
    end_time: DateTime.strptime("#{end_at + i}:00", "%H:%M")
  )
  p "slot #{i} : créé"
end

10.times do |i|
  WorkSession.create!(
    title: Faker::App.name,
    date: Faker::Date.forward(10),
    slot_id: Slot.pluck(:id).sample
  )
  p "work_session #{i} : créé"
end
