require 'test_helper'

class FayeAuditTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FayeAudit::VERSION
  end

  def test_it_can_set_logger
    FayeAudit.logger = 'any logger'
    assert 'any logger', FayeAudit.logger
  end
end
