describe 'Matcher output' do
    it { expect{ puts "vitor" }.to output.to_stdout}
    it { expect{ print "vitor" }.to output("vitor").to_stdout}
    it { expect{ puts "vitor queiroz" }.to output(/vitor/).to_stdout}
  
    it { expect{ warn "vitor" }.to output.to_stderr}
    it { expect{ warn "vitor" }.to output("vitor\n").to_stderr}
    it { expect{ warn "vitor queiroz" }.to output(/vitor/).to_stderr}
  end