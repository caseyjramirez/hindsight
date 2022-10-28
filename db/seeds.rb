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

mentor = UserType.create(
    name: 'mentor'
)

mentee = UserType.create(
    name: 'mentee'
)

5.times do
    User.create(
        user_type_id: mentor.id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: rand(18..62),
        email: Faker::Internet.email,
        description: Faker::Quote.famous_last_words,
        phone_number: 1112223333,
        community_id: c1.id,
        password: "1234",
    )
end

25.times do
    User.create(
        user_type_id: mentee.id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: rand(18..62),
        email: Faker::Internet.email,
        description: Faker::Quote.famous_last_words,
        phone_number: 1112223333,
        community_id: c1.id,
        password: "1234",
    )
end


10.times do
    Posting.create(
        user_id: User.where(user_type_id: mentor.id).sample.id,
        topic_id: Topic.all.sample.id,
        community_id: c1.id,
        description: Faker::Quote.most_interesting_man_in_the_world,
        isFilled: false,
    )
end

30.times do
    Application.create(
        posting_id: Posting.all.sample.id,
        user_id: User.where(user_type_id: mentee.id).sample.id,
        description: Faker::Quote.most_interesting_man_in_the_world,
        isRejected: false,
        isAccepted: false,
    )
end

5.times do
    Relationship.create!(
        mentor_id: User.where(user_type_id: mentor.id).sample.id,
        mentee_id: User.where(user_type_id: mentee.id).sample.id,
        topic_id: Topic.all.sample.id,
        community_id: c1.id,
        description: Faker::Quote.most_interesting_man_in_the_world
    )
end


puts "Seeding Complete ⏳"