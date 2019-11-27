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

  class Test
    prepend MethodMatchable::Base

    def deconstruct_keys(_keys)
      { hash_key: :hash_val }
    end

    def method_key
      :method_val
    end
  end

  it 'can match with both super and method valuese' do
    case Test.new
    in { hash_key: v1, method_key: v2 }
      expect(v1).to eq(:hash_val)
      expect(v2).to eq(:method_val)
    else
      fail
    end
  end

  class Hash
    prepend MethodMatchable::Base
  end

  it 'not destroy original hash' do
    h = { k: :v }
    case h
    in { k: v, size: size}
      expect(v).to eq(:v)
      expect(size).to eq(1)
    end
    expect(h).to eq({ k: :v })
  end
end
