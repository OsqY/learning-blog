require "test_helper"

class BlogpostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blogposts" do
    assert blogposts(:draft).draft?
  end
  test "draft? returns false for published blogposts" do
    refute blogposts(:published).draft?
  end
  test "draft? returns false for scheduled blogposts" do
    refute blogposts(:scheduled).draft?
  end
  test "published? returns true for published blogposts" do
    assert blogposts(:published).published?
  end
  test "published? returns false for draft blogposts" do
    refute blogposts(:draft).published?
  end
  test "published? returns false for scheduled blogposts" do
    refute blogposts(:scheduled).published?
  end
  test "scheduled? returns false for published blogposts" do
    refute blogposts(:published).scheduled?
  end
  test "scheduled? returns false for draft blogposts" do
    refute blogposts(:draft).scheduled?
  end
  test "scheduled? returns true for scheduled blogposts" do
    assert blogposts(:scheduled).scheduled?
  end

end
