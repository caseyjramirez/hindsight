puts "Begin Seeding ⏳"
c1 = Community.create(
    name: 'The Dallas Woodshop',
    city: "Dallas",
    state: "TX",
    description: "An inclusive community for woodworkers from all walks of life!",
)

5.times do
    Topic.create(
        name: Faker::Hobby.activity,
        description: Faker::Quote.most_interesting_man_in_the_world,
        community_id: c1.id
    )
end

10.times do
    Mentor.create(
        name: Faker::Name.name,
        age: rand(18..62),
        email: Faker::Internet.email,
        description: Faker::Quote.most_interesting_man_in_the_world,
        phone_number: 1112223333,
        community_id: c1.id,
        password: "here is my password",
    )
end

30.times do
    Mentee.create(
        name: Faker::Name.name,
        age: rand(18..62),
        email: Faker::Internet.email,
        description: Faker::Quote.most_interesting_man_in_the_world,
        phone_number: 1112223333,
        community_id: c1.id,
        password: "here is my password",
    )
end

25.times do
    Relationship.create(
        mentor_id: Mentor.all.sample.id,
        topic_id: Topic.all.sample.id,
        community_id: c1.id,
        description: Faker::Quote.most_interesting_man_in_the_world,
        isEstablished: false
    )
end

60.times do
    Application.create(
        relationship_id: Relationship.all.sample.id,
        applicant_id: Mentee.all.sample.id,
        description: Faker::Quote.most_interesting_man_in_the_world,
        isRejected: false
    )
end

puts "Seeding Complete ⏳"