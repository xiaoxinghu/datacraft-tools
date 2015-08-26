require 'nori'

module Datacraft::Tools::QA
  # Allure Test Case Reader
  class AllureTestCases
    def initialize(path, pattern: '*-testsuite.xml', with_test_suite_info: true)
      @path = path
      @with_test_suite_info = with_test_suite_info
      @test_suite_files = Pathname.glob("#{path}/#{pattern}")
    end

    def each
      @test_suite_files.each do |file|
        hash = to_hash file
        next unless valid? hash
        test_suite = hash['test_suite']
        test_suite['path'] = file.to_s
        test_cases = get_test_cases test_suite
        test_cases = [test_cases] if test_cases.is_a? Hash
        test_cases.each do |test_case|
          test_case['test_suite'] = test_suite if @with_test_suite_info
          yield test_case
        end
      end
    end

    private

    def to_hash(xml_file)
      xml = File.read(xml_file)
      parser = Nori.new
      parser.parse(xml)
    end

    def valid?(hash)
      hash.key? 'test_suite'
    end

    def get_test_cases(test_suite)
      return [] unless test_suite.key? 'test_cases'
      test_cases = test_suite.delete 'test_cases'
      test_cases['test_case']
    end
  end
end
