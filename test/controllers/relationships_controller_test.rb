require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relationship = relationships(:one)
  end

  test "should get index" do
    get relationships_url, as: :json
    assert_response :success
  end

  test "should create relationship" do
    assert_difference("Relationship.count") do
      post relationships_url, params: { relationship: { community_id: @relationship.community_id, description: @relationship.description, isEstablished: @relationship.isEstablished, mentee_id: @relationship.mentee_id, mentor_id: @relationship.mentor_id, topic_id: @relationship.topic_id } }, as: :json
    end

    assert_response :created
  end

  test "should show relationship" do
    get relationship_url(@relationship), as: :json
    assert_response :success
  end

  test "should update relationship" do
    patch relationship_url(@relationship), params: { relationship: { community_id: @relationship.community_id, description: @relationship.description, isEstablished: @relationship.isEstablished, mentee_id: @relationship.mentee_id, mentor_id: @relationship.mentor_id, topic_id: @relationship.topic_id } }, as: :json
    assert_response :success
  end

  test "should destroy relationship" do
    assert_difference("Relationship.count", -1) do
      delete relationship_url(@relationship), as: :json
    end

    assert_response :no_content
  end
end
