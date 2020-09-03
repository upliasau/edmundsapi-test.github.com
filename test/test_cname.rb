require 'test/unit'

module Test
  class TestCName < Test::Unit::TestCase

    PRODUCTION_REPOSITORY = "developer.edmunds.com"

    def test_cname
      repository = `git remote -v`

      file = File.open("CNAME")
      cname = file.read.gsub(/\s+/, "")
      file.close

      if repository.include? PRODUCTION_REPOSITORY
        verify = cname == PRODUCTION_REPOSITORY
      else
        verify = repository.include? cname
      end
    end

  end
end
