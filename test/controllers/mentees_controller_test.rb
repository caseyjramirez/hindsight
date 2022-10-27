require "test_helper"

class MenteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentee = mentees(:one)
  end

  test "should get index" do
    get mentees_url, as: :json
    assert_response :success
  end

  test "should create mentee" do
    assert_difference("Mentee.count") do
      post mentees_url, params: { mentee: { age: @mentee.age, community_id: @mentee.community_id, description: @mentee.description, email: @mentee.email, first_name: @mentee.first_name, last_name: @mentee.last_name, password_digest: @mentee.password_digest, phone_number: @mentee.phone_number } }, as: :json
    end

    assert_response :created
  end

  test "should show mentee" do
    get mentee_url(@mentee), as: :json
    assert_response :success
  end

  test "should update mentee" do
    patch mentee_url(@mentee), params: { mentee: { age: @mentee.age, community_id: @mentee.community_id, description: @mentee.description, email: @mentee.email, first_name: @mentee.first_name, last_name: @mentee.last_name, password_digest: @mentee.password_digest, phone_number: @mentee.phone_number } }, as: :json
    assert_response :success
  end

  test "should destroy mentee" do
    assert_difference("Mentee.count", -1) do
      delete mentee_url(@mentee), as: :json
    end

    assert_response :no_content
  end
end
