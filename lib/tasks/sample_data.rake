 namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
   make_users
   make_projects
   make_deliverables
  end
end

def make_users
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
    end
end

def make_projects
  40.times do |n|
    title   = Faker::Commerce.product_name
    client  = Faker::Company.name
    description = Faker::Lorem.paragraph(4)
    deadline = rand(Date.new(2015, 1, 1)..Date.new(2016,12,31))
    user_id = 1

    Project.create!(
      title: title,
      client: client,
      deadline: deadline,
      user_id: user_id,
      description: description
    )
  end
end

def make_deliverables
  200.times do |n|
    title = Faker::Company.bs
    description = Faker::Lorem.paragraph(2)
    timebox = rand(Date.new(2015, 3, 2)..Date.new(2016,11,30))
    project_id = rand(1..40)

    Deliverable.create!(
      title: title,
      description: description,
      timebox: timebox,
      project_id: project_id
    )
  end
end
