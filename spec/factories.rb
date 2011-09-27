Factory.define :paste do |f|
	f.sequence(:body) {|n| "pasted#{n}"}
end