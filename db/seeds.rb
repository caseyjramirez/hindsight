puts "Begin Seeding ⏳"
c1 = Community.create(
    name: 'The Dallas Woodshop',
    city: "Dallas",
    state: "TX",
    description: "An inclusive community for woodworkers from all walks of life!",
)

1.times do
    Topic.create(
        name: Faker::Hobby.activity,
        description: Faker::Quote.most_interesting_man_in_the_world,
        community_id: c1.id
    )
end

3.times do
    Mentor.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: rand(18..62),
        email: Faker::Internet.email,
        description: Faker::Quote.most_interesting_man_in_the_world,
        phone_number: 1112223333,
        community_id: c1.id,
        password: "here is my password",
    )
end

Mentor.create(
    first_name: 'Casey',
    last_name: 'Ramirez',
    age: 24,
    email: 'casey@gmail.com',
    description: 'casey really doesnt enjoy coding rn',
    phone_number: 1112223333,
    community_id: c1.id,
    password: "1234",
)

10.times do
    Mentee.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: rand(18..22),
        email: Faker::Internet.email,
        description: Faker::Quote.most_interesting_man_in_the_world,
        phone_number: 1112223333,
        community_id: c1.id,
        password: "here is my password",
    )
end

10.times do
    Relationship.create(
        mentor_id: Mentor.all.sample.id,
        topic_id: Topic.all.sample.id,
        community_id: c1.id,
        isEstablished: false,
        description: Faker::Quote.most_interesting_man_in_the_world,
    )
end

20.times do
    Application.create(
        relationship_id: Relationship.all.sample.id,
        mentee_id: Mentee.all.sample.id,
        description: Faker::Quote.most_interesting_man_in_the_world,
        isRejected: false
    )
end

puts "Seeding Complete ⏳"