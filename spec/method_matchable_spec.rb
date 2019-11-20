RSpec.describe MethodMatchable do
  Person = Struct.new(:first_name, :last_name) do
    include MethodMatchable

    def full_name
      "#{first_name} #{last_name}"
    end
  end

  it 'match with methods' do
    case Person.new('Hotaru', 'Shiragiku')
    in { full_name: name }
      expect(name).to eq('Hotaru Shiragiku')
    else
      fail
    end
  end
end
