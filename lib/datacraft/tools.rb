require 'datacraft/tools/version'
require 'datacraft/tools/basic/required'
require 'datacraft/tools/qa/required'

module Datacraft
  module Tools
    include Datacraft::Tools::Basic
    include Datacraft::Tools::QA
  end
end
