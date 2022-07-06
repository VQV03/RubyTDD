require_relative "../../helpers/helper"

RSpec.configure do |conf|
    conf.include Helper     
end

describe "Ruby on Rails" do
    it { is_expected.to start_with("Ruby").and end_with("Rails")}
    it { expect(fruta).to eq("banana").or eq("laranja").or eq("uva") }

    # def fruta # helper method arbitrario
    #     %w(banana laranja uva).sample
    # end
end

=begin 
    %w() array of strings
    %r() regular expression.
    %q() string
    %x() a shell command (returning the output string)
    %i() array of symbols (Ruby >= 2.0.0)
    %s() symbol
    %() (without letter) shortcut for %Q()
=end