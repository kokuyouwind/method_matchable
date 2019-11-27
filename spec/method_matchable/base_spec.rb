RSpec.describe MethodMatchable::Base do
  Person = Struct.new(:first_name, :last_name) do
    include MethodMatchable::Base

    def full_name
      "#{first_name} #{last_name}"
    end
  end

  it 'can match with method values' do
    case Person.new('Hotaru', 'Shiragiku')
    in { full_name: name }
      expect(name).to eq('Hotaru Shiragiku')
    else
      fail
    end
  end

  it 'not raise with undefined method values' do
    case Person.new('Hotaru', 'Shiragiku')
    in { undefined_method: value }
      fail
    else
      true
    end
  end
end
