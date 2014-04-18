# require 'spec_helper'
# require Rails.root.join('lib/modules/importer')

# usms_test = Rails.root.join('db/data/usms_test.csv')

# describe Importer do
#   describe 'import' do
#     before(:all) do
#       Importer.import(usms_test)
#     end

#     after(:all) do
#       Swimmer.destroy_all
#     end

#     describe 'swimmers' do
#       it 'should have created the right number of swimmers' do
#         Swimmer.count.should == 10
#       end
#     end
#   end
# end
